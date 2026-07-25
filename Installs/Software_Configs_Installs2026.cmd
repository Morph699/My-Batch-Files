@echo off
TITLE Installs Software Configs 
chcp 65001 >nul

:: =========================================================================
:: AUTOMATIC ADMINISTRATOR ELEVATION ENGINE
:: =========================================================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrative privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:: RESTORE PATH: Fixes the C:\Windows\System32 directory override caused by Admin mode
CD /d "%~dp0"
setlocal EnableDelayedExpansion

mode con:cols=78 lines=26
color 1F

:: =========================================================================
:: SYSTEM CORE ENGINE & SERVICING MANAGEMENTS
:: =========================================================================
echo =========================================================
echo       Applying System Core Engine & Service Tweaks       
echo =========================================================
echo.

:: Disable system hibernation parameters to conserve storage arrays
echo [-] Disabling System Hibernation...
powercfg /hibernate off
powercfg -h off

:: Enforce Maximum Performance Target Schemas on Server Environment
echo [-] Configuring High Performance Power Schema...
powercfg /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
if %errorlevel% neq 0 (
    powercfg /setactive SCHEME_MIN
)

:: Disable AC Monitor Power Off and Sleep Standby Timeouts (Forced On State)
powercfg /change /monitor-timeout-ac 0
powercfg /change /standby-timeout-ac 0

:: Terminate and disable Windows Search Indexer service to save CPU cycles
echo [-] Disabling Windows Search Indexer Service...
net stop WSearch >nul 2>&1
sc config WSearch start= disabled >nul 2>&1

color 1F
cls
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo.
echo         ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß
echo         ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     
echo         ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß
echo         ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß
echo         ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß
echo.
echo  ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     
echo ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß
echo ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß
echo  ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß
echo.
echo ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
:: =========================================================================
:: APPLICATION INTERFACES & FILE EXPLORER OPTIMIZATIONS
:: =========================================================================
echo.
echo =========================================================
echo       Applying Explorer ^& Interface Optimizations        
echo =========================================================
echo.

:: Remove the "- Shortcut" suffix from new shortcuts (FIXED: Standardized variable escaping)
echo [-] Removing Shortcut Name Suffixes...
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"^%s.lnk\"" /f >nul 2>&1

:: Configure VMware Tray Behavior Status Rules (Set to Hide)
echo [-] Optimizing VMware System Tray Status...
Reg.exe add "HKCU\SOFTWARE\VMware, Inc.\VMware Tray" /v "ShowTrayIcon" /t REG_DWORD /d 0 /f >nul 2>&1

:: =========================================================================
:: CUSTOM CONTEXT OPTIONS & COSMETIC MODIFICATIONS LAYERS
:: =========================================================================
:: StartIsBack Custom Graphic Orb and Evoke Style Theme Package Paths Map
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "OrbBitmap" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Orbs\Alien (16).bmp" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Evoke X.msstyles" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "AlterStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Horizon Forbidden West.msstyles" /f

:: Desktop Background Context Menu: Restart Explorer Tool Option (FIXED: Added fail-safe redirection)
Reg.exe delete "HKCR\DesktopBackground\Shell\Restart Explorer" /f >nul 2>&1
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer" /v "icon" /t REG_SZ /d "explorer.exe" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer\command" /ve /t REG_SZ /d "cmd.exe /c taskkill /f /im explorer.exe & start explorer.exe" /f

:: =========================================================================
:: NETWORK PIPELINES: QBITTORRENT SYSTEM CAPABILITIES INTEGRATION
:: =========================================================================
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\qBittorrent\qbittorrent.exe,1" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationName" /t REG_SZ /d "qBittorrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Torrent downloader" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\FileAssociations" /v ".torrent" /t REG_SZ /d "qBittorrent.torrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\URLAssociations" /v "magnet" /t REG_SZ /d "qBittorrent.magnet" /f

:: =========================================================================
:: SERVER SYSTEM APP AUTOMATED STARTUP PIPELINES (RUN SETTINGS)
:: =========================================================================
:: Native & Portable Application Initialization Array
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NetTraffic" /t REG_SZ /d "d:\Temp\Apps Portable\_DataFolders\_Server\NetTraffic\NetTraffic.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Classic Volume Control" /t REG_SZ /d "d:\Temp\Apps Portable\Classic Volume Control\ClassicVolumeControl.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "FanControl" /t REG_SZ /d "d:\Temp\Apps Portable\FanControl Portable\FanControl.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Aida64" /t REG_SZ /d "d:\Temp\Apps Portable\AIDA64 Portable\aida64.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Overwolf" /t REG_SZ /d "C:\Program Files (x86)\Overwolf\OverwolfLauncher.exe -overwolfsilent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Emby" /t REG_SZ /d "g:\Apps Portable\Emby Server\system\EmbyServer.exe" /f

:: FIXED: Mapped nested quote parameters cleanly to prevent startup string truncation bugs
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "qBittorrent" /t REG_SZ /d "\"C:\Program Files\qBittorrent\qbittorrent.exe\" --profile=\"\" --configuration=\"\"" /f

