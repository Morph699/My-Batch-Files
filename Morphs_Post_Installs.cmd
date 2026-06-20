@echo off
setlocal EnableDelayedExpansion
TITLE Morphs 2026 Installs Menu
chcp 65001 >nul
cd /d "%~dp0"

:MENU
mode con:cols=80 lines=25
color 0F

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: =========================================================================
:: GLOBAL UNIFIED DYNAMIC COUNTER (Complete Master Sync Manifest)
:: =========================================================================
set "TotalInstalls=1"

for /f "delims=" %%i in ('dir /b /a-d "%~dp0*.cmd"') do (
    set "TargetScript=%%~nxi"
    set "IsExcluded=0"

    :: Self-Exclusion
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    
    :: Add your custom file exclusions here
    if /i "!TargetScript!"=="Choice_Morphs_Post_Installs.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="setResolution.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="PortableApps_1.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="PortableApps_2.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Post_Installs_Max.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Post_Installs_Max_Plain.cmd" set "IsExcluded=1"

    :: To add a new exclusion, copy-paste the line below and change the filename:
    :: if /i "!TargetScript!"=="YourNewFile.cmd" set "IsExcluded=1"

    if "!IsExcluded!"=="0" set /a TotalInstalls+=1
)

:: Fail-safe check to prevent division-by-zero crashes
if !TotalInstalls! equ 0 (
    echo [ERROR] No installation scripts found to process inside "%~dp0".
    timeout /t 8 >nul
    exit /b
)

set "CurrentInstall=0"
set "Pct=0"
:MENU
cls
TITLE Morphs 2026 Installs Menu
mode con:cols=80 lines=25
color 0F
setlocal DisableDelayedExpansion
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
setlocal EnableDelayedExpansion
echo.
echo                    ==== Morphs 2026 Installs Menu =====
echo.
echo                1. Install normally with apps and portables
echo.
echo                2. Install only portables
echo.
echo                3. Install only apps
echo.
echo                9. Reboot
echo.
echo                    ===== PRESS 'Q' TO QUIT =======
echo.

SET "INPUT="
SET /P INPUT=Please choose a number: 

IF /I "%INPUT%"=="1" GOTO Normal
IF /I "%INPUT%"=="2" GOTO Portables
IF /I "%INPUT%"=="3" GOTO Apps
IF /I "%INPUT%"=="Q" GOTO Quit
IF /I "%INPUT%"=="9" GOTO Reboot

GOTO Invalid
:Invalid
cls
color C0
cls
setlocal DisableDelayedExpansion
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo                        ===== INVALID INPUT =====
echo.
echo                    Please select a number between 1 and 3
echo                         or select 'Q' to quit.
echo                    ===== PRESS A KEY TO CONTINUE =====
endlocal
PAUSE >nul
goto MENU

:Normal
start "" /d "%~dp0" Morphs_Post_Installs_Max.cmd
GOTO Quit

:Portables
start "" "%windir%\Setup\filesU\Portables\PortableApps_1.cmd"
start "" "%windir%\Setup\filesU\Portables\PortableApps_2.cmd"
GOTO Quit

:Apps
start "" /d "%~dp0" Morphs_Post_Installs_Max_Plain.cmd
GOTO Quit

:Quit
cls
color 0E
mode con:cols=78 lines=22
cls
setlocal DisableDelayedExpansion
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo                    ** For more of my amazing releases **
echo                *** Be sure to check out Morph69's uploads ***
echo                     *** @ https://www.teamos.xyz/ ***
echo.
echo                          Exiting shortly...
endlocal
timeout /t 3 >nul
exit

:Reboot
mode con:cols=78 lines=23
color 1F
cls
setlocal DisableDelayedExpansion
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo                    ** For more of my amazing releases **
echo                *** Be sure to check out Morph69's uploads ***
echo                     *** @ https://www.teamos.xyz/ ***
echo.
echo                   Are you sure you want to reboot your PC?
echo                  If not, you will need to close this window
echo                     Otherwise, press ENTER to continue...
endlocal
pause >nul
shutdown /r /f /t 3 /c "Rebooting your computer in a few seconds...."
if exist "%WINDIR%\Setup\scripts" RMDIR /S /Q "%WINDIR%\Setup\scripts"
if exist "%WINDIR%\Setup\Files"   RMDIR /S /Q "%WINDIR%\Setup\Files"
del /q /f "%~f0" & exit
