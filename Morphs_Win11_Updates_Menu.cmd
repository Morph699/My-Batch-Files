@echo off
chcp 65001 >nul
CD /d "%~dp0"
TITLE Morphs Win11 Updates Menu
color 0E

:MENU
mode con:cols=85 lines=35
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
echo           ===== Morphs 2024 Windows Tools Menu =====
echo.
echo  A. Disable Defender Temporarily
echo  B. Disable Defender + Security modules Permanently - need to reboot to complete process
echo  C. Morphs Disable Firewall 
echo  D. Morphs Enable Firewall 
echo  E. Morphs Cleaning WinSXS - Clear space after updates
echo  F. Morphs Dism Repair - Repair your install (includes SFC)
echo.   
echo           ===== Morphs 2024 Windows Updates Menu =====
echo.
echo              1. Pause Automatic Updates till 30 Dec 3000
echo              3. Start Windows Update Blocker/Enabler (WUB64) v1.8
echo              5. Start Windows updates For Win11 22H2-23H2 (Up to Aug 2024)
echo              7. Start Windows updates For Win11 24H2 (Up to Aug 2024)
echo.
echo                             15. Reboot Computer 
echo. 
echo                 ===== PRESS 'Q' TO QUIT =======
echo.

SET INPUT=
SET /P INPUT=Select a number or letter: 

IF /I '%INPUT%'=='A' GOTO Defen1
IF /I '%INPUT%'=='B' GOTO Defen2
IF /I '%INPUT%'=='C' GOTO DFirewall 
IF /I '%INPUT%'=='D' GOTO EFirewall 
IF /I '%INPUT%'=='E' GOTO WinSXS
IF /I '%INPUT%'=='F' GOTO DismR
IF /I '%INPUT%'=='1' GOTO PauseUpdates
IF /I '%INPUT%'=='3' GOTO Wub
IF /I '%INPUT%'=='5' GOTO 23h2
IF /I '%INPUT%'=='7' GOTO 24h2
IF /I '%INPUT%'=='15' GOTO Reboot
IF /I '%INPUT%'=='Q' GOTO Quit

cls
mode con:cols=78 lines=26
color C0
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
echo             ===== *INVALID INPUT* =======
echo           Please select a number or letter
echo                or select 'Q' to quit 
echo         ===== *PRESS A KEY TO CONTINUE* ======
echo.            

PAUSE > NUL
GOTO MENU

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

:23h2
start .\WinUpdates\22621\Morphs_Win11_Updates.cmd
GOTO MENU

:24h2
start .\WinUpdates\26100\Morphs_Win11_Updates.cmd
GOTO MENU

:Reboot
color 1F
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
echo if not you will need to close this window otherwise press enter to continue
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
echo              ** For more of my amazing releases **
echo          *** Be sure to check out Morph69's uploads ***
echo	           *** @ https://www.teamos.xyz/ ***
echo                        0_o    0_o   0_o
echo.         
timeout 3
EXIT