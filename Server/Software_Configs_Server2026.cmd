@echo off
chcp 65001 >nul
CD /d "%~dp0"
Title Server_Software_Configs
setlocal EnableDelayedExpansion

cd %systemroot%\system32
call :IsAdmin

powercfg /hibernate off
powercfg -h off
powercfg /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /change /monitor-timeout-ac 0
powercfg /change /standby-timeout-ac 0

net stop WSearch
sc config WSearch start= disabled

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
::Shortcuts

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f

::VMWare

Reg.exe add "HKCU\SOFTWARE\VMware, Inc.\VMware Tray" /v "TrayBehavior" /t REG_DWORD /d "2" /f

::NetTraffic

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NetTraffic" /t REG_SZ /d "d:\Temp\Apps Portable\NetTraffic\NetTraffic.exe" /f

::Classic Volume Control

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Classic Volume Control" /t REG_SZ /d "d:\Temp\Apps Portable\Classic Volume Control\ClassicVolumeControl.exe" /f

::Unlimited_Files

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "10000" /f

::PowerISO

Reg.exe add "HKCR\Applications\PowerISOPortable.exe\shell\open\command" /ve /t REG_SZ /d "\"g:\Apps Portable\PowerISO\PowerISO 9.exe\" \"%%1\"" /f

::OEM_Server_Info

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOwner" /t REG_SZ /d "Server-Edition" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "Morphs Creations" /f

::Windows 10 Classic Right Click

Reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f

::Disable_Explorer From Showing External Drives Twice

Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
Reg.exe delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f

::RegConvert

Reg.exe add "HKCR\regfile\shell\0_RegConvert" /v "MUIVerb" /t REG_SZ /d "Convert to bat" /f
Reg.exe add "HKCR\regfile\shell\0_RegConvert" /v "Icon" /t REG_SZ /d "\"d:\Temp\Apps Portable\RegConverter\RegConvert.exe\",4" /f
Reg.exe add "HKCR\regfile\shell\0_RegConvert\Command" /ve /t REG_SZ /d "d:\Temp\Apps Portable\RegConverter\RegConvert.exe\" \"/S=%%1\" /O=bat /T" /f

::Disable_offline_network system tray icon

Reg Add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider" /v "RestoreConnection" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\HwOrder" /v "ProviderOrder" /t REG_SZ /d "RDPNP,LanmanWorkstation,webclient" /f
Reg Add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider\Order" /v "ProviderOrder" /t REG_SZ /d "RDPNP,LanmanWorkstation,webclient" /f

::StartIsBack_config

Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "OrbBitmap" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Orbs\Alien (16).bmp" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "TaskbarStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Evoke X.msstyles" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack" /v "AlterStyle" /t REG_SZ /d "C:\Program Files (x86)\StartIsBack\Styles\Horizon Forbidden West.msstyles" /f

::Restart Explorer context menu

Reg.exe delete "HKCR\DesktopBackground\Shell\Restart Explorer" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer" /v "icon" /t REG_SZ /d "explorer.exe" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\Restart Explorer\command" /ve /t REG_SZ /d "cmd.exe /c taskkill /f /im explorer.exe  & start explorer.exe" /f

::qBittorrent_Settings

Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\qBittorrent\qbittorrent.exe,1" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationName" /t REG_SZ /d "qBittorrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Torrent downloader" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\FileAssociations" /v ".torrent" /t REG_SZ /d "qBittorrent.torrent" /f
Reg.exe add "HKCU\SOFTWARE\qBittorrent\Capabilities\URLAssociations" /v "magnet" /t REG_SZ /d "qBittorrent.magnet" /f

::Run_Setting

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NetTraffic" /t REG_SZ /d "d:\Temp\Apps Portable\NetTraffic\NetTraffic.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Classic Volume Control" /t REG_SZ /d "d:\Temp\Apps Portable\Classic Volume Control\ClassicVolumeControl.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "FanControl" /t REG_SZ /d "d:\Temp\Apps Portable\FanControl Portable\FanControl.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Aida64" /t REG_SZ /d "d:\Temp\Apps Portable\AIDA64 Portable\aida64.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Overwolf" /t REG_SZ /d "C:\Program Files (x86)\Overwolf\OverwolfLauncher.exe -overwolfsilent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Emby" /t REG_SZ /d "g:\Apps Portable\Emby Server\system\EmbyServer.exe" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "qBittorrent" /t REG_SZ /d "\"C:\Program Files\qBittorrent\qbittorrent.exe\" \"--profile=\" \"--configuration=\"" /f

::OldNewExplorer

Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "DriveGrouping" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoRibbon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoCaption" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NoUpButton" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "NavBarGlass" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "IEButtons" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "Details" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Tihiy\OldNewExplorer" /v "StatusBar" /t REG_DWORD /d "1" /f

::DAMNNFO_Viewer

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

::Overwolf

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

::Warframe

Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe" /ve /t REG_SZ /d "LauncherCEFV7" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "UpdateVersion" /t REG_DWORD /d "23" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "DownloadDir" /t REG_SZ /d "f:\Temp\Games\Warframe\Downloaded\\" /f
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
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LauncherExe" /t REG_SZ /d "C:\Users\Server\AppData\Local\Warframe\Downloaded\Public\Tools\Launcher.exe" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "EnableShaderCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "LanguageVO" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "WindowMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Digital Extremes\Warframe\Launcher" /v "ErrorDx10Unsuported" /t REG_DWORD /d "1" /f

::Visual effects

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
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\Themes" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_DWORD /d "1" /f

::7-Zip

Reg.exe add "HKCU\SOFTWARE\7-Zip" /v "Path64" /t REG_SZ /d "C:\Program Files\7-Zip\\" /f
Reg.exe add "HKCU\SOFTWARE\7-Zip" /v "Path" /t REG_SZ /d "C:\Program Files\7-Zip\\" /f
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

::Realtek_Audio_Settings

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

::Pause updates

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
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2025-10-14T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "SmartActiveHoursSuggestionState" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowMUUpdateService" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2025-10-14T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2025-10-14T13:00:00Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "3000-10-14T13:00:01Z" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "TrayIconVisibility" /t REG_DWORD /d "0" /f

::Myfolders

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\INetCache" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Templates" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d "F:\Temp\Downloads\4K Video Downloader" /f

::Myfolders2

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "!Do not use this registry key" /t REG_SZ /d "Use the SHGetFolderPath or SHGetKnownFolderPath function instead" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "AppData" /t REG_SZ /d "C:\Users\Server\AppData\Roaming" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Local AppData" /t REG_SZ /d "C:\Users\Server\AppData\Local" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CD Burning" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\Burn\Burn" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Libraries" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "C:\Users\Server\Videos" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "D:\Temp\My Pics" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "C:\Users\Server\Desktop" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "History" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\History" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "NetHood" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_SZ /d "C:\Users\Server\Contacts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{00BCFC5A-ED94-4E48-96A1-3F6217F21990}" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\RoamingTiles" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Cookies" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\INetCookies" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /t REG_SZ /d "C:\Users\Server\Favorites" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "SendTo" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\SendTo" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Start Menu" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "D:\Temp\Music" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Programs" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Recent" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Recent" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "PrintHood" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_SZ /d "C:\Users\Server\Searches" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "D:\New Stuff" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{A520A1A4-1780-4FF6-BD18-167343C5AF16}" /t REG_SZ /d "C:\Users\Server\AppData\LocalLow" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Startup" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Administrative Tools" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" /t REG_SZ /d "D:\Temp\My Docs" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_SZ /d "C:\Users\Server\Links" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Cache" /t REG_SZ /d "C:\Users\Server\AppData\Local\Microsoft\Windows\INetCache" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Templates" /t REG_SZ /d "C:\Users\Server\AppData\Roaming\Microsoft\Windows\Templates" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\Users\Server\Saved Games" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Fonts" /t REG_SZ /d "C:\Windows\Fonts" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Do not use this registry key" /t REG_SZ /d "Use the SHGetFolderPath or SHGetKnownFolderPath function instead" /f

::StartAllback_config

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

::StartIsBack_config

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
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealHeight.6" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealHeight.9" /t REG_DWORD /d "131078" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "IdealWidth.9" /t REG_SZ /d "Control Panel" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "OrbWidth.96" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\SOFTWARE\StartIsBack\Cache" /v "OrbHeight.96" /t REG_DWORD /d "54" /f

::Regional_Settings

Reg.exe add "HKCU\Control Panel\International" /v "Locale" /t REG_SZ /d "00001C09" /f
Reg.exe add "HKCU\Control Panel\International" /v "LocaleName" /t REG_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International" /v "s1159" /t REG_SZ /d "am" /f
Reg.exe add "HKCU\Control Panel\International" /v "s2359" /t REG_SZ /d "pm" /f
Reg.exe add "HKCU\Control Panel\International" /v "sCurrency" /t REG_SZ /d "R" /f
Reg.exe add "HKCU\Control Panel\International" /v "sDate" /t REG_SZ /d " " /f
Reg.exe add "HKCU\Control Panel\International" /v "sDecimal" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sLanguage" /t REG_SZ /d "ENS" /f
Reg.exe add "HKCU\Control Panel\International" /v "sList" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sLongDate" /t REG_SZ /d "dddd, dd MMMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonDecimalSep" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonThousandSep" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sNativeDigits" /t REG_SZ /d "0123456789" /f
Reg.exe add "HKCU\Control Panel\International" /v "sNegativeSign" /t REG_SZ /d "-" /f
Reg.exe add "HKCU\Control Panel\International" /v "sPositiveSign" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "dd MMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sThousand" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sTime" /t REG_SZ /d ":" /f
Reg.exe add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "HH:mm:ss" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "HH:mm" /f
Reg.exe add "HKCU\Control Panel\International" /v "sYearMonth" /t REG_SZ /d "MMMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCalendarType" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCountry" /t REG_SZ /d "27" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrency" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDate" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "NumShape" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstDayOfWeek" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstWeekOfYear" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegNumber" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iPaperSize" /t REG_SZ /d "9" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTimePrefix" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Reg.exe add "HKCU\Control Panel\International\??????" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Nation" /t REG_SZ /d "209" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Name" /t REG_SZ /d "ZA" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableLanguagePacks" /t REG_MULTI_SZ /d "af-za\0fa-ir\0be-by\0he-il\0bn-bd\0ga-ie\0uk-ua\0mn-mn\0ti-et\0mr-in\0ky-kg\0as-in\0gl-es\0km-kh\0ar-sa\0am-et\0bn-in\0ca-es-valencia\0az-latn-az\0de-de\0bg-bg\0da-dk\0gd-gb\0ka-ge\0ha-latn-ng\0uz-latn-uz\0sw-ke\0hu-hu\0it-it\0ku-arab-iq\0yo-ng\0tn-za\0es-mx\0chr-cher-us\0nl-nl\0hr-hr\0bs-latn-ba\0lv-lv\0th-th\0pt-br\0or-in\0pl-pl\0is-is\0te-in\0mk-mk\0es-es\0ml-in\0fr-fr\0kn-in\0prs-af\0kok-in\0ca-es\0en-gb\0fr-ca\0sd-arab-pk\0et-ee\0zh-cn\0si-lk\0cs-cz\0gu-in\0cy-gb\0ig-ng\0ja-jp\0el-gr\0eu-es\0xh-za\0sl-si\0en-us\0kk-kz\0mi-nz\0fi-fi\0id-id\0fil-ph\0tk-tm\0lt-lt\0pa-in\0hi-in\0lo-la\0ko-kr\0hy-am\0lb-lu\0ms-my\0ur-pk\0ro-ro\0mt-mt\0sr-cyrl-rs\0sq-al\0ne-np\0ug-cn\0nb-no\0nn-no\0nso-za\0pa-arab-pk\0pt-pt\0quc-latn-gt\0quz-pe\0ru-ru\0rw-rw\0sk-sk\0sr-cyrl-ba\0sr-latn-rs\0sv-se\0ta-in\0tg-cyrl-tj\0tr-tr\0tt-ru\0vi-vn\0wo-sn\0zh-tw\0zu-za" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableSpeechFeatures" /t REG_MULTI_SZ /d "fr-CA\0en-GB\0da-DK\0en-IN\0de-DE\0en-AU\0en-CA\0en-US\0fr-FR\0es-ES\0es-MX\0it-IT\0ja-JP\0pt-BR\0zh-CN\0zh-HK\0zh-TW" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableHandwritingFeatures" /t REG_MULTI_SZ /d "rm-CH\0el-GR\0rw-RW\0de-DE\0af-ZA\0ca-ES\0en-GB\0gd-GB\0da-DK\0nl-NL\0hr-HR\0bs-LATN-BA\0zh-CN\0cs-CZ\0ja-JP\0cy-GB\0xh-ZA\0sl-SI\0en-US\0ms-BN\0fr-FR\0es-ES\0tn-ZA\0es-MX\0eu-ES\0fi-FI\0ga-IE\0nso-ZA\0gl-ES\0hi-IN\0id-ID\0sw-KE\0it-IT\0ko-KR\0lb-LU\0mi-NZ\0ms-MY\0nb-NO\0nn-NO\0pt-BR\0pl-PL\0pt-PT\0ro-RO\0ru-RU\0sk-SK\0sr-CYRL-RS\0sq-AL\0sr-LATN-RS\0sv-SE\0tr-TR\0wo-SN\0zh-HK\0zh-TW\0zu-ZA" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableTextToSpeechFeatures" /t REG_MULTI_SZ /d "ar-SA\0ar-EG\0bg-BG\0de-DE\0da-DK\0de-CH\0fr-CA\0en-GB\0ca-ES\0zh-CN\0cs-CZ\0fi-FI\0de-AT\0en-IN\0el-GR\0en-AU\0en-CA\0nl-BE\0en-IE\0sl-SI\0en-US\0fr-FR\0es-ES\0es-MX\0fr-CH\0he-IL\0hi-IN\0nl-NL\0hr-HR\0it-IT\0hu-HU\0id-ID\0ja-JP\0ko-KR\0ms-MY\0nb-NO\0th-TH\0pt-BR\0pl-PL\0pt-PT\0ro-RO\0ru-RU\0sk-SK\0sv-SE\0ta-IN\0tr-TR\0vi-VN\0zh-HK\0zh-TW" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "Languages" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowTextPrediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "UserLocaleFromLanguageProfileOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "1C09:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "CachedLanguageName" /t REG_SZ /d "@Winlangdb.dll,-1122" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "FeaturesToInstall" /t REG_DWORD /d "227" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "Languages" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowTextPrediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-ZA" /v "1C09:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\??????" /v "Calendar" /t REG_SZ /d "Gregorian" /f

::Console1

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
Reg.exe add "HKCU\Console\%%%%Startup" /v "DelegationConsole" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\Console\%%%%Startup" /v "DelegationTerminal" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_Resources_Themes_Horizon Forbidden West.theme" /v "WindowPosition" /t REG_DWORD /d "9502839" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_Resources_Themes_Horizon Forbidden West.theme" /v "FontSize" /t REG_DWORD /d "1179658" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_Sysnative_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_Sysnative_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "ColorTable09" /t REG_DWORD /d "16727040" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "PopupColors" /t REG_DWORD /d "158" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontSize" /t REG_DWORD /d "1179658" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "1441887" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowAlpha" /t REG_DWORD /d "206" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowPosition" /t REG_DWORD /d "9110400" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_cmd.exe" /v "CursorSize" /t REG_DWORD /d "100" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_cmd.exe" /v "QuickEdit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable05" /t REG_DWORD /d "5645313" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ColorTable06" /t REG_DWORD /d "15789550" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "243" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "QuickEdit" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608120" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "86" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "3276920" /f

::Console2

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

