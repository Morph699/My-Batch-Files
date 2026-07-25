@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "ModernIconsBadgesStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "AutoUpdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "WinBuild" /t REG_DWORD /d "22621" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "WinLangID" /t REG_DWORD /d "1033" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "ModernIconsColorized" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "WelcomeShown" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "FrameStyle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "OrbBitmap" /t REG_SZ /d "Windows 10" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "SysTrayStyle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "BottomDetails" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarControlCenter" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_LargeMFUIcons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartMetroAppsMFU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartScreenShortcut" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_LargeAllAppsIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartMetroAppsFolder" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_SortFoldersFirst" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_NotifyNewApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_AutoCascade" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_AskCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_RightPaneIcons" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowMyDocs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowMyMusic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowVideos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowSkyDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartMenuFavorites" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowRecentDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowNetPlaces" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowNetConn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowMyComputer" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowControlPanel" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowPCSettings" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_AdminToolsRoot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowPrinters" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowSetProgramAccessAndDefaults" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowCommandPrompt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_ShowRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_MinMFU" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Start_JumpListItems" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "Disabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartIsApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "NoXAMLPrelaunch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TerminateOnClose" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "AllProgramsFlyout" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "CombineWinX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "HideUserFrame" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarLargerIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarSpacierIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarJumpList" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "HideOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "HideSecondaryOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "StartMenuMonitor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "ImmersiveMenus" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "WinkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "MetroHotkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "MetroHotKey" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarCenterIcons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "TaskbarTranslucentEffect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "ModernIconsColorful" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "ModernIconsUnplated" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback" /v "SettingsVersion" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealHeight.6" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealHeight.9" /t REG_DWORD /d "131078" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealWidth.9" /t REG_SZ /d "Control Panel" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "OrbWidth.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "OrbHeight.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Lock" /t REG_DWORD /d "512" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Shut down" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Restart" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /ve /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Switch user" /t REG_DWORD /d "256" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Sign out" /t REG_DWORD /d "1" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