:: =========================================================================
:: ENVIRONMENT UTILITIES: OLDNEWEXPLORER PROFILE CONFIGURATION
:: =========================================================================
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "DriveGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoRibbon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoCaption" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoUpButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NavBarGlass" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "IEButtons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "Details" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "StatusBar" /t REG_DWORD /d "1" /f

:: =========================================================================
:: UTILITIES APP: DAMN NFO VIEWER LOOK & FEEL ENVIRONMENT
:: =========================================================================
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "CheckDefaultViewer" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "ReuseWindow" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "Language" /t REG_DWORD /d "1033" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer" /v "AlwaysOnTop" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "FontName" /t REG_SZ /d "[built-in] Courier New" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "FontData" /t REG_BINARY /d "94000301" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "Window" /t REG_DWORD /d "163" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "BackgroundColor" /t REG_BINARY /d "1b1c1d00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "TextColor" /t REG_BINARY /d "ff000000" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "HyperLinkColor" /t REG_BINARY /d "6a5acd00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "HyperLinkHoverColor" /t REG_BINARY /d "8fbc8f00" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\NFO" /v "Text" /t REG_DWORD /d "1024" /f
Reg.exe add "HKCU\SOFTWARE\DAMN\DAMN NFO Viewer\WindowPlacements" /v "Main" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffffb7050000ffffffffc1080000d4020000" /f

:: =========================================================================
:: OVERWOLF COMPONENT TELEMETRY & LAUNCHER PREFERENCES
:: =========================================================================
:: FIXED: Replaced static profile string locks with dynamic environment wrappers and stripped double slashes
Reg.exe add "HKCU\SOFTWARE\Overwolf\CEF" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "PartnerCreationDate" /t REG_SZ /d "3/30/2026" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "PartnerID" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "Culture" /t REG_SZ /d "en" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserPrivacyMode" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserDataFolder" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Overwolf" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "InGameUpdatesSuspender" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastRunVersion" /t REG_SZ /d "0.300.0.11" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "LastKnownUsername" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "Channel" /t REG_SZ /d "web_dl_btn" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "RegistrationDate" /t REG_SZ /d "02/15/2026 12:13:29" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "OW_Name" /t REG_SZ /d "OW_5202bbec-e357-4736-8d27-81c0b1879798" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "OverlaySendExceptions" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf" /v "UserActivityState" /t REG_SZ /d "WeeklyActive" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf\ApplicationShortCuts" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Overwolf\Overwolf\ApplicationShortCuts" /v "afmcagbpgggkpdkokjhjkllpegnadmkignlonpjm" /t REG_SZ /d "^%USERPROFILE^\Desktop\AlecaFrame.lnk" /f

:: =========================================================================
:: DIGITAL EXTREMES: WARFRAME ENGINE & LAUNCHER PARAMS
:: =========================================================================
:: FIXED: Cleaned double terminal slashes and replaced hardcoded profile strings safely
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe" /ve /t REG_SZ /d "LauncherCEFV7" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "UpdateVersion" /t REG_DWORD /d "23" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "DownloadDir" /t REG_SZ /d "f:\Temp\Games\Warframe\Downloaded" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ReadEula" /t REG_SZ /d "7110700521B4706047841B38F0DBB5C1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "VerifyVersionPublic" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherStats" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableFullScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "GraphicsAPI" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "DebugGraphicsDriver" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "GPUPreference" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableBulkDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableAggressiveDownload" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherGPU" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ForceHTTPS" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ServerCluster" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "Language" /t REG_SZ /d "en" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherExe" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Warframe\Downloaded\Public\Tools\Launcher.exe" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableShaderCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LanguageVO" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "WindowMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ErrorDx10Unsuported" /t REG_DWORD /d "1" /f
:: =========================================================================
:: SERVER SYSTEM VISUAL EFFECTS APPEARANCE APPLIED STATES
:: =========================================================================
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f

:: FIXED: Completed parameter structure for the missing FontSmoothing elements layout
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /v "DefaultApplied" /t REG_DWORD /d "1" /f

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\Themes" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f

:: =========================================================================
:: COMPONENT MANAGEMENT: 7-ZIP INTERFACE & VIEWER METRICS
:: =========================================================================
:: FIXED: Cleaned trailing path double-backslash characters to keep folder resolution safe
Reg.exe add "HKCU\SOFTWARE\7-Zip" /v "Path64" /t REG_SZ /d "C:\Program Files\7-Zip\" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip" /v "Path" /t REG_SZ /d "C:\Program Files\7-Zip\" /f

Reg.exe add "HKCU\SOFTWARE\7-Zip\Extraction" /v "ShowPassword" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "FolderShortcuts" /t REG_BINARY /d "" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "FlatViewArc0" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "PanelPath1" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "FlatViewArc1" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "ListMode" /t REG_DWORD /d "771" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "Position" /t REG_BINARY /d "200b000000040000d60e00001907000000000000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM" /v "Panels" /t REG_BINARY /d "0100000000000000ce010000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM\Columns" /v "7-Zip.7z" /t REG_BINARY /d "0100000004000000010000000400000001000000a00000000700000001000000640000000800000001000000640000000c000000010000008a0000000900000001000000640000001300000001000000640000000f00000001000000640000001600000001000000640000001b00000001000000640000001f0000000100000064000000200000000100000064000000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM\Columns" /v "7-Zip.wim" /t REG_BINARY /d "0100000004000000010000000400000001000000a00000000700000001000000640000000800000001000000640000000c00000001000000640000000a00000001000000640000000b00000001000000640000000900000001000000640000001600000001000000640000000d00000001000000640000003200000001000000640000005b00000001000000640000002500000001000000640000003f00000001000000640000004b00000001000000640000001f00000001000000640000002000000001000000640000004300000001000000640000005900000001000000640000003e0000000100000064000000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM\Columns" /v "FSFolder" /t REG_BINARY /d "0100000004000000010000000400000001000000a00000000700000001000000640000000c00000001000000640000000a00000001000000640000001c00000001000000640000001f00000001000000640000002000000001000000640000000b00000000000000640000006200000000000000640000000900000000000000640000000800000000000000640000005b0000000000000064000000250000000000000064000000590000000000000064000000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM\Columns" /v "7-Zip.xz" /t REG_BINARY /d "0100000004000000010000000400000001000000a00000000700000001000000640000000800000001000000640000001600000001000000640000001f0000000100000064000000200000000100000064000000" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip\FM\Columns" /v "7-Zip.Nsis" /t REG_BINARY /d "0100000004000000010000000400000001000000a00000000700000001000000640000000800000001000000640000000c00000001000000640000000900000001000000640000001600000001000000640000000d00000001000000640000002400000001000000640000001f0000000100000064000000200000000100000064000000" /f
:: =========================================================================
:: HARDWARE INITIALIZATION: REALTEK AUDIO SYSTEM CONFIGURATIONS
:: =========================================================================
:: FIXED: Cleaned hardcoded dynamic DriverStore file hashes to prevent cross-platform initialization failures
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallPath" /t REG_SZ /d "\"C:\Windows\System32\RtkAudUService64.exe\"" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallPathChanged" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallDate_Low" /t REG_DWORD /d "3623178464" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallDate_High" /t REG_DWORD /d "31244441" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InitFirstTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "InstallTime" /t REG_SZ /d "Tuesday, 31 March 2026 01:06:29" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\General" /v "JDPopup" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "HostGuiType" /t REG_DWORD /d "20" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "HostGuiSubType" /t REG_DWORD /d "402" /f
Reg.exe add "HKCU\SOFTWARE\Realtek\Audio\RtkAudUService\Others" /v "End RpcServerConnect" /t REG_DWORD /d "0" /f

:: =========================================================================
:: SYSTEM ENVIRONMENT SERVICING & PAUSE UPDATES TRACKS
:: =========================================================================
:: Configure Active Hours ranges to mitigate background servicing interrupts
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursEnd" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursStart" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightCommitted" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "IsExpedited" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "LastToastAction" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "UxOption" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "HideMCTLink" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "RestartNotificationsAllowed2" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "SmartActiveHoursSuggestionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowMUUpdateService" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "TrayIconVisibility" /t REG_DWORD /d "0" /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2026-01-01T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2026-01-01T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2026-01-01T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f

:: =========================================================================
:: NT USER CONFIGURATIONS: DYNAMIC PROFILE USER SHELL FOLDERS (MIGRATIONS)
:: =========================================================================
:: FIXED: Correctly escaped environmental variable operators via carets (^%) to unbreak path evaluation
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\INetCache" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "^%USERPROFILE^\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "^%USERPROFILE^\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Templates" /f

:: Target Redirected Media Library Directories Mappings
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "^%USERPROFILE^\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f

:: Redirected KnownFolder GUI Identifiers Mappings
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d "F:\Temp\Downloads\4K Video Downloader" /f

:: =========================================================================
:: SYSTEM BACKWARD COMPATIBILITY LAYERS: SYSTEM LEGACY SHELL FOLDERS MAPS
:: =========================================================================
:: FIXED: Replaced static user account profile paths with dynamic, portable variable allocations
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "!Do not use this registry key" /t REG_SZ /d "Use the SHGetFolderPath or SHGetKnownFolderPath function instead" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "AppData" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Local AppData" /t REG_SZ /d "^%USERPROFILE^\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CD Burning" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\Burn\Burn" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Libraries" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "^%USERPROFILE^\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "^%USERPROFILE^\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "History" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "NetHood" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_SZ /d "^%USERPROFILE^\Contacts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{00BCFC5A-ED94-4E48-96A1-3F6217F21990}" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\RoamingTiles" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Cookies" /t REG_SZ /d "^%USERPROFILE^\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /t REG_SZ /d "^%USERPROFILE^\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "SendTo" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Start Menu" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Programs" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Recent" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "PrintHood" /t REG_SZ /d "^%USERPROFILE^\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_SZ /d "^%USERPROFILE^\Searches" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{A520A1A4-1780-4FF6-B2CE-42A440D4A0E4}" /t REG_SZ /d "D:\New Stuff" /f


:: =========================================================================
:: STARTALLBACK CORE CONFIGURATIONS (WINDOWS 11 ENVIRONMENT)
:: =========================================================================
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

:: Layout Metrics Pre-Cache Keys
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealHeight.6" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealHeight.9" /t REG_DWORD /d "131078" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "IdealWidth.9" /t REG_SZ /d "Control Panel" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "OrbWidth.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\Cache" /v "OrbHeight.96" /t REG_DWORD /d "54" /f

:: Custom Shutdown Context Menu Options Mappings
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Lock" /t REG_DWORD /d "512" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Shut down" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Restart" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /ve /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Switch user" /t REG_DWORD /d "256" /f
Reg.exe add "HKCU\SOFTWARE\StartAllback\ShutdownChoices" /v "Sign out" /t REG_DWORD /d "1" /f

:: =========================================================================
:: STARTISBACK CORE CONFIGURATIONS (WINDOWS 10 ENVIRONMENT)
:: =========================================================================
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
:: =========================================================================
:: SYSTEM CONFIGURATIONS: SOUTH AFRICAN REGIONAL DISCOVERY BASELINES
:: =========================================================================
:: Set locale, currency, date/time formats, and numerical separators to en-ZA.
Reg.exe add "HKCU\Control Panel\International" /v "Locale" /t REG_SZ /d "00001C09" /f
Reg.exe add "HKCU\Control Panel\International" /v "LocaleName" /t REG_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International" /v "sCurrency" /t REG_SZ /d "R" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "dd MMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "HH:mm:ss" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCountry" /t REG_SZ /d "27" /f
Reg.exe add "HKCU\Control Panel\International" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Name" /t REG_SZ /d "ZA" /f

:: =========================================================================
:: SYSTEM CAPABILITIES & USER PROFILE (MULTI-STRING & DWORDS)
:: =========================================================================
:: Configures available language packs, handwriting, and TTS features, 
:: and sets User Profile input settings (autocorrect, prediction, en-ZA).
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableLanguagePacks" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "Languages" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowTextPrediction" /t REG_DWORD /d "1" /f
:: =========================================================================
:: NT USER CONFIGURATIONS: CURRENT USER GLOBAL CONSOLE STYLE SCHEETS
:: =========================================================================
:: Global Hexadecimal Color Palette Table Mappings
Reg.exe add "HKCU\Console" /v "ColorTable00" /t REG_DWORD /d "789516" /f
Reg.exe add "HKCU\Console" /v "ColorTable01" /t REG_DWORD /d "14300928" /f
Reg.exe add "HKCU\Console" /v "ColorTable02" /t REG_DWORD /d "958739" /f
Reg.exe add "HKCU\Console" /v "ColorTable03" /t REG_DWORD /d "14521914" /f
Reg.exe add "HKCU\Console" /v "ColorTable04" /t REG_DWORD /d "2035653" /f
Reg.exe add "HKCU\Console" /v "ColorTable05" /t REG_DWORD /d "9967496" /f
Reg.exe add "HKCU\Console" /v "ColorTable06" /t REG_DWORD /d "40129" /f
Reg.exe add "HKCU\Console" /v "ColorTable07" /t REG_DWORD /d "13421772" /f
Reg.exe add "HKCU\Console" /v "ColorTable08" /t REG_DWORD /d "7763574" /f
Reg.exe add "HKCU\Console" /v "ColorTable09" /t REG_DWORD /d "16742459" /f
Reg.exe add "HKCU\Console" /v "ColorTable10" /t REG_DWORD /d "837142" /f
Reg.exe add "HKCU\Console" /v "ColorTable11" /t REG_DWORD /d "14079585" /f
Reg.exe add "HKCU\Console" /v "ColorTable12" /t REG_DWORD /d "5654759" /f
Reg.exe add "HKCU\Console" /v "ColorTable13" /t REG_DWORD /d "10354868" /f
Reg.exe add "HKCU\Console" /v "ColorTable14" /t REG_DWORD /d "10875385" /f
Reg.exe add "HKCU\Console" /v "ColorTable15" /t REG_DWORD /d "15921906" /f

:: Global UI Properties, Window Sizing, and QuickEdit Toggles
Reg.exe add "HKCU\Console" /v "CtrlKeyShortcutsDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "CursorColor" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Console" /v "CursorSize" /t REG_DWORD /d "25" /f
Reg.exe add "HKCU\Console" /v "DefaultBackground" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Console" /v "DefaultForeground" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Console" /v "EnableColorSelection" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "ExtendedEditKey" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "ExtendedEditKeyCustom" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "FaceName" /t REG_SZ /d "Courier New" /f
Reg.exe add "HKCU\Console" /v "FilterOnPaste" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console" /v "FontSize" /t REG_DWORD /d "1179648" /f
Reg.exe add "HKCU\Console" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console" /v "ForceV2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "FullScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "HistoryBufferSize" /t REG_DWORD /d "50" /f
Reg.exe add "HKCU\Console" /v "HistoryNoDup" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "InsertMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "LineSelection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "LineWrap" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "LoadConIme" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "NumberOfHistoryBuffers" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Console" /v "PopupColors" /t REG_DWORD /d "159" /f
Reg.exe add "HKCU\Console" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "ScreenBufferSize" /t REG_DWORD /d "589889631" /f
Reg.exe add "HKCU\Console" /v "ScreenColors" /t REG_DWORD /d "31" /f
Reg.exe add "HKCU\Console" /v "ScrollScale" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console" /v "TerminalScrolling" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "TrimLeadingZeros" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "WindowAlpha" /t REG_DWORD /d "232" /f
Reg.exe add "HKCU\Console" /v "WindowSize" /t REG_DWORD /d "1310815" /f
Reg.exe add "HKCU\Console" /v "WordDelimiters" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "CurrentPage" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Console" /v "CursorType" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Console" /v "InterceptCopyPaste" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console" /v "WindowPosition" /t REG_DWORD /d "0" /f

