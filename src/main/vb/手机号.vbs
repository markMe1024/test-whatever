path=inputbox("请输入要转换的文件名包含绝对路径。如：D:\小工具\手机号.txt","提示") 
MsgBox "要转换的文件" + path
respath=inputbox("请输入生成文件名包含绝对路径。如：D:\小工具\手机号结果.txt","提示") 
MsgBox "目的文件" + respath

set fso=createobject("scripting.filesystemobject")
set file=fso.opentextfile(path)
s=file.readall
file.close
's1=replace(s,chr(10),"#"+chr(10))
s1=replace(s,vbcrlf, ""&vbTab&vbcrlf)
set file=fso.createtextfile(respath)
file.write s1
file.close
msgbox "请查看"+respath+"文件！"

