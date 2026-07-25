@echo off
CD /d %~dp0
color 1F
mode con:cols=78 lines=26

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

takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\" /r /d y
ICACLS takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\" /grant administrators:F

takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\en-US\arunres.dll.mui" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\sources\en-US\arunres.dll.mui" /grant administrators:F
ping localhost -n 2 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\en-US\setup.exe.mui" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\sources\en-US\setup.exe.mui" /grant administrators:F
ping localhost -n 2 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\en-US\spwizres.dll.mui" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\sources\en-US\spwizres.dll.mui" /grant administrators:F
ping localhost -n 2 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\en-US\w32uires.dll.mui" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\sources\en-US\w32uires.dll.mui" /grant administrators:F
ping localhost -n 2 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" /grant administrators:F
del /q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" winpe.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" /grant administrators:F
del /Q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg"
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" winre.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" /a
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" /grant administrators:F
del /Q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp"
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" setup.bmp.bak

ping localhost -n 2 >nul

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof