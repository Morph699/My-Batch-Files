@echo off
chcp 65001 >nul
CD /d "%~dp0"

setlocal EnableDelayedExpansion

cd %systemroot%\system32
call :IsAdmin

RMDIR /S /Q "c:\Users\Server\AppData\Local\AlecaFrame\"
cls
Echo Linking Overwolf's data folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Local\AlecaFrame\" "g:\Apps Portable\_DataFolders\_Server\AlecaFrame\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
taskkill /f /im dropbox.exe
RMDIR /S /Q "c:\Users\Server\AppData\Local\Dropbox\"
cls
Echo Linking Dropbox's Profile folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Local\Dropbox\" "d:\Temp\Apps Portable\_DataFolders\_Server\DropboxData\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
RMDIR /S /Q "c:\Users\Server\AppData\Roaming\GHISLER\"
cls
Echo TotalCMD's user data folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Roaming\GHISLER\" "g:\Apps Portable\_DataFolders\_Server\GHISLER\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
RMDIR /S /Q "c:\Users\Server\AppData\Local\Overwolf\"
cls
Echo Linking Overwolf's data folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Local\Overwolf\" "g:\Apps Portable\_DataFolders\_Server\Overwolf\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
RMDIR /S /Q "c:\Users\Server\AppData\Local\qBittorrent\"
cls
Echo Linking qBittorrent's Local data folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Local\qBittorrent\" "d:\Temp\Apps Portable\_DataFolders\_Server\qBittorrent1\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
RMDIR /S /Q "c:\Users\Server\AppData\Roaming\qBittorrent\"
cls
Echo Linking qBittorrent Roaming data folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Roaming\qBittorrent\" "d:\Temp\Apps Portable\_DataFolders\_Server\qBittorrent2\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
RMDIR /S /Q "c:\Users\Server\AppData\Local\Warframe\"
cls
Echo Linking Warframe's Profile folder..
ping localhost -n 2 >nul
mklink /J "c:\Users\Server\AppData\Local\Warframe" "g:\Apps Portable\_DataFolders\_Server\Warframe\"
echo.
echo [Done]
echo.
ping localhost -n 2 >nul
exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof