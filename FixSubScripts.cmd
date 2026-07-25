@echo off
TITLE Morphs_SubScript_Mass_Fixer
cd /d "%~dp0"
setlocal EnableDelayedExpansion

echo ====================================================================
echo             Morphs Automatic Sub-Script Typo Corrector
echo ====================================================================
echo.
echo This will safely restore the exact cd /d "%%~dp0" string syntax.
echo.
pause

set "FixedCount=0"

:: Scan all batch files in the current folder
for /f "delims=" %%f in ('dir /b /a-d "*.cmd"') do (
    set "CurrentFile=%%f"
    
    :: Skip fixer script and master runners to protect them
    set "IsMaster=0"
    if /i "%%f"=="%~nx0" set "IsMaster=1"
    if /i "%%f"=="MorphsTweaks2026.cmd" set "IsMaster=1"
    if /i "!CurrentFile:~0,19!"=="Morphs_Post_Installs" set "IsMaster=1"
    
    if "!IsMaster!"=="0" (
        set "NeedsFix=0"
        
        :: Identify files containing either the typo or the unwanted literal folder paths
        for /f "delims=" %%l in ('findstr /i /c:"cd /d " "%%f"') do set "NeedsFix=1"
        
        if "!NeedsFix!"=="1" (
            echo Fixing: %%f
            if exist "%%f.tmp" del /f /q "%%f.tmp"
            
            :: Process line-by-line using safe variable replacement loops
            for /f "delims=" %%a in ('type "%%f"') do (
                set "Line=%%a"
                set "Test=!Line!"
                
                :: Tweak: If the line contains a CD command, force drop the universal placeholder text
                if "!Test:~0,5!"=="cd /d" (
                    set "Line=cd /d "%%~dp0""
                ) else if "!Test:~0,5!"=="CD /d" (
                    set "Line=cd /d "%%~dp0""
                )
                
                echo(!Line!>>"%%f.tmp"
            )
            
            move /y "%%f.tmp" "%%f" >nul
            set /a FixedCount+=1
        )
    )
)

echo.
echo ====================================================================
echo Done! Cleaned up and applied true variable syntax to !FixedCount! files.
echo ====================================================================
pause
exit /b