:: =========================================================================
:: SPECIFIC TARGET APPLICATION EXTENSION RULES OVERRIDES
:: =========================================================================
:: Virtual Terminal Delegation Consoles (FIXED: Escaped variables via ^%^%)
Reg.exe add "HKCU\Console\^%^%Startup" /v "DelegationConsole" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\Console\^%^%Startup" /v "DelegationTerminal" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f

:: Target App: Custom Horizon Forbidden West Desktop Theme Engine Console (FIXED: Escaped variables via ^%)
Reg.exe add "HKCU\Console\^%SystemRoot^\_Resources_Themes_Horizon Forbidden West.theme" /v "WindowPosition" /t REG_DWORD /d "9502839" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_Resources_Themes_Horizon Forbidden West.theme" /v "FontSize" /t REG_DWORD /d "1179658" /f

:: Target App: Native 64-bit CMD Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKCU\Console\^%SystemRoot^\_Sysnative_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_Sysnative_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f

Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "ColorTable09" /t REG_DWORD /d "16727040" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "PopupColors" /t REG_DWORD /d "158" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "FontSize" /t REG_DWORD /d "1179658" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "1441887" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowAlpha" /t REG_DWORD /d "206" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowPosition" /t REG_DWORD /d "9110400" /f

:: Target App: Native 64-bit Windows PowerShell Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f

:: Target App: WOW64 32-bit Compatibility CMD Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f

:: Target App: WOW64 32-bit Compatibility Windows PowerShell Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKCU\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f
:: =========================================================================
:: NT USER CONFIGURATIONS: DEFAULT PROFILE GLOBAL CONSOLE STYLE SCHEETS
:: =========================================================================
:: Global Hexadecimal Color Palette Table Mappings
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

:: Global UI Properties, Window Sizing, and QuickEdit Toggles
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

:: =========================================================================
:: SPECIFIC TARGET APPLICATION EXTENSION RULES OVERRIDES
:: =========================================================================
:: Virtual Terminal Delegation Consoles (FIXED: Escaped variables via ^%^%)
Reg.exe add "HKU\.DEFAULT\Console\^%^%Startup" /v "DelegationConsole" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKU\.DEFAULT\Console\^%^%Startup" /v "DelegationTerminal" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f

:: Target App: Custom Horizon Forbidden West Desktop Theme Engine Console (FIXED: Escaped variables via ^%)
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_Resources_Themes_Horizon Forbidden West.theme" /v "WindowPosition" /t REG_DWORD /d "9502839" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_Resources_Themes_Horizon Forbidden West.theme" /v "FontSize" /t REG_DWORD /d "1179658" /f

:: Target App: Native 64-bit CMD Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_Sysnative_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_Sysnative_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f

Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "FaceName" /t REG_SZ /d "Consolas" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "FontSize" /t REG_DWORD /d "1114112" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "ScreenBufferSize" /t REG_DWORD /d "589889622" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "1179734" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowPosition" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "ScreenColors" /t REG_DWORD /d "30" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "ColorTable09" /t REG_DWORD /d "16727040" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "PopupColors" /t REG_DWORD /d "158" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_system32_cmd.exe" /v "WindowAlpha" /t REG_DWORD /d "206" /f

:: Target App: Native 64-bit Windows PowerShell Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f

:: Target App: WOW64 32-bit Compatibility CMD Subsystem (FIXED: Escaped variables via ^%)
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_SysWOW64_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_SysWOW64_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f

:: Target App: WOW64 32-bit Compatibility Windows PowerShell Subsystem (FIXED: Completed cut-off string statements)
Reg.exe add "HKU\.DEFAULT\Console\^%SystemRoot^\_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
::Drive_setting

