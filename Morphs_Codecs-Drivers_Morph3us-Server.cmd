@echo off
chcp 65001 >nul
CD /d "%~dp0"
TITLE Morphs Drivers installer
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
echo Installing the Latest 7zip x64, please wait...
start /wait 7z2600-x64.exe /S
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing DirectX, please wait...
start /wait DirectX_SETUP_silent.exe
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing The Latest AdobeAIR, please wait...
start /wait AdobeAIR_51.3.1.2.exe -silent
ping localhost -n 2 >nul
echo.
echo Installing the Latest Visual C++ 202x x86-x64 Runtimes, please wait...
start /wait VisualCppRedist_AIO_x86_x64.exe /ai /gm2
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing Microsoft Runtmes v4.x x86-X64, please wait...
start /wait NDP481-x86-x64-AllOS-ENU.exe /q /norestart
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing Microsoft Runtmes v5.x x86-X64, please wait...
start /wait windowsdesktop-runtime-5.0.17-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-5.0.17-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing Microsoft Runtmes v6.x x86-X64, please wait...
start /wait windowsdesktop-runtime-6.0.36-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-6.0.36-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing Microsoft Runtmes v7.x x86-X64, please wait...
start /wait windowsdesktop-runtime-7.0.20-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-7.0.20-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing The Latest Microsoft Runtmes v8.x x86-X64, please wait...
start /wait windowsdesktop-runtime-8.0.26-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-8.0.26-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo. 
echo Installing The Latest Microsoft Runtmes v9.x x86-X64, please wait...
start /wait windowsdesktop-runtime-9.0.15-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-9.0.15-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo. 
echo Installing The Latest Microsoft Runtmes v10.x x86-X64, please wait...
start /wait windowsdesktop-runtime-10.0.6-win-x64.exe /quiet /norestart
start /wait windowsdesktop-runtime-10.0.6-win-x86.exe /quiet /norestart
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing the Latest Microsoft Edge WebView Runtimes, please wait...
start /wait MicrosoftEdgeWebView2RuntimeInstallerX64.exe /silent /install
echo [Done]
ping localhost -n 2 >nul
echo.
echo Installing The Latest K-Lite Codec Pack, please wait...
start /wait K-Lite_Codec_Pack_1955_Mega.exe /VERYSILENT /NORESTART /NOFILEASSOCIATIONS
start /wait Ac3filter.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
echo [Done]
ping localhost -n 1 >nul
echo.
echo Installing The Latest Chrome x86, please wait...
start /wait ChromeStandaloneSetup.exe /silent /install
echo [Done]
ping localhost -n 1 >nul
cls
color 0E
echo "  ___                                                                       ___  ";
echo " |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ";
echo " |   |  __  __              _          ___              _   _              |   | ";
echo " |   | |  \/  |___ _ _ _ __| |_  ___  / __|_ _ ___ __ _| |_(_)___ _ _  ___ |   | ";
echo " |   | | |\/| / _ \ '_| '_ \ ' \(_-< | (__| '_/ -_) _` |  _| / _ \ ' \(_-< |   | ";
echo " |   | |_|_ |_\___/_|_| .__/_||_/__/  \___|_| \___\__,_|\__|_\___/_||_/__/ |   | ";
echo " |   |                |                                                    |   | ";
echo " |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ";
echo 				        All done!        
echo.
echo Exiting in...
timeout 5
del /q /f "%USERPROFILE%\AppData\Local\Temp"
del /q /f "%WINDIR%\Temp"
exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof