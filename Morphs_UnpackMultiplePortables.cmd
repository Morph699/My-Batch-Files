@echo off
chcp 65001 >nul
cd /d "%~dp0"

:: Initialize configuration sizes outside loops to prevent layout resizing flickering
mode con:cols=80 lines=22

TITLE Morphs Portable Extracter
cls
color 0F
:: Animated Unicode Logo Render
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.

timeout /t 1 >nul
color 1F

:: CRITICAL FIX: Strip exclamation marks and spaces via PowerShell BEFORE enabling delayed expansion
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem *.exe | Where-Object { $_.Name -match '[ !]' } | ForEach-Object { $newName = $_.Name -replace ' ', '_' -replace '!', ''; Rename-Item -Path $_.FullName -NewName $newName -ErrorAction SilentlyContinue }"

:: Now it is completely safe to load delayed expansion
setlocal enabledelayedexpansion
set "TotalFiles=0"
for %%f in (*.exe) do set /a TotalFiles+=1

:: Fail-safe exit check if no executables exist
if !TotalFiles! equ 0 (
    echo [!] No executable targets found. Exiting...
    timeout /t 3 >nul
    exit /b
)

set "CurrentFile=0"
set "Pct=0"

:: Pre-assign 30-block progress bar layouts to draw instantly without loop calculations
set "Bar0=░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar1=█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar2=██░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar3=███░░░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar4=████░░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar5=█████░░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar6=██████░░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar7=███████░░░░░░░░░░░░░░░░░░░░░░░"
set "Bar8=████████░░░░░░░░░░░░░░░░░░░░░░"
set "Bar9=█████████░░░░░░░░░░░░░░░░░░░░░"
set "Bar10=██████████░░░░░░░░░░░░░░░░░░░░"
set "Bar11=███████████░░░░░░░░░░░░░░░░░░░"
set "Bar12=████████████░░░░░░░░░░░░░░░░░░"
set "Bar13=█████████████░░░░░░░░░░░░░░░░░"
set "Bar14=██████████████░░░░░░░░░░░░░░░░"
set "Bar15=███████████████░░░░░░░░░░░░░░░"
set "Bar16=████████████████░░░░░░░░░░░░░░"
set "Bar17=█████████████████░░░░░░░░░░░░░"
set "Bar18=██████████████████░░░░░░░░░░░░"
set "Bar19=███████████████████░░░░░░░░░░░"
set "Bar20=████████████████████░░░░░░░░░░"
set "Bar21=█████████████████████░░░░░░░░░"
set "Bar22=██████████████████████░░░░░░░░"
set "Bar23=███████████████████████░░░░░░░"
set "Bar24=████████████████████████░░░░░░"
set "Bar25=█████████████████████████░░░░░"
set "Bar26=██████████████████████████░░░░"
set "Bar27=███████████████████████████░░░"
set "Bar28=████████████████████████████░░"
set "Bar29=█████████████████████████████░"
set "Bar30=██████████████████████████████"

FOR %%f IN (*.exe) DO (
    if exist "%%~f" (
        set /a CurrentFile+=1
        set "FileName=%%~nxf"
        
        :: Calculate accurate progress metrics
        set /a "Pct=(CurrentFile * 100) / TotalFiles"
        :: Scale 0-100% to a 0-30 block range using (Pct * 3) / 10
        set /a "Blocks=(Pct * 3) / 10"
        
        :: Map active string pointer instantly
        set "ActiveBar=!Bar0!"
        if !Blocks! equ 1 set "ActiveBar=!Bar1!"
        if !Blocks! equ 2 set "ActiveBar=!Bar2!"
        if !Blocks! equ 3 set "ActiveBar=!Bar3!"
        if !Blocks! equ 4 set "ActiveBar=!Bar4!"
        if !Blocks! equ 5 set "ActiveBar=!Bar5!"
        if !Blocks! equ 6 set "ActiveBar=!Bar6!"
        if !Blocks! equ 7 set "ActiveBar=!Bar7!"
        if !Blocks! equ 8 set "ActiveBar=!Bar8!"
        if !Blocks! equ 9 set "ActiveBar=!Bar9!"
        if !Blocks! equ 10 set "ActiveBar=!Bar10!"
        if !Blocks! equ 11 set "ActiveBar=!Bar11!"
        if !Blocks! equ 12 set "ActiveBar=!Bar12!"
        if !Blocks! equ 13 set "ActiveBar=!Bar13!"
        if !Blocks! equ 14 set "ActiveBar=!Bar14!"
        if !Blocks! equ 15 set "ActiveBar=!Bar15!"
        if !Blocks! equ 16 set "ActiveBar=!Bar16!"
        if !Blocks! equ 17 set "ActiveBar=!Bar17!"
        if !Blocks! equ 18 set "ActiveBar=!Bar18!"
        if !Blocks! equ 19 set "ActiveBar=!Bar19!"
        if !Blocks! equ 20 set "ActiveBar=!Bar20!"
        if !Blocks! equ 21 set "ActiveBar=!Bar21!"
        if !Blocks! equ 22 set "ActiveBar=!Bar22!"
        if !Blocks! equ 23 set "ActiveBar=!Bar23!"
        if !Blocks! equ 24 set "ActiveBar=!Bar24!"
        if !Blocks! equ 25 set "ActiveBar=!Bar25!"
        if !Blocks! equ 26 set "ActiveBar=!Bar26!"
        if !Blocks! equ 27 set "ActiveBar=!Bar27!"
        if !Blocks! equ 28 set "ActiveBar=!Bar28!"
        if !Blocks! equ 29 set "ActiveBar=!Bar29!"
        if !Blocks! equ 30 set "ActiveBar=!Bar30!"

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
echo      Extracting !CurrentFile! of !TotalFiles! - !FileName!
echo      Progress   [!ActiveBar!] !Pct!%%
 
 :: Fire raw extraction commands
 "%%~f" /SILENT /PORTABLE=1
    )
)

:: Termination/Completion Page Display
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
echo      			 All Done^!
echo      			-----------
timeout /t 2 >nul
endlocal
exit
