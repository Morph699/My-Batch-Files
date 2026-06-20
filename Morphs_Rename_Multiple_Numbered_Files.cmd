powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem *.cmd | Where-Object { $_.Name -match '^\d+_(.+)' } | Rename-Item -NewName { $_.Name -replace '^\d+_(.+)', '$1' }"
