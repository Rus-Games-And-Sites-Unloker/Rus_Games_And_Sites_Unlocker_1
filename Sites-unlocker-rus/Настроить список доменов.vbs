Option Explicit
On Error Resume Next

' Настройки
Const folderName = "lists"
Const resultFile = "list-ultimate.txt"

Dim fso, folder, files, file, selectedFiles(), i, shell
Dim currentDir, listsPath, fileCount, answer, output, content
Dim dict, line, allLines, lineCount, totalFilesProcessed

' Создаем объект Dictionary для отслеживания уникальных строк
Set dict = CreateObject("Scripting.Dictionary")
dict.CompareMode = 1 ' Текстовое сравнение (без учета регистра)

' Получаем текущую директорию
Set shell = CreateObject("WScript.Shell")
currentDir = shell.CurrentDirectory
listsPath = currentDir & "\" & folderName

' Проверяем существование папки
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(listsPath) Then
    MsgBox "Папка '" & folderName & "' не найдена!" & vbCrLf & _
           "Поместите скрипт рядом с папкой '" & folderName & "' и попробуйте снова.", _
           vbExclamation, "Ошибка"
    WScript.Quit
End If

' Получаем список файлов
Set folder = fso.GetFolder(listsPath)
Set files = folder.Files
fileCount = 0
ReDim selectedFiles(100) ' Максимум 100 файлов

' Собираем только нужные файлы (list-*.txt, исключая resultFile)
For Each file In files
    If LCase(fso.GetExtensionName(file.Name)) = "txt" Then
        If LCase(Left(file.Name, 5)) = "list-" And LCase(file.Name) <> LCase(resultFile) Then
            selectedFiles(fileCount) = file.Name
            fileCount = fileCount + 1
        End If
    End If
Next

If fileCount = 0 Then
    MsgBox "В папке '" & folderName & "' не найдено файлов list-*.txt", _
           vbExclamation, "Ошибка"
    WScript.Quit
End If

' Создаем или очищаем итоговый файл
Set output = fso.CreateTextFile(listsPath & "\" & resultFile, True)
output.Close

' Инициализируем счетчик обработанных файлов
totalFilesProcessed = 0

' Обрабатываем каждый файл
For i = 0 To fileCount - 1
    ' Используем vbYesNo вместо vbYesNoCancel (убираем кнопку Отмена)
    answer = MsgBox("Добавить файл в объединенный список?" & vbCrLf & vbCrLf & _
                   "Файл: " & selectedFiles(i), _
                   vbQuestion + vbYesNo, "Подтверждение (" & (i+1) & "/" & fileCount & ")")
    
    If answer = vbYes Then
        ' Увеличиваем счетчик обработанных файлов
        totalFilesProcessed = totalFilesProcessed + 1
        
        ' Читаем содержимое файла
        Set file = fso.OpenTextFile(listsPath & "\" & selectedFiles(i), 1)
        allLines = Split(file.ReadAll, vbNewLine)
        file.Close
        
        ' Открываем файл для добавления
        Set output = fso.OpenTextFile(listsPath & "\" & resultFile, 8, True)
        
        ' Обрабатываем каждую строку
        For lineCount = 0 To UBound(allLines)
            line = Trim(allLines(lineCount))
            
            ' Пропускаем пустые строки
            If line <> "" Then
                ' Если строка еще не встречалась
                If Not dict.Exists(line) Then
                    ' Добавляем в словарь и записываем в файл
                    dict.Add line, line
                    output.WriteLine line
                End If
            End If
        Next
        
        ' Закрываем файл после обработки
        output.Close
    End If
Next

' Формируем статистику
Dim stats
stats = "Объединение файлов завершено!" & vbCrLf & _
        vbCrLf & _
        "Итоговый файл: " & resultFile & vbCrLf & _
        "Расположение: " & listsPath & vbCrLf & _
        vbCrLf & _
        "Статистика:" & vbCrLf & _
        "- Всего файлов доступно: " & fileCount & vbCrLf & _
        "- Файлов обработано: " & totalFilesProcessed & vbCrLf & _
        "- Уникальных строк добавлено: " & dict.Count

MsgBox stats, vbInformation, "Результат работы"

' Освобождаем ресурсы
Set dict = Nothing
Set fso = Nothing
Set shell = Nothing