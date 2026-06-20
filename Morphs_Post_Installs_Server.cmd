@echo off
chcp 65001 >nul
cd /d "%~dp0"
TITLE Morphs Server-Edition installs
setlocal EnableDelayedExpansion

mode con:cols=80 lines=22
color 0F

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: Launch background optimization scripts safely wrapped in quotes
start /min "" "MorphsTweaks2026.cmd"
start /min "" "OEM_Reg_info_Server.cmd"
start /min "" "TSforge_Activation_W10.cmd"
start /min "" "Software_Configs_Server2026.cmd"
start /min "" "setResolution.cmd"

cls
TITLE Morphs Server-Edition installs
:: Animated Unicode Logo Render
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
timeout /t 3 >nul

:: =========================================================================
:: CONSOLIDATED DYNAMIC COUNTER
:: =========================================================================
set "TotalInstalls=0"
for %%i in (*.cmd) do (
    set "IsExcluded=0"
    if /i "%%i"=="%~nx0" set "IsExcluded=1"
    if /i "%%i"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "%%i"=="OEM_Reg_info_Server.cmd" set "IsExcluded=1"
    if /i "%%i"=="TSforge_Activation_W10.cmd" set "IsExcluded=1"
    if /i "%%i"=="Software_Configs_Server2026.cmd" set "IsExcluded=1"
    if /i "%%i"=="setResolution.cmd" set "IsExcluded=1"
    
    if "!IsExcluded!"=="0" set /a TotalInstalls+=1
)

:: Safety Check: Stop execution if zero valid payloads are identified
if !TotalInstalls! equ 0 (
    cls
    color 0C
    echo Error: No target installer .cmd files found in directory.
    pause
    exit /b
)

set "CurrentInstall=0"
set "Pct=0"

:: =========================================================================
:: MAIN INSTALLATION RUNNER
:: =========================================================================
for /f "delims=" %%i in ('dir /b /o:n /a-d *.cmd') do (
    set "TargetScript=%%i"
    set "IsExcluded=0"
    
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="OEM_Reg_info_Server.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="TSforge_Activation_W10.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Software_Configs_Server2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="setResolution.cmd" set "IsExcluded=1"

    if "!IsExcluded!"=="0" (
        set /a CurrentInstall+=1
        set "AppName=%%~ni"
        
        :: Real-time math evaluations using exclamation blocks
        set /a "Pct=(CurrentInstall * 100) / TotalInstalls"
        set /a "Blocks=(Pct * 30) / 100"
        
        :: Stable inline thick bar engine
        set "Bar="
        for /L %%g in (1,1,30) do (if %%g leq !Blocks! (set "Bar=!Bar!█") else (set "Bar=!Bar!░"))
        
color 1A
        cls
        echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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
        echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
        echo.
        echo      Installing !CurrentInstall! of !TotalInstalls! - "!AppName!"
        echo      Progress   [!Bar!] !Pct!%%                                  
        echo ================================================================================

        if "!SimulationMode!"=="1" (
            color 0E
            echo      [SIMULATE] Safe-run active. Would now execute: "%%i"
            timeout /t 2 >nul
            color 1F
        ) else (
            setlocal
            cmd /c "%%i"
            endlocal
        )
        echo.
    )
)


start /wait "" "%SystemRoot%\System32\SystemPropertiesPerformance.exe"
cls
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
echo                         System Fully Configured!
echo                        --------------------------
echo.
timeout /t 30
shutdown /r /f /t 3 /c "Rebooting your computer in a few seconds...."
if exist "%WINDIR%\Setup\scripts" RMDIR /S /Q "%WINDIR%\Setup\scripts"
if exist "%WINDIR%\Setup\Files"   RMDIR /S /Q "%WINDIR%\Setup\Files"
if exist "%WINDIR%\Setup\FilesU"  RMDIR /S /Q "%WINDIR%\Setup\FilesU"
del /q /f "%~f0" & exit
