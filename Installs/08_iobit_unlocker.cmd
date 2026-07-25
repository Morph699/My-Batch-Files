@for %%i in ("IObit Unlocker*.exe") do @start /wait "" "%%i" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-

@taskkill /f /im IObitUnlocker.exe >nul 2>&1
