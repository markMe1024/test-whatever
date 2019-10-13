#!/bin/bash
#
# 该脚本仅支持12.1.1版本weblogic的安装
# 
# jdk版本为1.8
#
# 启动weblogic server的用户名为weblogic，密码为weblogic123456。登陆控制台的用户名和密码也是这个。
#

# jdk下载地址
jdk_address="http://100.2.97.247:31980/isofthouse/v1/softs/c35a7541-436f-4df4-8a30-002e5047bd03/jdk-8u141-linux-x64.tar.gz --header=region:regionOne"

# weblogic下载地址
weblogic_address="http://100.2.97.247:31980/isofthouse/v1/softs/654bb42d-c57d-43b0-9ddb-19a94d517ec5/wls1211_generic.jar --header=region:regionOne"

# webloic部署的机器的ip
ListenAddress=100.2.12.84

# 函数：安装jdk
function install_jdk {
	echo "jdk is installing..."
	
	# 1.校验是否已安装1.8版本的jdk
	installed_java_version=`java -version 2>&1 | grep "version"`
	if [[ $installed_java_version =~ "1.8" ]]; then
		return
	elif [[ $installed_java_version =~ "1." ]]; then
		exit 2
	fi

	# 2.创建jdk安装目录
	jdk_dir=/opt/java
	if [[ ! -d $jdk_dir ]]; then
		mkdir $jdk_dir
	fi
	cd $jdk_dir

	# 3.下载jdk到/opt/java下
	wget $jdk_address

	# 4.解压
	jdk_tar_name=`ls | grep jdk-8*tar.gz`
	if [[ $jdk_tar_name ]]; then
		tar -zxvf $jdk_tar_name
	else
		echo "installation of jdk failed, can't find jdk1.8 installation package"
		exit 2
	fi

	# 5.设置环境变量
	jdk_name=`ls | grep jdk1.8`
	if [[ $jdk_name ]]; then
			set_jdk_env
	else
		echo "installation of jdk failed, can't find jdk1.8 installation package"
		exit 2
	fi
	
	
	echo "jdk installed successfully"
}

# 函数：设置java环境变量
function set_jdk_env {
JAVA_HOME=$jdk_dir/$jdk_name
cat >> /etc/profile << EOF

JAVA_HOME=$JAVA_HOME
PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib
export JAVA_HOME PATH CLASSPATH
EOF
source /etc/profile
}


# 安装jdk
install_jdk

# 函数：创建配置文件silent.xml
function creat_silent_xml {
cat >> silent.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<bea-installer> 
	<input-fields>
		<data-value name="BEAHOME" value="/opt/weblogic" />
		<data-value name="WLS_INSTALL_DIR" value="/opt/weblogic/Oracle/Middleware" /> 
	</input-fields> 
</bea-installer>
EOF
}

# 函数：安装weblogic
function install_weblogic {
	# 创建用于安装weblogic的用户weblogic
	weblogic_user_home=/home/weblogic
	if [[ ! `id weblogic` ]]; then
		useradd -c "weblogic user" -d $weblogic_user_home -s /bin/bash weblogic -m	
	fi
	
	# 创建weblogic安装目录，并给weblogic用户赋权
	bea_home=/opt/weblogic
	if [[ ! -d $bea_home ]]; then
		mkdir $bea_home
	fi
	chown -R weblogic:weblogic $bea_home
	
	# 创建silent.xml
	cd $weblogic_user_home
	if [[ ! -f silent.xml ]]; then
		creat_silent_xml	
	fi
	
	# 下载weblogic安装包
	wget $weblogic_address
	
	# 安装weblogic
	su weblogic -c "java -jar wls1211_generic.jar -mode=silent -silent_xml=/home/weblogic/silent.xml -log=/home/weblogic/install.log"
}

install_weblogic

# 函数：创建创建域需要的py
function create_domain_py {
cat >> create_domain.py << EOF
readTemplate("/opt/weblogic/Oracle/Middleware/common/templates/domains/wls.jar")
cd("Server/AdminServer")
cmo.setName("weblogic")
set("ListenAddress", "$ListenAddress")
set("ListenPort", 7001)
cd("/Security/base_domain/User/weblogic")
cmo.setPassword("weblogic123456")
setOption("OverwriteDomain",'true')
setOption('ServerStartMode','prod')
writeDomain("/opt/weblogic/default_domain")
closeTemplate() 
exit()
EOF
}

# 函数：创建域
function create_domain {
	create_domain_py
	su weblogic -c "/opt/weblogic/Oracle/Middleware/common/bin/wlst.sh create_domain.py"
}

create_domain