@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION
:: ==========================================
set "DEST_DIR=C:\ExtractedDrivers"
set "DISM_STAGE=%DEST_DIR%\LiveSystemDrivers"

:: Create the destination folder if it doesn't exist
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"

:: ==========================================
:: STEP 1: DISM LIVE DRIVER EXPORT WITH FILTERS
:: ==========================================
echo [STAGE 1] Exporting live system third-party drivers via DISM...
if not exist "%DISM_STAGE%" mkdir "%DISM_STAGE%"

dism /online /export-driver /destination:"%DISM_STAGE%" >nul

echo [STAGE 1] Filtering out excluded drivers (ESET, VMware, Dropbox)...
for /d %%G in ("%DISM_STAGE%\*") do (
    set "REMOVE_FOLDER=0"
    if exist "%%G\*.inf" (
        for /f "delims=" %%A in ('findstr /i /m "eset vmware dropbox" "%%G\*.inf" 2^>nul') do (
            set "REMOVE_FOLDER=1"
        )
    )
    if "!REMOVE_FOLDER!"=="1" (
        echo   -- Removing excluded driver folder: %%~nxG
        rmdir /s /q "%%G" >nul
    )
)
echo DISM Live Export completed cleanly.
echo ==========================================

:: ==========================================
:: STEP 2: DRIVE DETECTION AND SCANNING
:: ==========================================
echo [STAGE 2] Scanning for connected drives (Max 4 levels deep)...
echo ==========================================
for /f "skip=1 tokens=1" %%D in ('wmic logicaldisk get deviceid') do (
    set "DRIVE=%%D"
    
    if defined DRIVE (
        if /i not "!DRIVE!"=="C:" (
            echo Checking Drive !DRIVE! ...
            
            :: 1. SEARCH FOR DRIVER FOLDERS (Max 4 Levels Deep)
            for /f "delims=" %%F in ('dir "!DRIVE!\" /s /b /ad 2^>nul ^| findstr /i /r "\\driver$" /r "\\drivers$"') do (
                set "TARGET_PATH=%%F"
                
                set "SUBPATH=!TARGET_PATH:*:\=!"
                set "DEPTH=0"
                for %%A in (!SUBPATH:\= !) do set /a DEPTH+=1
                
                if !DEPTH! leq 4 (
                    echo Found folder: %%F ^(Depth: !DEPTH!^)
                    xcopy "%%F" "%DEST_DIR%" /E /I /Y /Q >nul
                )
            )

            :: 2. SEARCH FOR SPECIFIC CHIPSET / HARDWARE DRIVERS
            call :SearchFileDepth "!DRIVE!" "*amd*.exe"
            call :SearchFileDepth "!DRIVE!" "*Logitech.exe"
            call :SearchFileDepth "!DRIVE!" "*Razer*.exe"
            call :SearchFileDepth "!DRIVE!" "*Realtek*.zip"
            call :SearchFileDepth "!DRIVE!" "*REDRAGON*.zip"

            :: 3. SEARCH FOR UTILITIES / RUNTIMES
            call :SearchFileDepth "!DRIVE!" "*K-Lite*.exe"
            call :SearchFileDepth "!DRIVE!" "*MicrosoftEdgeWebView2RuntimeInstaller*.exe"
            call :SearchFileDepth "!DRIVE!" "*MSI*.zip"
            call :SearchFileDepth "!DRIVE!" "*VisualCpp*.exe"
            call :SearchFileDepth "!DRIVE!" "*VMware-tools*.exe"
            call :SearchFileDepth "!DRIVE!" "*VMware-tools*.msi"
            call :SearchFileDepth "!DRIVE!" "*WDDriveUtilities*.zip"
        )
    )
)

echo ==========================================
echo [FINISHED] All driver files processed at: %DEST_DIR%
echo Live drivers are stored cleanly in: %DISM_STAGE%
echo Original driver files on external drives were NOT modified.
exit /b

:: ==========================================
:: FILE SEARCH WITH PATH DEPTH COUNTING ENGINE
:: ==========================================
:SearchFileDepth
:: %1 = Drive letter (e.g. "D:"), %2 = Search Pattern
for /f "delims=" %%I in ('dir "%~1\%~2" /s /b 2^>nul') do (
    set "FULL_PATH=%%I"
    
    set "SUBPATH=!FULL_PATH:*:\=!"
    set "DEPTH=0"
    for %%A in (!SUBPATH:\= !) do set /a DEPTH+=1
    
    if !DEPTH! leq 4 (
        set "FILENAME=%%~nxI"
        set "SKIP_FILE=0"
        
        :: --- EXCLUSION FILTERS ---
        echo !FILENAME! | findstr /i "ExamDiff" >nul && set "SKIP_FILE=1"
        echo !FILENAME! | findstr /i "wimmountadksetup" >nul && set "SKIP_FILE=1"
        
        if "!SKIP_FILE!"=="1" (
            echo   [SKIPPED] Unwanted file blocked: !FILENAME!
        ) else (
            echo Found file: %%I ^(Depth: !DEPTH!^)
            
            if /i "%%~xI"==".zip" (
                echo Copying and extracting: !FILENAME!
                set "ZIP_OUT_DIR=%DEST_DIR%\%%~nI"
                if not exist "!ZIP_OUT_DIR!" mkdir "!ZIP_OUT_DIR!"
                
                copy /Y "%%I" "!ZIP_OUT_DIR!\" >nul
                tar -xf "!ZIP_OUT_DIR!\%%~nxI" -C "!ZIP_OUT_DIR!" 2>nul
                del /f /q "!ZIP_OUT_DIR!\%%~nxI" >nul
            ) else (
                copy /Y "%%I" "%DEST_DIR%\" >nul
            )
        )
    )
)
exit /b
