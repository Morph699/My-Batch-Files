@echo off
chcp 65001 >nul
CD /d "%~dp0"

Title Server_reg_keys_export

cd %systemroot%\system32
call :IsAdmin

REG EXPORT "HKCU\SOFTWARE\7-Zip" F:\Temp\7zip_Server.reg

REG EXPORT "HKCU\SOFTWARE\ACD Systems\ACDSee32" F:\Temp\ACDSee_Server.reg

REG EXPORT "HKCU\Console" F:\Temp\Consol_Server.reg

REG EXPORT "HKU\.DEFAULT\Console" F:\Temp\Consol2_Server.reg

REG EXPORT "HKCU\SOFTWARE\JOConnell\DeskTop" F:\Temp\DeskTopLayout_Server.reg

REG EXPORT "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices" F:\Temp\Drive_Setting_Server.reg

REG EXPORT "HKCU\SOFTWARE\MPC-HC\MPC-HC" F:\Temp\MPHC_Server.reg

REG EXPORT "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" F:\Temp\Myfolders2_Server.reg

REG EXPORT "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" F:\Temp\Myfolders_Server.reg

REG EXPORT "HKCU\SOFTWARE\Microsoft\Notepad" F:\Temp\Notepad_Server.reg

REG EXPORT "HKEY_CURRENT_USER\SOFTWARE\Overwolf" F:\Temp\Overwolf_Server.reg

REG EXPORT "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" F:\Temp\Power_Server.reg

REG EXPORT "HKCU\SOFTWARE\qBittorrent" F:\Temp\qBittorrent_Server.reg

REG EXPORT "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" F:\Temp\Quicklaunch_Server.reg

REG EXPORT "HKEY_CURRENT_USER\SOFTWARE\Realtek" F:\Temp\Realtek_Audio_Server.reg

REG EXPORT "HKEY_CLASSES_ROOT\regfile\shell\0_RegConvert" F:\Temp\RegConvert_Server.reg

REG EXPORT "HKEY_CURRENT_USER\Control Panel\International" F:\Temp\Regional_Setting_Server.reg

REG EXPORT "HKCU\SOFTWARE\StartAllback" F:\Temp\StartAllback_Server.reg

REG EXPORT "HKCU\SOFTWARE\StartIsBack" F:\Temp\StartIsBack_Server.reg

REG EXPORT "HKCU\SOFTWARE\VMware, Inc.\VMware Tray" F:\Temp\VMware_Server.reg

REG EXPORT "HKCU\SOFTWARE\Digital Extremes\Warframe" F:\Temp\Warframe_Server.reg

REG EXPORT "HKCU\Software\WinRAR" F:\Temp\WinRAR_Server.reg


rem mkdir F:\Temp\Quicklaunch
rem xcopy /c /q /k /r /h /y “c:\Users\Server\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\” F:\Temp\Quicklaunch 

echo.
echo Exported successfully
ping localhost -n 3 >nul
exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof