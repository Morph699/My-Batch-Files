@echo off
CD /d %~dp0
mode con:cols=78 lines=26
Title Morph's_Files_Renamer_Theme_Files
color 1F

cd %systemroot%\system32
call :IsAdmin

color 1F
cls
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo  ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo  ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
takeown /F d:\Temp\NTLite\NLTmpMnt\Windows\System32\themeui.dll /a
ICACLS d:\Temp\NTLite\NLTmpMnt\Windows\System32\themeui.dll /GRANT Administrators:F
rem ren d:\Temp\NTLite\NLTmpMnt\Windows\System32\themeui.dll themeui.dll.bak
ping localhost -n 1 >nul
takeown /F d:\Temp\NTLite\NLTmpMnt\Windows\System32\uxinit.dll /a
ICACLS d:\Temp\NTLite\NLTmpMnt\Windows\System32\uxinit.dll /GRANT Administrators:F
rem ren d:\Temp\NTLite\NLTmpMnt\Windows\System32\uxinit.dll uxinit.dll.bak
ping localhost -n 2 >nul
takeown /F d:\Temp\NTLite\NLTmpMnt\Windows\System32\recovery\winre.wim /a
ICACLS d:\Temp\NTLite\NLTmpMnt\Windows\System32\recovery\winre.wim /GRANT Administrators:F
del d:\Temp\NTLite\NLTmpMnt\Windows\System32\recovery\winre.wim


:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof






