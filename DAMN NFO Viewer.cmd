@echo off
chcp 65001 >nul
CD /d "%~dp0"
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "CheckDefaultViewer" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "ReuseWindow" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "Language" /t REG_DWORD /d "1033" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "AlwaysOnTop" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "FontName" /t REG_SZ /d "[built-in] Courier New" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "FontData" /t REG_BINARY /d "94000301" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "Window" /t REG_DWORD /d "163" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "BackgroundColor" /t REG_BINARY /d "1b1c1d00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "TextColor" /t REG_BINARY /d "ff000000" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "HyperLinkColor" /t REG_BINARY /d "6a5acd00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "HyperLinkHoverColor" /t REG_BINARY /d "8fbc8f00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "Text" /t REG_DWORD /d "1024" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\WindowPlacements" /v "Main" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffffb7050000ffffffffc1080000d4020000" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
