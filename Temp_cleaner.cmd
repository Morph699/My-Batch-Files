@echo off
chcp 65001 >nul
mode con:cols=78 lines=26

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Elevating to Administrator...
    powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

color 1F
cls
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo  ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo  ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo             ===================================================
echo                ANALYSING AND CLEANING TEMPORARY FILES...
echo             ===================================================
echo.
powershell -NoProfile -Command "$Targets = @{'User Temp' = '%USERPROFILE%\AppData\Local\Temp'; 'Windows Temp' = 'C:\Windows\Temp'; 'Prefetch' = 'C:\Windows\Prefetch'}; foreach ($Name in $Targets.Keys) { $Path = $Targets[$Name]; if (Test-Path $Path) { $Files = Get-ChildItem -Path $Path -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer }; $Size = ($Files | Measure-Object -Property Length -Sum).Sum; if (!$Size) { $Size = 0 }; $TopLevelItems = Get-ChildItem -Path $Path -Force -ErrorAction SilentlyContinue; foreach ($Item in $TopLevelItems) { try { Remove-Item -Path $Item.FullName -Recurse -Force -ErrorAction SilentlyContinue } catch {} }; if ($Size -ge 1GB) { $DisplaySize = '{0:N2} GB' -f ($Size / 1GB) } else { $DisplaySize = '{0:N2} MB' -f ($Size / 1MB) }; Write-Host \"$DisplaySize targeted from $Name\" -ForegroundColor Cyan } }"
echo.
ping localhost -n 3 >nul