::ACDSee_Config

Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageDB" /t REG_SZ /d "C:\Program Files (x86)\ACDSee32\ImageDB.aid" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellBrowseAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellViewAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellOpenAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HistPaths" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserWndPos" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffff080000007b020000e805000074060000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoPreview" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PreviewMode" /t REG_BINARY /d "04000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "LVStyle" /t REG_BINARY /d "04000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SCStyle" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SortMethod" /t REG_BINARY /d "03000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SortReverse" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PreviewLoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShortcutsLoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUTV" /t REG_BINARY /d "c8000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUFL" /t REG_BINARY /d "64000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUSC" /t REG_BINARY /d "c8000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "TVSplitPos" /t REG_BINARY /d "71010000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SCSplitLPos" /t REG_BINARY /d "64000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SCSplitPos" /t REG_BINARY /d "64000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserWndSize" /t REG_BINARY /d "8002000090010000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserToolBar" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserStatBar" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserMenu" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserPathBox" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserFolderTree" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserPreview" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserShortcuts" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerToolBar" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerStatBar" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerMenu" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "MCShowImages" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "MCScrollUnison" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PrintSetup" /t REG_BINARY /d "0000803f0000803f0000803f0000803f01010100010101002c0100009a99993f0000c0400000c0400000803f0000803f" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ConvertOptions" /t REG_BINARY /d "000000005a00000000000000000000000200000000000000000000000100000000000000010000000000000000000000480000004800000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowOpenPreview" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "OpenDefFilter" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellPrintAssoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageHiliteClr" /t REG_BINARY /d "ffffc800" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageHiliteClr8" /t REG_BINARY /d "ffff0000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "FindOptions" /t REG_BINARY /d "01000000010000000100000001000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SyncOptions" /t REG_BINARY /d "010000000100000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "NewThumbs" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowColumns" /t REG_BINARY /d "010000000100000000000000010000000100000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ColumnWidths" /t REG_BINARY /d "64000000550000005f0000007d0000007800000013010000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ColumnOrder" /t REG_BINARY /d "000000000100000002000000020000000300000003000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "OpenFolder" /t REG_SZ /d "I:\Full ISO's\Win10 ISO's\Backup\4KStogram\Pics\4K Stogram\#__Bestest\#a.My Folders\Best Slides" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "LastFolder" /t REG_SZ /d "C:\Program Files (x86)\ACDSee32" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerWndPos" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffff4b0a00000e040000020c00008f060000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SaveBrowserWindow" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowImgOnly" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowHidden" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowDrives" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "UseSysIcons" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoSizeColumns" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "CacheImgDim" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "RememberDir" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ReadImgHdrs" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewAll" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HiddenDesc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoPrevDelay" /t REG_BINARY /d "32000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoHidePreview" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ConfirmDelete" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ConfirmDirDelete" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "NoRecycle" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ThumbSize" /t REG_BINARY /d "aa00000082000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ThumbBorderSize" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoSizeWindow" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoCenterWindow" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoSaveWinPos" /t REG_BINARY /d "01" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSAutoMode" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSDelayMS" /t REG_BINARY /d "d0070000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSWrap" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSReadAhead" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSCacheBehind" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSSequenceMode" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SSAutoFlipReady" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AlwaysOnTop" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "Dither8" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "Dither16" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "Dither8Preview" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "Dither16Preview" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoShrink" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoZoom" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "StartupMode" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DropMode" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "UseDDB" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "TopDownBitmaps" /t REG_BINARY /d "01" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SnapToButtons" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BlankCursor" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "GridLines" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "FullRowSelect" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HiliteImageFiles" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "RefreshNewPlacement" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoRefreshSelect" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowFolderThumbs" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowFileThumbs" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "FullScreenMode" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableGIFAnim" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ExitAfterDelete" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableOpen" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableBrowser" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableFileOps" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableWallpaper" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisablePrint" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableOptions" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableOptionsSave" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowPrintSetup" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "MCOverwriteAction" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "MCOverwriteSkip" /t REG_BINARY /d "01" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerShowFullPath" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserShowFullPath" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "OemConvertDesc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoRefresh" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "VersionTitle" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ToolTips" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "InfoTips" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "GammaCorrect" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "GammaValue" /t REG_BINARY /d "333333333333f33f" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ClickRename" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ClickDescribe" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "RenameSepChar" /t REG_BINARY /d "5f" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerShowSize" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "CacheThumbnails" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "CompressThumbnails" /t REG_BINARY /d "41" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "RemoveDirectional" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PCDMaxResolution" /t REG_BINARY /d "03" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SaveMRUFolders" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "FileSizeKB" /t REG_BINARY /d "01" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowTNMFileSize" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowTNMImgDim" /t REG_BINARY /d "01" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PlaySounds" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HistRenameTemplates" /t REG_BINARY /d "467574757269737469635f23232300417070735f546f6f6c735f313330393230303223232e6a7067004d6f72706827735f34696e315f53657074323032325f2323232e6a7067005365702e5f30322c5f323032325f31352d34352d2323232e6a7067005365702e5f30322c5f323032325f31342d30302d2323232e6a70670057616c6c70617065722323232e6a70670057616c6c7061706572232323004d6f72706827735f31305f313836355f323248325f76322e302b4f324b32315f23232e6a7067004d6f72706827735f31305f313836355f323248325f76322e305f23232e6a70670034303067625f336872735f3030232e6a7067002323235f4a756c2e5f33302c5f323032325f5f2e6a7067004a756c2e5f33302c5f323032325f2323232e6a7067004a756c2e5f33302c5f323032325f23232300696d6723230000" /f

