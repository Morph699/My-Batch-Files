@echo off
for /f "tokens=3 delims=." %%i in ('ver') do set "Build=%%i"

if %Build% geq 22000 (
    @for %%f in ("Windhawk*.exe") do @start /wait "" "%%f" /S
)
