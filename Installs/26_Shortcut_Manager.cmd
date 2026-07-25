@for %%i in ("Shortcut_Manager*.msi") do @start /wait "" msiexec.exe /i "%%i" /quiet /norestart
