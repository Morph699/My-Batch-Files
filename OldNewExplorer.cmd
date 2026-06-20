@echo off
chcp 65001 >nul
CD /d "%~dp0"
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "DriveGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoRibbon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoCaption" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoUpButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NavBarGlass" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "IEButtons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "Details" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "StatusBar" /t REG_DWORD /d "1" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
