path=inputbox("������Ҫת�����ļ�����������·�����磺D:\С����\�ֻ���.txt","��ʾ") 
MsgBox "Ҫת�����ļ�" + path
respath=inputbox("�����������ļ�����������·�����磺D:\С����\�ֻ��Ž��.txt","��ʾ") 
MsgBox "Ŀ���ļ�" + respath

set fso=createobject("scripting.filesystemobject")
set file=fso.opentextfile(path)
s=file.readall
file.close
's1=replace(s,chr(10),"#"+chr(10))
s1=replace(s,vbcrlf, ""&vbTab&vbcrlf)
set file=fso.createtextfile(respath)
file.write s1
file.close
msgbox "��鿴"+respath+"�ļ���"

