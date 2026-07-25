@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\INetCache" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Templates" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d "F:\Temp\Downloads\4K Video Downloader" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
