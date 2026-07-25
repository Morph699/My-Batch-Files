@echo off
TITLE Setting Display Resolution...
chcp 65001 >nul

cd %systemroot%\system32
call :IsAdmin

:: TARGET DESIGNATION SPECIFICATIONS (Adjust your preferred height/width layout here)
set "TargetWidth=1920"
set "TargetHeight=1080"

:: Inline PowerShell deployment using raw User32 API processing hooks
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$pinvoke = '[DllImport(\"user32.dll\")] public static extern bool EnumDisplaySettings(string lpszDeviceName, int iModeNum, ref DEVMODE lpDevMode); [DllImport(\"user32.dll\")] public static extern int ChangeDisplaySettingsEx(string lpszDeviceName, ref DEVMODE lpDevMode, IntPtr hWnd, uint dwflags, IntPtr lParam); [StructLayout(LayoutKind.Sequential)] public struct DEVMODE { [MarshalAs(UnmanagedType.ByValTStr, SizeConst=32)] public string dmDeviceName; public short dmSpecVersion; public short dmDriverVersion; public short dmSize; public short dmDriverExtra; public int dmFields; public int dmPositionX; public int dmPositionY; public int dmDisplayOrientation; public int dmDisplayFixedOutput; public short dmColor; public short dmDuplex; public short dmYResolution; public short dmTTOption; public short dmCollate; [MarshalAs(UnmanagedType.ByValTStr, SizeConst=32)] public string dmFormName; public short dmLogPixels; public int dmBitsPerPel; public int dmPelsWidth; public int dmPelsHeight; public int dmDisplayFlags; public int dmNup; public int dmDisplayFrequency; }'; " ^
    "Add-Type -MemberDefinition $pinvoke -Name User32 -Namespace Win32; " ^
    "$devmode = New-Object Win32.User32+DEVMODE; " ^
    "$devmode.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($devmode); " ^
    "[Win32.User32]::EnumDisplaySettings($null, -1, [ref]$devmode) | Out-Null; " ^
    "$devmode.dmPelsWidth = %TargetWidth%; " ^
    "$devmode.dmPelsHeight = %TargetHeight%; " ^
    "$devmode.dmFields = 0x00080000 -bor 0x00100000; " ^
    "[Win32.User32]::ChangeDisplaySettingsEx($null, [ref]$devmode, [IntPtr]::Zero, 0, [IntPtr]::Zero) | Out-Null"

exit /b

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof