@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe" /ve /t REG_SZ /d "LauncherCEFV7" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "UpdateVersion" /t REG_DWORD /d "23" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "DownloadDir" /t REG_SZ /d "f:\Temp\Games\Warframe\Downloaded\\" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ReadEula" /t REG_SZ /d "7110700521B4706047841B38F0DBB5C1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "VerifyVersionPublic" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherStats" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableFullScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "GraphicsAPI" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "DebugGraphicsDriver" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "GPUPreference" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableBulkDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableAggressiveDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherGPU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ForceHTTPS" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ServerCluster" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "Language" /t REG_SZ /d "en" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherExe" /t REG_SZ /d "C:\Users\Server\AppData\Local\Warframe\Downloaded\Public\Tools\Launcher.exe" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableShaderCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LanguageVO" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "WindowMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ErrorDx10Unsuported" /t REG_DWORD /d "1" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
