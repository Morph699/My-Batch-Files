@echo off
CD /d "%~dp0"
title Custom Windows Deployment - Optimizing System Settings...
chcp 65001 >nul

mode con:cols=78 lines=26
color 1F

cls
echo ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
echo.
echo         sss    sss   ssssss   ssssss   ssssss   ss   ss  sssssss
echo         ssss  ssss  ss    ss  ss   ss  ss   ss  ss   ss  ss     
echo         ss ssss ss  ss    ss  ssssss   ssssss   sssssss  sssssss
echo         ss  ss  ss  ss    ss  ss   ss  ss       ss   ss       ss
echo         ss      ss   ssssss   ss   ss  ss       ss   ss  sssssss
echo.
echo  ssssss  ssssss  sssssss   sssss  ssssssss  ss  ssssss  sss    ss  sssssss
echo ss       ss   ss ss       ss   ss    ss     ss ss    ss ssss   ss  ss     
echo ss       ssssss  sssssss  sssssss    ss     ss ss    ss ss ss  ss  sssssss
echo ss       ss   ss ss       ss   ss    ss     ss ss    ss ss  ss ss       ss
echo  ssssss  ss   ss sssssss  ss   ss    ss     ss  ssssss  ss   ssss  sssssss
echo.
echo ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
echo 			Please wait while tweaks load..
echo.

net accounts /maxpwage:unlimited

echo =========================================================
echo   RUNNING POST-INSTALLATION WINDOWS OPTIMIZATIONS
echo =========================================================

:: ----------------------------------------------------------------
:: SYSTEM CONTEXT TWEAKS (SYSTEM-WIDE)
:: ----------------------------------------------------------------
echo Applying System Registry Tweaks natively...

:: Defender SpyNet / Telemetry
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 0 /f >nul

:: Privacy, AI, Copilot Policies, and Consumer App Pre-installs
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f >nul

:: Storage Performance Updates (Disable Access Stamps & 8.3 Names)
reg add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d 1 /f >nul

:: System Preferences & Sign-In
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v "DevicePasswordLessBuildVersion" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d 1 /f >nul

:: Command Prompt Environment Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "CompletionChar" /t REG_DWORD /d 9 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "DefaultColor" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "EnableExtensions" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "PathCompletionChar" /t REG_DWORD /d 9 /f >nul


:: ----------------------------------------------------------------
:: DEFAULT USER CONTEXT TWEAKS (PROPAGATED TO ALL NEW USERS)
:: ----------------------------------------------------------------
echo Injecting User Settings into Default User Registry Profile...

:: Mount the Default User Template Hive
reg load HKEY_USERS\DefaultUser "C:\Users\Default\NTUSER.DAT" >nul

:: Windows UI, Snap Assist & Window Management
reg add "HKEY_USERS\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_USERS\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_USERS\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d 0 /f >nul

:: Fixed Cutoff: Ensure we unmount the default user hive when finished!
echo Unmounting Default User Registry Profile...
reg unload HKEY_USERS\DefaultUser >nul

call "%WINDIR%\Setup\Files\MorphsTweaks2026.cmd"
RMDIR /S /Q "%WINDIR%\Setup\Scripts"
del /q /f "%0"