::WinRAR_Settings

Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictHistorySize" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictMask" /t REG_SZ /d "0000001100000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictLimit" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DefFolder" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Vol5MB" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Vol100MB" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "CD700" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Vol2GB" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "FAT32" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "DVD+R" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "DVD-R" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "DVD DL" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Blu-ray" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Blu-ray DL" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "Autodetect" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "History" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserLabel0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserSize0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserLabel1" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserSize1" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserLabel2" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserSize2" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserLabel3" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Compression\Volumes" /v "UserSize3" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /v "0" /t REG_SZ /d "D:\Temp\Apps Portable\My_PC'D'_PortableApps.exe" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /v "1" /t REG_SZ /d "D:\Temp\Apps Portable\My_PC'D'_PortableAppsShortcuts.exe" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /v "2" /t REG_SZ /d "D:\Temp\Apps Portable\_DataFolders\_Morph3us\AlecaFrame.rar" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /v "3" /t REG_SZ /d "D:\Temp\Apps Portable\_DataFolders\_Morph3us\ChromeUserData.rar" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /v "4" /t REG_SZ /d "D:\Temp\Apps Portable\_DataFolders\_Morph3us\ChromiumUserData.rar" /f
Reg.exe add "HKCU\Software\WinRAR\DialogEditHistory\DictSize" /v "0" /t REG_SZ /d "64 MB" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "DefFolder" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "AppendName" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "RemoveRedundantFolder" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "UseExclNames" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "ExclNames" /t REG_SZ /d "*.exe *.com *.pif *.scr *.bat *.cmd *.lnk" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "MOTWMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Extraction" /v "MOTWZoneOnly" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "Detailed" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ArchivesFirst" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ColorAttr" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "AllVolumes" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ShowSeconds" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ExactSizes" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ShowGrid" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "FullRow" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "Checkboxes" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "SingleClick" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "Underline" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "ArcSort" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "FileSort" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "Font" /t REG_BINARY /d "efffffff0000000000000000000000009001000000000000030201225300650067006f006500200055004900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\WinRAR\FileList" /v "FontColorDark" /t REG_DWORD /d "16777215" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "name" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "size" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "psize" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "type" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "mtime" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "ctime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "atime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "attr" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "crc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnStates" /v "path" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "name" /t REG_DWORD /d "304" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "size" /t REG_DWORD /d "101" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "psize" /t REG_DWORD /d "101" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "type" /t REG_DWORD /d "129" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "mtime" /t REG_DWORD /d "146" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "crc" /t REG_DWORD /d "70" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "name" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "size" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "psize" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "type" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "mtime" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "ctime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "atime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "attr" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "crc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnStates" /v "path" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "name" /t REG_DWORD /d "307" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "size" /t REG_DWORD /d "101" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "type" /t REG_DWORD /d "214" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "mtime" /t REG_DWORD /d "147" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "VerInfo" /t REG_BINARY /d "000d0700c78cf5b37f08dc01" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "History" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "DlgHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "WizardMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "OnTop" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "ShowComment" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "WrapComment" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "ReuseWindow" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "Sound" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "Threads" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "LargePages" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "Log" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "LimitLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "LogSize" /t REG_DWORD /d "1000" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "RestoreFolder" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "WipeTemp" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "LastFolder" /t REG_SZ /d "D:\Temp\Apps Portable" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "Size" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "ButtonsText" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "Lock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_0" /t REG_BINARY /d "4c000000610100000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000550000004403000000000000000000000000000001000000" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_1" /t REG_BINARY /d "4c0000006101000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000001b0000002600000000000000000000000000000002000000" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_2" /t REG_BINARY /d "4c0000006101000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000001b0000006400000000000000000000000000000003000000" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "ColorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "FullPathsTitle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "SystemProgressBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "TaskbarProgressBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "AsArchives" /t REG_SZ /d "*.exe" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\CmdWin" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\Comment" /v "LeftBorder" /t REG_DWORD /d "744" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\ErrList" /v "ResPlacement" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffffa3030000170200005c06000089030000" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\MainWin" /v "Placement" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffffc90a000040040000070f00003f080000" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\Themes" /v "ActivePath" /t REG_SZ /d "HUDApocalypse.theme" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\Themes" /v "ShellExtBMP" /t REG_SZ /d "C:\Program Files\WinRAR\Themes\HUDApocalypse.theme\RarSmall.bmp" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\Themes" /v "ShellExtIcon" /t REG_SZ /d "C:\Program Files\WinRAR\Themes\HUDApocalypse.theme\Rar.ico" /f
Reg.exe add "HKCU\Software\WinRAR\Paths" /v "TempFolder" /t REG_SZ /d "C:\Users\Administrator\AppData\Local\Temp" /f
Reg.exe add "HKCU\Software\WinRAR\Paths" /v "TempRemovableOnly" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Paths" /v "StartFolder" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Name" /t REG_SZ /d "Default Profile" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Default" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ImmExec" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ExclNames" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "StoreNames" /t REG_SZ /d "*.rar *.zip *.zipx *.cab *.7z *.ace *.arj *.bz2 *.gz *.lha *.lz *.lzh *.taz *.tbz2 *.tgz *.xz *.txz *.tzst *.z *.zst" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "UseRAR" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SFXModule" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SFXIcon" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SFXLogo" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "CmtFile" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "CmtTextData" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "VolumeSize" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "VolPause" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "OldVolNames" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "RecVolNumber" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Update" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Fresh" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SyncFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Move" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Solid" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "AV" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Test" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Recovery" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "EraseDest" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "AddArcOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ClearArc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Lock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Method" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "DictSizeLZ" /t REG_DWORD /d "4194304" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Background" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "WaitForOther" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Shutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Password" /t REG_BINARY /d "49" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "EncryptHeaders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "OpenShared" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ProcessOwners" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SaveStreams" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "GenerateArcName" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "VersionControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "GenerateMask" /t REG_SZ /d "yyyymmddhhmmss" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileTimeMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileDays" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileHours" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileMinutes" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileTimeBefore" /t REG_DWORD /d "2281701376" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileTimeAfter" /t REG_DWORD /d "2281701376" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ArcTimeOriginal" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ArcTimeLatest" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "mtime" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ctime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "atime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PathsAbs" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PathsNone" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PathsAbsDrive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SeparateArc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "EmailArcTo" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PackDetails" /t REG_BINARY /d "000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SFXLogo2" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SFXElevate" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "CmtDataWide" /t REG_BINARY /d "0000" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "VolSizeMod" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "Overwrite" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ArcRecBin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ArcWipe" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "WipeIfPassword" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "RecEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "RecSize" /t REG_DWORD /d "4294967293" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "DictSizeKB" /t REG_DWORD /d "65536" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PasswordData" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "ZipLegacyEncrypt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SaveSymLinks" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SaveHardLinks" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "BLAKE2" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "FileCopies" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "OrigArcData" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "QuickOpen" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PreserveAtime" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SeparateArcDoubleExt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "SeparateArcSubfolders" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PackLongRange" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PackDeltaComp" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PackExeComp" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "PackExhaustive" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Profiles\0" /v "CmdSwitches" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup" /v "ShellExt" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup" /v "CascadedMenu" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup" /v "MenuIcons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup" /v "LegacyMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup" /v "CustomExt" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.001" /v "Set" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.001" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.001" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.001" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.7z" /v "Set" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.7z" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.7z" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.7z" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.arj" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.arj" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.arj" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.arj" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz2" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz2" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz2" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.bz2" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.cab" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.cab" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.cab" /v "Type" /t REG_SZ /d "CABFolder" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.cab" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.gz" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.gz" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.gz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.gz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.iso" /v "Set" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.jar" /v "Set" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lha" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lha" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lha" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lz" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lzh" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lzh" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lzh" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.lzh" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.rar" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.rar" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.rar" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.rar" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tar" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tar" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tar" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tar" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.taz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.taz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.taz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz2" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz2" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tbz2" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tgz" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tgz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tgz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tlz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tlz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tlz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.txz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.txz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.txz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tzst" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tzst" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.tzst" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uu" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uu" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uu" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uue" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uue" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uue" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.uue" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xxe" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xxe" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xxe" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xz" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xz" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xz" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.xz" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.z" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.z" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.z" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.z" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zip" /v "Set" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zip" /v "Exist" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zip" /v "Type" /t REG_SZ /d "CompressedFolder" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zip" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zipx" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zipx" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zipx" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zipx" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zst" /v "Set" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zst" /v "Exist" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zst" /v "Type" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\.zst" /v "ShellNew" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\Links" /v "Desktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\Links" /v "StartMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\Links" /v "Programs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrTo" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrHere" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Extr" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrSep" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "OpenSFX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "AddTo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "AddArc" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailArc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailOpt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Test" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Convert" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "Type" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "DosCharSet" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "ReuseWindow" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "Wrap" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "ViewerUnpackAll" /t REG_SZ /d "*.exe *.msi *.htm *.html *.part*.rar" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "ExternalViewer" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "Autodetect" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "ViewerIgnoreModifications" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\VirusScan" /v "Prompt" /t REG_DWORD /d "1" /f

