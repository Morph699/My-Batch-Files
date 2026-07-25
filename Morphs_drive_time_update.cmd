@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cd /d "%~dp0"
mode con:cols=77 lines=30
color 0E
title Bulk Drive Timestamp Updater (Debug Mode)

:: Define Fixed Path Exclusions (Do not modify the trailing backslashes here)
set "exclude_paths='d:\New Stuff\','d:\Temp\Dropbox\','d:\Temp\Music\','d:\Temp\My Docs\','d:\Temp\My Pics\','d:\Temp\Samsung Backup\','d:\Temp\_Full Apps\Drivers\','d:\Temp\_Full Apps\Full Apps\','d:\Temp\_Full Apps\Office2024_Installer\','d:\Temp\_Full Apps\Full ISO''s\','e:\Seeding\','f:\Temp\Full ISO''s\','g:\My Backups\My Docs\','g:\My Backups\My Pics\','g:\My Backups\Samsung Backup\','h:\Full ISO''s\Win10 ISO''s\Backup\'"

:menu
cls
:: Animated Unicode Logo Render
powershell -NoProfile -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
echo ===========================================================================
echo                        BULK DRIVE TIMESTAMP UPDATER
echo ===========================================================================

:: Dynamically build active drives list using PowerShell backend
set "drive_index=0"
for /f "tokens=*" %%d in ('powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.IO.DriveInfo]::GetDrives() | Where-Object { $_.DriveType -match 'Fixed|Removable' -and $_.IsReady } | ForEach-Object { $_.Name.Replace('\','') }"') do (
    set /a drive_index+=1
    set "drive_letter[!drive_index!]=%%d\"
    echo  !drive_index!. Update %%d Drive
)

set /a path_opt=!drive_index! + 1
set /a all_opt=!drive_index! + 2
set /a exit_opt=!drive_index! + 3

echo  !path_opt!. Custom Path Entry (Specific Folder/Directory)
echo  !all_opt!. Update ALL Connected Drives In Order
echo  !exit_opt!. Exit
echo ===========================================================================
echo  Excluded: .jpg, .mkv, .mp4, .iso, .vhdx, .adi
echo  Update here and then search for and edit this '$_.Extension -notin'
echo ===========================================================================
echo.

set /p choice="Select an option (1-!exit_opt!): "

if "%choice%"=="!exit_opt!" goto script_exit
if "%choice%"=="!all_opt!" set "target=ALL" & goto get_time
if "%choice%"=="!path_opt!" goto get_custom_path

:: Check for a valid dynamic numeric selection
if defined drive_letter[%choice%] (
    set "target=!drive_letter[%choice%]!"
    goto get_time
)

echo Invalid choice. Please try again.
pause
goto menu

:get_custom_path
echo.
echo ---------------------------------------------------------------------------
echo  CUSTOM PATH ENTRY
echo  - Type or paste the full directory path.
echo  - Example: D:\Documents\Projects\TargetFolder
echo ---------------------------------------------------------------------------
set "target="
set /p target="Enter folder path: "

:: Strip outer quotes if the user dragged and dropped the folder
set "target=%target:"=%"

:: Validate if the custom path actually exists
if not exist "%target%" (
    echo.
    echo [ERROR] The directory path specified does not exist. Please check your spelling.
    pause
    goto menu
)
goto get_time

:get_time
echo.
echo ---------------------------------------------------------------------------
echo  TIMESTAMP CONFIGURATION (Day/Month/Year)
echo  - Press ENTER to use the CURRENT date and time.
echo  - Or type a custom date using one of these formats:
echo      Date Only:   DD/MM/YYYY        (e.g., 25/12/2026)
echo      Date + Time: DD/MM/YYYY HH:mm  (e.g., 25/12/2026 14:30)
echo ---------------------------------------------------------------------------
set "custom_time="
set /p custom_time="Enter target time [Current]: "

if "%target%"=="ALL" goto all_drives
goto single

:single
echo.
:: Check if the path requested falls under any of the hardcoded exclusions
powershell -NoProfile -ExecutionPolicy Bypass -Command "$t = $env:target; $xp = @(%exclude_paths%); if ($xp | Where-Object { $t.StartsWith($_, 'CurrentCultureIgnoreCase') -or ($_.StartsWith($t, 'CurrentCultureIgnoreCase') -and $t.Length -gt 3) }) { Write-Host '[SKIPPED] This directory or its target hierarchy is explicitly excluded.' -ForegroundColor Yellow; exit 1 } else { exit 0 }"
if errorlevel 1 (
    echo.
    pause
    goto menu
)

echo Processing %target% at maximum speed...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$t = $env:target; $c = $env:custom_time; $xp = @(%exclude_paths%); $now = Get-Date; if (-not [string]::IsNullOrWhiteSpace($c)) { if ($c -match '\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}') { $now = [datetime]::ParseExact($c, 'dd/MM/yyyy HH:mm', $null) } else { $now = [datetime]::ParseExact($c, 'dd/MM/yyyy', $null) } }; $count = 0; if (Test-Path $t) { Get-ChildItem -Path $t -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { $f = $_.FullName; $_.Extension -notin '.jpg','.mkv','.mp4','.iso','.vhdx','.adi' -and -not ($xp | Where-Object { $f.StartsWith($_, 'CurrentCultureIgnoreCase') }) } | ForEach-Object { try { $_.CreationTime = $now; $_.LastWriteTime = $now; $_.LastAccessTime = $now; $count++ } catch {} }; Write-Host 'Successfully updated' $count 'files.' -ForegroundColor Green } else { Write-Host 'Error: Path not found by subsystem.' -ForegroundColor Red }"
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'Done processing '$env:target'!' -ForegroundColor Cyan"
echo.
pause
goto menu

:all_drives
echo.
echo Starting high-speed sequential run for all discovered drives...
for /l %%i in (1,1,%drive_index%) do (
    set "target=!drive_letter[%%i]!"
    echo.
    echo Processing drive !target! at maximum speed...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$t = $env:target; $c = $env:custom_time; $xp = @(%exclude_paths%); $now = Get-Date; if (-not [string]::IsNullOrWhiteSpace($c)) { if ($c -match '\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}') { $now = [datetime]::ParseExact($c, 'dd/MM/yyyy HH:mm', $null) } else { $now = [datetime]::ParseExact($c, 'dd/MM/yyyy', $null) } }; $count = 0; if (Test-Path $t) { Get-ChildItem -Path $t -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { $f = $_.FullName; $_.Extension -notin '.jpg','.mkv','.mp4','.iso','.vhdx','.adi' -and -not ($xp | Where-Object { $f.StartsWith($_, 'CurrentCultureIgnoreCase') }) } | ForEach-Object { try { $_.CreationTime = $now; $_.LastWriteTime = $now; $_.LastAccessTime = $now; $count++ } catch {} }; Write-Host 'Successfully updated' $count 'files.' -ForegroundColor Green } "
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'Completed drive '$env:target'!' -ForegroundColor Cyan"
)
echo.
echo All active connected drives have been updated!
pause
goto menu

:script_exit
cls
mode con:cols=78 lines=18
color 0E
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo  ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo Exiting shortly..         
timeout 3
exit
