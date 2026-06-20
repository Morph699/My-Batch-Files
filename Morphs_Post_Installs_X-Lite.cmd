@echo off
TITLE Morphs Win10/Win11 X-Lite installs
chcp 65001 >nul

:: Force active working directory to script location immediately
CD /d "%~dp0"

:: CRITICAL FIX: Enable immediately at the top to preserve directory context and safe math execution
setlocal EnableDelayedExpansion

mode con:cols=80 lines=22
color 0F

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: FIXED: Run child script with fallback security rules intact
if exist "%~dp0setResolution.cmd" call "%~dp0setResolution.cmd"

:: FIXED: Explicit path injection prevents shortcut reference crashes on Win11
if exist "%~dp0MorphsTweaks2026.cmd" (
    start /min "" cmd /c "CD /d "%~dp0" && "MorphsTweaks2026.cmd""
)

:: FIXED: Changed 'call' to asynchronous 'start' execution to eliminate deployment freeze
if exist "c:\ProgramData\Morphs_Apps\Defender Control Portable\dControl.exe" (
    start "" /b "c:\ProgramData\Morphs_Apps\Defender Control Portable\dControl.exe"
)

cls
TITLE Morphs Win10/Win11 X-Lite installs
:: Animated Unicode Logo Render
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
ping localhost -n 3 >nul

:: =========================================================================
:: GLOBAL UNIFIED DYNAMIC COUNTER (Complete Master Sync Manifest)
:: =========================================================================
set "TotalInstalls=0"
for /f "delims=" %%i in ('dir /b /a-d "%~dp0*.cmd"') do (
    set "TargetScript=%%~nxi"
    set "IsExcluded=0"
    
    :: Global System Exclusions (Applies across all Morph Edition variants)
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    if /i "!TargetScript!"=="setResolution.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Post_Installs_X-Lite.cmd" set "IsExcluded=1"
    
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

:: =========================================================================
:: UNIVERSAL MAIN RUNNER ENGINE
:: =========================================================================
for /f "delims=" %%i in ('dir /b /o:n /a-d "%~dp0*.cmd"') do (
    set "TargetScript=%%~nxi"
    set "IsExcluded=0"
    
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    if /i "!TargetScript!"=="setResolution.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Post_Installs_X-Lite.cmd" set "IsExcluded=1"

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
            :: CRITICAL ARMORED EXECUTION: Nested escaping quotes protect spaces and force direct execution root context
            cmd /c "CD /d "%~dp0" && "%%i""
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
echo Press any key to reboot immediately, or setup will auto-reboot...
echo.
timeout /t 30
shutdown /r /f /t 3 /c "Rebooting your computer in a few seconds...."
if exist "%WINDIR%\Setup\scripts" RMDIR /S /Q "%WINDIR%\Setup\scripts"
if exist "%WINDIR%\Setup\Files"   RMDIR /S /Q "%WINDIR%\Setup\Files"
if exist "%WINDIR%\Setup\FilesU"  RMDIR /S /Q "%WINDIR%\Setup\FilesU"
del /q /f "%~f0" & exit