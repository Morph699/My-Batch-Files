@echo off
title MORPHS_CREATIONS_DEPLOYMENT

:: ============================================================
:: AUTOMATIC ADMINISTRATOR ELEVATION
:: ============================================================
fsutil dirty query %systemdrive% >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Requesting Administrative Privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%TEMP%\getadmin.vbs"
    "%TEMP%\getadmin.vbs"
    del "%TEMP%\getadmin.vbs"
    exit /b
)

:: Force layout size: 120 columns wide, 40 lines tall
mode con: cols=120 lines=40

:: Force working directory to the current folder (C:\Windows\Setup\FilesU)
cd /d "%~dp0"

:: ============================================================
:: SIMULATION CONFIGURATION
:: 1 = Test Mode (Simulate Only), 0 = Active Deployment Mode
set Simulation=1
:: ============================================================

echo [!] Initializing Rainbow Core Graphics Engine...
echo [!] Launching background visualization window...
@echo off
:: 1. Initialize screen dimensions and UTF-8 encoding
mode con: cols=90 lines=32
chcp 65001 >nul
cls

:: 2. Your centered dragon artwork
echo                              ░░                                                           
echo                          ░░▒▒▒░░          ░      ░░                                       
echo                      ░▒▒▒▒░░░░             ░░░░   ░▒▒░ ░        ░▒▓▓▒░                    
echo                  ░▒▒▓▒░    ░░                 ░▒▒▒▒▒▓▓▓▓▓▓░       ▒▒▒▒▓░                  
echo               ░▒▓▓▒░  ░   ░░░                ░▒▓▒▒▒░░▒▓▓▒▒▓^█▓░     ░░░▒▒▓▒                
echo             ░▒▓▒░░ ░░░   ░░░▒              ░▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▓▓▒▓   ░▒░░░░▒▓▓░             
echo           ░▒▓▒░░░░░░░░   ▒░░▒▒            ░░▒▒░░░░░░░░░▒░  ░░░░▒   ░▒░  ░░ ░▓▓▒           
echo         ░▒▓▒░░░░░░░░░░░  ▒░░░▓▒          ░░░▒▒▒▒░  ░░▒░░░▒▒░░      ▒░░░ ░░░ ░▒▓▓░         
echo        ░▒▒░░░░░░▒▒░░░░░  ▒▒░░░▓▒░        ░░░▒▒▒▒▒░ ░     ░▒▒▒    ░▓▒░▒░░░░░░░ ░▒^█▓░       
echo       ▒▓▒░░░░░▒▒▒▒░░░░░  ░▒▒▒▒░░▓▓▒░░     ░░░▒▒▓▓▓▒▒░     ░░░   ▒▓▒▒░▒░░░░░░░░ ░▒▓▓░      
echo     ░▒▓▒▒▒▒▒░▒▒▒▒▒▒░░░░     ░░▒▒▒░▒▓▓▓▒▓░░░░░░▒▓▓▓▓▓▒▒       ░▒▓▓▒▒▒▒░░░░░░░░░░ ░░▓▓▒     
echo    ░▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒░░░░           ░▒▒▓▒▓▓▒▒░░░▒▒▓▓^█▓▓░░▒▓▓▓^█▓▒▓▒▒░░░░░░░░░░░░ ░░░▓▓▓    
echo    ░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒░░░░░░ ░         ░ ░▒▒▓▒▓▒▒▒▒▒▓▓^██▓^█▓▓█▓▓▒░░   ░ ░░░░░░░░░░░ ░░░▓▓░   
echo   ░▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒░░░░░░░░░░ ░░░     ░░▒▒▓▓▓▓▒▒▒▓▒▓▓▓^█▓^█▓░░   ░░░░░░░░░░░░░░░░ ░░░▒▓▓   
echo   ░▒▒▓▒▒▒▒▒░▒▒▒▒░░       ░░░░    ░ ░░░░░░▒▓▓▓▓▓▒░▒▒▒▒▒▓▓▓▓▓▒░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒  
echo   ▒▓▒▒░░▒▒▒▒▒▒░             ░ ░░░▒▓▒░░░▒░░░░░░░░░░░░▒▒▒▓▒▒▒▒░░░░░░░░░░░░▒▒░░░░░░░░░░░░▓▓░ 
echo   ▒▒     ░▒▒▓░               ░░▒▓▒▒░░▒▒░░░░░   ░░░░░░▒▒░░░░   ░░░░░     ░░░▒░░░░░░░░░░▓▓░ 
echo   ▒        ▒▒             ░▒░▓▓^█▓▒░░░▒▒▓▒░    ░░░░░░░░  ░░▒                ░░░░░░░░░░░▒▓░ 
echo   ▒        ░░         ░▒▓▒▒▒░▒▒▓▓▒    ░░▒▓▓▒    ░░░░    ░▒▓^█░               ░▒▒░░░░░░░▒▓  
echo   ░░        ▒      ░▓▓▓▓▒▒▒░▒░░▒░       ░▓▓▓▒▒▒▒░░░░░   ░░▒▓▓░               ▒▒░░    ░▒▒  
echo                 ░▒▓▓▓▓▒▒▒░ ░░░░░       ░░▓░▓░░▒▓▒▒▒▒▓▓▓▒▒░░▒▓▓░              ▒░      ░▒░  
echo               ░▒▓▓▓▓▓▒░░   ░░░      ░░░░░░  ▒░░▒░▒▓▓▒▓▓▓▓▒▒▒▓▓▓             ░░       ░▒   
echo              ░▒▓▓▓▓▓▒░    ░▒░░    ░░░▒▒░░ ░░░░░░░░▒▓▓▒▓▓▓▓▓░▒▓▓▒          ░░         ▒    
echo              ░▒▓▓▓▓▒      ░▓░▒░░░▒▓▒░░▒▒░░░░░▒▒░░░░░░▒▒░▒▒▒▓▒▒░▓▓░                  ▒     
echo              ░▒▒▓▓▓░   ░░▒░▒▒░▒▒▒▒▒▒░ ░░░░░░░░░▒░  ░ ░▒▒▒▒▒▓▓▒░░▒▒                 ░      
echo               ░▒▒▒▓▓▒░░░░░░░░░░░░▒▓▒▒░░░░░░░░  ░▒░░░░░▒▒▒▒░░▒▓▓▒▒░░                       
echo                 ░░▒▒▒▒▒▓▒▓▒▓▒▒▒▒░░░▒▒▓▒▒▒▒▒░░░░  ░░░░░░▒▓▓▓▒░░░▒▒▓▓▓▒                     
echo                      ░░░░░░░░▒▒▒▒░░░░  ░░░▒▒▓▓▒▒░ ░░░▒▒▒▒▒▒▒░░░░▒▒▒▒▓▒                    
echo               ░░       ░░░░         ░   ░░▒░ ░▒▒▒▒░░      ▒▒▓▓▓▒░▒▒▒▒▒▒                   
echo                          ░                 ░    ░░ ░        ░   ░░░ ░░░                   

