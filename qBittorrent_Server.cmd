@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\qBittorrent\qbittorrent.exe,1" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationName" /t REG_SZ /d "qBittorrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Torrent downloader" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\FileAssociations" /v ".torrent" /t REG_SZ /d "qBittorrent.torrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\URLAssociations" /v "magnet" /t REG_SZ /d "qBittorrent.magnet" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
