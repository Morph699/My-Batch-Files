@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable00" /t REG_DWORD /d "789516" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable01" /t REG_DWORD /d "14300928" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable02" /t REG_DWORD /d "958739" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable03" /t REG_DWORD /d "14521914" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable04" /t REG_DWORD /d "2035653" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable05" /t REG_DWORD /d "9967496" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable06" /t REG_DWORD /d "40129" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable07" /t REG_DWORD /d "13421772" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable08" /t REG_DWORD /d "7763574" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable09" /t REG_DWORD /d "16742459" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable10" /t REG_DWORD /d "837142" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable11" /t REG_DWORD /d "14079585" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable12" /t REG_DWORD /d "5654759" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable13" /t REG_DWORD /d "10354868" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable14" /t REG_DWORD /d "10875385" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ColorTable15" /t REG_DWORD /d "15921906" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "CtrlKeyShortcutsDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "CursorColor" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "CursorSize" /t REG_DWORD /d "25" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "DefaultBackground" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "DefaultForeground" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "EnableColorSelection" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ExtendedEditKey" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ExtendedEditKeyCustom" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FaceName" /t REG_SZ /d "Courier New" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FilterOnPaste" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FontSize" /t REG_DWORD /d "1114112" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ForceV2" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "FullScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "HistoryBufferSize" /t REG_DWORD /d "50" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "HistoryNoDup" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "InsertMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "LineSelection" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "LineWrap" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "LoadConIme" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "NumberOfHistoryBuffers" /t REG_DWORD /d "4" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "PopupColors" /t REG_DWORD /d "10" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ScreenBufferSize" /t REG_DWORD /d "589889622" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ScreenColors" /t REG_DWORD /d "31" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "ScrollScale" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "TerminalScrolling" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "TrimLeadingZeros" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "WindowAlpha" /t REG_DWORD /d "255" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "WindowSize" /t REG_DWORD /d "1179734" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "WordDelimiters" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "CurrentPage" /t REG_DWORD /d "4" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "CursorType" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "InterceptCopyPaste" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console" /v "WindowPosition" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\%%%%Startup" /v "DelegationConsole" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKU\.DEFAULT\Console\%%%%Startup" /v "DelegationTerminal" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_Resources_Themes_Horizon Forbidden West.theme" /v "WindowPosition" /t REG_DWORD /d "9502839" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_Resources_Themes_Horizon Forbidden West.theme" /v "FontSize" /t REG_DWORD /d "1179658" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_Sysnative_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_Sysnative_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "FaceName" /t REG_SZ /d "Consolas" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontSize" /t REG_DWORD /d "1114112" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "ScreenBufferSize" /t REG_DWORD /d "589889622" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "1179734" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowPosition" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "ScreenColors" /t REG_DWORD /d "30" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "ColorTable09" /t REG_DWORD /d "16727040" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "PopupColors" /t REG_DWORD /d "158" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowAlpha" /t REG_DWORD /d "206" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKU\.DEFAULT\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
