'* Имя: Lab_2.vbs
'* Язык: VBScript
'* Описание: лабораторная работа
'*********************************************************************
Dim s, FSO,TextStream,F
' Выводим строку на экран
do
WScript.StdOut.WriteLine "Menu"
WScript.StdOut.WriteLine "----------------------------"
WScript.StdOut.WriteLine "1. Author information"
WScript.StdOut.WriteLine "2. rename folder"
WScript.StdOut.WriteLine "3. create txt file"
WScript.StdOut.WriteLine "4. Exit"
WScript.StdOut.Write "Choose a task:"
' Считываем строку
s = WScript.StdIn.ReadLine
' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
if (s="1") Then
WScript.StdOut.WriteLine "Tratsevskiy Ivan, ITP-11"

elseif (s="2") Then
'выводим строку на экран
WScript.StdOut.Write "Input way to folder: "
'считываем строку
way=WScript.StdIn.ReadLine
WScript.StdOut.Write "Input folder rename: "
'считываем название папки
rename=WScript.StdIn.ReadLine
On Error Resume Next
With WScript.CreateObject("Scripting.FileSystemObject")
	If .FolderExists(way) Then
				.GetFolder(way).Name = rename
	Else
		WScript.Echo "Folder "+ way +" not found"
	End If
End With
WScript.Echo "Operation successful"
elseif (s="3") Then
set FSO = WScript.CreateObject("Scripting.FileSystemObject")
set Drives = FSO.Drives
set oFSO = CreateObject("Scripting.FileSystemObject")
ScriptPlace = oFSO.GetParentFolderName(WScript.ScriptFullName)
set oTStream = oFSO.CreateTextFile(ScriptPlace & "\text.txt", true)
for each oFile in oFSO.GetFolder(ScriptPlace).Name
oTStream.WriteLine oFile.Name
next
oTStream.Close
WScript.Echo "Txt file has been created"
End if
loop until (s="4")
'************* Конец *********************************************