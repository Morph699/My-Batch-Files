@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "!Do not use this registry key" /t REG_SZ /d "Use the SHGetFolderPath or SHGetKnownFolderPath function instead" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "AppData" /t REG_SZ /d "C:\Users\Server\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Local AppData" /t REG_SZ /d "C:\Users\Server\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CD Burning" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\Burn\Burn" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Libraries" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "C:\Users\Server\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "C:\Users\Server\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "History" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "NetHood" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_SZ /d "C:\Users\Server\Contacts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{00BCFC5A-ED94-4E48-96A1-3F6217F21990}" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\RoamingTiles" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Cookies" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /t REG_SZ /d "C:\Users\Server\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "SendTo" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Start Menu" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Programs" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Recent" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "PrintHood" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_SZ /d "C:\Users\Server\Searches" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{A520A1A4-1780-4FF6-BD18-167343C5AF16}" /t REG_SZ /d "C:\Users\Server\AppData\LocalLow" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Startup" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Administrative Tools" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" /t REG_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_SZ /d "C:\Users\Server\Links" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Cache" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\INetCache" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Templates" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Templates" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\Users\Server\Saved Games" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Fonts" /t REG_SZ /d "C:\Windows\Fonts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Do not use this registry key" /t REG_SZ /d "Use the SHGetFolderPath or SHGetKnownFolderPath function instead" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