:: 3. Interactive Pause
timeout /t 3 >nul

:: Configures full UTF-8 encoding support and maintains an unflooded center zone for the tracking box
start "" /max powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8; $w=[Console]::LargestWindowWidth; $h=[Console]::LargestWindowHeight; [Console]::WindowWidth=$w; [Console]::WindowHeight=$h; [Console]::CursorVisible=$false; (Get-Host).UI.RawUI.BackgroundColor='Black'; (Get-Host).UI.RawUI.ForegroundColor='White'; [Console]::Clear(); $chars='0123456789ABCDEF'; $frames=@(' [ ■ □ □ □ □ ] ',' [ ■ ■ □ □ □ ] ',' [ ■ ■ ■ □ □ ] ',' [ ■ ■ ■ ■ □ ] ',' [ ■ ■ ■ ■ ■ ] '); $rainbow=@('Red','Yellow','Green','Cyan','Blue','Magenta'); $step=0; while($true){ $cf=$frames[$step%%$frames.Count]; $rc=$rainbow[$step%%$rainbow.Count]; $step++; [Console]::SetCursorPosition(0,2); [Console]::ForegroundColor='Cyan'; $l1=' =============================================================================='; [Console]::WriteLine($l1.PadLeft([Math]::Max(0, [int](($w+$l1.Length)/2)))); [Console]::ForegroundColor='White'; $l2='                     >>> MORPHS CREATIONS SYSTEMS ACTIVE <<<                  '; [Console]::WriteLine($l2.PadLeft([Math]::Max(0, [int](($w+$l2.Length)/2)))); [Console]::ForegroundColor='Cyan'; $l3=' =============================================================================='; [Console]::WriteLine($l3.PadLeft([Math]::Max(0, [int](($w+$l3.Length)/2)))); $midY = [Math]::Max(5, [int]($h/2)-3); $boxX = [Math]::Max(0, [int](($w-66)/2)); [Console]::SetCursorPosition($boxX, $midY); [Console]::ForegroundColor='Green'; [Console]::WriteLine('=================================================================='); [Console]::SetCursorPosition($boxX, $midY+1); [Console]::WriteLine('║                                                                ║'); [Console]::SetCursorPosition($boxX, $midY+2); [Console]::Write('║ '); [Console]::ForegroundColor='Yellow'; [Console]::Write('                 INSTALL IN PROGRESS: PLEASE WAIT               '); [Console]::ForegroundColor='Green'; [Console]::WriteLine(' ║'); [Console]::SetCursorPosition($boxX, $midY+3); [Console]::Write('║ '); [Console]::ForegroundColor=$rc; [Console]::Write('               DEPLOYMENT INSTANCE =>'+$cf+'            '); [Console]::ForegroundColor='Green'; [Console]::WriteLine(' ║'); [Console]::SetCursorPosition($boxX, $midY+4); [Console]::WriteLine('║                                                                ║'); [Console]::SetCursorPosition($boxX, $midY+5); [Console]::WriteLine('=================================================================='); do { $x=Get-Random -Min 0 -Max ($w-35); $y=Get-Random -Min 5 -Max ($h-2); } while ($y -ge $midY -and $y -le ($midY+5) -and $x -ge ($boxX-30) -and $x -le ($boxX+66)); [Console]::SetCursorPosition($x,$y); [Console]::ForegroundColor=$rc; $addr='0x'+(1..8|%%{$chars[(Get-Random -Max 16)]})-join ''; [Console]::Write('>> NODE:'+$addr+' RAINBOW_DATA_STREAM... $(Get-Random -Min 1000 -Max 9999)kb/s'); Start-Sleep -Milliseconds 40 }"

