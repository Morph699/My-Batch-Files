@echo off
TITLE Morphs 2026 Hard Drive Target Normalizer

:: =========================================================================
:: AUTOMATIC ADMINISTRATOR ELEVATION ENGINE
:: =========================================================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrative privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

setlocal EnableDelayedExpansion

:: =========================================================================
:: STATIC SIMULATION CONFIGURATION SWITCH
:: =========================================================================
set "SimulationMode=1"

if "!SimulationMode!"=="1" (color 0E) else (color 1F)
cls
echo =========================================================
echo       Normalizing System Hard Drive Letter Assignments   
echo =========================================================
echo.

:: =====================================================================================
:: DRIVE ADJUSTMENT CONFIGURATION BLOCK
:: Configured directly with your system serial numbers. Adjust target letters as desired.
:: =====================================================================================

:: Target Drive 1 (MKNSSDS2250GB-LT)
set "Drive1_Serial=MK211117148AD0526
set "Drive1_TargetLetter=C"

:: Target Drive 2 (WDC WD20EZRX-00D8PB0)
set "Drive2_Serial=     WD-WMC4M0281898"
set "Drive2_TargetLetter=D"

:: Target Drive 3 (WDC WD8003FFBX-68B9AN0)
set "Drive3_Serial=VAHD3WWL"
set "Drive3_TargetLetter=E"

:: Target Drive 4 (MKNSSDVT1TB-D8)
set "Drive4_Serial=A843_9721_4B7A_7C53."
set "Drive4_TargetLetter=F"

:: Target Drive 5 (WDC WDS500G2B0A-00SM50)
set "Drive5_Serial=2135FD440514"
set "Drive5_TargetLetter=G"

:: Target Drive 6 (addlink M.2 PCIE G3x4 NVMe)
set "Drive6_Serial=0000_0001_2109_0668_3A5A_2703_D000_25AF."
set "Drive6_TargetLetter=H"

:: =====================================================================================
:: AUTOMATED PROCESSING ENGINE (Flat Logic Architecture)
:: =====================================================================================

:: --- DRIVE 1 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive1_Serial%" to [%Drive1_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 1 [%Drive1_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive1_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive1_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive1_TargetLetter%' } } }"
)

:: --- DRIVE 2 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive2_Serial%" to [%Drive2_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 2 [%Drive2_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive2_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive2_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive2_TargetLetter%' } } }"
)

:: --- DRIVE 3 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive3_Serial%" to [%Drive3_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 3 [%Drive3_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive3_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive3_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive3_TargetLetter%' } } }"
)

:: --- DRIVE 4 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive4_Serial%" to [%Drive4_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 4 [%Drive4_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive4_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive4_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive4_TargetLetter%' } } }"
)

:: --- DRIVE 5 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive5_Serial%" to [%Drive5_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 5 [%Drive5_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive5_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive5_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive5_TargetLetter%' } } }"
)

:: --- DRIVE 6 ---
if "!SimulationMode!"=="1" echo [SIMULATE] Safe-run active. Would remap Serial "%Drive6_Serial%" to [%Drive6_TargetLetter%:] & timeout /t 1 >nul
if "!SimulationMode!"=="0" (
    echo Processing Target Assignment 6 [%Drive6_TargetLetter%:]...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$disk = Get-Disk | Where-Object { $_.SerialNumber.Trim() -eq '%Drive5_Serial%'.Trim() }; if ($disk) { $part = Get-Partition -DiskNumber $disk.Number | Where-Object { $_.DriveLetter -ne $null -and $_.PartitionNumber -eq 1 }; if ($part) { if ($part.DriveLetter -ne '%Drive5_TargetLetter%') { $old = $part.DriveLetter + ':\'; Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -AccessPath $old; Set-Partition -DiskNumber $disk.Number -PartitionNumber $part.PartitionNumber -NewDriveLetter '%Drive5_TargetLetter%' } } }"
)

echo.
if "!SimulationMode!"=="1" (
    echo Safe simulation run finished. No hardware settings were modified.
) else (
    echo Hard drive letters successfully forced to correct configurations.
)
endlocal
timeout /t 4 >nul