:: Tweaks Optimization Script

:: Disable snap assist
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "JointResize" /T REG_DWORD /D "0" /F
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "SnapAssist" /T REG_DWORD /D "0" /F
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "SnapFill" /T REG_DWORD /D "0" /F
Reg Add "HKCU\Control Panel\Desktop" /V "WindowArrangementActive" /D "0" /F
:: Disable offline drives in system tray
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
 
 
:: Defender spytools
Reg Add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "0" /f
:: Audio auto levelling
Reg Add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f
:: Sticky Keys
Reg Add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
Reg Add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f
:: Windows Sign-in & Maps
Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v "DevicePasswordLessBuildVersion" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /t REG_BINARY /d "0700000000A0BE0BAA3CDA01" /f
:: AI, Copilot, and GameBar
Reg Add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f
 
 
:: Privacy & Telemetry
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
:: Graphics Optimizations
Reg Add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f
 
 
:: File Explorer Preferences
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f
 
 
:: System Performance & Error Reporting
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d 1 /f
 
 
:: Command Processor Customization
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "CompletionChar" /t REG_DWORD /d "9" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "DefaultColor" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "EnableExtensions" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "PathCompletionChar" /t REG_DWORD /d "9" /f
 
 
:: Scheduled Tasks (Diagnostics & Office Telemetry)
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 2>nul
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable 2>nul
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 2>nul
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable 2>nul
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" 2>nul
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable 2>nul
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" 2>nul
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable 2>nul
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack" 2>nul
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack" /disable 2>nul
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" 2>nul
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" /disable 2>nul
 
 
:: Microsoft Office Logging and Diagnostics
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
:: Taskbar & Recent History Clean Up
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchBoxTaskbarMode" /d 0 /t REG_DWORD /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /d 0 /t REG_DWORD /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /d 1 /t REG_DWORD /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /d 0 /t REG_DWORD /f
 
echo.
echo =========================================================
echo       All Server Configuration Tweaks Completed!         
echo =========================================================
endlocal
exit