echo.
echo ============================================================
if "%Simulation%"=="1" (
    echo   [SIMULATION MODE ACTIVE] TRACKING LOGICAL CHAIN
) else (
    echo   STARTING DEPLOYMENT CHAIN (SEQUENTIAL FOLDER SCAN)
)
echo ============================================================
echo.

:: Enable real-time dynamic variable updates inside the loop
setlocal enabledelayedexpansion

:: --- CONFIGURATION: Dynamic Same-Folder Loop ---
for %%G in ("*.cmd") do (
    
    :: 1. Critical check: Skip running this master script itself
    if /i "%%~nxG" neq "%~nx0" (
        
        :: Reset tracking variable for this file iteration
        set "SkipFile=0"
        
        :: 2. Check current filename against the exclusion list
        for %%E in (
            "Morphs_Driver_Search.cmd"
            "Morphs_Post_Installs_Server.cmd"
            "MorphsTweaks2026.cmd"
            "OEM_Reg_info_Server.cmd"
            "Software_Configs_Server2026.cmd"
            "TSforge_Activation_W10.cmd"
            "Morphs_Post_Installs_Installer.cmd"
            "OEM_Reg_info_Installs.cmd"
            "Software_Configs_Installs2026.cmd"
            "Morphs_Post_Installs_X-SuperLite.cmd"
            "Morphs_Post_Installs_X-Lite.cmd"
            "Morphs_Post_Installs_Morphed.cmd"
            "Morphs_Post_Installs_choice.cmd"
            "Morphs_Post_Installs_Max_Plain.cmd"
        ) do (
            if /i "%%~nxG"==%%E set "SkipFile=1"
        )
        
        :: 3. Process the file only if SkipFile is still 0
        if "!SkipFile!"=="0" (
            if "%Simulation%"=="1" (
                echo [SIMULATION] ^>^>^> Would execute target script: %%~nG
                timeout /t 1 >nul
                echo [SIMULATION] [OK] Logic loop pass complete for: %%~nG
                echo ------------------------------------------------------------
            ) else (
                echo [+] Launching: %%~nG...
                
                :: Run the numbered script and pause the loop until it fully finishes
                call "%%~G"
                
                echo [OK] Completed: %%~nG
                echo ------------------------------------------------------------
            )
        )
    )
)

echo.
echo ============================================================
if "%Simulation%"=="1" (
    echo [+] Simulation pipeline test finished cleanly.
    echo ============================================================
    pause
    :: Terminate the detached PowerShell graph window before exiting
    taskkill /f /im powershell.exe >nul 2>&1
    exit
) else (
    echo [+] All deployments executed successfully.
    echo ============================================================
    echo.
    echo [-] Purging staging environment: C:\Windows\Setup\FilesU...
    
    :: Safely drop execution lock by moving to parent, then clear only FilesU
    cd /d C:\Windows\Setup
    if exist "FilesU" rmdir /s /q "FilesU"
    
    echo [✓] FilesU deployment binaries cleared cleanly from Setup tree.
    echo.
    echo [!] WARNING: Deployment cycle finalized. 
    echo [!] Commencing localized mandatory system environment reload...
    echo.
    
    :: Clean 5-Second visual countdown sequence
    timeout /t 1 >nul & echo [!] Initializing hardware cycling in: 5...
    timeout /t 1 >nul & echo [!] Initializing hardware cycling in: 4...
    timeout /t 1 >nul & echo [!] Initializing hardware cycling in: 3...
    timeout /t 1 >nul & echo [!] Initializing hardware cycling in: 2...
    timeout /t 1 >nul & echo [!] Initializing hardware cycling in: 1...
    timeout /t 1 >nul
    
    :: Terminate the detached PowerShell background animation window safely
    taskkill /f /im powershell.exe >nul 2>&1
    
    :: Force an immediate, graceful system reboot
    shutdown /r /t 0 /f
)
exit
