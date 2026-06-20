@echo off
TITLE Morphs Portables - Pack 2 (Above 100MB)
chcp 65001 >nul
CD /d "%windir%\Setup\filesU\Portables"
setlocal EnableDelayedExpansion

mode con:cols=78 lines=14
color 1F

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=0"

:: POSITION ADJUSTMENT: Stacks the faster small pack directly on top (X=10, Y=310)
powershell -Command "$w=Add-Type -Name W -Pass -Member '[DllImport(\"kernel32.dll\")]public static extern IntPtr GetConsoleWindow();[DllImport(\"user32.dll\")]public static extern bool SetWindowPos(IntPtr h,IntPtr a,int x,int y,int cx,int cy,uint f);';$w::SetWindowPos($w::GetConsoleWindow(),[IntPtr]::Zero,10,310,0,0,0x0001)" >nul 2>&1

:: EMPTY FOLDER PROTECTION: Verify if any .exe files exist before starting
dir *.exe >nul 2>&1
if !errorlevel! neq 0 (
    echo ==============================================================================
    echo [!] Notice: No portable .exe files found in the folder.
    echo ==============================================================================
    timeout /t 4 >nul
    exit /b
)

:: 1. Dynamically count only .exe payloads OVER 100MB
set "TotalInstalls=0"
for %%i in (*.exe) do (
    if /i not "%%i"=="PortableApps_1.exe" (
        if /i not "%%i"=="PortableApps_2.exe" (
            if %%~zi gtr 104857600 set /a TotalInstalls+=1
        )
    )
)

if !TotalInstalls! equ 0 (
    echo [!] No portable .exe installers found [Above 100MB].
    timeout /t 4 >nul
    exit /b
)

set "CurrentInstall=0"

:: 2. Process each large portable self-extractor sequentially
for %%i in (*.exe) do (
    if /i not "%%i"=="PortableApps_1.exe" (
        if /i not "%%i"=="PortableApps_2.exe" (
            if %%~zi gtr 104857600 (
                set /a CurrentInstall+=1
                set "AppName=%%~ni"
                
                :: EXTENDED MATH: Calculate percentage and scale to 50 blocks
                set /a "Pct=(CurrentInstall * 100) / TotalInstalls"
                set /a "Blocks=(Pct * 50) / 100"
                
                :: SYSTEM LOCALE FIX: Generates full blocks (9608) and blank spaces (32) purely through system decimal codes
                set "Bar="
                for /f "delims=" %%p in ('powershell -NoProfile -Command "[string]::new([char]9608, !Blocks!) + [string]::new([char]32, (50 - !Blocks!))"') do set "Bar=%%p"
                
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
                    echo [SIMULATE] Safe-run active. Would now execute: "%%i"
                    timeout /t 2 >nul
                ) else (
                    setlocal
                    cmd /c "CD /d "%~dp0" && "%%i""
                    endlocal
                )
                echo.
            )
        )
    )
)
endlocal
mode con:cols=78 lines=26
color 0F
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

echo                                 Large Files Done!
echo                                 ------------------
timeout 2 >nul
exit
