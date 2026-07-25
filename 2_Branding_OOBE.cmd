@echo off
CD /d %~dp0
color 1F
mode con:cols=78 lines=26
Title Morph's_File_renamer_Branding

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
takeown /F d:\Temp\NTLite\NLTmpMnt\Windows\System32\oobe\en-US\W32UIRes.dll.mui /a
ICACLS d:\Temp\NTLite\NLTmpMnt\Windows\System32\oobe\en-US\W32UIRes.dll.mui /GRANT Administrators:F
rem ren d:\Temp\NTLite\NLTmpMnt\Windows\System32\oobe\en-US\W32UIRes.dll.mui W32UIRes.dll.mui.bak
ping localhost -n 1 >nul
takeown /F d:\Temp\NTLite\NLTmpMnt\Windows\Branding\Basebrd\basebrd.dll /a
ICACLS d:\Temp\NTLite\NLTmpMnt\Windows\Branding\Basebrd\basebrd.dll /GRANT Administrators:F
rem ren d:\Temp\NTLite\NLTmpMnt\Windows\Branding\Basebrd\basebrd.dll basebrd.dll.bak
ping localhost -n 2 >nul
takeown /F d:\Temp\NTlite\NLTmpMnt\Windows\Branding\Basebrd\en-US\basebrd.dll.mui /a
ICACLS d:\Temp\NTlite\NLTmpMnt\Windows\Branding\Basebrd\en-US\basebrd.dll.mui /GRANT Administrators:F
rem ren d:\Temp\NTlite\NLTmpMnt\Windows\Branding\Basebrd\en-US\basebrd.dll.mui basebrd.dll.mui.bak


:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof