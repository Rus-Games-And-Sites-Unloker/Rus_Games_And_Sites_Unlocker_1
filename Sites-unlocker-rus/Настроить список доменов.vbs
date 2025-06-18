Option Explicit
On Error Resume Next

' ���������
Const folderName = "lists"
Const resultFile = "list-ultimate.txt"

Dim fso, folder, files, file, selectedFiles(), i, shell
Dim currentDir, listsPath, fileCount, answer, output, content
Dim dict, line, allLines, lineCount, totalFilesProcessed

' ������� ������ Dictionary ��� ������������ ���������� �����
Set dict = CreateObject("Scripting.Dictionary")
dict.CompareMode = 1 ' ��������� ��������� (��� ����� ��������)

' �������� ������� ����������
Set shell = CreateObject("WScript.Shell")
currentDir = shell.CurrentDirectory
listsPath = currentDir & "\" & folderName

' ��������� ������������� �����
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(listsPath) Then
    MsgBox "����� '" & folderName & "' �� �������!" & vbCrLf & _
           "��������� ������ ����� � ������ '" & folderName & "' � ���������� �����.", _
           vbExclamation, "������"
    WScript.Quit
End If

' �������� ������ ������
Set folder = fso.GetFolder(listsPath)
Set files = folder.Files
fileCount = 0
ReDim selectedFiles(100) ' �������� 100 ������

' �������� ������ ������ ����� (list-*.txt, �������� resultFile)
For Each file In files
    If LCase(fso.GetExtensionName(file.Name)) = "txt" Then
        If LCase(Left(file.Name, 5)) = "list-" And LCase(file.Name) <> LCase(resultFile) Then
            selectedFiles(fileCount) = file.Name
            fileCount = fileCount + 1
        End If
    End If
Next

If fileCount = 0 Then
    MsgBox "� ����� '" & folderName & "' �� ������� ������ list-*.txt", _
           vbExclamation, "������"
    WScript.Quit
End If

' ������� ��� ������� �������� ����
Set output = fso.CreateTextFile(listsPath & "\" & resultFile, True)
output.Close

' �������������� ������� ������������ ������
totalFilesProcessed = 0

' ������������ ������ ����
For i = 0 To fileCount - 1
    ' ���������� vbYesNo ������ vbYesNoCancel (������� ������ ������)
    answer = MsgBox("�������� ���� � ������������ ������?" & vbCrLf & vbCrLf & _
                   "����: " & selectedFiles(i), _
                   vbQuestion + vbYesNo, "������������� (" & (i+1) & "/" & fileCount & ")")
    
    If answer = vbYes Then
        ' ����������� ������� ������������ ������
        totalFilesProcessed = totalFilesProcessed + 1
        
        ' ������ ���������� �����
        Set file = fso.OpenTextFile(listsPath & "\" & selectedFiles(i), 1)
        allLines = Split(file.ReadAll, vbNewLine)
        file.Close
        
        ' ��������� ���� ��� ����������
        Set output = fso.OpenTextFile(listsPath & "\" & resultFile, 8, True)
        
        ' ������������ ������ ������
        For lineCount = 0 To UBound(allLines)
            line = Trim(allLines(lineCount))
            
            ' ���������� ������ ������
            If line <> "" Then
                ' ���� ������ ��� �� �����������
                If Not dict.Exists(line) Then
                    ' ��������� � ������� � ���������� � ����
                    dict.Add line, line
                    output.WriteLine line
                End If
            End If
        Next
        
        ' ��������� ���� ����� ���������
        output.Close
    End If
Next

' ��������� ����������
Dim stats
stats = "����������� ������ ���������!" & vbCrLf & _
        vbCrLf & _
        "�������� ����: " & resultFile & vbCrLf & _
        "������������: " & listsPath & vbCrLf & _
        vbCrLf & _
        "����������:" & vbCrLf & _
        "- ����� ������ ��������: " & fileCount & vbCrLf & _
        "- ������ ����������: " & totalFilesProcessed & vbCrLf & _
        "- ���������� ����� ���������: " & dict.Count

MsgBox stats, vbInformation, "��������� ������"

' ����������� �������
Set dict = Nothing
Set fso = Nothing
Set shell = Nothing