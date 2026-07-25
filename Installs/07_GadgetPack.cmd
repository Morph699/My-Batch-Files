@for %%i in ("GadgetPack*.msi") do @start /wait "" msiexec.exe /i "%%i" /quiet /norestart

@for %%i in ("GadgetPack_silent*.exe") do @start /wait "" "%%i"