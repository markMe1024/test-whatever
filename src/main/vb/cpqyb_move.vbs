Dim x1
Dim objExcel
Dim my
path=inputbox("请输入要转换的文件名包含绝对路径。如：D:\小工具\vb移植\圈存报总行清单20140822.xlsx","提示") 
MsgBox "要转换的文件" + path
respath=inputbox("请输入生成文件名包含绝对路径。如：D:\小工具\vb移植\cpqyb.del","提示") 
MsgBox "目的文件" + respath
sheet=inputbox("请输入要转换的sheet页。如：Sheet1","提示") 
MsgBox "sheet页"+ sheet
Set fso =CreateObject("Scripting.FileSystemObject")   
'Set a = fso.CreateTextFile("D:\小工具\vb移植\cpqyb.del", True)   
Set a = fso.CreateTextFile(respath, True)   
Set x1 = CreateObject("Excel.Application")
Set objExcel = x1.Workbooks.Open _ 
(path)   '指定excel文档路径
'("D:\小工具\vb移植\圈存报总行清单20140822.xlsx")   '指定excel文档路径
Count = objExcel.WorkSheets.Count '取sheet数量 
'For Each my In objExcel.WorkSheets '遍历sheet 
MsgBox "是否开始执行程序", vbOK + vbInformation, "执行开始"
x1.Workbooks(1).Worksheets(sheet).Activate   '指定要打开的sheet名称
dim ExcelRow
ExcelRow = x1.Workbooks(1).Worksheets(sheet).Range(Chr(64 + Colum) & "65535").end(-4162).Row
MsgBox ExcelRow
dim count
count = 0
For rwIndex = 2 To 10000   '指定要遍历的Excel行标  由于第1行是表头，从第2行开始
        With x1.Workbooks(1).Worksheets(sheet)
            If .Cells(rwIndex, 1).Value = "" Then
               Exit For
            End If
              count = count + 1
              ' MsgBox chr(34)+"0020001001"+cstr(rwIndex+10000)+chr(34)+","+chr(34)+"9009"+chr(34)+","+chr(34)+"806"+chr(34)+","+chr(34)+"00"+chr(34)+","+chr(34)+"002"+chr(34)+","+chr(34)+"0020001001"+chr(34)+","+chr(34)+"D"+chr(34)+","+chr(34)+"806010101"+chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ) +chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 3).Value )+chr(34)+","+chr(34)+"0"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+"20491231"+chr(34)+","+chr(34)+"ALL"+chr(34)+","+chr(34)+"806010701"+chr(34)+","+chr(34)+"806010701001"+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 4).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+"1"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+"0.00"+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)+","+"0.00"+","+chr(34)+"500.00"+chr(34)+","+chr(34)+"500.00"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"yizhi"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)
              '  "002000100100000","9009","806","00","002","0020001001","D","806010101","　6214481101010000011","王星贺","","","01","210381199503230233","0","","20140826","20491231","ALL","806010701","806010701001","20140826","　6214481101010000011","","","王星贺","1","","","","01",0.00,"","","","","0",0.00,"500.00","500.00","","","yizhi","","0"
               'MsgBox ""+ CStr(.Cells(rwIndex, 1).Value) +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 1).Value ) +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 3).Value )  +chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ), vbOK + vbInformation, "列"
               a.WriteLine(chr(34)+"0020001001"+cstr(rwIndex+10000)+chr(34)+","+chr(34)+"9009"+chr(34)+","+chr(34)+"806"+chr(34)+","+chr(34)+"00"+chr(34)+","+chr(34)+"002"+chr(34)+","+chr(34)+"0020001001"+chr(34)+","+chr(34)+"D"+chr(34)+","+chr(34)+"806010101"+chr(34)+","+chr(34)+ CStr( .Cells(rwIndex, 4).Value ) +chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 3).Value )+chr(34)+","+chr(34)+"0"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+"20491231"+chr(34)+","+chr(34)+"ALL"+chr(34)+","+chr(34)+"806010701"+chr(34)+","+chr(34)+"806010701001"+chr(34)+","+chr(34)+"20140826"+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 4).Value )+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+CStr( .Cells(rwIndex, 2).Value )+chr(34)+","+chr(34)+"1"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"01"+chr(34)+","+"0.00"+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34)+","+"0.00"+","+chr(34)+"500.00"+chr(34)+","+chr(34)+"500.00"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"yizhi"+chr(34)+","+chr(34)+""+chr(34)+","+chr(34)+"0"+chr(34))
        End With
NEXT
MsgBox "执行结束，共计转换" + CStr(count) + "条数据", vbOK + vbInformation, "执行结果"
'NEXT
a.Close
