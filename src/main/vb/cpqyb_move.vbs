Dim x1
Dim objExcel
Dim my
path=inputbox("������Ҫת�����ļ�����������·�����磺D:\С����\vb��ֲ\Ȧ�汨�����嵥20140822.xlsx","��ʾ") 
MsgBox "Ҫת�����ļ�" + path
respath=inputbox("�����������ļ�����������·�����磺D:\С����\vb��ֲ\cpqyb.del","��ʾ") 
MsgBox "Ŀ���ļ�" + respath
sheet=inputbox("������Ҫת����sheetҳ���磺Sheet1","��ʾ") 
MsgBox "sheetҳ"+ sheet
Set fso =CreateObject("Scripting.FileSystemObject")   
'Set a = fso.CreateTextFile("D:\С����\vb��ֲ\cpqyb.del", True)   
Set a = fso.CreateTextFile(respath, True)   
Set x1 = CreateObject("Excel.Application")
Set objExcel = x1.Workbooks.Open _ 
(path)   'ָ��excel�ĵ�·��
'("D:\С����\vb��ֲ\Ȧ�汨�����嵥20140822.xlsx")   'ָ��excel�ĵ�·��
Count = objExcel.WorkSheets.Count 'ȡsheet���� 
'For Each my In objExcel.WorkSheets '����sheet 
MsgBox "�Ƿ�ʼִ�г���", vbOK + vbInformation, "ִ�п�ʼ"
x1.Workbooks(1).Worksheets(sheet).Activate   'ָ��Ҫ�򿪵�sheet����
dim ExcelRow
ExcelRow = x1.Workbooks(1).Worksheets(sheet).Range(Chr(64 + Colum) & "65535").end(-4162).Row
MsgBox ExcelRow
dim count
count = 0
For rwIndex = 2 To 10000   'ָ��Ҫ������Excel�б�  ���ڵ�1���Ǳ�ͷ���ӵ�2�п�ʼ
        With x1.Workbooks(1).Worksheets(sheet)
            If .Cells(rwIndex, 1).Value = "" Then
               Exit For
            End If
              count = count + 1
              ' MsgBox chr(34)+"0020001001"+cstr(rwIndex+10000)+chr(34)+","+chr(34)+"9009"+chr(34)+","+chr(34)+"806"+chr(34)+","+chr(34)+"00"+chr(34)+","+chr(34)+"002"+chr(34)+","+chr(34)+"0020001001"+chr(34)+","+chr(34)+"D"+chr(34)+","+chr(34)+"806010101"+chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ) +chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 3).Value )+chr(34)+","+chr(34)+"0"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+"20491231"+chr(34)+","+chr(34)+"ALL"+chr(34)+","+chr(34)+"806010701"+chr(34)+","+chr(34)+"806010701001"+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 4).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+"1"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+"0.00"+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)+","+"0.00"+","+chr(34)+"500.00"+chr(34)+","+chr(34)+"500.00"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"yizhi"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)
              '  "002000100100000","9009","806","00","002","0020001001","D","806010101","��6214481101010000011","���Ǻ�","","","01","210381199503230233","0","","20140826","20491231","ALL","806010701","806010701001","20140826","��6214481101010000011","","","���Ǻ�","1","","","","01",0.00,"","","","","0",0.00,"500.00","500.00","","","yizhi","","0"
               'MsgBox ""+ CStr(.Cells(rwIndex, 1).Value) +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 1).Value ) +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 3).Value )  +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ), vbOK + vbInformation, "��"
               a.WriteLine(chr(34)+"0020001001"+cstr(rwIndex+10000)+chr(34)+","+chr(34)+"9009"+chr(34)+","+chr(34)+"806"+chr(34)+","+chr(34)+"00"+chr(34)+","+chr(34)+"002"+chr(34)+","+chr(34)+"0020001001"+chr(34)+","+chr(34)+"D"+chr(34)+","+chr(34)+"806010101"+chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ) +chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 3).Value )+chr(34)+","+chr(34)+"0"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+"20491231"+chr(34)+","+chr(34)+"ALL"+chr(34)+","+chr(34)+"806010701"+chr(34)+","+chr(34)+"806010701001"+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 4).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+"1"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+"0.00"+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)+","+"0.00"+","+chr(34)+"500.00"+chr(34)+","+chr(34)+"500.00"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"yizhi"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34))
        End With
NEXT
MsgBox "ִ�н���������ת��" + CStr(count) + "������", vbOK + vbInformation, "ִ�н��"
'NEXT
a.Close
