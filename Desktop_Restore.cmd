@for %%i in ("Desktop_Restore*.msi") do @start /wait "" msiexec.exe /i "%%i" /quiet /norestart
