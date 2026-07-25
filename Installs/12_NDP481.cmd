@echo off
for /f "tokens=3 delims=." %%i in ('ver') do set "Build=%%i"

if %Build% lss 22000 (
    @for %%f in ("NDP481*.exe") do @start /wait "" "%%f" /q /norestart
)
