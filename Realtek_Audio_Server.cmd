@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallPath" /t REG_SZ /d "\"C:\Windows\System32\DriverStore\FileRepository\realtekservice.inf_amd64_dde1a678dfd07f64\RtkAudUService64.exe\"" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallPathChanged" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallDate_Low" /t REG_DWORD /d "3623178464" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallDate_High" /t REG_DWORD /d "31244441" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InitFirstTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallTime" /t REG_SZ /d "Tuesday, 31 March 2026 01:06:29" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "JDPopup" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "HostGuiType" /t REG_DWORD /d "20" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "HostGuiSubType" /t REG_DWORD /d "402" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "End RpcServerConnect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 13:52:49.385_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 13:53:32.380_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 14:40:48.439_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 14:41:20.089_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 14:41:55.686_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 14:43:24.369_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 14:46:11.430_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 15:32:22.694_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 15:47:50.090_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 15:57:51.885_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:04:08.102_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:04:59.213_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:05:07.663_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:22:36.565_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:23:12.832_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:29:07.352_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:33:46.486_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-11 16:40:00.005_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-12 14:53:19.090_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-12 17:26:46.642_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-13 11:57:34.857_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-13 12:05:47.483_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-13 14:33:47.124_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-13 14:34:30.202_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-14 10:09:32.798_E" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\SessionDebug" /v "2026-05-14 10:12:38.556_S" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\Customize" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\DefLevel" /v "Finished" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\DevRestore" /v "{0.0.0.00000000}.{1eec0b26-87c7-4d17-a1e8-2eb0a2e3410a}" /t REG_BINARY /d "9da50000000000000000000024000000050000000c00000000672b026400000000000000070000000800000000672b02010000000100000024000000050000000c00000080033d0264000000000000000700000008000000b0333e02010000000200000024000000050000000c000000b0333e0264000000000000000700000008000000e07c3e02010000000300000024000000050000000c000000e07c3e0264000000000000000700000008000000405a3e0201000000" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\DevRestore" /v "{0.0.0.00000000}.{df0fe8c6-e969-407e-807a-39c299642811}" /t REG_BINARY /d "9da50000000000000000000080000000000000000800000014a03d0204000000040000004400000040702140dc050000dc050000dc05000000000000ac030000ac030000ac030000ac0300000000000000000000000000000000000000000000000000000000000000000000050000000c000000605a3e026400000002000000070000000800000000000000050000000100000080000000000000000800000010503e0201000000040000004400000040702140dc050000dc050000dc05000000000000ac030000ac030000ac030000ac0300000000000000000000000000000000000000000000000000000000000000000000050000000c000000407d3e0243000000000000000700000008000000407d3e02050000000200000080000000000000000800000010503e0201000000040000004400000040702140dc050000dc050000dc05000000000000ac030000ac030000ac030000ac0300000000000000000000000000000000000000000000000000000000000000000000050000000c000000405a3e0243000000000000000700000008000000405a3e02050000000300000080000000000000000800000010a03d0201000000040000004400000040702140dc050000dc050000dc05000000000000ac030000ac030000ac030000ac0300000000000000000000000000000000000000000000000000000000000000000000050000000c000000605a3e0243000000000000000700000008000000605a3e0205000000" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "TempPropDevicePath" /t REG_SZ /d "\\?\HDAUDIO#FUNC_01&VEN_10EC&DEV_0892&SUBSYS_1462CB79&REV_1003#5&343FCA2E&0&0001#{6994AD04-93EF-11D0-A3CC-00A0C9223196}\REARLINEOUTWAVE3" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "TempDevInstanceId" /t REG_SZ /d "HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_1462CB79&REV_1003\5&343FCA2E&0&0001" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "ShowTrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "JDPopup" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "CplExecuted_1462CB79_1462CB79" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "LastFixDefaultTime" /t REG_BINARY /d "ea070600040004000f0035001b00b600" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "RenderDefaultFixed" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "CaptureDefaultFixed" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkNGUI64\General" /v "Language" /t REG_DWORD /d "0" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