::Drive_setting

Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\C:" /t REG_BINARY /d "444d494f3a49443a3114320fa150324694037ef9082f7529" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\D:" /t REG_BINARY /d "444d494f3a49443a4d9b9ae1204d794f9d722318b7fb7c39" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\E:" /t REG_BINARY /d "444d494f3a49443ab1dbb91a35edd74f8511d8fc6dc84aae" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\F:" /t REG_BINARY /d "444d494f3a49443a3379dfe259f0de488198088573f9df9b" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\G:" /t REG_BINARY /d "444d494f3a49443af3725387252b6b4e9ee862464a24b396" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{3eabd8c3-43d5-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443af8f5803dc2f88144953a30b1014db9ba" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{3eabd8c4-43d5-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a61af2a2f610c3e4ab908b28b2aac7a75" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{3eabd8df-43d5-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a61af2a2f610c3e4ab908b28b2aac7a75" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{3eabda83-43d5-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000310023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{6537bd71-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a1965fc670b7d234eab65a21af86053f7" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{6537bd75-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a3e6007b518316946ba28d695f81fb2a5" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{6537be0c-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a1965fc670b7d234eab65a21af86053f7" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{6537be0d-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a3e6007b518316946ba28d695f81fb2a5" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{6537be88-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "5f003f003f005f00550053004200530054004f00520023004400690073006b002600560065006e005f004b0069006e006700730074006f006e002600500072006f0064005f004400610074006100540072006100760065006c00650072005f004700330026005200650076005f0050004d004100500023003000300031004300430030004500430033003300420030004200410042003100410037004400390030003000360043002600300023007b00350033006600350036003300300037002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{6537bec5-4513-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443ad2653871ca3c74419ea4c478075367ec" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{b5b39369-4531-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443aa9f62277dbb91748ba2df4eae7c9166b" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{b5b3936a-4531-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a53ce3118971614418e65485d2e67ba61" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{b5b393bd-4531-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a8ac97fa9c8fb4c46a5c9253f5c97e5db" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{f8718260-4563-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a90fb0e36825f744ebfa21b50e686a500" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{f87182a2-4563-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a2fb803ad33484840a5e34def18e9a2ea" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{f87197af-4563-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a7663f8e2b5920846853c751ecfa3dbf9" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{f87197fb-4563-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a634472584d86db4ebbc359d39820ed08" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{0f903e4a-4630-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a3745e4019be11246aa8decb9d0d33738" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{0f903eaf-4630-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a5c916ce1f5f38b43b854f45ac8f4d16f" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{e5c81dc0-4644-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443acd49de02e4a5124ab3406313c769053c" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{e5c81e5d-4644-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a661fd429a327b14a831c54acd7639ad0" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{2cdd7378-4868-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a00000000000000000000000000000000" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{2cdd748b-4868-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "5f003f003f005f00550053004200530054004f00520023004400690073006b002600560065006e005f004a006500740046006c006100730068002600500072006f0064005f005400720061006e007300630065006e0064005f00360034004700420026005200650076005f0031003100300030002300300035004e00490042004d0048005a00420035004d0048003300490056004e002600300023007b00350033006600350036003300300037002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{4b67f329-4911-11f1-9a6a-309c23e102b6}" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000330023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{81a96ff4-4952-11f1-9a6b-309c23e102b6}" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000320023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\J:" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000330023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{81a97000-4952-11f1-9a6b-309c23e102b6}" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000340023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\K:" /t REG_BINARY /d "5c003f003f005c00530043005300490023004300640052006f006d002600560065006e005f004d007300660074002600500072006f0064005f005600690072007400750061006c005f004400560044002d0052004f004d002300320026003100660034006100640066006600650026003000260030003000300030003000340023007b00350033006600350036003300300064002d0062003600620066002d0031003100640030002d0039003400660032002d003000300061003000630039003100650066006200380062007d00" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{16ff290b-4f81-11f1-9a85-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443aaf4f087b304a0b468e1d76218d5b27aa" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{16ff291f-4f81-11f1-9a85-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a9238dd18d3c08344b73a483c6a8c5995" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\??\Volume{16ff2923-4f81-11f1-9a85-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a16f959b065195d49a2af03d4c521e6d2" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "#{16ff2956-4f81-11f1-9a85-309c23e102b6}" /t REG_BINARY /d "444d494f3a49443a16f959b065195d49a2af03d4c521e6d2" /f
Reg.exe add "HKLM\SYSTEM\MountedDevices" /v "\DosDevices\H:" /t REG_BINARY /d "444d494f3a49443a9238dd18d3c08344b73a483c6a8c5995" /f

::MPC-HC_Setting

Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC" /v "ExePath" /t REG_SZ /d "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AC3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_APE" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_ASF" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AVI" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AVS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_CDDA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_CDXA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_DSM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_DTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLIC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_GIF" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_HTTP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MATROSKA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MISC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MMS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MP4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPEG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPEGTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_OGG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_REALMEDIA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RFS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTMP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTSP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_SUBS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_UDP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_VTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_WTV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AC3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AC4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_ALAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_ALS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AMR" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AMVV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AV1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_DIVX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_DTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLIC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLV4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_H263" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_INDEO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_LPCM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MJPEG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPEG1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MSMPEG4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MSVIDEO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_NELLY" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_OPUS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_PCM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_PS2AUD" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_RA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_RV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_SCREEN" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_SVQ3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_THEORA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_V210_V410" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VORBIS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP356" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP8" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMALL" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMAPRO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_XVID" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_H264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_HEVC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPEG2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VC1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP9" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "SampleConvertDither" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "DRCEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "AutoAVSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Output51Legacy" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "ExpandMono" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingLayout" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingFlags" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Mixing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingCenterLevel" /t REG_DWORD /d "10000" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingLFELevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_ac3" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_dts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_eac3" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_dtshd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_truehd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "QueueMaxPackets" /t REG_DWORD /d "350" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "QueueMaxSize" /t REG_DWORD /d "128" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "NetworkAnalysisDuration" /t REG_DWORD /d "2100" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo" /v "MSWMV9DMO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWAccel" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "h264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "vc1" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "hevc" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "hevc10" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "vp9" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "av1" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "mpeg2" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "mpeg4" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "dvd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWAccelDeviceD3D11" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWResFlags" /t REG_DWORD /d "6" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "DSVidRen" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AutoloadSubtitles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SubtitleRenderer" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AudioRendererType" /t REG_SZ /d "Internal Audio Renderer" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AllowDroppingSubpic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AutoDownloadSubtitles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RenderSSAUsingLibass" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SubtitlesProviders" /t REG_SZ /d "<|OpenSubtitles|||0|1|><|podnapisi|||1|0|><|SubDB|||1|0|><|Napisy24|||0|0|>" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AudioNormalize" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "ShowOSD" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "UseSeekPreview" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "FastSeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "KeepHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberFilePos" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberPosForAudioFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberPosForLongerThan" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "BlockRDP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "MPCTheme" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "ModernThemeMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "DefaultToolbarSize" /t REG_DWORD /d "28" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "IconLibVersion" /t REG_DWORD /d "1337" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SettingsVersion" /t REG_DWORD /d "9" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "0" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "1" /t REG_SZ /d "Sharpen" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PreResize0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PreResize1" /t REG_SZ /d ".\Sharpen complex 2.hlsl" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PostResize0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PostResize1" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Toolbars\PlayerToolBar" /v "DefaultToolbarSize" /t REG_DWORD /d "28" /f

::ACDSee_Config

Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageDB" /t REG_SZ /d "C:\Program Files (x86)\ACDSee32\ImageDB.aid" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellBrowseAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellViewAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellOpenAssoc" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HistPaths" /t REG_BINARY /d "00" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "BrowserWndPos" /t REG_BINARY /d "2c0000000000000001000000fffffffffffffffffffffffffffffffff7ffffff4b020000d305000061060000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoPreview" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PreviewMode" /t REG_BINARY /d "04000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "LVStyle" /t REG_BINARY /d "04000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SCStyle" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SortMethod" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SortReverse" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PreviewLoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShortcutsLoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUTV" /t REG_BINARY /d "c8000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUFL" /t REG_BINARY /d "64000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "PVHeightUSC" /t REG_BINARY /d "c8000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "TVSplitPos" /t REG_BINARY /d "61010000" /f
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
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ConvertOptions" /t REG_BINARY /d "000000005a00000000000000000000000200000000000000000000000100000002000000010000000000000000000000480000004800000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowOpenPreview" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "OpenDefFilter" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShellPrintAssoc" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageHiliteClr" /t REG_BINARY /d "ffffc800" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ImageHiliteClr8" /t REG_BINARY /d "ffff0000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "FindOptions" /t REG_BINARY /d "01000000010000000100000001000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SyncOptions" /t REG_BINARY /d "010000000100000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "NewThumbs" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowColumns" /t REG_BINARY /d "010000000100000000000000010000000100000000000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ColumnWidths" /t REG_BINARY /d "ef000000550000005f0000007d0000007800000013010000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ColumnOrder" /t REG_BINARY /d "000000000100000002000000020000000300000003000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "LastFolder" /t REG_SZ /d "f:\Temp\_Custom Apps\Server_Win10\$OEM$\$$\Web\Wallpaper" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ViewerWndPos" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffff990a00006c040000f70b00005f060000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "SaveBrowserWindow" /t REG_BINARY /d "02000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowImgOnly" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowHidden" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "ShowDrives" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "UseSysIcons" /t REG_BINARY /d "01000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "AutoSizeColumns" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "CacheImgDim" /t REG_BINARY /d "00000000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "RememberDir" /t REG_BINARY /d "01000000" /f
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
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "HistRenameTemplates" /t REG_BINARY /d "4d6f727068734372656174696f6e735f447261676f6e735f232323004d6f727068735f57616c6c735f232323004d6f727068735f447261676f6e735f232323005361746f7269204d6173736167652023232300456d6f74696f6e735f23232300417070735f546f6f6c735f313330393230303223232e6a7067004d6f72706827735f34696e315f53657074323032325f2323232e6a7067005365702e5f30322c5f323032325f31352d34352d2323232e6a7067005365702e5f30322c5f323032325f31342d30302d2323232e6a70670057616c6c70617065722323232e6a70670057616c6c7061706572232323004d6f72706827735f31305f313836355f323248325f76322e302b4f324b32315f23232e6a7067004d6f72706827735f31305f313836355f323248325f76322e305f23232e6a70670034303067625f336872735f3030232e6a7067002323235f4a756c2e5f33302c5f323032325f5f2e6a7067004a756c2e5f33302c5f323032325f2323232e6a7067004a756c2e5f33302c5f323032325f23232300696d6723230000" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "OpenFolder" /t REG_SZ /d "I:\Full ISO's\Win10 ISO's\Backup\4KStogram\Pics\#__Bestest\#a.My Folders" /f
Reg.exe add "HKCU\SOFTWARE\ACD Systems\ACDSee32" /v "DisableFileOps " /t REG_BINARY /d "00" /f

::WinRAR_Settings

Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictHistorySize" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictMask" /t REG_SZ /d "0000001100000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\WinRAR\Compression" /v "DictLimit" /t REG_DWORD /d "8" /f
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
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "name" /t REG_DWORD /d "343" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "size" /t REG_DWORD /d "116" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "psize" /t REG_DWORD /d "116" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "type" /t REG_DWORD /d "88" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\ArcColumnWidths" /v "mtime" /t REG_DWORD /d "154" /f
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
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "name" /t REG_DWORD /d "367" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "size" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "type" /t REG_DWORD /d "216" /f
Reg.exe add "HKCU\Software\WinRAR\FileList\FileColumnWidths" /v "mtime" /t REG_DWORD /d "155" /f
Reg.exe add "HKCU\Software\WinRAR\General" /v "VerInfo" /t REG_BINARY /d "00160700e110da3d3bdadc01" /f
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
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "Size" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "ButtonsText" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar" /v "Lock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.add" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.add.pos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.add.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.add" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.add.pos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.add.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exto" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exto.pos" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exto.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exto" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exto.pos" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exto.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.test" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.test.pos" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.test.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.test" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.test.pos" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.test.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.view" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.view.pos" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.view.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.view" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.view.pos" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.view.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.del" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.del.pos" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.del.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.del" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.del.pos" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.del.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.find" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.find.pos" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.find.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.find" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.find.pos" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.find.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prn.pos" /t REG_DWORD /d "6" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prn.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prn" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prn.pos" /t REG_DWORD /d "6" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prn.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.wiz" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.wiz.pos" /t REG_DWORD /d "7" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.wiz.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.wiz" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.wiz.pos" /t REG_DWORD /d "7" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.wiz.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cvt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cvt.pos" /t REG_DWORD /d "8" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cvt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cvt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cvt.pos" /t REG_DWORD /d "8" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cvt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.info" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.info.pos" /t REG_DWORD /d "9" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.info.sep" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.info" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.info.pos" /t REG_DWORD /d "9" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.info.sep" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exit.pos" /t REG_DWORD /d "11" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.exit.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exit" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exit.pos" /t REG_DWORD /d "11" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.exit.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rep" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rep.pos" /t REG_DWORD /d "12" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rep.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rep.pos" /t REG_DWORD /d "12" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rep.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.extr" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.extr.pos" /t REG_DWORD /d "13" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.extr.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.extr" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.extr.pos" /t REG_DWORD /d "13" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.extr.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.vir" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.vir.pos" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.vir.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.vir" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.vir.pos" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.vir.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cmt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cmt.pos" /t REG_DWORD /d "15" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.cmt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cmt" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cmt.pos" /t REG_DWORD /d "15" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.cmt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prot.pos" /t REG_DWORD /d "16" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.prot.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prot.pos" /t REG_DWORD /d "16" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.prot.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.lock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.lock.pos" /t REG_DWORD /d "17" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.lock.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.lock" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.lock.pos" /t REG_DWORD /d "17" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.lock.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.sfx" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.sfx.pos" /t REG_DWORD /d "18" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.sfx.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.sfx" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.sfx.pos" /t REG_DWORD /d "18" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.sfx.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rpt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rpt.pos" /t REG_DWORD /d "19" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.rpt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rpt" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rpt.pos" /t REG_DWORD /d "19" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.rpt.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.bnc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.bnc.pos" /t REG_DWORD /d "20" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "f.bnc.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.bnc" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.bnc.pos" /t REG_DWORD /d "20" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Buttons" /v "a.bnc.sep" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_0" /t REG_BINARY /d "4c000000610100000402000000000000000000000000000000000000000000000000000000000000000000000000000000000000550000003402000000000000000000000000000001000000" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_1" /t REG_BINARY /d "4c0000006101000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d0000002600000000000000000000000000000002000000" /f
Reg.exe add "HKCU\Software\WinRAR\General\Toolbar\Layout" /v "Band76_2" /t REG_BINARY /d "4c0000006101000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d0000006400000000000000000000000000000003000000" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "ColorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "FullPathsTitle" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "SystemProgressBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "TaskbarProgressBar" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "AsArchives" /t REG_SZ /d "*.exe" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "ShowPassword" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface" /v "PswAllArchives" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\CmdWin" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\Comment" /v "LeftBorder" /t REG_DWORD /d "696" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\ErrList" /v "ResPlacement" /t REG_BINARY /d "2c0000000000000001000000fffffffffffffffffffffffffffffffff60a000096010000210e0000f5030000" /f
Reg.exe add "HKCU\Software\WinRAR\Interface\MainWin" /v "Placement" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffffb80a0000f5030000ff0e0000fb070000" /f
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
Reg.exe add "HKCU\Software\WinRAR\Setup\.zip" /v "Set" /t REG_DWORD /d "1" /f
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
Reg.exe add "HKCU\Software\WinRAR\Viewer" /v "Placement" /t REG_BINARY /d "2c0000000000000001000000ffffffffffffffffffffffffffffffff7405000085010000b60800003c050000" /f
Reg.exe add "HKCU\Software\WinRAR\VirusScan" /v "Prompt" /t REG_DWORD /d "1" /f

::QuickLaunch

Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /t REG_BINARY /d "3c0300004c0000000114020000000000c00000000000004683008000200000002733974e53c0dc012733974e53c0dc01a8b6c6daddacd501970100000000000001000000000000000000000000000000a4013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc018408563952c0dc018408563952c0dc01140056003100000000007e5c327511005461736b42617200400009000400efbe7d5c00687e5c32752e000000b8dd00000000bd01000000000000000000000000000095e0ba005400610073006b00420061007200000016001201320097010000874f0749200046696c65204578706c6f7265722e6c6e6b007c0009000400efbe7e5c32757e5c32752e00000022c30100000079010000000000000000520000000000589c4400460069006c00650020004500780070006c006f007200650072002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000002000220000001e00efbe02005500730065007200500069006e006e006500640000002000120000002b00efbe1c419a4e53c0dc012000420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f00720065007200000020000000a10000001c000000010000001c0000003100000000000000a00000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c46696c65204578706c6f7265722e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8152f47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8152f47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000ec0200004c0000000114020000000000c000000000000046830080002000000010c6860052c0dc0110c6860052c0dc0110c6860052c0dc015b080000000000000100000000000000000000000000000054013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c087411005461736b42617200400009000400efbe7d5c00687e5c08742e000000b8dd00000000bd010000000000000000000000000000f01104015400610073006b0042006100720000001600c20032005b0800007e5c08742000476f6f676c65204368726f6d652e6c6e6b00540009000400efbe7e5c08747e5c08742e0000007bf40100000085010000000000000000000000000000f011040147006f006f0067006c00650020004300680072006f006d0065002e006c006e006b0000002000220000001e00efbe02005500730065007200500069006e006e006500640000002000120000002b00efbe7328890052c0dc0120001a0000001d00efbe02004300680072006f006d006500000020000000a10000001c000000010000001c0000003100000000000000a00000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c476f6f676c65204368726f6d652e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8562e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8562e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000001d0300004c0000000114020000000000c00000000000004683008000200000001bd75df651c0dc011bd75df651c0dc01b4745bf651c0dc017205000000000000010000000000000000000000000000008a013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5cfd7311005461736b42617200400009000400efbe7d5c00687e5cfd732e000000b8dd00000000bd010000000000000000000000000000e56b72005400610073006b0042006100720000001600f8003200720500007e5cfd732000544f54414c434d442e6c6e6b00004a0009000400efbe7e5cfd737e5cfd732e000000fbc201000000800100000000000000000000000000004cce740054004f00540041004c0043004d0044002e006c006e006b0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00120000002b00efbe1bd75df651c0dc011c005e0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0054006f00740061006c0043004d0044005c0054004f00540041004c0043004d004400360034002e0045005800450000001c0000009c0000001c000000010000001c00000031000000000000009b0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c544f54414c434d442e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8502e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8502e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000003b0600004c0000000114020000000000c00000000000004683008000200000003c7ab64aeec0dc0162f21755eec0dc0162f21755eec0dc014e07000000000000010000000000000000000000000000008a043a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe10000000008021435ec0dc01008021435ec0dc01008021435ec0dc011400820074001c0043465346160031000000000000000000100041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000000000001000526f616d696e6700400009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000052006f0061006d0069006e006700000016005c003100000000000000000010004d6963726f736f667400440009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000000000001000496e7465726e6574204578706c6f72657200540009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f00720065007200000020006600310000000000000000001000517569636b204c61756e636800004a0009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000051007500690063006b0020004c00610075006e006300680000001c006200310000000000000000001200557365722050696e6e656400480009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e003100000000007f5c61491000496d706c6963697441707053686f72746375747300005a0009000400efbe7e5c00807f5c61492e000000fedb00000000d800000000000000000000000000000025b90b0149006d0070006c006900630069007400410070007000530068006f007200740063007500740073000000240072003100000000007f5c61491000356337346432666161383361613630340000520009000400efbe7f5c61497f5c61492e0000004d1c0000000085010000000000000000000000000000c41c0b01350063003700340064003200660061006100380033006100610036003000340000002000ee0032004e0700007f5c694920004368726f6d69756d2e6c6e6b00004a0009000400efbe7f5c61497f5c69492e000000808501000000df0100000000000000000000000000009e0c33004300680072006f006d00690075006d002e006c006e006b0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00120000002b00efbebfa33cd7f0c0dc011c00540000001d00efbe02004300680072006f006d00690075006d002e00340046004f005a004f00540055005600570041005a003600500056004b0035005000340036005200570051004d00360047004d0000001c000000ba0000001c000000010000001c0000003100000000000000b90000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c496d706c6963697441707053686f7274637574735c356337346432666161383361613630345c4368726f6d69756d2e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8a212c6a24c2cf1119a64309c23e102b6543878ea63a83449bb18a28722c157e8a212c6a24c2cf1119a64309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000005d0300004c0000000114020000000000c0000000000000468300800020000000f56de80752c0dc01f56de80752c0dc01900be60752c0dc01120700000000000001000000000000000000000000000000c4013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0e7411005461736b42617200400009000400efbe7d5c00687e5c0e742e000000b8dd00000000bd0100000000000000000000000000000b78c9005400610073006b004200610072000000160032013200120700007e5c0e7420004143445365652042726f777365722e6c6e6b0000560009000400efbe7e5c0e747e5c0e742e0000008cf4010000008801000000000000000000000000000070dacb004100430044005300650065002000420072006f0077007300650072002e006c006e006b0000002200220000001e00efbe02005500730065007200500069006e006e006500640000002200120000002b00efbef56de80752c0dc012200860000001d00efbe02007b00370043003500410034003000450046002d0041003000460042002d0034004200460043002d0038003700340041002d004300300046003200450030004200390046004100380045007d005c00410043004400530065006500330032005c00410043004400530065006500330032002e00650078006500000022000000a20000001c000000010000001c0000003100000000000000a10000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c4143445365652042726f777365722e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8592e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8592e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000002f0300004c0000000114020000000000c00000000000004683008000200000005080440652c0dc015080440652c0dc01e91d420652c0dc017803000000000000010000000000000000000000000000009c013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0c7411005461736b42617200400009000400efbe7d5c00687e5c0c742e000000b8dd00000000bd010000000000000000000000000000b00b0b005400610073006b00420061007200000016000a013200780300007e5c0c74200043436c65616e65722e6c6e6b00004a0009000400efbe7e5c0c747e5c0c742e00000086f40100000085010000000000000000000000000000176e0d00430043006c00650061006e00650072002e006c006e006b0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00120000002b00efbe5080440652c0dc011c00700000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c00430043006c00650061006e0065007200200050006f0072007400610062006c0065005c00430043006c00650061006e0065007200360034002e0065007800650000001c0000009c0000001c000000010000001c00000031000000000000009b0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c43436c65616e65722e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8582e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8582e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000090300004c0000000114020000000000c000000000000046830080002000000090ff3fff51c0dc0190ff3fff51c0dc012b9d3dff51c0dc014f030000000000000100000000000000000000000000000078013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c077411005461736b42617200400009000400efbe7d5c00687e5c07742e000000b8dd00000000bd01000000000000000000000000000070ab19015400610073006b0042006100720000001600e60032004f0300007e5c077420004d50432d48432e6c6e6b0000460009000400efbe7e5c07747e5c07742e00000079f401000000a4010000000000000000000000000000d50d1c014d00500043002d00480043002e006c006e006b0000001a00220000001e00efbe02005500730065007200500069006e006e006500640000001a00120000002b00efbe90ff3fff51c0dc011a00520000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c004d00500043002d00480043005c006d00700063002d00680063002e0065007800650000001a0000009a0000001c000000010000001c0000003100000000000000990000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c4d50432d48432e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8552e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8552e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000005c0300004c0000000114020000000000c00000000000004683008000200000006fb18ff951c0dc016fb18ff951c0dc01094f8df951c0dc01d00300000000000001000000000000000000000000000000c6013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c027411005461736b42617200400009000400efbe7d5c00687e5c02742e000000b8dd00000000bd0100000000000000000000000000009118d4005400610073006b004200610072000000160034013200d00300007e5c0274200071426974746f7272656e742e6c6e6b00500009000400efbe7e5c02747e5c02742e00000074f40100000070010000000000000000000000000000f77ad600710042006900740074006f007200720065006e0074002e006c006e006b0000001e00220000001e00efbe02005500730065007200500069006e006e006500640000001e00120000002b00efbe6fb18ff951c0dc011e00920000001d00efbe02007b00360044003800300039003300370037002d0036004100460030002d0034003400340042002d0038003900350037002d004100330037003700330046003000320032003000300045007d005c00710042006900740074006f007200720065006e0074005c00710062006900740074006f007200720065006e0074002e0065007800650000001e0000009f0000001c000000010000001c00000031000000000000009e0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c71426974746f7272656e742e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8522e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8522e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000d80300004c0000000114020000000000c0000000000000468300800020000000d03b740952c0dc01d03b740952c0dc016fd9710952c0dc01d706000000000000010000000000000000000000000000002c023a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0f7411005461736b42617200400009000400efbe7d5c00687e5c0f742e000000b8dd00000000bd01000000000000000000000000000030d76e005400610073006b00420061007200000016009a013200d70600007e5c0f742000344b20566964656f20446f776e6c6f6164657220506c757320506f727461626c652e6c6e6b007c0009000400efbe7e5c0f747e5c0f742e00000090f401000000ad0100000000000000000000000000009139710034004b00200056006900640065006f00200044006f0077006e006c006f006100640065007200200050006c0075007300200050006f0072007400610062006c0065002e006c006e006b0000003400220000001e00efbe02005500730065007200500069006e006e006500640000003400120000002b00efbed03b740952c0dc013400b60000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0034004b00200056006900640065006f00200044006f0077006e006c006f006100640065007200200050006c0075007300200050006f0072007400610062006c0065005c0034004b0056006900640065006f0044006f0077006e006c006f00610064006500720050006c007500730050006f0072007400610062006c0065002e00650078006500000034000000b50000001c000000010000001c0000003100000000000000b40000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c344b20566964656f20446f776e6c6f6164657220506c757320506f727461626c652e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e85c2e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e85c2e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000004b0300004c0000000114020000000000c0000000000000468300800020000000457f72ed51c0dc01457f72ed51c0dc010090b3a399bedc013e0300000000000001000000000000000000000000000000b4013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5cf67311005461736b42617200400009000400efbe7d5c00687e5cf6732e000000b8dd00000000bd010000000000000000000000000000bb8805015400610073006b0042006100720000001600220132003e0300007c5c005020005748446f776e6c6f616465722e6c6e6b0000520009000400efbe7e5cf6737e5cf6732e000000db7c010000000d030000000000000000000000000000000000005700480044006f0077006e006c006f0061006400650072002e006c006e006b0000002000220000001e00efbe02005500730065007200500069006e006e006500640000002000120000002b00efbe457f72ed51c0dc0120007c0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0057004800200044006f0077006e006c006f006100640065007200200030002e0030002e0032002e0034005c005700480044006f0077006e006c006f0061006400650072002e00650078006500000020000000a00000001c000000010000001c00000031000000000000009f0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c5748446f776e6c6f616465722e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e84e2e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e84e2e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000960300004c0000000114020000000000c0000000000000468300800020000000f18ccafa51c0dc01f18ccafa51c0dc01f18ccafa51c0dc01a00300000000000001000000000000000000000000000000ea013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c037411005461736b42617200400009000400efbe7d5c00687e5c03742e000000b8dd00000000bd0100000000000000000000000000000f6aca005400610073006b004200610072000000160058013200a00300007e5c037420004f666669636520323031332d323032342043325220496e7374616c6c204c6974652e6c6e6b007c0009000400efbe7e5c03747e5c03742e00000075f4010000009f0100000000000000000000000000000f6aca004f0066006600690063006500200032003000310033002d0032003000320034002000430032005200200049006e007300740061006c006c0020004c006900740065002e006c006e006b0000003400220000001e00efbe02005500730065007200500069006e006e006500640000003400120000002b00efbe58efccfa51c0dc013400740000001d00efbe020047003a005c005f0044006f0077006e006c006f006100640073005c005f004f006600660069006300650032003000320031002d0032003000320034005c004f0049006e007300740061006c006c004c006900740065005f007800360034002e00650078006500000034000000b50000001c000000010000001c0000003100000000000000b40000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c4f666669636520323031332d323032342043325220496e7374616c6c204c6974652e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8532e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8532e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000450300004c0000000114020000000000c00000000000004683008000200000000ed9aa4374c2dc010ed9aa4374c2dc010ed9aa4374c2dc017e0300000000000001000000000000000000000000000000ac013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000c0d189adc1dc0100c0d189adc1dc0100c0d189adc1dc0114005600310000000000825c4a3d11005461736b42617200400009000400efbe815c0040825c4a3d2e000000b8dd00000000bd010000000000000000000000000000b47238005400610073006b00420061007200000016001a0132007e030000825c513d20005265736f757263652054756e65722e6c6e6b0000560009000400efbe825c513d825c513d2e00000018e400000000ac000000000000000000000000000000f2b719015200650073006f0075007200630065002000540075006e00650072002e006c006e006b0000002200220000001e00efbe02005500730065007200500069006e006e006500640000002200120000002b00efbe2a00ab4374c2dc0122006e0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c005200650073006f0075007200630065002000540075006e00650072005c004100700070005c00720065007300740075006e00650072002e00650078006500000022000000a20000001c000000010000001c0000003100000000000000a10000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c5265736f757263652054756e65722e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8ae4bc880ae2df1119a64309c23e102b6543878ea63a83449bb18a28722c157e8ae4bc880ae2df1119a64309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000320300004c0000000114020000000000c000000000000046830080002000000033044b0452c0dc0133044b0452c0dc01cea1480452c0dc017a03000000000000010000000000000000000000000000009e013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0b7411005461736b42617200400009000400efbe7d5c00687e5c0b742e000000b8dd00000000bd010000000000000000000000000000cd5ad3005400610073006b00420061007200000016000c0132007a0300007e5c0b7420004449534d5f546f6f6c2e6c6e6b004c0009000400efbe7e5c0b747e5c0b742e0000007df4010000008201000000000000000000000000000032bdd5004400490053004d005f0054006f006f006c002e006c006e006b0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00120000002b00efbe33044b0452c0dc011c00700000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c004400490053004d00200054006f006f006c00200050006f0072007400610062006c0065005c004400490053004d005f0054006f006f006c002e0065007800650000001c0000009d0000001c000000010000001c00000031000000000000009c0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c4449534d5f546f6f6c2e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8572e47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8572e47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000330300004c0000000114020000000000c00000000000004683008000200000008ac76b8353c0dc018ac76b8353c0dc01228f6a8353c0dc010a050000000000000100000000000000000000000000000092013a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc018408563952c0dc018408563952c0dc01140056003100000000007e5c627511005461736b42617200400009000400efbe7d5c00687e5c62752e000000b8dd00000000bd01000000000000000000000000000076045c005400610073006b0042006100720000001600000132000a0500007e5c62752000564d7761726520576f726b73746174696f6e2050726f2e6c6e6b0000660009000400efbe7e5c62757e5c62752e00000035c3010000008b010000000000000000000000000000de3c5d0056004d007700610072006500200057006f0072006b00730074006100740069006f006e002000500072006f002e006c006e006b0000002a00220000001e00efbe02005500730065007200500069006e006e006500640000002a00120000002b00efbe688b6c8353c0dc012a003c0000001d00efbe020056004d0077006100720065002e0057006f0072006b00730074006100740069006f006e002e0076006d007500690000002a000000aa0000001c000000010000001c0000003100000000000000a90000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c564d7761726520576f726b73746174696f6e2050726f2e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8882f47d5442cf1119a63309c23e102b6543878ea63a83449bb18a28722c157e8882f47d5442cf1119a63309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b3960000000000000000000000006f0600004c0000000114020000000000c000000000000046830080002000000095ac17a17cc7dc018f3319a17cc7dc018f3319a17cc7dc01990900000000000001000000000000000000000000000000bc043a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe100000000010628481c7dc010010628481c7dc010010628481c7dc011400820074001c00434653461600310000000000885c0090120041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe885c0090885c00902e000000b89e0100000002000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000885c00901000526f616d696e6700400009000400efbe885c0090885c00902e000000b99e01000000020000000000000000000000000000000000000052006f0061006d0069006e006700000016005c00310000000000885c009014004d6963726f736f667400440009000400efbe885c0090885c00902e000000ba9e0100000002000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000885c00901000496e7465726e6574204578706c6f72657200540009000400efbe885c0090885c00902e000000c89e01000000020000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f007200650072000000200066003100000000007e5cd1731004517569636b204c61756e636800004a0009000400efbe7e5cd1737e5cd1732e000000790300000000030000000000030000a00000000000005715d60051007500690063006b0020004c00610075006e006300680000001c006200310000000000885c00901300557365722050696e6e656400480009000400efbe885c0090885c00902e00000043da00000000360100000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e00310000000000885c218b1000496d706c6963697441707053686f72746375747300005a0009000400efbe885c0090885c218b2e000000fedb00000000d8000000000000000000000000000000d19ac90049006d0070006c006900630069007400410070007000530068006f00720074006300750074007300000024007200310000000000885c218b1000613665326465326531303566666466310000520009000400efbe885c218b885c218b2e000000711d000000008d000000000000000000000000000000d19ac9006100360065003200640065003200650031003000350066006600640066003100000020002001320099090000885c218b2000416c6563614672616d652e6c6e6b00004e0009000400efbe885c218b885c218b2e000000867701000000ec0100000000000000000000000000007177c70041006c006500630061004600720061006d0065002e006c006e006b0000001e00220000001e00efbe02005500730065007200500069006e006e006500640000001e00120000002b00efbec2c7cba17cc7dc011e00800000001d00efbe02006f0076006500720077006f006c0066002e00610066006d00630061006700620070006700670067006b00700064006b006f006b006a0068006a006b006c006c007000650067006e00610064006d006b00690067006e006c006f006e0070006a006d002e007400610073006b0062006100720000001e000000bc0000001c000000010000001c0000003100000000000000bb0000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c496d706c6963697441707053686f7274637574735c613665326465326531303566666466315c416c6563614672616d652e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8edd76d93a532f1119a66309c23e102b6543878ea63a83449bb18a28722c157e8edd76d93a532f1119a66309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000280600004c0000000114020000000000c0000000000000468300800020000000f3fc9106c9d4dc018a02f00fc9d4dc018a02f00fc9d4dc014a07000000000000010000000000000000000000000000007a043a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe100000000018baa225d2dc010018baa225d2dc010018baa225d2dc011400820074001c0043465346160031000000000000000000100041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000000000001000526f616d696e6700400009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000052006f0061006d0069006e006700000016005c003100000000000000000010004d6963726f736f667400440009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000000000001000496e7465726e6574204578706c6f72657200540009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f00720065007200000020006600310000000000000000001000517569636b204c61756e636800004a0009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000051007500690063006b0020004c00610075006e006300680000001c006200310000000000000000001200557365722050696e6e656400480009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e00310000000000965c00381000496d706c6963697441707053686f72746375747300005a0009000400efbe965c0038965c00382e000000fedb00000000d80000000000000000000000000000000000000049006d0070006c006900630069007400410070007000530068006f00720074006300750074007300000024007200310000000000995c537c1000323763666265633365623233353733630000520009000400efbe965c0038995c537c2e000000617e01000000ae0100000000000000000000000000000d3e1e00320037006300660062006500630033006500620032003300350037003300630000002000de0032004a070000995c5b7c200042726176652e6c6e6b00440009000400efbe995c537c995c5b7c2e000000192e00000000d001000000000000000000000000000076a04900420072006100760065002e006c006e006b0000001800220000001e00efbe02005500730065007200500069006e006e006500640000001800120000002b00efbebeeb7c13c9d4dc0118004e0000001d00efbe0200420072006100760065002e00340046004f005a004f00540055005600570041005a003600500056004b0035005000340036005200570051004d00360047004d00000018000000b70000001c000000010000001c0000003100000000000000b60000001500000003000000cda7977e100000004d61696e00433a5c55736572735c5365727665725c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c496d706c6963697441707053686f7274637574735c323763666265633365623233353733635c42726176652e6c6e6b000060000000030000a058000000000000007365727665722d706300000000000000543878ea63a83449bb18a28722c157e8b46bfd8f103ff1119a6a309c23e102b6543878ea63a83449bb18a28722c157e8b46bfd8f103ff1119a6a309c23e102b645000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d000000680000000048000000f3725387252b6b4e9ee862464a24b396000000000000000000000000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00a40100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc018408563952c0dc018408563952c0dc01140056003100000000007e5c327511005461736b42617200400009000400efbe7d5c00687e5c32752e000000b8dd00000000bd01000000000000000000000000000095e0ba005400610073006b00420061007200000016001201320097010000874f0749200046696c65204578706c6f7265722e6c6e6b007c0009000400efbe7e5c32757e5c32752e00000022c30100000079010000000000000000520000000000589c4400460069006c00650020004500780070006c006f007200650072002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000002000120000002b00efbe1c419a4e53c0dc012000420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000002000220000001e00efbe02005500730065007200500069006e006e006500640000002000000000540100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c087411005461736b42617200400009000400efbe7d5c00687e5c08742e000000b8dd00000000bd010000000000000000000000000000f01104015400610073006b0042006100720000001600c20032005b0800007e5c08742000476f6f676c65204368726f6d652e6c6e6b00540009000400efbe7e5c08747e5c08742e0000007bf40100000085010000000000000000000000000000f011040147006f006f0067006c00650020004300680072006f006d0065002e006c006e006b0000002000120000002b00efbe7328890052c0dc0120001a0000001d00efbe02004300680072006f006d00650000002000220000001e00efbe02005500730065007200500069006e006e0065006400000020000000008a0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5cfd7311005461736b42617200400009000400efbe7d5c00687e5cfd732e000000b8dd00000000bd010000000000000000000000000000e56b72005400610073006b0042006100720000001600f8003200720500007e5cfd732000544f54414c434d442e6c6e6b00004a0009000400efbe7e5cfd737e5cfd732e000000fbc201000000800100000000000000000000000000004cce740054004f00540041004c0043004d0044002e006c006e006b0000001c00120000002b00efbe1bd75df651c0dc011c005e0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0054006f00740061006c0043004d0044005c0054004f00540041004c0043004d004400360034002e0045005800450000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c000000008a0400003a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe10000000008021435ec0dc01008021435ec0dc01008021435ec0dc011400820074001c0043465346160031000000000000000000100041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000000000001000526f616d696e6700400009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000052006f0061006d0069006e006700000016005c003100000000000000000010004d6963726f736f667400440009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000000000001000496e7465726e6574204578706c6f72657200540009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f00720065007200000020006600310000000000000000001000517569636b204c61756e636800004a0009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000051007500690063006b0020004c00610075006e006300680000001c006200310000000000000000001200557365722050696e6e656400480009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e003100000000007f5c61491000496d706c6963697441707053686f72746375747300005a0009000400efbe7e5c00807f5c61492e000000fedb00000000d800000000000000000000000000000025b90b0149006d0070006c006900630069007400410070007000530068006f007200740063007500740073000000240072003100000000007f5c61491000356337346432666161383361613630340000520009000400efbe7f5c61497f5c61492e0000004d1c0000000085010000000000000000000000000000c41c0b01350063003700340064003200660061006100380033006100610036003000340000002000ee0032004e0700007f5c694920004368726f6d69756d2e6c6e6b00004a0009000400efbe7f5c61497f5c69492e000000808501000000df0100000000000000000000000000009e0c33004300680072006f006d00690075006d002e006c006e006b0000001c00120000002b00efbebfa33cd7f0c0dc011c00540000001d00efbe02004300680072006f006d00690075006d002e00340046004f005a004f00540055005600570041005a003600500056004b0035005000340036005200570051004d00360047004d0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00000000c40100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0e7411005461736b42617200400009000400efbe7d5c00687e5c0e742e000000b8dd00000000bd0100000000000000000000000000000b78c9005400610073006b004200610072000000160032013200120700007e5c0e7420004143445365652042726f777365722e6c6e6b0000560009000400efbe7e5c0e747e5c0e742e0000008cf4010000008801000000000000000000000000000070dacb004100430044005300650065002000420072006f0077007300650072002e006c006e006b0000002200120000002b00efbef56de80752c0dc012200860000001d00efbe02007b00370043003500410034003000450046002d0041003000460042002d0034004200460043002d0038003700340041002d004300300046003200450030004200390046004100380045007d005c00410043004400530065006500330032005c00410043004400530065006500330032002e0065007800650000002200220000001e00efbe02005500730065007200500069006e006e0065006400000022000000009c0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0c7411005461736b42617200400009000400efbe7d5c00687e5c0c742e000000b8dd00000000bd010000000000000000000000000000b00b0b005400610073006b00420061007200000016000a013200780300007e5c0c74200043436c65616e65722e6c6e6b00004a0009000400efbe7e5c0c747e5c0c742e00000086f40100000085010000000000000000000000000000176e0d00430043006c00650061006e00650072002e006c006e006b0000001c00120000002b00efbe5080440652c0dc011c00700000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c00430043006c00650061006e0065007200200050006f0072007400610062006c0065005c00430043006c00650061006e0065007200360034002e0065007800650000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00000000780100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c077411005461736b42617200400009000400efbe7d5c00687e5c07742e000000b8dd00000000bd01000000000000000000000000000070ab19015400610073006b0042006100720000001600e60032004f0300007e5c077420004d50432d48432e6c6e6b0000460009000400efbe7e5c07747e5c07742e00000079f401000000a4010000000000000000000000000000d50d1c014d00500043002d00480043002e006c006e006b0000001a00120000002b00efbe90ff3fff51c0dc011a00520000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c004d00500043002d00480043005c006d00700063002d00680063002e0065007800650000001a00220000001e00efbe02005500730065007200500069006e006e006500640000001a00000000c60100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c027411005461736b42617200400009000400efbe7d5c00687e5c02742e000000b8dd00000000bd0100000000000000000000000000009118d4005400610073006b004200610072000000160034013200d00300007e5c0274200071426974746f7272656e742e6c6e6b00500009000400efbe7e5c02747e5c02742e00000074f40100000070010000000000000000000000000000f77ad600710042006900740074006f007200720065006e0074002e006c006e006b0000001e00120000002b00efbe6fb18ff951c0dc011e00920000001d00efbe02007b00360044003800300039003300370037002d0036004100460030002d0034003400340042002d0038003900350037002d004100330037003700330046003000320032003000300045007d005c00710042006900740074006f007200720065006e0074005c00710062006900740074006f007200720065006e0074002e0065007800650000001e00220000001e00efbe02005500730065007200500069006e006e006500640000001e000000002c0200003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0f7411005461736b42617200400009000400efbe7d5c00687e5c0f742e000000b8dd00000000bd01000000000000000000000000000030d76e005400610073006b00420061007200000016009a013200d70600007e5c0f742000344b20566964656f20446f776e6c6f6164657220506c757320506f727461626c652e6c6e6b007c0009000400efbe7e5c0f747e5c0f742e00000090f401000000ad0100000000000000000000000000009139710034004b00200056006900640065006f00200044006f0077006e006c006f006100640065007200200050006c0075007300200050006f0072007400610062006c0065002e006c006e006b0000003400120000002b00efbed03b740952c0dc013400b60000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0034004b00200056006900640065006f00200044006f0077006e006c006f006100640065007200200050006c0075007300200050006f0072007400610062006c0065005c0034004b0056006900640065006f0044006f0077006e006c006f00610064006500720050006c007500730050006f0072007400610062006c0065002e0065007800650000003400220000001e00efbe02005500730065007200500069006e006e006500640000003400000000b40100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5cf67311005461736b42617200400009000400efbe7d5c00687e5cf6732e000000b8dd00000000bd010000000000000000000000000000bb8805015400610073006b0042006100720000001600220132003e0300007c5c005020005748446f776e6c6f616465722e6c6e6b0000520009000400efbe7e5cf6737e5cf6732e000000db7c010000000d030000000000000000000000000000000000005700480044006f0077006e006c006f0061006400650072002e006c006e006b0000002000120000002b00efbe457f72ed51c0dc0120007c0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c0057004800200044006f0077006e006c006f006100640065007200200030002e0030002e0032002e0034005c005700480044006f0077006e006c006f0061006400650072002e0065007800650000002000220000001e00efbe02005500730065007200500069006e006e006500640000002000000000ea0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c037411005461736b42617200400009000400efbe7d5c00687e5c03742e000000b8dd00000000bd0100000000000000000000000000000f6aca005400610073006b004200610072000000160058013200a00300007e5c037420004f666669636520323031332d323032342043325220496e7374616c6c204c6974652e6c6e6b007c0009000400efbe7e5c03747e5c03742e00000075f4010000009f0100000000000000000000000000000f6aca004f0066006600690063006500200032003000310033002d0032003000320034002000430032005200200049006e007300740061006c006c0020004c006900740065002e006c006e006b0000003400120000002b00efbe58efccfa51c0dc013400740000001d00efbe020047003a005c005f0044006f0077006e006c006f006100640073005c005f004f006600660069006300650032003000320031002d0032003000320034005c004f0049006e007300740061006c006c004c006900740065005f007800360034002e0065007800650000003400220000001e00efbe02005500730065007200500069006e006e006500640000003400000000ac0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000c0d189adc1dc0100c0d189adc1dc0100c0d189adc1dc0114005600310000000000825c4a3d11005461736b42617200400009000400efbe815c0040825c4a3d2e000000b8dd00000000bd010000000000000000000000000000b47238005400610073006b00420061007200000016001a0132007e030000825c513d20005265736f757263652054756e65722e6c6e6b0000560009000400efbe825c513d825c513d2e00000018e400000000ac000000000000000000000000000000f2b719015200650073006f0075007200630065002000540075006e00650072002e006c006e006b0000002200120000002b00efbe2a00ab4374c2dc0122006e0000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c005200650073006f0075007200630065002000540075006e00650072005c004100700070005c00720065007300740075006e00650072002e0065007800650000002200220000001e00efbe02005500730065007200500069006e006e0065006400000022000000009e0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc01aeb038e851c0dc01aeb038e851c0dc01140056003100000000007e5c0b7411005461736b42617200400009000400efbe7d5c00687e5c0b742e000000b8dd00000000bd010000000000000000000000000000cd5ad3005400610073006b00420061007200000016000c0132007a0300007e5c0b7420004449534d5f546f6f6c2e6c6e6b004c0009000400efbe7e5c0b747e5c0b742e0000007df4010000008201000000000000000000000000000032bdd5004400490053004d005f0054006f006f006c002e006c006e006b0000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00120000002b00efbe33044b0452c0dc011c00700000001d00efbe020047003a005c004100700070007300200050006f0072007400610062006c0065005c004400490053004d00200054006f006f006c00200050006f0072007400610062006c0065005c004400490053004d005f0054006f006f006c002e0065007800650000001c00000000920100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1300000000886af37bbfdc018408563952c0dc018408563952c0dc01140056003100000000007e5c627511005461736b42617200400009000400efbe7d5c00687e5c62752e000000b8dd00000000bd01000000000000000000000000000076045c005400610073006b0042006100720000001600000132000a0500007e5c62752000564d7761726520576f726b73746174696f6e2050726f2e6c6e6b0000660009000400efbe7e5c62757e5c62752e00000035c3010000008b010000000000000000000000000000de3c5d0056004d007700610072006500200057006f0072006b00730074006100740069006f006e002000500072006f002e006c006e006b0000002a00120000002b00efbe688b6c8353c0dc012a003c0000001d00efbe020056004d0077006100720065002e0057006f0072006b00730074006100740069006f006e002e0076006d007500690000002a00220000001e00efbe02005500730065007200500069006e006e006500640000002a00000000bc0400003a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe100000000010628481c7dc010010628481c7dc010010628481c7dc011400820074001c00434653461600310000000000885c0090120041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe885c0090885c00902e000000b89e0100000002000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000885c00901000526f616d696e6700400009000400efbe885c0090885c00902e000000b99e01000000020000000000000000000000000000000000000052006f0061006d0069006e006700000016005c00310000000000885c009014004d6963726f736f667400440009000400efbe885c0090885c00902e000000ba9e0100000002000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000885c00901000496e7465726e6574204578706c6f72657200540009000400efbe885c0090885c00902e000000c89e01000000020000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f007200650072000000200066003100000000007e5cd1731004517569636b204c61756e636800004a0009000400efbe7e5cd1737e5cd1732e000000790300000000030000000000030000a00000000000005715d60051007500690063006b0020004c00610075006e006300680000001c006200310000000000885c00901300557365722050696e6e656400480009000400efbe885c0090885c00902e00000043da00000000360100000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e00310000000000885c218b1000496d706c6963697441707053686f72746375747300005a0009000400efbe885c0090885c218b2e000000fedb00000000d8000000000000000000000000000000d19ac90049006d0070006c006900630069007400410070007000530068006f00720074006300750074007300000024007200310000000000885c218b1000613665326465326531303566666466310000520009000400efbe885c218b885c218b2e000000711d000000008d000000000000000000000000000000d19ac9006100360065003200640065003200650031003000350066006600640066003100000020002001320099090000885c218b2000416c6563614672616d652e6c6e6b00004e0009000400efbe885c218b885c218b2e000000867701000000ec0100000000000000000000000000007177c70041006c006500630061004600720061006d0065002e006c006e006b0000001e00120000002b00efbec2c7cba17cc7dc011e00800000001d00efbe02006f0076006500720077006f006c0066002e00610066006d00630061006700620070006700670067006b00700064006b006f006b006a0068006a006b006c006c007000650067006e00610064006d006b00690067006e006c006f006e0070006a006d002e007400610073006b0062006100720000001e00220000001e00efbe02005500730065007200500069006e006e006500640000001e000000007a0400003a001f44471a0359723fa74489c55595fe6b30ee260001002600efbe100000000018baa225d2dc010018baa225d2dc010018baa225d2dc011400820074001c0043465346160031000000000000000000100041707044617461000000741a595e96dfd3488d671733bcee28bac5cdfadf9f6756418947c5c76bc0b67f400009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004100700070004400610074006100000042005600310000000000000000001000526f616d696e6700400009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000052006f0061006d0069006e006700000016005c003100000000000000000010004d6963726f736f667400440009000400efbe00000000000000002e00000000000000000000000000000000000000000000000000000000004d006900630072006f0073006f0066007400000018007400310000000000000000001000496e7465726e6574204578706c6f72657200540009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000049006e007400650072006e006500740020004500780070006c006f00720065007200000020006600310000000000000000001000517569636b204c61756e636800004a0009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000051007500690063006b0020004c00610075006e006300680000001c006200310000000000000000001200557365722050696e6e656400480009000400efbe00000000000000002e000000000000000000000000000000000000000000000000000000000055007300650072002000500069006e006e006500640000001a007e00310000000000965c00381000496d706c6963697441707053686f72746375747300005a0009000400efbe965c0038965c00382e000000fedb00000000d80000000000000000000000000000000000000049006d0070006c006900630069007400410070007000530068006f00720074006300750074007300000024007200310000000000995c537c1000323763666265633365623233353733630000520009000400efbe965c0038995c537c2e000000617e01000000ae0100000000000000000000000000000d3e1e00320037006300660062006500630033006500620032003300350037003300630000002000de0032004a070000995c5b7c200042726176652e6c6e6b00440009000400efbe995c537c995c5b7c2e000000192e00000000d001000000000000000000000000000076a04900420072006100760065002e006c006e006b0000001800120000002b00efbebeeb7c13c9d4dc0118004e0000001d00efbe0200420072006100760065002e00340046004f005a004f00540055005600570041005a003600500056004b0035005000340036005200570051004d00360047004d0000001800220000001e00efbe02005500730065007200500069006e006e0065006400000018000000ff" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesRemovedChanges" /t REG_DWORD /d "7" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins" /v "MailPin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins" /v "CopilotPWAPin" /t REG_DWORD /d "1" /f

::Desktop_Restore_Settings

Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440" /v "Version" /t REG_DWORD /d "858673732" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0001" /v "XCoord" /t REG_DWORD /d "1813" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0001" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0001" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0001" /v "Name" /t REG_SZ /d "Morphs_Pause_Update_14-10-3000" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0001" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Pause_Update_14-10-3000.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0002" /v "XCoord" /t REG_DWORD /d "1888" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0002" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0002" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0002" /v "Name" /t REG_SZ /d "Morphs_Update_Repair" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0002" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Update_Repair.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0003" /v "XCoord" /t REG_DWORD /d "1888" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0003" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0003" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0003" /v "Name" /t REG_SZ /d "chatgpt_Template" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0003" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\chatgpt_Template.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0004" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0004" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0004" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0004" /v "Name" /t REG_SZ /d "Morphs_Cleaning_WinSXS" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0004" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Cleaning_WinSXS.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0005" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0005" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0005" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0005" /v "Name" /t REG_SZ /d "cover letter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0005" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\cover letter.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0006" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0006" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0006" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0006" /v "Name" /t REG_SZ /d "Daily updated apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0006" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Daily updated apps.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0007" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0007" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0007" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0007" /v "Name" /t REG_SZ /d "This PC" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0007" /v "Path" /t REG_SZ /d "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0008" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0008" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0008" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0008" /v "Name" /t REG_SZ /d "ScreenHunterProPortableAdmin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0008" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunterProPortableAdmin.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0009" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0009" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0009" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0009" /v "Name" /t REG_SZ /d "FullApps_ " /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0009" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FullApps_ .lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0010" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0010" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0010" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0010" /v "Name" /t REG_SZ /d "Recycle Bin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0010" /v "Path" /t REG_SZ /d "::{645FF040-5081-101B-9F08-00AA002F954E}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0011" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0011" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0011" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0011" /v "Name" /t REG_SZ /d "AOMEI Backupper Tech Plus 8.0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0011" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AOMEI Backupper Tech Plus 8.0.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0012" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0012" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0012" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0012" /v "Name" /t REG_SZ /d "Morphs_Dragons_Dark" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0012" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Dark.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0013" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0013" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0013" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0013" /v "Name" /t REG_SZ /d "Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0013" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0014" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0014" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0014" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0014" /v "Name" /t REG_SZ /d "Vista Shortcut Manager" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0014" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Vista Shortcut Manager.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0015" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0015" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0015" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0015" /v "Name" /t REG_SZ /d "Morphs_Dragons_Light" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0015" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Light.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0016" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0016" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0016" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0016" /v "Name" /t REG_SZ /d "Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0016" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0017" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0017" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0017" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0017" /v "Name" /t REG_SZ /d "OODefrag Portable" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0017" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\OODefrag Portable.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0018" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0018" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0018" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0018" /v "Name" /t REG_SZ /d "DraquaVape Flavours" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0018" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\DraquaVape Flavours.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0019" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0019" /v "YCoord" /t REG_DWORD /d "305" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0019" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0019" /v "Name" /t REG_SZ /d "CACHE" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0019" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\CACHE.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0020" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0020" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0020" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0020" /v "Name" /t REG_SZ /d "ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0020" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0021" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0021" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0021" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0021" /v "Name" /t REG_SZ /d "Warframe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0021" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Warframe.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0022" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0022" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0022" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0022" /v "Name" /t REG_SZ /d "Emby Server" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0022" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Emby Server.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0023" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0023" /v "YCoord" /t REG_DWORD /d "305" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0023" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0023" /v "Name" /t REG_SZ /d "FanControl" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0023" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FanControl.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0024" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0024" /v "YCoord" /t REG_DWORD /d "406" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0024" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0024" /v "Name" /t REG_SZ /d "samegame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0024" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\samegame.exe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0025" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0025" /v "YCoord" /t REG_DWORD /d "507" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0025" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0025" /v "Name" /t REG_SZ /d "AlecaFrame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0025" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AlecaFrame.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0026" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0026" /v "YCoord" /t REG_DWORD /d "709" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0026" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0026" /v "Name" /t REG_SZ /d "Monthly Payments" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0026" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Monthly Payments.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0027" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0027" /v "YCoord" /t REG_DWORD /d "810" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0027" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0027" /v "Name" /t REG_SZ /d "TV Series" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440\Icon0027" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\TV Series.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server" /v "Version" /t REG_DWORD /d "858673732" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0001" /v "XCoord" /t REG_DWORD /d "1813" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0001" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0001" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0001" /v "Name" /t REG_SZ /d "Morphs_Pause_Update_14-10-3000" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0001" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Pause_Update_14-10-3000.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0002" /v "XCoord" /t REG_DWORD /d "1888" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0002" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0002" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0002" /v "Name" /t REG_SZ /d "Morphs_Update_Repair" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0002" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Update_Repair.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0003" /v "XCoord" /t REG_DWORD /d "1888" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0003" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0003" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0003" /v "Name" /t REG_SZ /d "chatgpt_Template" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0003" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\chatgpt_Template.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0004" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0004" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0004" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0004" /v "Name" /t REG_SZ /d "Morphs_Cleaning_WinSXS" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0004" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Cleaning_WinSXS.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0005" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0005" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0005" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0005" /v "Name" /t REG_SZ /d "cover letter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0005" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\cover letter.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0006" /v "XCoord" /t REG_DWORD /d "1963" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0006" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0006" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0006" /v "Name" /t REG_SZ /d "Daily updated apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0006" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Daily updated apps.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0007" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0007" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0007" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0007" /v "Name" /t REG_SZ /d "This PC" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0007" /v "Path" /t REG_SZ /d "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0008" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0008" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0008" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0008" /v "Name" /t REG_SZ /d "ScreenHunterProPortableAdmin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0008" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunterProPortableAdmin.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0009" /v "XCoord" /t REG_DWORD /d "2038" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0009" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0009" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0009" /v "Name" /t REG_SZ /d "FullApps_ " /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0009" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FullApps_ .lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0010" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0010" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0010" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0010" /v "Name" /t REG_SZ /d "Recycle Bin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0010" /v "Path" /t REG_SZ /d "::{645FF040-5081-101B-9F08-00AA002F954E}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0011" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0011" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0011" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0011" /v "Name" /t REG_SZ /d "AOMEI Backupper Tech Plus 8.0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0011" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AOMEI Backupper Tech Plus 8.0.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0012" /v "XCoord" /t REG_DWORD /d "2113" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0012" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0012" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0012" /v "Name" /t REG_SZ /d "Morphs_Dragons_Dark" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0012" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Dark.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0013" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0013" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0013" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0013" /v "Name" /t REG_SZ /d "Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0013" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0014" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0014" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0014" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0014" /v "Name" /t REG_SZ /d "Vista Shortcut Manager" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0014" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Vista Shortcut Manager.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0015" /v "XCoord" /t REG_DWORD /d "2188" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0015" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0015" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0015" /v "Name" /t REG_SZ /d "Morphs_Dragons_Light" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0015" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Light.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0016" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0016" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0016" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0016" /v "Name" /t REG_SZ /d "Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0016" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0017" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0017" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0017" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0017" /v "Name" /t REG_SZ /d "OODefrag Portable" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0017" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\OODefrag Portable.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0018" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0018" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0018" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0018" /v "Name" /t REG_SZ /d "DraquaVape Flavours" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0018" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\DraquaVape Flavours.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0019" /v "XCoord" /t REG_DWORD /d "2263" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0019" /v "YCoord" /t REG_DWORD /d "305" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0019" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0019" /v "Name" /t REG_SZ /d "CACHE" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0019" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\CACHE.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0020" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0020" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0020" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0020" /v "Name" /t REG_SZ /d "ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0020" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0021" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0021" /v "YCoord" /t REG_DWORD /d "103" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0021" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0021" /v "Name" /t REG_SZ /d "Warframe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0021" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Warframe.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0022" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0022" /v "YCoord" /t REG_DWORD /d "204" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0022" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0022" /v "Name" /t REG_SZ /d "Emby Server" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0022" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Emby Server.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0023" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0023" /v "YCoord" /t REG_DWORD /d "305" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0023" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0023" /v "Name" /t REG_SZ /d "FanControl" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0023" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FanControl.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0024" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0024" /v "YCoord" /t REG_DWORD /d "406" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0024" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0024" /v "Name" /t REG_SZ /d "samegame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0024" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\samegame.exe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0025" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0025" /v "YCoord" /t REG_DWORD /d "507" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0025" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0025" /v "Name" /t REG_SZ /d "AlecaFrame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0025" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AlecaFrame.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0026" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0026" /v "YCoord" /t REG_DWORD /d "709" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0026" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0026" /v "Name" /t REG_SZ /d "Monthly Payments" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0026" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Monthly Payments.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0027" /v "XCoord" /t REG_DWORD /d "2338" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0027" /v "YCoord" /t REG_DWORD /d "810" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0027" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0027" /v "Name" /t REG_SZ /d "TV Series" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 2560 x 1440_Server\Icon0027" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\TV Series.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160" /v "Version" /t REG_DWORD /d "858673732" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0001" /v "XCoord" /t REG_DWORD /d "2867" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0001" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0001" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0001" /v "Name" /t REG_SZ /d "Morphs_Pause_Update_14-10-3000" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0001" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Pause_Update_14-10-3000.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0002" /v "XCoord" /t REG_DWORD /d "2962" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0002" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0002" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0002" /v "Name" /t REG_SZ /d "Morphs_Update_Repair" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0002" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Update_Repair.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0003" /v "XCoord" /t REG_DWORD /d "2962" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0003" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0003" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0003" /v "Name" /t REG_SZ /d "chatgpt_Template" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0003" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\chatgpt_Template.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0004" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0004" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0004" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0004" /v "Name" /t REG_SZ /d "Morphs_Cleaning_WinSXS" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0004" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Cleaning_WinSXS.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0005" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0005" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0005" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0005" /v "Name" /t REG_SZ /d "cover letter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0005" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\cover letter.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0006" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0006" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0006" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0006" /v "Name" /t REG_SZ /d "Daily updated apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0006" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Daily updated apps.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0007" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0007" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0007" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0007" /v "Name" /t REG_SZ /d "This PC" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0007" /v "Path" /t REG_SZ /d "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0008" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0008" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0008" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0008" /v "Name" /t REG_SZ /d "ScreenHunterProPortableAdmin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0008" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunterProPortableAdmin.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0009" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0009" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0009" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0009" /v "Name" /t REG_SZ /d "FullApps_ " /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0009" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FullApps_ .lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0010" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0010" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0010" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0010" /v "Name" /t REG_SZ /d "Recycle Bin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0010" /v "Path" /t REG_SZ /d "::{645FF040-5081-101B-9F08-00AA002F954E}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0011" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0011" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0011" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0011" /v "Name" /t REG_SZ /d "AOMEI Backupper Tech Plus 8.0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0011" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AOMEI Backupper Tech Plus 8.0.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0012" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0012" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0012" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0012" /v "Name" /t REG_SZ /d "Morphs_Dragons_Dark" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0012" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Dark.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0013" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0013" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0013" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0013" /v "Name" /t REG_SZ /d "Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0013" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0014" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0014" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0014" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0014" /v "Name" /t REG_SZ /d "Vista Shortcut Manager" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0014" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Vista Shortcut Manager.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0015" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0015" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0015" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0015" /v "Name" /t REG_SZ /d "Morphs_Dragons_Light" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0015" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Light.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0016" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0016" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0016" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0016" /v "Name" /t REG_SZ /d "Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0016" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0017" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0017" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0017" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0017" /v "Name" /t REG_SZ /d "OODefrag Portable" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0017" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\OODefrag Portable.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0018" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0018" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0018" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0018" /v "Name" /t REG_SZ /d "DraquaVape Flavours" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0018" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\DraquaVape Flavours.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0019" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0019" /v "YCoord" /t REG_DWORD /d "377" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0019" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0019" /v "Name" /t REG_SZ /d "CACHE" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0019" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\CACHE.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0020" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0020" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0020" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0020" /v "Name" /t REG_SZ /d "ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0020" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0021" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0021" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0021" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0021" /v "Name" /t REG_SZ /d "Warframe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0021" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Warframe.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0022" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0022" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0022" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0022" /v "Name" /t REG_SZ /d "Emby Server" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0022" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Emby Server.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0023" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0023" /v "YCoord" /t REG_DWORD /d "377" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0023" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0023" /v "Name" /t REG_SZ /d "FanControl" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0023" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FanControl.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0024" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0024" /v "YCoord" /t REG_DWORD /d "502" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0024" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0024" /v "Name" /t REG_SZ /d "samegame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0024" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\samegame.exe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0025" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0025" /v "YCoord" /t REG_DWORD /d "627" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0025" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0025" /v "Name" /t REG_SZ /d "AlecaFrame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0025" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AlecaFrame.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0026" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0026" /v "YCoord" /t REG_DWORD /d "1127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0026" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0026" /v "Name" /t REG_SZ /d "Monthly Payments" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0026" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Monthly Payments.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0027" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0027" /v "YCoord" /t REG_DWORD /d "1252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0027" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0027" /v "Name" /t REG_SZ /d "TV Series" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160\Icon0027" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\TV Series.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server" /v "Version" /t REG_DWORD /d "858673732" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0001" /v "XCoord" /t REG_DWORD /d "2867" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0001" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0001" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0001" /v "Name" /t REG_SZ /d "Morphs_Pause_Update_14-10-3000" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0001" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Pause_Update_14-10-3000.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0002" /v "XCoord" /t REG_DWORD /d "2962" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0002" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0002" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0002" /v "Name" /t REG_SZ /d "Morphs_Update_Repair" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0002" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Update_Repair.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0003" /v "XCoord" /t REG_DWORD /d "2962" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0003" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0003" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0003" /v "Name" /t REG_SZ /d "chatgpt_Template" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0003" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\chatgpt_Template.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0004" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0004" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0004" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0004" /v "Name" /t REG_SZ /d "Morphs_Cleaning_WinSXS" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0004" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Cleaning_WinSXS.cmd" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0005" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0005" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0005" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0005" /v "Name" /t REG_SZ /d "cover letter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0005" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\cover letter.txt" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0006" /v "XCoord" /t REG_DWORD /d "3057" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0006" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0006" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0006" /v "Name" /t REG_SZ /d "Daily updated apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0006" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Daily updated apps.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0007" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0007" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0007" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0007" /v "Name" /t REG_SZ /d "This PC" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0007" /v "Path" /t REG_SZ /d "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0008" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0008" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0008" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0008" /v "Name" /t REG_SZ /d "ScreenHunterProPortableAdmin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0008" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunterProPortableAdmin.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0009" /v "XCoord" /t REG_DWORD /d "3152" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0009" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0009" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0009" /v "Name" /t REG_SZ /d "FullApps_ " /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0009" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FullApps_ .lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0010" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0010" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0010" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0010" /v "Name" /t REG_SZ /d "Recycle Bin" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0010" /v "Path" /t REG_SZ /d "::{645FF040-5081-101B-9F08-00AA002F954E}" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0011" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0011" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0011" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0011" /v "Name" /t REG_SZ /d "AOMEI Backupper Tech Plus 8.0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0011" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AOMEI Backupper Tech Plus 8.0.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0012" /v "XCoord" /t REG_DWORD /d "3247" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0012" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0012" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0012" /v "Name" /t REG_SZ /d "Morphs_Dragons_Dark" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0012" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Dark.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0013" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0013" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0013" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0013" /v "Name" /t REG_SZ /d "Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0013" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Backup" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0014" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0014" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0014" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0014" /v "Name" /t REG_SZ /d "Vista Shortcut Manager" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0014" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Vista Shortcut Manager.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0015" /v "XCoord" /t REG_DWORD /d "3342" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0015" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0015" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0015" /v "Name" /t REG_SZ /d "Morphs_Dragons_Light" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0015" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Morphs_Dragons_Light.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0016" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0016" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0016" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0016" /v "Name" /t REG_SZ /d "Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0016" /v "Path" /t REG_SZ /d "C:\Users\Public\Desktop\Morphs_Desktop_Apps" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0017" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0017" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0017" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0017" /v "Name" /t REG_SZ /d "OODefrag Portable" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0017" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\OODefrag Portable.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0018" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0018" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0018" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0018" /v "Name" /t REG_SZ /d "DraquaVape Flavours" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0018" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\DraquaVape Flavours.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0019" /v "XCoord" /t REG_DWORD /d "3437" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0019" /v "YCoord" /t REG_DWORD /d "377" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0019" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0019" /v "Name" /t REG_SZ /d "CACHE" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0019" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\CACHE.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0020" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0020" /v "YCoord" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0020" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0020" /v "Name" /t REG_SZ /d "ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0020" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\ScreenHunter" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0021" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0021" /v "YCoord" /t REG_DWORD /d "127" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0021" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0021" /v "Name" /t REG_SZ /d "Warframe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0021" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Warframe.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0022" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0022" /v "YCoord" /t REG_DWORD /d "252" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0022" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0022" /v "Name" /t REG_SZ /d "Emby Server" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0022" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Emby Server.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0023" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0023" /v "YCoord" /t REG_DWORD /d "377" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0023" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0023" /v "Name" /t REG_SZ /d "FanControl" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0023" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\FanControl.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0024" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0024" /v "YCoord" /t REG_DWORD /d "502" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0024" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0024" /v "Name" /t REG_SZ /d "samegame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0024" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\samegame.exe" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0025" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0025" /v "YCoord" /t REG_DWORD /d "627" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0025" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0025" /v "Name" /t REG_SZ /d "AlecaFrame" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0025" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\AlecaFrame.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0026" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0026" /v "YCoord" /t REG_DWORD /d "877" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0026" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0026" /v "Name" /t REG_SZ /d "Monthly Payments" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0026" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\Monthly Payments.lnk" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0027" /v "XCoord" /t REG_DWORD /d "3532" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0027" /v "YCoord" /t REG_DWORD /d "1002" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0027" /v "Monitor" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0027" /v "Name" /t REG_SZ /d "TV Series" /f
Reg.exe add "HKCU\SOFTWARE\JOConnell\DeskTop\Layout 3840 x 2160_Server\Icon0027" /v "Path" /t REG_SZ /d "C:\Users\Server\Desktop\TV Series.lnk" /f

::Power_Setting

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CustomizeDuringSetup" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HiberFileSizePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MfBufferingThreshold" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PerfCalculateActualUtilization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SourceSettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TimerRebaseThresholdOnDripsExit" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0" /v "PowerEnvelope" /t REG_DWORD /d "350" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve" /v "PointCount" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\0" /v "FrequencyPercent" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\0" /v "PowerEnvelope" /t REG_DWORD /d "48" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\1" /v "FrequencyPercent" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\1" /v "PowerEnvelope" /t REG_DWORD /d "53" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\2" /v "FrequencyPercent" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\2" /v "PowerEnvelope" /t REG_DWORD /d "81" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\3" /v "FrequencyPercent" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\3" /v "PowerEnvelope" /t REG_DWORD /d "111" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\4" /v "FrequencyPercent" /t REG_DWORD /d "80" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\4" /v "PowerEnvelope" /t REG_DWORD /d "182" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\5" /v "FrequencyPercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\0\PowerCurve\5" /v "PowerEnvelope" /t REG_DWORD /d "348" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1" /v "PowerEnvelope" /t REG_DWORD /d "2200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve" /v "PointCount" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\0" /v "FrequencyPercent" /t REG_DWORD /d "13" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\0" /v "PowerEnvelope" /t REG_DWORD /d "103" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\1" /v "FrequencyPercent" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\1" /v "PowerEnvelope" /t REG_DWORD /d "126" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\2" /v "FrequencyPercent" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\2" /v "PowerEnvelope" /t REG_DWORD /d "225" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\3" /v "FrequencyPercent" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\3" /v "PowerEnvelope" /t REG_DWORD /d "395" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\4" /v "FrequencyPercent" /t REG_DWORD /d "80" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\4" /v "PowerEnvelope" /t REG_DWORD /d "710" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\5" /v "FrequencyPercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\CPU\EfficiencyClass\1\PowerCurve\5" /v "PowerEnvelope" /t REG_DWORD /d "1100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayBacklightPowerFloor" /t REG_DWORD /d "25" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayBacklightPowerGradient" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayBacklightPowerQDenominator" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayBacklightPowerQNumerator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayPanelPowerAreaFactor" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayPanelPowerDpiFactor" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayPanelPowerFloor" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Display" /v "DisplayPanelPowerVsyncDelta" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\ResidualEnergy" /v "EnableInlineAccounting" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\StandbyActivationEnergy" /v "DripsPowerFloorMilliWatts" /t REG_DWORD /d "150" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\StandbyActivationEnergy" /v "Policy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "FlushPowerMw" /t REG_DWORD /d "2040" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "IdleStatesNumber" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "LargeRandomReadPowerMw" /t REG_DWORD /d "1935" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "LargeRandomWritePowerMw" /t REG_DWORD /d "2040" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "LargeSequentialReadPowerMw" /t REG_DWORD /d "1890" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "LargeSequentialWritePowerMw" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "SmallRandomReadPowerMw" /t REG_DWORD /d "1820" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "SmallRandomWritePowerMw" /t REG_DWORD /d "1720" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "SmallSequentialReadPowerMw" /t REG_DWORD /d "1720" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD" /v "SmallSequentialWritePowerMw" /t REG_DWORD /d "1800" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "1260" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "285" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\2" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "54375" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\2" /v "IdleExitLatencyMs" /t REG_DWORD /d "33" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\2" /v "IdlePowerMw" /t REG_DWORD /d "720" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\2" /v "IdleTimeLengthMs" /t REG_DWORD /d "8000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\3" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "553500" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\3" /v "IdleExitLatencyMs" /t REG_DWORD /d "325" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\3" /v "IdlePowerMw" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\HDD\IdleState\3" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "FlushPowerMw" /t REG_DWORD /d "2100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "IdleStatesNumber" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "LargeRandomReadPowerMw" /t REG_DWORD /d "2300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "LargeRandomWritePowerMw" /t REG_DWORD /d "2100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "LargeSequentialReadPowerMw" /t REG_DWORD /d "2400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "LargeSequentialWritePowerMw" /t REG_DWORD /d "2400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "SmallRandomReadPowerMw" /t REG_DWORD /d "1600" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "SmallRandomWritePowerMw" /t REG_DWORD /d "2100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "SmallSequentialReadPowerMw" /t REG_DWORD /d "1700" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME" /v "SmallSequentialWritePowerMw" /t REG_DWORD /d "1800" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\NVME\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "FlushPowerMw" /t REG_DWORD /d "145" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "IdleStatesNumber" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "LargeRandomReadPowerMw" /t REG_DWORD /d "130" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "LargeRandomWritePowerMw" /t REG_DWORD /d "145" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "LargeSequentialReadPowerMw" /t REG_DWORD /d "135" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "LargeSequentialWritePowerMw" /t REG_DWORD /d "205" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "SmallRandomReadPowerMw" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "SmallRandomWritePowerMw" /t REG_DWORD /d "130" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "SmallSequentialReadPowerMw" /t REG_DWORD /d "110" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD" /v "SmallSequentialWritePowerMw" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "FlushPowerMw" /t REG_DWORD /d "2310" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "IdleStatesNumber" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "LargeRandomReadPowerMw" /t REG_DWORD /d "1770" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "LargeRandomWritePowerMw" /t REG_DWORD /d "2310" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "LargeSequentialReadPowerMw" /t REG_DWORD /d "1755" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "LargeSequentialWritePowerMw" /t REG_DWORD /d "1710" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "SmallRandomReadPowerMw" /t REG_DWORD /d "1915" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "SmallRandomWritePowerMw" /t REG_DWORD /d "1962" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "SmallSequentialReadPowerMw" /t REG_DWORD /d "1875" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD" /v "SmallSequentialWritePowerMw" /t REG_DWORD /d "1815" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "9000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitLatencyMs" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdlePowerMw" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleTimeLengthMs" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "80000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitLatencyMs" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdlePowerMw" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "250" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\WorkOnBehalf" /v "DisableWorkOnBehalfAttribution" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /ve /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy" /v "EA:PowerStateDischarging" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy" /v "EA:EnergySaverEngaged" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}" /v "Condition" /t REG_SZ /d "{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}" /v "OwnerAppName" /t REG_SZ /d "EA:PowerStateDischarging" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{AAF91665-FAFF-449D-B47A-5E19B4ABB4E2}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{AAF91665-FAFF-449D-B47A-5E19B4ABB4E2}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{AAF91665-FAFF-449D-B47A-5E19B4ABB4E2}" /v "Type" /t REG_DWORD /d "4121" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{AAF91665-FAFF-449D-B47A-5E19B4ABB4E2}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{EC5C2F86-8FC5-4ACE-BC77-B29BF20276B0}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{EC5C2F86-8FC5-4ACE-BC77-B29BF20276B0}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{EC5C2F86-8FC5-4ACE-BC77-B29BF20276B0}" /v "Type" /t REG_DWORD /d "4106" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{DDC4A1A9-7163-4072-878F-5416933D22D1}\{885D4A75-7CE6-4075-8AF0-2BFC82B62FE3}\{EC5C2F86-8FC5-4ACE-BC77-B29BF20276B0}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}" /v "Condition" /t REG_SZ /d "{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}" /v "OwnerAppName" /t REG_SZ /d "EA:EnergySaverEngaged" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{CF69B873-5A0E-4F7E-AC84-8A185A47A85F}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{CF69B873-5A0E-4F7E-AC84-8A185A47A85F}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{CF69B873-5A0E-4F7E-AC84-8A185A47A85F}" /v "Type" /t REG_DWORD /d "4106" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{CF69B873-5A0E-4F7E-AC84-8A185A47A85F}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{E4E90B30-BD23-4AEA-B44E-3777C9401354}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{E4E90B30-BD23-4AEA-B44E-3777C9401354}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{E4E90B30-BD23-4AEA-B44E-3777C9401354}" /v "Type" /t REG_DWORD /d "4145" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PDC\VetoPolicy\EA\{EE8ED144-1D82-4B2E-B807-2082FE3D4AC7}\{850FAEAE-3ADC-4CC6-BA5C-7F4151466500}\{E4E90B30-BD23-4AEA-B44E-3777C9401354}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerRequestOverride" /ve /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-300,Harddisk and storage power management settings and configurations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-301,Harddisk settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v "FriendlyName" /t REG_EXPAND_SZ /d "AHCI Link Power Management - HIPM/DIPM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v "Description" /t REG_EXPAND_SZ /d "Configures the LPM state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "Active" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\0" /v "Description" /t REG_EXPAND_SZ /d "Neither Host or Device initiated allowed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "HIPM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\1" /v "Description" /t REG_EXPAND_SZ /d "Host initiated allowed only" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "HIPM+DIPM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\2" /v "Description" /t REG_EXPAND_SZ /d "Both Host and Device initiated allowed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "DIPM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\3" /v "Description" /t REG_EXPAND_SZ /d "Device initiated allowed only" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\3" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "Lowest" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\4" /v "Description" /t REG_EXPAND_SZ /d "HIPM+DIPM+DEVSLP" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\4" /v "SettingValue" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d69d7-a2a1-449c-9680-f91c70521c60\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-312,Specifies the the power consumption level storage devices should not exceed." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-313,Maximum Power Level" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,%%" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\51dea550-bb38-4bc4-991b-eacf37be5ec8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-302,The harddisk may power down after the specified time of inactivity is detected." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-303,Harddisk power down timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "600" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-310,Ignore a burst of disk activity up to the specified time when determining if a hard disk is idle." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-311,Hard disk burst ignore time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\80e3c60e-bb94-4ad8-bbe0-0d3195efc663\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "FriendlyName" /t REG_EXPAND_SZ /d "Secondary NVMe Idle Timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "Description" /t REG_EXPAND_SZ /d "Specifies the amount of time the NVMe device must be in the primary non-operational power state before transitioning to the secondary non-operational power state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMax" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueUnits" /t REG_EXPAND_SZ /d "milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "1000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "FriendlyName" /t REG_EXPAND_SZ /d "Primary NVMe Idle Timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "Description" /t REG_EXPAND_SZ /d "Specifies the amount of time the NVMe device must be idle before transitioning to the primary non-operational power state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMax" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueUnits" /t REG_EXPAND_SZ /d "milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "FriendlyName" /t REG_EXPAND_SZ /d "AHCI Link Power Management - Adaptive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "Description" /t REG_EXPAND_SZ /d "Automatically transit from Partial to Slumber." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "ValueMax" /t REG_DWORD /d "300000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456" /v "ValueUnits" /t REG_EXPAND_SZ /d "millisecond" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dab60367-53fe-4fbc-825e-521d069d2456\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "FriendlyName" /t REG_EXPAND_SZ /d "Secondary NVMe Power State Transition Latency Tolerance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "Description" /t REG_EXPAND_SZ /d "After the NVMe device has been in the primary non-operational power state for a certain amount of time, transition to the lowest non-operational power state whose ENLAT+EXLAT value is less than or equal to the value specified by this setting." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "ValueMax" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472" /v "ValueUnits" /t REG_EXPAND_SZ /d "milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\dbc9e238-6de9-49e3-92cd-8c2b4946b472\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-314,Enable or Disable NVMe Non-Operational Power State Permissive Mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-315,NVMe NOPPME" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc7372b6-ab2d-43ee-8797-15e9841f2cca\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "FriendlyName" /t REG_EXPAND_SZ /d "Primary NVMe Power State Transition Latency Tolerance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "Description" /t REG_EXPAND_SZ /d "When the NVMe device has been idle for a certain amount of time, transition to the lowest non-operational power state whose ENLAT+EXLAT value is less than or equal to the value specified by this setting." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "ValueMax" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e" /v "ValueUnits" /t REG_EXPAND_SZ /d "milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\fc95af4d-40e7-4b6d-835a-56d131dbc80e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2401;SubgroupDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2400;SubgroupName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8" /v "IconResource" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2660;RES_ICO_FRAME" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd" /v "Description" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2402;TimerSettingName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd" /v "IconResource" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\0" /v "Description" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2403;ValueMaxPowName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\1" /v "Description" /t REG_EXPAND_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mshtml.dll,-2404;ValueMaxPerfName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\02F815B5-A5CF-4C84-BF20-649D1F75D3D8\4c793e7d-a264-42e1-87d3-7a0d2f523ccd\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-409,SubGroupDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-408,SubGroupName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-411,PowerSettingDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-410,PowerSettingName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-415,EnabledDec" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-414,EnabledName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-413,DisabledDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\System32\stobject.dll,-412,DisabledName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-102,Locks the console when the system wakes from a sleep state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-103,Lock Console when System Wakes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-118,Do not lock console when system wakes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-118,Do not lock console when system wakes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-123,Lock console when system wakes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-123,Lock console when system wakes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0E796BDB-100D-47D6-A2D5-F7D2DAA51F51\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4098" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4097" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1" /v "IconResource" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\shell32.dll,-80" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4099" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4102" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4101" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\0" /v "SettingValue" /t REG_BINARY /d "4f16abc14f833d468544a40e93ab5472" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4104" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4103" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\1" /v "SettingValue" /t REG_BINARY /d "cbbc7c784bcd76478be55f8ae4726f2b" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4106" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4105" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\2" /v "SettingValue" /t REG_BINARY /d "12e42867d140b04a8d15f3c56f303eb5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4108" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\wlansvc.dll,-4107" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\3" /v "SettingValue" /t REG_BINARY /d "0fdc12e09783b546a0600de84f96388e" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19cbb8fa-5279-450e-9fac-8a3d5fedd0c1\12bbebe6-58d6-4636-95bb-3217ef867c1a\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-119,Sleep transition settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-120,Sleep transition settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1500,Avoid waking from hiberate via the legacy RTC wake alarm. Also defer hibernate in the presence of an immanent wake alarm." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1501,Legacy RTC mitigations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1502,Disable legacy RTC mitigations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1503,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1504,Enable legacy RTC mitigations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1505,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\1A34BDC3-7E6B-442E-A9D0-64B6EF378E84\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-550,Allow away mode to be enabled for your computer" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-551,Allow Away Mode Policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-552,Don't Allow away mode to be enabled." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-553,No" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-554,Allow away mode to be enabled." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-555,Yes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\25DFA149-5DD1-4736-B5AB-E8A37B5B8187\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-104,System idle timeout before the system enters a low power standby state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-105,System standby timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1800" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "900" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "900" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "600" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-128,Idle timeout before the system returns to a low power sleep state after waking unattended." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-129,System unattended sleep timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-108,Enable or Disable FastS4 System State." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-109,System FastS4 Support" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\94AC6D29-73CE-41A6-809F-6363BA21B47E\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-106,System idle timeout before the system enters a low power hibernation state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-107,System hibernation timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\9d7815a6-7ee4-497e-8888-515a05f02364\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-560,Allow programs to prevent machine from going to sleep automatically" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-561,Allow System Required Policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-562,Don't allow programs to prevent machine from going to sleep automatically." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-553,No" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-563,Allow programs to prevent machine from going to sleep automatically." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-555,Yes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\A4B195F5-8225-47D8-8012-9D41369786E2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-121,Allow Windows to use the standby states when sleeping your computer." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-122,Allow Standby States" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\abfc2519-3608-4c2a-94ea-171b0ed546ab\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-124,Allow Windows to automatically wake your computer from sleep on a timer for scheduled tasks and other programs." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-125,Allow automatic wake from sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-517,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-518,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-519,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-520,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-523,Important Wake Timers Only" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-524,Important Wake Timers Only" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "OverrideACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "OverrideDCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "OverrideACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "OverrideDCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "OverrideACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "OverrideDCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d" /v "Description" /t REG_EXPAND_SZ /d "@%%systemroot%%\system32\wkssvc.dll,-103,Allow your machine to go to sleep when files opened remotely have not been written to." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%systemroot%%\system32\wkssvc.dll,-104,Allow sleep with remote opens" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-100,Power Scheme Personality. This is a personality of a power scheme, indicating whether to maximize performance, maximize power savings, or optimize between the two. Many system components may use this power setting to as an indicator for their decisions about how to optimize for powersavings and performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-101,Power Scheme Personality" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-10,Longer battery life is more important than system performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-11,Power Saver" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\0" /v "SettingValue" /t REG_BINARY /d "081384a14135ab4fbc81f71556f20b4a" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-12,System performance is more important than longer battery life." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-13,High Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\1" /v "SettingValue" /t REG_BINARY /d "da7f5e8cbfe8964a9a85a6e23a8c635c" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-14,Windows automatically balances power savings and system performance, offering full performance on demand, and saving power when idle." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-15,Automatic (recommended)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\2" /v "SettingValue" /t REG_BINARY /d "22421b3894f6f0419685ff5bb260df2e" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\245d8541-3943-4422-b025-13a784f679b7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1200;UsbPowerSettingsName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1201;UsbPowerSettingsDescription" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "FriendlyName" /t REG_EXPAND_SZ /d "Hub Selective Suspend Timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "Description" /t REG_EXPAND_SZ /d "This value will be used as idle timeouts for all USB hubs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMax" /t REG_DWORD /d "100000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueUnits" /t REG_EXPAND_SZ /d "Millisecond" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1202;UsbPowerSelSupName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1203;UsbPowerSelSupDescription" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1206;ValueOffName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1207;ValueOffDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1204;ValueOnName" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\usbui.dll,-1205;ValueOnDesc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678" /v "FriendlyName" /t REG_EXPAND_SZ /d "Setting IOC on all TDs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678" /v "Description" /t REG_EXPAND_SZ /d "Should IOC be set for all TDs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\0" /v "Description" /t REG_EXPAND_SZ /d "Set IOC only for the last TD in a transfer" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\1" /v "Description" /t REG_EXPAND_SZ /d "Set IOC for for all TDs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\498c044a-201b-4631-a522-5c744ed4e678\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "FriendlyName" /t REG_EXPAND_SZ /d "USB 3 Link Power Mangement" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "Description" /t REG_EXPAND_SZ /d "Specifies the power management policy to use for USB 3 links when they are idle " /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\0" /v "Description" /t REG_EXPAND_SZ /d "Do not enable the U1 U2 states" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "Minimum power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\1" /v "Description" /t REG_EXPAND_SZ /d "Enable the U1 U2 states but choose conservative timeout values to optimize for peformance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "Moderate power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\2" /v "Description" /t REG_EXPAND_SZ /d "Enable the U1 U2 states and choose optimal timeout values to balance power and peformance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "Maximum power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\3" /v "Description" /t REG_EXPAND_SZ /d "Enable the U1 U2 states and choose aggressive timeout values to optimize for power" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1000,Idle resiliency settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1001,Idle Resiliency" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1006,Specifies Execution Required power request timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1007,Execution Required power request timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\3166BC41-7E98-4e03-B34E-EC0F5F2B218E\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1004,Specifies IO coalescing timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1005,IO coalescing timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-82,Milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C36F0EB4-2988-4a70-8EEE-0884FC2C2433\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "60000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1002,Specifies Processor Idle Resiliency Timer Resolution" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1003,Processor Idle Resiliency Timer Resolution" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "ValueMax" /t REG_DWORD /d "65000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-82,Miliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\C42B79AA-AA3A-484b-A98F-2CF32AA90A28\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1008,Specifies Deep Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1009,Specifies Deep Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-126,Deep Sleep is disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-126,Deep Sleep is disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-127,Deep Sleep is enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-127,Deep Sleep is enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2E601130-5351-4d9d-8E04-252966BAD054\D502F7EE-1DC7-4EFD-A55D-F04B6F5C0545\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1110,Interrupt Steering Settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1111,Interrupt Steering Settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1112,Interrupt Steering Mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1113,Interrupt Steering Mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1114,Default" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1115,Default" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1118,Route interrupts to any processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1119,Route interrupts to any processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1120,Route interrupts to any unparked processor with time delay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1121,Route interrupts to any unparked processor with time delay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1122,Route interrupts to any unparked processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1123,Route interrupts to any unparked processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1130,Lock Routing" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1131,Lock Routing" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\4" /v "SettingValue" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1116,Route interrupts to P0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1117,Route interrupts to P0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\5" /v "SettingValue" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1132,Route interrupts to P1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1133,Route interrupts to P1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\6" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\2BFC24F9-5EA2-4801-8213-3DBAE01AA39D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1124,Interrupt Steering Target Load for each Processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1125,Interrupt Steering Target Load for each Processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "ValueMax" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1126,Tenths of a percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\73CDE64D-D720-4bb2-A860-C755AFE77EF2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1127,Time a processor must remain unparked before interrupts are moved onto it" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1128,Unparked time trigger" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "ValueMax" /t REG_DWORD /d "100000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1129,Milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E\D6BA4903-386F-4c2c-8ADB-5C21B3328D25\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-250,Power buttons settings and configurations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-251,Power buttons settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-256,Power state to transition to when the system lid is closed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-257,lid-close action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936" /v "IconResource" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-512" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-50,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-51,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\1" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\3" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-252,Power state to transition to when the power button is pressed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-253,power button action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "IconResource" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-513" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-50,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-51,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\1" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\3" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-60,Turn off the display but leave the system running (ACPI-defined sleep state S0)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-61,Turn off the display" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\4" /v "SettingValue" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-900,Enable forced shutdown for button and lid actions" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-901,Enable forced shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\833a6b62-dfa4-46d1-82f8-e09e34d029d6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-254,Power state to transition to when the sleep button is pressed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-255,sleep button action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "IconResource" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-514" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-50,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-51,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\1" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\3" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-60,Turn off the display but leave the system working (ACPI-defined sleep state S0)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-61,Turn off the display" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\4" /v "SettingValue" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-260,Specify the action to take when the lid is opened." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-261,Lid open action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-58,Do Nothing" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-59,Do Nothing" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-62,Turn on the display" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-63,Turn on the display" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\99ff10e7-23b1-4c07-a9d1-5c3206d741b4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-258,Specifies the action that Windows takes when a user presses the user interface sleep button" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-259,User Interface Sleep Button Action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Sleep" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\0" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\1" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\2" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-60,Turn off the display but leave the system running (ACPI-defined sleep state S0)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-61,Turn off the display" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\4" /v "SettingValue" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\A7066653-8D6C-40A8-910E-A1F54B84C7E5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-150,Specifies the policy for devices powering down while the system is running." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-151,Device idle policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-152,Favor performance over power savings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-153,Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-154,Favor power savings over performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-155,Power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4faab71a-92e5-4726-b531-224559672d19\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-600,PCI Express Power Management Settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-601,PCI Express" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-602,Specifies the Active State Power Management (ASPM) policy to use for capable links when the link is idle." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-603,Link State Power Management" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-604,Turn off ASPM for all links." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-605,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-606,Attempt to use the L0S state when link is idle." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-607,Moderate power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-608,Attempt to use the L1 state when the link is idle." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-609,Maximum power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\501a4d13-42af-4429-9fd1-a8218c268e20\ee12f906-d277-404b-b6da-e5fa1a576df5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-350,Processor Power management settings and configurations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-351,Processor power settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-376,Specify the upper busy threshold that must be met before increasing the processor's performance state (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-377,Processor performance increase threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1216,Specify the upper busy threshold that must be met before increasing the processor's performance state for Processor Power Efficiency Class 1 (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1217,Processor performance increase threshold for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\06cadf0e-64ed-448a-8927-ce7bf90eb35e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-766,Specify the minimum number of unparked cores/packages allowed (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-767,Processor performance core parking min cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1224,Specify the minimum number of unparked cores/packages allowed for Processor Power Efficiency Class 1 (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1225,Processor performance core parking min cores for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318584\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-378,Specify the lower busy threshold that must be met before decreasing the processor's performance state (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-379,Processor performance decrease threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1214,Specify the lower busy threshold that must be met before decreasing the processor's performance state for Processor Power Efficiency Class 1 (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1215,Processor performance decrease threshold for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\12a0ab44-fe28-4fa9-b3bd-4b64f44960a7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1240,Initial performance state for Processor Power Efficiency Class 1 when woken from a parked state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1241,Initial performance for Processor Power Efficiency Class 1 when unparked" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\1facfc65-a930-4bc5-9f38-504ec097bbc0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-796,Specify the busy threshold that must be met when calculating the concurrency of a node (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-797,Processor performance core parking concurrency threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2430ab6f-a520-44a2-9601-f7f23b5134b1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-768,Specify the minimum number of perf check intervals that must elapse before more cores/packages can be unparked." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-769,Processor performance core parking increase time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\2ddd5a84-5a71-437e-912a-db0b8c788732\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-811,Specify how much processors should favor energy savings over performance when operating in autonomous mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-812,Processor energy performance preference policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "33" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\4569e601-272e-4869-bcab-1c6c03d7966f\381b4222-f694-41f0-9685-ff5bb260df2e" /ve /t REG_SZ /d "" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "33" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "ProvDcSettingIndex" /t REG_DWORD /d "70" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1244,Specify how much Processor Power Efficiency Class 1 processors should favor energy savings over performance when operating in autonomous mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1245,Processor energy performance preference policy for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "33" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6864\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-380,Allow processors to use throttle states in addition to performance states." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-381,Allow Throttle States" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Off" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-741,Automatically use throttle states when they are power efficient." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-742,Automatic" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1230,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be increased for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1231,Processor performance increase time for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4009efa7-e72d-4cba-9edf-91084ea8cbc3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-392,Specify the algorithm used to select a new performance state when the ideal performance state is lower than the current performace state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-393,Processor performance decrease policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-382,Select the ideal processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-383,Ideal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-384,Select the processor performance state one closer to ideal than the current processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-385,Single" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-388,Select the lowest speed/power processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-389,Rocket" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1210,Specify the algorithm used to select a new performance state when the ideal performance state is lower than the current performace state for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1211,Processor performance decrease policy for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-382,Select the ideal processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-383,Ideal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-384,Select the processor performance state one closer to ideal than the current processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-385,Single" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-388,Select the lowest speed/power processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-389,Rocket" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\40fbefc7-2e9d-4d25-a185-0cfd8574bac7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-805,Specify what performance state a processor enters when parked." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-806,Processor performance core parking parked performance state" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-802,No Preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-802,No Preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-803,Deepest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-803,Deepest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-804,Lightest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-804,Lightest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1222,Specify what performance state a processor enters when parked for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1223,Processor performance core parking parked performance state for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-802,No Preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-802,No Preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-803,Deepest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-803,Deepest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-804,Lightest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-804,Lightest Performance State" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\447235c7-6a8d-4cc0-8e24-9eaf70b96e2c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-719,Specify how much processors may opportunistically increase frequency above maximum when allowed by current operating contitions." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-720,Processor performance boost policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\45bcc044-d885-43e2-8605-ee0ec6e96b59\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-390,Specify the algorithm used to select a new performance state when the ideal performance state is higher than the current performace state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-391,Processor performance increase policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-382,Select the ideal processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-383,Ideal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-384,Select the processor performance state one closer to ideal than the current processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-385,Single" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-386,Select the highest speed/power processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-387,Rocket" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-747,Select the ideal processor performance state optimized for responsiveness." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-748,IdealAggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc418\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1212,Specify the algorithm used to select a new performance state when the ideal performance state is higher than the current performace state for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1213,Processor performance increase policy for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-382,Select the ideal processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-383,Ideal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-384,Select the processor performance state one closer to ideal than the current processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-385,Single" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-386,Select the highest speed/power processor performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-387,Rocket" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-747,Select the ideal processor performance state optimized for responsiveness." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-748,IdealAggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\465e1f50-b610-473a-ab58-00d1077dc419\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-706,Specify the upper busy threshold that must be met before demoting the processor to a lighter idle state (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-707,Processor idle demote threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-800,Specify the utilization threshold used to calculate the distribution concurrency (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-801,Processor performance core parking distribution threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4bdaf4e9-d103-46d7-a5f0-6280121616ef\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-398,Specify the amount that must expire before processor performance states and parked cores may be reevaluated (in milliseconds)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-399,Processor performance time check interval" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMax" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-82,Milliseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "15" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-815,Specify whether the processor may use duty cycling." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-816,Processor duty cycling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-817,Disallow processor duty cycling." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-730,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-818,Allow processor duty cycling." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-732,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4e4450b3-6179-4e91-b8f1-5bb9938f81a1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-702,Specify if idle states should be disabled." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-703,Processor idle disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-714,Enable idle states." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-715,Enable idle" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-716,Disable idle states." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-717,Disable idle" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-794, Specify the minimum number of unparked cores/packages when a latency hint is active (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-795,Latency sensitivity hint min unparked cores/packages" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd88\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1220, Specify the minimum number of unparked cores/packages when a latency hint is active for Processor Power Efficiency Class 1 (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1221,Latency sensitivity hint min unparked cores/packages for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\616cdaa5-695e-4545-97ad-97dc2d1bdd89\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-723,Specify the processor performance in response to latency sensitivity hints." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-724,Latency sensitivity hint processor performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300971\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1218,Specify the processor performance in response to latency sensitivity hints for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1219,Latency sensitivity hint processor performance for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\619b7505-003b-4e82-b7a6-4dd29c300972\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-700,Specify if idle state promotion and demotion values should be scaled based on the current peformance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-701,Processor idle threshold scaling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-712,Disable scaling of idle state promotion and demotion values based on the current performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-713,Disable scaling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-710,Enable scaling of idle state promotion and demotion values based on the current performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-711,Enable scaling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\6c2993b0-8f48-481f-bcc6-00dd2742aa06\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-762,Specify the number of cores/packages to park when fewer cores are required." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-763,Processor performance core parking decrease policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-750,Ideal number of cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-751,Ideal number of cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-752,Single core" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-753,Single core" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-754,All possible cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-755,All possible cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-774,One eighth cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-775,One eighth cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\71021b41-c749-4d21-be74-a00f335d582b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-819,Specify the approximate maximum frequency of your processor (in MHz)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-820,Maximum processor frequency" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-87,MHz" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1242,Specify the approximate maximum frequency of your Processor Power Efficiency Class 1 processor (in MHz)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1243,Maximum processor frequency for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-87,MHz" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e101\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-708,Specify the lower busy threshold that must be met before promoting the processor to a deeper idle state (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-709,Processor idle promote threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-721,Specify the number of processor performance time check intervals to use when calculating the average utility." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-722,Processor performance history count" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "ValueMax" /t REG_DWORD /d "128" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f5f\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1200,Specify the number of processor performance time check intervals to use when calculating the average utility for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1201,Processor performance history count for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "ValueMax" /t REG_DWORD /d "128" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7d24baa7-0b84-480f-840c-1b0743c00f60\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1228,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be decreased for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1229,Processor performance decrease time for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2492b6-60b1-45e5-ae55-773f8cd5caec\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1250,Specify what policy to be used on systems with at least two different Processor Power Efficiency Classes." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1251,Heterogeneous policy in effect." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1252,Heterogeneous policy 0." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1253,Use heterogeneous policy 0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1254,Heterogeneous policy 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1255,Use heterogeneous policy 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1256,Heterogeneous policy 2." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1257,Use heterogeneous policy 2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1258,Heterogeneous policy 3." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1259,Use heterogeneous policy 3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1260,Heterogeneous policy 4." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1261,Use heterogeneous policy 4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\4" /v "SettingValue" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-364,Minimum percentage of processor capabilities to use. Lower percenatage may result in significantly better battery life, but possibly lower performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-365,Lower bound for processor performance throttling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\0aabb002-a307-447e-9b81-1d819df6c6d0\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\0da965dc-8fcf-4c0b-8efe-8dd5e7bc959a\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\0da965dc-8fcf-4c0b-8efe-8dd5e7bc959a\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\d4140c81-ebba-4e60-8561-6918290359cd\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvAcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\d4140c81-ebba-4e60-8561-6918290359cd\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ProvDcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c\DefaultPowerSchemeValues\ded574b5-45a0-4f42-8737-46345c09c238" /v "ProvAcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1202,Minimum percentage of processor capabilities to use for Processor Power Efficiency Class 1. Lower percenatage may result in significantly better battery life, but possibly lower performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1203,Lower bound for processor performance throttling for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-807,Specify whether processors should autonomously determine their target performance state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-808,Processor performance autonomous mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-809,Determine target performance state using operating system algorithms." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-730,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-810,Determine target performance state using autonomous selection." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-732,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1262,Specify what thread scheduling policy to use on heterogeneous systems." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1263,Heterogeneous thread scheduling policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1266,Schedule to any available processor." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1267,All processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1268,Schedule exclusively to more performant processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1269,Performant processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1270,Schedule to more performant processors when possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1271,Prefer performant processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1272,Schedule exclusively to more efficient processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1273,Efficient processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1274,Schedule to more efficient processors when possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1275,Prefer efficient processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\4" /v "SettingValue" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1276,Let the system choose an appropriate policy." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1277,Automatic" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\5" /v "SettingValue" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\93b8b6dc-0698-4d1c-9ee4-0644e900c85d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-792,Specify the busy threshold that must be met before a parked core is considered over utilized (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-793,Processor performance core parking over utilization threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "ValueMin" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "85" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "85" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "90" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-370,Specify the cooling mode for your system" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-371,System cooling policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-372,Slow the processor before increasing fan speed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-373,Passive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\0" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-374,Increase fan speed before slowing the processor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-375,Active" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\1" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\94D3A615-A899-4AC5-AE2B-E4D8F634367F\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-776,Specify the anticipated execution latency at which a soft parked core can be used by the scheduler." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-777,Processor performance core parking soft park latency" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-83,Microseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\97cfac41-2217-47eb-992d-618b1977c907\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-394,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be increased." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-395,Processor performance increase time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5aa\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1208,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be increased for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1209,Processor performance increase time for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\984cf492-3bed-4488-a8f9-4286c97bf5ab\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-735,Specify the deepest idle state that should be used." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-736,Processor idle state maximum" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "ValueMax" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-86,state type" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\9943e905-9a30-4ec1-9b99-44dd3b76f7a2\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1234,Specifies the performance level increase threshold at which the Processor Power Efficiency Class 1 processor count is increased (in units of Processor Power Efficiency Class 0 processor performance)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1235,Processor performance level increase threshold for Processor Power Efficiency Class 1 processor count increase" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\255" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1236,Processor performance level threshold change for Processor Power Efficiency Class 1 processor count change relative to Processor Power Efficiency Class 0 performance level." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\255" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1237,Processor performance level threshold change for Processor Power Efficiency Class 1 processor count change" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\255" /v "SettingValue" /t REG_DWORD /d "1515870810" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\b000397d-9b0b-483d-98c9-692a6060cfbf\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1264,Specify what thread scheduling policy to use for short running threads on heterogeneous systems." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1265,Heterogeneous short running thread scheduling policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1266,Schedule to any available processor." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1267,All processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1268,Schedule exclusively to more performant processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1269,Performant processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1270,Schedule to more performant processors when possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1271,Prefer performant processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1272,Schedule exclusively to more efficient processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1273,Efficient processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1274,Schedule to more efficient processors when possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1275,Prefer efficient processors" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\4" /v "SettingValue" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1276,Let the system choose an appropriate policy." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1277,Automatic" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\5" /v "SettingValue" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-362,Maximum percentage of processor capabilities to use. Lower percenatage may result in better battery life, but possibly lower performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-363,Upper bound for processor performance throttling" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\9897998c-92de-4669-853f-b7cd3ecb2790" /v "OverrideACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "OverrideACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1204,Maximum percentage of processor capabilities to use for Processor Power Efficiency Class 1. Lower percenatage may result in better battery life, but possibly lower performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1205,Upper bound for processor performance throttling for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "75" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ed\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "75" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-727,Specify how processors select a target frequency when allowed to select above maximum frequency by current operating conditions." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-728,Processor performance boost mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-729,Don't select target frequencies above maximum frequency." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-730,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-731,Select target frequencies above maximum frequency." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-732,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-733,Always select the highest possible target frequency above nominal frequency." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-734,Aggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-737,Select target frequencies above maximum frequency if hardware supports doing so efficiently." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-738,Efficient Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-739,Always select the highest possible target frequency above nominal frequency if hardware supports doing so efficiently." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-740,Efficient Aggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\4" /v "SettingValue" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\5" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-743,Always select the highest possible target frequency above guaranteed frequency." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\5" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-744,Aggressive At Guaranteed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\5" /v "SettingValue" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-745,Always select the highest possible target frequency above guaranteed frequency if hardware supports doing so efficiently." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-746,Efficient Aggressive At Guaranteed" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\6" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-704,Specify the time that elapsed since the last idle state promotion or demotion before idle states may be promoted or demoted again (in microseconds)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-705,Processor idle time check" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMax" /t REG_DWORD /d "200000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-83,Microseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "50000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-760,Specify the number of cores/packages to unpark when more cores are required." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-761,Processor performance core parking increase policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-750,Ideal number of cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-751,Ideal number of cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-752,Single core" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-753,Single core" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-754,All possible cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-755,All possible cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-774,One eighth cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-775,One eighth cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\3" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c7be0679-2817-4d69-9d02-519a537ed0c6\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-813,Specify the time period over which to observe processor utilization when operating in autonomous mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-814,Processor autonomous activity window" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMax" /t REG_DWORD /d "1270000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-83,Microseconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "30000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-396,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be decreased." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-397,Processor performance decrease time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1206,Specify the minimum number of perf check intervals since the last performance state change before the performance state may be decreased for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1207,Processor performance decrease time for Processor Power Efficiency Class 1." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\d8edeb9b-95cf-4f95-a73c-b061973693c9\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-770,Specify the minimum number of perf check intervals that must elapse before more cores/packages can be parked." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-771,Processor performance core parking decrease time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "ValueMin" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-718,Time check intervals" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\dfd10d17-d5eb-45dd-877a-9a34ddd15c82\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-772,Specify whether the core parking engine should distribute utility across processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-773,Processor performance core parking utility distribution" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-725,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-725,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-726,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-726,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\e0007330-f589-42ed-a401-5ddb10e785d3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-764,Specify the maximum number of unparked cores/packages allowed (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-765,Processor performance core parking max cores" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334028\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1226,Specify the maximum number of unparked cores/packages allowed for Processor Power Efficiency Class 1 (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1227,Processor performance core parking max cores for Processor Power Efficiency Class 1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\ea062031-0e34-4ff1-9b6d-eb1059334029\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-798,Specify the busy threshold that must be met by all cores in a concurrency set to unpark an extra core (in percentage)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-799,Processor performance core parking concurrency headroom threshold" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f735a673-2066-4f80-a0c5-ddee0cf1bf5d\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1232,Specifies the performance level decrease threshold at which the Processor Power Efficiency Class 1 processor count is decreased (in units of Processor Power Efficiency Class 0 processor performance)." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1233,Processor performance level decrease threshold for Processor Power Efficiency Class 1 processor count decrease" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\255" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1236,Processor performance level decrease threshold for Processor Power Efficiency Class 1 processor count decrease. The level is relative to Processor Power Efficiency Class 0 performance level." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\255" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1237,Processor performance level threshold change for Processor Power Efficiency Class 1 processor count change" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\255" /v "SettingValue" /t REG_DWORD /d "842150450" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\f8861c27-95e7-475c-865b-13c0cb3f9d6b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1238,Performance state floor for Processor Power Efficiency Class 0 when Processor Power Efficiency Class 1 is woken from a parked state." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1239,A floor performance for Processor Power Efficiency Class 0 when there are Processor Power Efficiency Class 1 processors unparked" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\fddc842b-8364-4edc-94cf-c17f60de1c80\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1600,Graphics configuration settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1601,Graphics settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1602,Policy to determine GPU preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1603,GPU preference policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1604,No preference" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1605,None" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1606,Prefer low-power GPU" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1607,Low Power" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "ProvAcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "ProvDcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\ded574b5-45a0-4f42-8737-46345c09c238" /v "ProvAcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5FB4938D-1EE8-4b0f-9A3C-5036B0AB995C\DD848B2A-8A5D-4451-9AE2-39CD41658F6C\DefaultPowerSchemeValues\ded574b5-45a0-4f42-8737-46345c09c238" /v "ProvDcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1150,Specifies the disconnected standby mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1151,Disconnected Standby Mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1152,Normal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1153,Normal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1154,Aggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1155,Aggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\68AFB2D9-EE95-47A8-8F50-4115088073B1\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-400,Video and Display power management settings and configurations" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-401,Video settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-406,Specify how long your computer is inactive before your display dims." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-407,Dim display after" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "585" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "285" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "885" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "585" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "285" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "105" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-402,Video power down timeout after idle detection." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-403,Video power down timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "600" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "900" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "600" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "120" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-416,Specify the policy to decide visual quality of Advanced Color capable displays." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-417,Advanced Color quality bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-418,Advanced Color display mode would be biased towards battery life." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-419,Advanced Color power saving bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-420,Advanced Color display mode would be biased towards visual quality." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-421,Advanced Color visual quality bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\684C3E69-A4F7-4014-8754-D45179A56167\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-414,Specifies Console lock display off timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-415,Console lock display off timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "60" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-404,Allow the system to adapt the video powerdown timeout based on system usage and channel power monitor history." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-405,Enable adaptive powerdown timeout." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\90959d22-d6a1-49b9-af93-bce885ad335b\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-566,Allow programs to prevent display from turning off automatically" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-567,Allow Display Required Policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-568,Don't allow programs to prevent display from turning off automatically." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-553,No" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-569,Allow programs to prevent display from turning off automatically." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-555,Yes" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\A9CEB8DA-CD46-44FB-A98B-02AF69DE4623\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-516, Display brightness" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-515, Specify the normal state brightness level of your display." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-522, Display dim brightness" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-521, Specify the dim brightness level of your display." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\f1fbfde2-a960-4165-9f88-50667911ce96\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-412,Monitors ambient light sensors to detect changes in ambient light and adjust the display brightness." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-413,Enable adaptive brightness" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\FBD9AA66-9553-4097-BA44-ED6E9D65EAB8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1100,Presence Aware Power Behavior settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1101,Presence Aware Power Behavior" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1186,Specifies the minimun active usage time that the battery charge level should allow before taking an adaptive action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1187,Standby Reserve Time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\468FE7E5-1158-46EC-88BC-5B96C9E44FD0\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1188,Specifies percentage of battery charge which resets the adaptive budget" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1189,Standby Reserve Time" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,Percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "75" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\49CB11A5-56E2-4AFB-9D38-3DF47872E21B\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1104,Specifies Non-sensor Input Presence Timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1105,Non-sensor Input Presence Timeout" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\5ADBBFBC-074E-4da1-BA38-DB8B36B2C8F3\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1180,Specifies the grace period before taking an adaptive action when the system has exceeded its standby budget" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1181,Standby Budget Grace Period" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "900" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\60C07FE1-0556-45CF-9903-D56E32210242\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1170,Specify User Presence Prediction mode for your computer" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1171,User Presence Prediction mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1172,Disable User Presence Prediction mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1173,Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1174,Enable User Presence Prediction mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1175,Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\82011705-FB95-4D46-8D35-4042B1D20DEF\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1182,Specifies percentage of battery per unit of time allowed to be consumed by the system while it is in standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1183,Standby Budget Percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,Percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\9FE527BE-1B70-48DA-930D-7BCF17B44990\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1184,Specifies the grace period before taking an adaptive action when the system is below the reserve battery charge level" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1185,Standby Reserve Grace Period" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "ValueMax" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-80,Seconds" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619B916-E004-4dd8-9B66-DAE86F806698\C763EE92-71E8-4127-84EB-F6ED043A3E3D\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1000,Specify the policy to bias video playback quality." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1001,Video playback quality bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1002,Video playback quality would be biased towards battery life." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1003,Video playback power-saving bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1004,Video playback quality would be biased towards performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\mfplat.dll,-1005,Video playback performance bias" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\10778347-1370-4ee0-8bbd-33bdacaade49\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-101,The power optimization mode used by your computer's video playback pipeline" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-100,When playing video" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-103,Gives the optimum video quality during playback" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-102,Optimize video quality" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\0" /v "SettingValue" /t REG_BINARY /d "12a1675cc9a43f48b4a71d473becafdc" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-105,A balance of video quality and power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-104,Balanced" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\1" /v "SettingValue" /t REG_BINARY /d "e5881265eda77640a96b6cc62d848fe1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-107,Gives optimum power savings during playback" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\evr.dll,-106,Optimize power savings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\2" /v "SettingValue" /t REG_BINARY /d "6809261614c9a14a8736b7a6f3c5ae9b" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\9596FB26-9850-41fd-AC3E-F7C3C00AFD4B\34C7B99F-9A6D-4b3c-8DC7-B6693B78CEF4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1160,Energy Saver settings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1161,Energy Saver settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1165,Specifies the percentage value to scale brightness when Energy Saver is on." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1166,Display brightness weight" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "70" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "70" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\13D09884-F74E-474A-A852-B6BDE8AD03A8\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "70" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1300,Specifies the policy to control Energy Saver." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1301,Energy Saver Policy" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1302,Engage Energy Saver based on user settings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1303,User" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1304,Allow Windows to engage Energy Saver aggressively." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1305,Aggressive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\5C5BB349-AD29-4ee2-9D0B-2B25270F7A81\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1162,Specifies battery charge level at which Energy Saver is turned on." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1163,Charge level" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1164,Percent battery charge" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\DE830923-A562-41AF-A086-E3A2C6BAD2DA\E69653CA-CF7F-4F05-AA73-CB833FA90AD4\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e276e160-7cb0-43c6-b20b-73f5dce39954\a1662ab2-9d34-4e53-ba8b-2639b9e20857" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-200,Battery settings and alarms" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-201,Battery settings" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-210,Specify whether a notification is shown when the battery capacity reaches the critical level." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-211,Critical battery notification" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-202,First Low Battery Alarm Action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-203,First Low Battery Alarm Action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-50,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-51,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,System standby sleep state (ACPI-defined sleep states S1 through S3)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\1" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\3" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "OverrideACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "OverrideDCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "OverrideACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "OverrideDCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "OverrideACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "OverrideDCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-220,Percent battery power remaining when the Low Battery action should be taken." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-221,Low Battery Warning Trip Point" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\8183ba9a-e910-48da-8769-14ae6dc1170a\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-218,Percent battery power remaining when first low-power action should be taken." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-219,First power trip point" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-212,Specify whether a notification is shown when the battery capacity reaches the low level." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-213,Low battery notification" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-116,Disable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-117,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-114,Enable." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-115,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-204,Second Low Battery Alarm Action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-205,Second Low Battery Alarm Action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-50,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-51,Take no action" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-52,System standby sleep state (ACPI-defined sleep states S1 through S3)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-53,Standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\1" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-54,System hibernate sleep state (ACPI-defined sleep state S4)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-55,Hibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\2" /v "SettingValue" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\3" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-56,System Shutdown (ACPI-defined sleep state S5)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\3" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-57,Shutdown" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\3" /v "SettingValue" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\batmeter.dll,-401,Percent battery power remaining when we enter Reserve power mode." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\batmeter.dll,-400,Reserve Battery Warning Trip Point" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "ValueIncrement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "ValueMax" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00" /v "ValueUnits" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-81,percent" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\F3C5027D-CD16-4930-AA6B-90DB844A8F00\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9" /v "Attributes" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1140,Specifies network connection state in Standby." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1141,Networking connectivity in Standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\0" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1144,Disable networking in Standby." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\0" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1145,Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\0" /v "SettingValue" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\1" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1142,Enable networking in Standby." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\1" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1143,Enable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\1" /v "SettingValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\2" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1146,Network connection state in Standby is managed by Windows." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\2" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1147,Managed by Windows" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\2" /v "SettingValue" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DcSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "AcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\F15576E8-98B7-4186-B944-EAFA664402D9\DefaultPowerSchemeValues\a1841308-3541-4fab-bc81-f71556f20b4a" /v "DcSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}" /v "Name" /t REG_SZ /d "SustainedPerf" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}" /v "Pri" /t REG_DWORD /d "35" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}" /v "Condition" /t REG_SZ /d "{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}" /v "OwnerAppName" /t REG_SZ /d "Sustained Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}\{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}\{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}\{89B2364B-E1E8-4408-BF39-F4B4E21C23DA}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}\{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}\{89B2364B-E1E8-4408-BF39-F4B4E21C23DA}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}\{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}\{89B2364B-E1E8-4408-BF39-F4B4E21C23DA}" /v "Type" /t REG_DWORD /d "4156" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0AABB002-A307-447e-9B81-1D819DF6C6D0}\{CE74AA52-A71A-4036-BEEF-B6C411010E28}\{9AE06AC0-B216-4b81-A251-BAE05CBA3B1E}\{89B2364B-E1E8-4408-BF39-F4B4E21C23DA}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0c3d5326-944b-4aab-8ad8-fe422a0e50e0}" /v "Name" /t REG_SZ /d "MultimediaQos" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0c3d5326-944b-4aab-8ad8-fe422a0e50e0}" /v "Pri" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}" /v "Name" /t REG_SZ /d "LowLatency" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}" /v "Pri" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "Condition" /t REG_SZ /d "{F6CC25DF-6E8F-4cf8-A242-B1343F565884}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "OwnerAppName" /t REG_SZ /d "High Performance Burst" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "TimeLimitInSeconds" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}" /ve /t REG_SZ /d "OR" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{3FE1F3F0-79E6-4574-8DE8-D824271E42E8}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{3FE1F3F0-79E6-4574-8DE8-D824271E42E8}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{3FE1F3F0-79E6-4574-8DE8-D824271E42E8}" /v "Type" /t REG_DWORD /d "4150" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{3FE1F3F0-79E6-4574-8DE8-D824271E42E8}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{40D9F99C-5047-44fe-AC8F-B996E308B958}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{40D9F99C-5047-44fe-AC8F-B996E308B958}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{40D9F99C-5047-44fe-AC8F-B996E308B958}" /v "Type" /t REG_DWORD /d "4151" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{40D9F99C-5047-44fe-AC8F-B996E308B958}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{53B7DCC2-A177-43b5-B02B-BFD8AED0FD2F}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{53B7DCC2-A177-43b5-B02B-BFD8AED0FD2F}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{53B7DCC2-A177-43b5-B02B-BFD8AED0FD2F}" /v "Type" /t REG_DWORD /d "4149" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{53B7DCC2-A177-43b5-B02B-BFD8AED0FD2F}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{E9FC7D48-282D-4fc4-8082-83F5165FF455}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{E9FC7D48-282D-4fc4-8082-83F5165FF455}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{E9FC7D48-282D-4fc4-8082-83F5165FF455}" /v "Type" /t REG_DWORD /d "4155" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{E9FC7D48-282D-4fc4-8082-83F5165FF455}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{FC036F5B-6ABF-4e5a-9BF9-3A674B38816A}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{FC036F5B-6ABF-4e5a-9BF9-3A674B38816A}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{FC036F5B-6ABF-4e5a-9BF9-3A674B38816A}" /v "Type" /t REG_DWORD /d "4133" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{FC036F5B-6ABF-4e5a-9BF9-3A674B38816A}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{4569E601-272E-4869-BCAB-1C6C03D7966F}" /v "Name" /t REG_SZ /d "LowPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{4569E601-272E-4869-BCAB-1C6C03D7966F}" /v "Pri" /t REG_DWORD /d "30" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}" /v "Name" /t REG_SZ /d "Standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}" /v "Pri" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}" /v "Condition" /t REG_SZ /d "{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}" /v "OwnerAppName" /t REG_SZ /d "Standby" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{BB7CDB55-C4A8-46f2-BDEA-31952DF298F0}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{BB7CDB55-C4A8-46f2-BDEA-31952DF298F0}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{BB7CDB55-C4A8-46f2-BDEA-31952DF298F0}" /v "Type" /t REG_DWORD /d "4133" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{BB7CDB55-C4A8-46f2-BDEA-31952DF298F0}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D71287A3-D690-45e6-983D-EAFDC16563BD}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D71287A3-D690-45e6-983D-EAFDC16563BD}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D71287A3-D690-45e6-983D-EAFDC16563BD}" /v "Type" /t REG_DWORD /d "4153" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D71287A3-D690-45e6-983D-EAFDC16563BD}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D81B5A0B-5EE0-425b-A60D-9873DC8A6959}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D81B5A0B-5EE0-425b-A60D-9873DC8A6959}" /v "Operator" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D81B5A0B-5EE0-425b-A60D-9873DC8A6959}" /v "Type" /t REG_DWORD /d "4158" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{D81B5A0B-5EE0-425b-A60D-9873DC8A6959}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{F348555E-8EAF-41b6-8E31-F1FE5E9426C8}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{F348555E-8EAF-41b6-8E31-F1FE5E9426C8}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{F348555E-8EAF-41b6-8E31-F1FE5E9426C8}" /v "Type" /t REG_DWORD /d "4125" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{8BC6262C-C026-411d-AE3B-7E2F70811A13}\{C072EEBB-1955-4fa9-B4BA-421E96E1D674}\{4B11C1A4-ED05-4b2e-A2B1-F6D0D590EAC8}\{F348555E-8EAF-41b6-8E31-F1FE5E9426C8}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{a4a61b5f-f42c-4d23-b3ab-5c27df9f0f18}" /v "Name" /t REG_SZ /d "EntryLevelPerf" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{a4a61b5f-f42c-4d23-b3ab-5c27df9f0f18}" /v "Pri" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{c04a802d-2205-4910-ae98-3b51e3bb72f2}" /v "Name" /t REG_SZ /d "Background" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{c04a802d-2205-4910-ae98-3b51e3bb72f2}" /v "Pri" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}" /v "Name" /t REG_SZ /d "GameMode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}" /v "Pri" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}" /v "Condition" /t REG_SZ /d "{5003589F-965E-4295-BE6E-2D9BEF847A30}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}" /v "OwnerAppName" /t REG_SZ /d "Game Mode" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Type" /t REG_DWORD /d "4157" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Type" /t REG_DWORD /d "4106" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{D4140C81-EBBA-4e60-8561-6918290359CD}\{35037BB4-9528-481d-8CB2-8FCC63A9DD81}\{5003589F-965E-4295-BE6E-2D9BEF847A30}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}" /v "Name" /t REG_SZ /d "Constrained" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}" /v "Pri" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}" /v "Condition" /t REG_SZ /d "{EC8B0515-7A9A-43c0-81F7-083DB93668BD}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}" /v "OwnerAppName" /t REG_SZ /d "Constrained Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}" /v "OwnerUserSid" /t REG_BINARY /d "010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}" /ve /t REG_SZ /d "AND" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{5B37E17A-9FD2-4b39-98C0-80A745DFAB81}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{5B37E17A-9FD2-4b39-98C0-80A745DFAB81}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{5B37E17A-9FD2-4b39-98C0-80A745DFAB81}" /v "Type" /t REG_DWORD /d "4145" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{5B37E17A-9FD2-4b39-98C0-80A745DFAB81}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{CEB0C263-7D90-4952-9124-C609758890D4}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{CEB0C263-7D90-4952-9124-C609758890D4}" /v "Operator" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{CEB0C263-7D90-4952-9124-C609758890D4}" /v "Type" /t REG_DWORD /d "4106" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{EE1E4F72-E368-46b1-B3C6-5048B11C2DBD}\{9C1F0DBA-33E9-43af-9EDA-A607AA5139DA}\{EC8B0515-7A9A-43c0-81F7-083DB93668BD}\{CEB0C263-7D90-4952-9124-C609758890D4}" /v "Value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\SecurityDescriptors" /v "0E796BDB-100D-47D6-A2D5-F7D2DAA51F51" /t REG_SZ /d "O:BAG:SYD:P(A;CI;KR;;;BU)(A;CI;KA;;;BA)(A;CI;KA;;;SY)(A;CI;KA;;;CO)(A;CI;KR;;;S-1-15-2-1)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\SecurityDescriptors" /v "Default" /t REG_SZ /d "O:BAG:SYD:P(A;CI;KRKW;;;BU)(A;CI;KA;;;BA)(A;CI;KA;;;SY)(A;CI;KA;;;CO)(A;CI;KR;;;AC)(A;CI;KR;;;S-1-15-3-1024-1502825166-1963708345-2616377461-2562897074-4192028372-3968301570-1997628692-1435953622)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes" /v "ActivePowerScheme" /t REG_SZ /d "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-14,Automatically balances performance with energy consumption on capable hardware." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-15,Balanced (recommended)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\3af9B8d9-7c97-431d-ad78-34a8bfea439f" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1400,Favor performance instead of energy savings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\3af9B8d9-7c97-431d-ad78-34a8bfea439f" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1401,High Performance Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-12,Favors performance, but may use more energy." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-13,High Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1404,Favor energy savings over performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1405,Better Battery-life Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-10,Saves energy by reducing your computer performance where possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-11,Power Saver" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\ded574b5-45a0-4f42-8737-46345c09c238" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1402,Maximize bias towards performance instead of energy savings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\ded574b5-45a0-4f42-8737-46345c09c238" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1403,Max Performance Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-18,Provides ultimate performance on higher end PCs." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-19,Ultimate Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\Default\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /v "ActivePowerScheme" /t REG_SZ /d "9935e61f-1661-40c5-ae2f-8495027d5d5d" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /v "ActiveOverlayAcPowerScheme" /t REG_SZ /d "961cc777-2547-4f9d-8174-7d86181b8a7a" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-14,Automatically balances performance with energy consumption on capable hardware." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-15,Balanced (recommended)" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\381b4222-f694-41f0-9685-ff5bb260df2e\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "ACSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\3af9B8d9-7c97-431d-ad78-34a8bfea439f" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1400,Favor performance instead of energy savings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\3af9B8d9-7c97-431d-ad78-34a8bfea439f" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1401,High Performance Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-12,Favors performance, but may use more energy." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-13,High Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\238c9fa8-0aad-41ed-83f4-97be242c8f20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "ACSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1404,Favor energy savings over performance." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\961cc777-2547-4f9d-8174-7d86181b8a7a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1405,Better Battery-life Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790" /v "Description" /t REG_EXPAND_SZ /d "Balanced power plan customized for AMD Ryzen™ processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790" /v "FriendlyName" /t REG_EXPAND_SZ /d "AMD Ryzen™ Balanced" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "ACSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ACSettingIndex" /t REG_DWORD /d "99" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9897998c-92de-4669-853f-b7cd3ecb2790\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "Description" /t REG_EXPAND_SZ /d "High performance power plan customized for AMD Ryzen™ processors." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d" /v "FriendlyName" /t REG_EXPAND_SZ /d "AMD Ryzen™ High Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\238c9fa8-0aad-41ed-83f4-97be242c8f20\29f6c1db-86da-48c5-9fdb-f2b67b1f44da" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "ACSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ACSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\36687f9e-e3a5-4dbf-b1dc-15eb381c6863" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "ACSettingIndex" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "DCSettingIndex" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\8baa4a8a-14c6-4451-8e8b-14bdbd197537" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\bae08b81-2d5e-4688-ad6a-13243356654b" /v "ACSettingIndex" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "ACSettingIndex" /t REG_DWORD /d "97" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "DCSettingIndex" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\9935e61f-1661-40c5-ae2f-8495027d5d5d\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-10,Saves energy by reducing your computer performance where possible." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-11,Power Saver" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\a1841308-3541-4fab-bc81-f71556f20b4a\4f971e89-eebd-4455-a8de-9e59040e7347\7648efa3-dd9c-4e3e-b566-50f929386280" /v "ACSettingIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\ded574b5-45a0-4f42-8737-46345c09c238" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1402,Maximize bias towards performance instead of energy savings." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\ded574b5-45a0-4f42-8737-46345c09c238" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-1403,Max Performance Overlay" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61" /v "Description" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-18,Provides ultimate performance on higher end PCs." /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61" /v "FriendlyName" /t REG_EXPAND_SZ /d "@%%SystemRoot%%\system32\powrprof.dll,-19,Ultimate Performance" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\245d8541-3943-4422-b025-13a784f679b7" /v "ACSettingIndex" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61\245d8541-3943-4422-b025-13a784f679b7" /v "DCSettingIndex" /t REG_DWORD /d "2" /f
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

::Old tweaks

::Disable snap assist

Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "JointResize" /T REG_DWORD /D "0" /F
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "SnapAssist" /T REG_DWORD /D "0" /F

::Disable offline drives in system tray
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
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
::Defender spytools

Reg Add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "0" /f

::Audio auto levelling

Reg Add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f

::Sticky Keys

Reg Add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
Reg Add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f

Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v "DevicePasswordLessBuildVersion" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /t REG_BINARY /d "0700000000A0BE0BAA3CDA01" /f
Reg Add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d "1" /f
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
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg Add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg Add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f
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
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "SnapFill" /T REG_DWORD /D "0" /F
Reg Add "HKCU\Control Panel\Desktop" /V "WindowArrangementActive" /D "0" /F
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f
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
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d "2147483649" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "RefsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f
Reg Add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d 1 /f
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
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "CompletionChar" /t REG_DWORD /d "9" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "DefaultColor" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "EnableExtensions" /t REG_DWORD /d "1" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Command Processor" /v "PathCompletionChar" /t REG_DWORD /d "9" /f
Reg Add HKCU\SOFTWARE\Microsoft\Multimedia\Audio /v UserDuckingPreference /d 3 /t REG_DWORD /f
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
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" /disable
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
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
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f

Reg Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /v SearchBoxTaskbarMode /d 0 /t REG_DWORD /f
Reg Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowTaskViewButton /d 0 /t REG_DWORD /f
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
Reg Add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRecentDocsHistory /d 1 /t REG_DWORD /f
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowFrequent /d 0 /t REG_DWORD /f
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowFrequent /d 0 /t REG_DWORD /f
Reg Add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /ve /t REG_SZ /d "" /f
Reg Add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
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


Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
