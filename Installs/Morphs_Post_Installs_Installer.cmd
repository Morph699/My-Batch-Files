@echo off
TITLE Morphs_Post_Installs_Installs
chcp 65001 >nul
cd /d "%~dp0"
setlocal EnableDelayedExpansion
mode con:cols=80 lines=22
color 0F
RMDIR /S /Q "%WINDIR%\Setup\Scripts\" 2>nul
RMDIR /S /Q "%WINDIR%\Setup\Files\" 2>nul

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: Explicit path injection prevents shortcut reference crashes on Win11
if exist "%~dp0MorphsTweaks2026.cmd" (
    start /min "" cmd /c "cd /d %~dp0 && MorphsTweaks2026.cmd"
)

:: Changed 'call' to asynchronous 'start' execution to eliminate deployment freeze
if exist "c:\ProgramData\Morphs_Apps\Defender Control Portable\dControl.exe" (
    start "" /b "c:\ProgramData\Morphs_Apps\Defender Control Portable\dControl.exe"
)

cls
TITLE Morphs_Post_Installs_Installs
:: Animated Unicode Logo Render
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
ping localhost -n 3 >nul

:: Generate Live System Analytics & Memory Monitor (Continuous Background Streaming)
echo Initializing Diagnostics Dashboard...
set "AnalyticsFile=%~dp0analytics.txt"
set "StatusFile=%~dp0status.txt"
set "StaticSpecsFile=%~dp0static_specs.txt"

:: Generate static OS and CPU specs once to save processing power
powershell -NoProfile -Command "$o=(Get-CimInstance Win32_OperatingSystem).Caption; $c=(Get-CimInstance Win32_Processor).Name.Trim(); ($o + '|' + $c) | Out-File -FilePath '%StaticSpecsFile%' -Encoding ascii -Force" 2>nul

:: Initialize Base Status Entry
echo INITIALIZING INTERFACE... > "%StatusFile%"

:: Launch Background Music via the Tiny 20KB Player
if exist "%~dp0cmdmp3.exe" (
    start /min "" "%~dp0cmdmp3.exe" "%~dp0music.mp3"
)

:: Fire Up the Fullscreen Animated Graphic Shield Over the UI
if exist "%~dp0Kaleidoscope Grid2_Installer_Coloured.hta" (
    start "" "mshta.exe" "%~dp0Kaleidoscope Grid2_Installer_Coloured.hta"
)

:: Allow a brief 2-second buffer for the HTA UI overlay to lock onto the screen
timeout /t 2 /nobreak >nul

:: =========================================================================
:: GLOBAL UNIFIED DYNAMIC COUNTER (Complete Master Sync Manifest)
:: =========================================================================
set "TotalInstalls=0"
for /f "delims=" %%i in ('dir /b /a-d "%~dp0*.cmd"') do (
    set "TargetScript=%%~nxi"
    set "IsExcluded=0"
    
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="OEM_Reg_info_Installs.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="TSforge_Activation_W10.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Software_Configs_Installs2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Driver_Search.cmd" set "IsExcluded=1"

    
    if "!IsExcluded!"=="0" set /a TotalInstalls+=1
)

if !TotalInstalls! equ 0 (
    taskkill /f /im mshta.exe >nul 2>&1
    taskkill /f /im cmdmp3.exe >nul 2>&1
    del /f /q "%StatusFile%" "%AnalyticsFile%" "%StaticSpecsFile%" 2>nul
    cls
    color 0C
    echo Error: No target installer .cmd files found in directory: "%~dp0"
    pause
    exit /b
)

set "CurrentInstall=0"
set "Pct=0"

:: Cache progress blocks array to optimize rendering loop
set "FullBar=██████████████████████████████"
set "EmptyBar=░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

:: =========================================================================
:: UNIVERSAL MAIN RUNNER ENGINE
:: =========================================================================
for /f "delims=" %%i in ('dir /b /o:n /a-d "%~dp0*.cmd"') do (
    set "TargetScript=%%~nxi"
    set "IsExcluded=0"
    
    if /i "!TargetScript!"=="%~nx0" set "IsExcluded=1"
    if /i "!TargetScript!"=="MorphsTweaks2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="OEM_Reg_info_Installs.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="TSforge_Activation_W10.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Software_Configs_Installs2026.cmd" set "IsExcluded=1"
    if /i "!TargetScript!"=="Morphs_Driver_Search.cmd" set "IsExcluded=1"


    if "!IsExcluded!"=="0" (
        set /a CurrentInstall+=1
        set "AppName=%%~ni"
        
        set /a "Pct=(CurrentInstall * 100) / TotalInstalls"
        set /a "Blocks=(Pct * 30) / 100"
        set /a "Left=30 - Blocks"
        
        :: Tweak: Fast string slicing replaces the heavy 1-to-30 loop sequence
        for /f "tokens=1,2" %%a in ("!Blocks! !Left!") do (
            set "Bar=!FullBar:~0,%%a!!EmptyBar:~0,%%b!"
        )
        
        :: PIPE TRACKING PARAMETERS DIRECTLY TO THE HTA 
        echo Installing !CurrentInstall! of !TotalInstalls!: !AppName! - !Pct!%%> "%StatusFile%"

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
            cmd /c "%~dp0%%i"
            endlocal
        )
        echo.
    )
)

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
echo                         System Fully Configured!
echo                        --------------------------
echo.

:: Clear visual overlay shield to reveal desktop focus
taskkill /f /im mshta.exe >nul 2>&1
del /f /q "%StatusFile%" "%AnalyticsFile%" "%StaticSpecsFile%" 2>nul

:: Moved: Opens directly into desktop focus immediately after HTA overlay drops
if "!SimulationMode!"=="0" (
    start /wait "" "%SystemRoot%\System32\SystemPropertiesPerformance.exe"
) else (
    timeout /t 2 >nul
)

:: Music plays for the final 30 seconds of execution for atmosphere
timeout /t 30
taskkill /f /im cmdmp3.exe >nul 2>&1

:: Trigger destructive cleanup and reboot (Bypassed in simulation mode)
if "!SimulationMode!"=="0" (
    :: Run the temporary cleaner script first and wait for it to finish
    if exist "temp_cleaner.cmd" (
        call "temp_cleaner.cmd"
    ) else if exist "%~dp0temp_cleaner.cmd" (
        call "%~dp0temp_cleaner.cmd"
    ) else (
        echo [WARNING] temp_cleaner.cmd not found, proceeding with reboot...
    )

    shutdown /r /f /t 3 /c "Rebooting your computer in a few seconds...."
    if exist "%WINDIR%\Setup\scripts" RMDIR /S /Q "%WINDIR%\Setup\scripts" 2>nul
    if exist "%WINDIR%\Setup\Files"   RMDIR /S /Q "%WINDIR%\Setup\Files" 2>nul
    if exist "%WINDIR%\Setup\FilesU"  RMDIR /S /Q "%WINDIR%\Setup\FilesU" 2>nul
    del /q /f "%~f0" 2>nul & exit
) else (
    cls
    color 0E
    echo [SIMULATION] Process completed. File purges and reboots skipped.
    pause
    exit /b 0
)
