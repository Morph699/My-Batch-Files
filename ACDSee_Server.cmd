@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

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
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
