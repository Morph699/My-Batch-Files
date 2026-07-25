@echo off
CD /d "%~dp0"
title Optimizing System Settings...
chcp 65001 >nul

mode con:cols=78 lines=26
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
echo 			Please wait while tweaks load..
echo.
net accounts /maxpwage:unlimited

:: =========================================================================
:: PROFILE VELOCITY BOOST REGISTRY INJECTIONS
:: =========================================================================
:: 1. Skip AppX Pre-Staging Profile Bottlenecks
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx" /v AllowDeploymentOnNonRemovableDataDrives /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx" /v DeferAppProvisioningUntilLogon /t REG_DWORD /d 1 /f >nul

:: 2. Block Cloud Consumer Network Staging Timeouts
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul

:: 3. Optimize Profile Service Hive Loading
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ProfSvc" /v Start /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v ReportBootStatus /t REG_DWORD /d 0 /f >nul

:: =========================================================================
:: DOWNSTREAM EXECUTION CALLS
:: =========================================================================
:: Call your tweaks layout package cleanly
if exist "%WINDIR%\Setup\Files\MorphsTweaks2026.cmd" (
    call "%WINDIR%\Setup\Files\MorphsTweaks2026.cmd"
)


exit /b 0
