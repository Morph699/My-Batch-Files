@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\regfile\shell\0_RegConvert" /v "MUIVerb" /t REG_SZ /d "Convert to bat" /f
Reg.exe add "HKCR\regfile\shell\0_RegConvert" /v "Icon" /t REG_SZ /d "\"C:\Program Files (x86)\RegConverter\RegConvert.exe\",4" /f
Reg.exe add "HKCR\regfile\shell\0_RegConvert\Command" /ve /t REG_SZ /d "\"C:\Program Files (x86)\RegConverter\RegConvert.exe\" \"/S=%%1\" /O=bat /T" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
