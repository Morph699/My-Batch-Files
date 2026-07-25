@echo off
chcp 65001 >nul
CD /d "%~dp0"
color 1F
mode con:cols=78 lines=26

cd %systemroot%\system32
call :IsAdmin

RMDIR /Q /S "d:\Temp\NTlite\NLTmpMnt\inetpub"
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
echo Only Press enter only once winre, WinPE and Setup.wim have been mounted
timeout 15

takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\" /a
ICACLS takeown /F "d:\Temp\NTlite\NLTmpMnt\sources\" /grant administrators:F /T

takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" /grant administrators:F /T
del /q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winpe.jpg" winpe.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg"
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\winre.jpg" winre.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp"
rem ren "d:\Temp\NTlite\NLTmpMnt\Windows\System32\setup.bmp" setup.bmp.bak

takeown /F "d:\Temp\NTlite\NLTmpMnt (1)\sources\" /a
ICACLS takeown /F "d:\Temp\NTlite\NLTmpMnt (1)\sources\" /grant administrators:F /T

takeown /F "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winpe.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winpe.jpg" /grant administrators:F /T
del /q "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winpe.jpg"
rem ren "d:\Temp\NTlite\NLTmpMnt (1)\System32\winpe.jpg" winpe.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winre.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winre.jpg" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winre.jpg"
rem ren "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\winre.jpg" winre.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\setup.bmp" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\setup.bmp" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\setup.bmp"
rem ren "d:\Temp\NTlite\NLTmpMnt (1)\Windows\System32\setup.bmp" setup.bmp.bak

takeown /F "d:\Temp\NTlite\NLTmpMnt (2)\sources\" /a
ICACLS takeown /F "d:\Temp\NTlite\NLTmpMnt (2)\sources\" /grant administrators:F /T

takeown /F "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winpe.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winpe.jpg" /grant administrators:F /T
del /q "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winpe.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt (2)\System32\winpe.jpg" winpe.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winre.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winre.jpg" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winre.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\winre.jpg" winre.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\setup.bmp" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\setup.bmp" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\setup.bmp"
rem ren "d:\Temp\NTlite\NLTmpMnt (2)\Windows\System32\setup.bmp" setup.bmp.bak

takeown /F "d:\Temp\NTlite\NLTmpMnt (3)\sources\" /a
ICACLS takeown /F "d:\Temp\NTlite\NLTmpMnt (3)\sources\" /grant administrators:F /T

takeown /F "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System33\winpe.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System33\winpe.jpg" /grant administrators:F /T
del /q "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\winpe.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt (3)\System33\winpe.jpg" winpe.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System33\winre.jpg" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System33\winre.jpg" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\winre.jpg" 
rem ren "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System33\winre.jpg" winre.jpg.bak
ping localhost -n 1 >nul
takeown /F "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\setup.bmp" /a /r /d y
ICACLS "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\setup.bmp" /grant administrators:F /T
del /Q "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\setup.bmp"
rem ren "d:\Temp\NTlite\NLTmpMnt (3)\Windows\System32\setup.bmp" setup.bmp.bak

ping localhost -n 1 >nul

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof