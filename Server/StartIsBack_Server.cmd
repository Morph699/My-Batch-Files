@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "OrbBitmap" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Orbs\Alien (16).bmp" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Evoke X.msstyles" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "AlterStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Horizon Forbidden West.msstyles" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "AutoUpdates" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "CurrentVersion" /t REG_SZ /d "2.9.20" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "WinBuild" /t REG_DWORD /d "19045" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "WinLangID" /t REG_DWORD /d "1033" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "ModernIconsColorized" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "WelcomeShown" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "FrameStyle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "SysTrayStyle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "BottomDetails" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarControlCenter" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_LargeMFUIcons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMetroAppsMFU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartScreenShortcut" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_LargeAllAppsIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMetroAppsFolder" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_SortFoldersFirst" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_NotifyNewApps" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_AutoCascade" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_AskCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_RightPaneIcons" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowMyDocs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowMyPics" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowMyMusic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowVideos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowDownloads" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowSkyDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMenuFavorites" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowRecentDocs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowNetPlaces" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowNetConn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowMyComputer" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowControlPanel" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowPCSettings" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_AdminToolsRoot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowPrinters" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowSetProgramAccessAndDefaults" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowCommandPrompt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_ShowRun" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_MinMFU" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Start_JumpListItems" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "Disabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartIsApps" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "NoXAMLPrelaunch" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TerminateOnClose" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "AllProgramsFlyout" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "CombineWinX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "HideUserFrame" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarLargerIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarSpacierIcons" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarJumpList" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "HideOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "HideSecondaryOrb" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMenuMonitor" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "ImmersiveMenus" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "WinkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "MetroHotkeyFunction" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "MetroHotKey" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarCenterIcons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarTranslucentEffect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "ModernIconsColorful" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "ModernIconsUnplated" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "ModernIconsBadgesStartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMenuColor" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMenuBlur" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "StartMenuAlpha" /t REG_DWORD /d "196" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarAlpha" /t REG_DWORD /d "196" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarBlur" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarColor" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "SettingsVersion" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealHeight.6" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealHeight.9" /t REG_DWORD /d "131078" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealWidth.9" /t REG_SZ /d "Control Panel" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "OrbWidth.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "OrbHeight.96" /t REG_DWORD /d "54" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
