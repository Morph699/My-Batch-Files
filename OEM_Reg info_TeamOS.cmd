@echo off
chcp 65001 >nul
CD /d "%~dp0"
cd /d "%%~dp0"
cd /d "%%~dp0"
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOwner" /t REG_SZ /d "TeamOS" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "Morphs Creations" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
