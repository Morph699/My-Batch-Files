@echo off
chcp 65001 >nul
CD /d "%~dp0"
TITLE Morphs ISO Installer Menu

:MENU
mode con:cols=78 lines=268
cls
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
echo                           ===== Morphs 2024 installer Menu =====
echo.   
echo            If installing the Full apps package it's advisable to disable Defender
echo     You can always re-enable it afterwards unless you've chosen the permanent option.
echo.
echo  A. Disable Defender Temporarily
echo  B. Disable Defender + Security modules Permanently - need to reboot to complete process
echo  C. Morphs Disable Firewall 
echo  D. Morphs Enable Firewall 
echo  E. Morphs Cleaning WinSXS - Clear space after updates
echo  F. Morphs Dism Repair - Repair your install (includes SFC)
echo.   
echo  0. Morphs 2024 Ultimate Morphation *Least amount of installs no Papps* + Office 2024
echo  1. Slim Install 1.5 GB installs *No Office or no pApps*..
echo  2. Simple Install 4.5 GB Programs *No pApps + Office 2024* (At least 35 GB space needed)
echo  3. Medium Install 8.5 GB Programs + pApps + Office 2024 (At least 50 GB space needed)
echo.
echo	   For the below install, it's advisable to only use an NVME or SSD HDD
echo.
echo  5. Full Install 23 GB Programs + pApps + Office 2024 (At least 80 GB space needed)
echo.
echo                     ===== Morphs Windows Updates Menu =====
echo.
echo              7. Pause Automatic Updates till 30 Dec 3000
echo              8. Start Windows Update Blocker/Enabler (WUB64) v1.8
echo              9. Start Windows updates For Win10 22H2
echo              10. Start Windows updates For Win11 22H2-23H2
echo              11. Start Windows updates For Win11 24H2
echo.
echo                             15. Reboot Computer 
echo. 
echo                          ===== PRESS 'Q' TO QUIT =======
echo.

SET INPUT=
SET /P INPUT=Select a number or letter: 

IF /I '%INPUT%'=='A' GOTO Defen1
IF /I '%INPUT%'=='B' GOTO Defen2
IF /I '%INPUT%'=='C' GOTO DFirewall 
IF /I '%INPUT%'=='D' GOTO EFirewall 
IF /I '%INPUT%'=='E' GOTO WinSXS
IF /I '%INPUT%'=='F' GOTO DismR
IF /I '%INPUT%'=='0' GOTO Morph2024
IF /I '%INPUT%'=='1' GOTO Slim
IF /I '%INPUT%'=='2' GOTO Simp
IF /I '%INPUT%'=='3' GOTO Med
IF /I '%INPUT%'=='5' GOTO Full24
IF /I '%INPUT%'=='7' GOTO PauseUpdates
IF /I '%INPUT%'=='8' GOTO Wub
IF /I '%INPUT%'=='9' GOTO 22h2
IF /I '%INPUT%'=='10' GOTO 23h2
IF /I '%INPUT%'=='11' GOTO 24h2
IF /I '%INPUT%'=='15' GOTO Reboot
IF /I '%INPUT%'=='Q' GOTO Quit

cls
mode con:cols=78 lines=26
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
echo                             ===== *INVALID INPUT* =======
echo                            Please select a number or letter
echo                                 or select 'Q' to quit 
echo                         ===== *PRESS A KEY TO CONTINUE* ======
echo.            

PAUSE > NUL
GOTO MENU

:Morph2024
start .\Installs\FilesU\Apocalypse\Apocalypse_Install.cmd
start .\Installs\FilesU\Post_Installs_morphs_ultimate.cmd
GOTO Quit

:Slim
start .\Installs\FilesU\Apocalypse\Apocalypse_Install.cmd
start .\Installs\FilesU\Post_Installs_Slim.cmd
GOTO Quit

:Simp
start .\Installs\FilesU\Apocalypse\Apocalypse_Install.cmd
start .\Installs\FilesU\Post_Installs_Simple.cmd
GOTO Quit

:Med
start .\Installs\FilesU\Apocalypse\Apocalypse_Install.cmd
start .\Installs\FilesU\Post_Installs_Min.cmd
GOTO Quit

:Full24
start .\Installs\FilesU\Apocalypse\Apocalypse_Install.cmd
start .\Installs\FilesU\Post_Installs_Full_2024.cmd
GOTO Quit

:Defen1
start .\WinUpdates\Defenderctrl\dControl.exe
GOTO Menu

:Defen2
start .\WinUpdates\Defenderctrl\Morphs_Disable_Defender.cmd
GOTO Menu

:DFirewall 
start .\WinUpdates\Defenderctrl\Morphs_Firewall_Disable.cmd
GOTO Menu

:EFirewall
start .\WinUpdates\Defenderctrl\Morphs_Firewall_Enable.cmd
GOTO Menu

:DismR
start .\WinUpdates\Wub\Morphs_Dism_Repair.cmd
GOTO Menu

:WinSXS
start .\WinUpdates\Wub\Morphs_Cleaning_WinSXS.cmd
GOTO Menu

:PauseUpdates
start .\WinUpdates\Wub\Morphs_Pause_Update_12-30-3000.cmd
GOTO MENU

:Wub
start .\WinUpdates\Wub\Wub_x64.exe
GOTO MENU

:22h2
start .\WinUpdates\19041\Morphs_Win10_Updates.cmd
GOTO MENU

:23h2
start .\WinUpdates\22621\Morphs_Win11_Updates.cmd
GOTO MENU

:24h2
start .\WinUpdates\26100\Morphs_Win11_Updates.cmd
GOTO MENU

:Reboot
color 0E
mode con:cols=78 lines=26
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
echo Are you sure you want to shutdown? 
echo if not you will need to close this window, otherwise press enter to continue
pause
shutdown /r /f /t 5 /c "Rebooting your computer in a few seconds...."
echo.
GOTO Quit

:Quit
cls
mode con:cols=78 lines=26
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
echo                        ** For more of my amazing releases **
echo            	*** Be sure to check out Morph69's uploads ***
echo			      *** @ https://www.teamos.xyz/ ***
echo                                   0_o    0_o   0_o
echo.         
timeout 3
EXIT