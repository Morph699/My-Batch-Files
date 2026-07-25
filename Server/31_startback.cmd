@for %%i in ("StartBack*.exe") do @start /wait "" "%%i" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-

@Reg.exe add "HKCU\SOFTWARE\StartAllBack" /v "TaskbarStyle" /t REG_SZ /d "C:\Program Files\StartAllBack\Styles\Evoke X.msstyles" /f >nul
@Reg.exe add "HKCU\SOFTWARE\StartAllBack" /v "AlterStyle" /t REG_SZ /d "C:\Program Files\StartAllBack\Styles\Horizon Forbidden West.msstyles" /f >nul
@Reg.exe add "HKCU\SOFTWARE\StartAllBack" /v "OrbBitmap" /t REG_SZ /d "C:\Program Files\StartAllBack\Orbs\Alien (16).bmp" /f >nul
