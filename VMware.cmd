@for %%i in ("VMware-tools*.msi") do @start /wait "" msiexec.exe /i "%%i" /quiet /passive /qn /norestart
