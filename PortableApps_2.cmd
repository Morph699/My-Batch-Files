@echo off
cd /d "%~dp0"
TITLE Morphs Portables - Pack 2 (Above 100MB)
chcp 65001 >nul
setlocal EnableDelayedExpansion

mode con:cols=78 lines=10
color 1F

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: POSITION ADJUSTMENT: Anchors the slower heavy pack safely at the bottom (X=10, Y=620)
powershell -Command "$w=Add-Type -Name W -Pass -Member '[DllImport(\"kernel32.dll\")]public static extern IntPtr GetConsoleWindow();[DllImport(\"user32.dll\")]public static extern bool SetWindowPos(IntPtr h,IntPtr a,int x,int y,int cx,int cy,uint f);';$w::SetWindowPos($w::GetConsoleWindow(),[IntPtr]::Zero,10,620,0,0,0x0001)" >nul 2>&1

:: EMPTY FOLDER PROTECTION: SILENT EXIT (Returns control to menu script instantly)
dir "%~dp0*.exe" >nul 2>&1
if !errorlevel! neq 0 (
    endlocal
    exit /b
)

:: 1. Dynamically count only .exe payloads OVER 100MB
set "TotalInstalls=0"
for %%i in ("%~dp0*.exe") do (
    if %%~zi gtr 104857600 set /a TotalInstalls+=1
)

:: SILENT EXIT: Returns control to menu script instantly if no matching files found
if !TotalInstalls! equ 0 (
    endlocal
    exit /b
)

set "CurrentInstall=0"

:: Pre-cached progress bar blocks array drops the heavy repeating PowerShell process call
set "FullBar=██████████████████████████████████████████████████"
set "EmptyBar=                                                  "

:: 2. Process each large portable self-extractor sequentially
for %%i in ("%~dp0*.exe") do (
    if %%~zi gtr 104857600 (
        set /a CurrentInstall+=1
        set "AppName=%%~ni"
        
        :: EXTENDED MATH: Calculate percentage and scale to 50 blocks
        set /a "Pct=(CurrentInstall * 100) / TotalInstalls"
        set /a "Blocks=(Pct * 50) / 100"
        set /a "Left=50 - Blocks"
        
        :: Instant native string slicing updates the screen instantly without lagging
        for /f "tokens=1,2" %%a in ("!Blocks! !Left!") do (
            set "Bar=!FullBar:~0,%%a!!EmptyBar:~0,%%b!"
        )
        
        cls
        if "!SimulationMode!"=="1" (color 0E) else (color 1F)
        echo ==============================================================================
        echo                  MORPHS PORTABLES - LARGE FILES [Above 100MB]
        echo ==============================================================================
        echo.
        echo      Installing Pack 2: !CurrentInstall! of !TotalInstalls!
        echo      Current App:     "!AppName!"
        echo.
        echo      Progress: [!Bar!] !Pct!%%
        echo.
        echo ==============================================================================
        
        if "!SimulationMode!"=="1" (
            echo [SIMULATE] Safe-run active. Would now execute: "%%~nxi"
            timeout /t 2 >nul
        ) else (
            setlocal
            cmd /c "CD /d "%~dp0" && "%%~fi""
            endlocal
        )
        echo.
    )
)

mode con:cols=80 lines=22
color 0F
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
echo                                 Large Files Done!
echo                                 ------------------
endlocal
timeout /t 4 >nul

:: TARGETED CLEANUP: Purges ONLY the processed large .exe payloads over 100MB
if "!SimulationMode!"=="0" (
    for %%i in ("%~dp0*.exe") do (
        if %%~zi gtr 104857600 del /f /q "%%~fi" >nul 2>&1
    )
)
exit
