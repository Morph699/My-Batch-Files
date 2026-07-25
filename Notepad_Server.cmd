@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fWindowsOnlyEOL" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fPasteOriginalEOL" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fReverse" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fWrapAround" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fMatchCase" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "iWindowPosX" /t REG_DWORD /d "1322" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "iWindowPosY" /t REG_DWORD /d "658" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "iWindowPosDX" /t REG_DWORD /d "880" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "iWindowPosDY" /t REG_DWORD /d "980" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "searchString" /t REG_SZ /d " /A" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "replaceString" /t REG_SZ /d " /a /r /d y" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfEscapement" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfOrientation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfItalic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfUnderline" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfStrikeOut" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfCharSet" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfOutPrecision" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfClipPrecision" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfQuality" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfPitchAndFamily" /t REG_DWORD /d "49" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "lfFaceName" /t REG_SZ /d "Consolas" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Notepad" /v "iPointSize" /t REG_DWORD /d "120" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
