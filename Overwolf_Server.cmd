@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastOverwolfLaunchTime" /t REG_QWORD /d "0xb806b0440ac3de88" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastUserActiveTime" /t REG_QWORD /d "0x9087e4acd8c3de88" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "IdleTime" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "lastsy" /t REG_QWORD /d "0xa3fafb269e010000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastUpdateTime" /t REG_QWORD /d "0x9087e4acd8c3de88" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\SOFTWARE\Overwolf\CEF" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "PartnerCreationDate" /t REG_SZ /d "3/30/2026" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "PartnerID" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "Culture" /t REG_SZ /d "en" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserPrivacyMode" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserDataFolder" /t REG_SZ /d "C:\Users\Server\AppData\Local\Overwolf\\" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "InGameUpdatesSuspender" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastRunVersion" /t REG_SZ /d "0.300.0.11" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastKnownUsername" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "Channel" /t REG_SZ /d "web_dl_btn" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "RegistrationDate" /t REG_SZ /d "02/15/2026 12:13:29" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "OW_Name" /t REG_SZ /d "OW_5202bbec-e357-4736-8d27-81c0b1879798" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "OverlaySendExceptions" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserActivityState" /t REG_SZ /d "WeeklyActive" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf\ApplicationShortCuts" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf\ApplicationShortCuts" /v "afmcagbpgggkpdkokjhjkllpegnadmkignlonpjm" /t REG_SZ /d "C:\Users\Server\Desktop\AlecaFrame.lnk" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
