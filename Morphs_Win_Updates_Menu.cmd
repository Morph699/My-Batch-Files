@echo off
chcp 65001 >nul
CD /d "%~dp0"
TITLE Morphs Win Updates Menu

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
echo   		   ==== Morphs 2025 Windows Updates Menu =====
echo.
echo         	  1. Pause Automatic Updates till 31 Dec 3000
echo         	  2. Start Windows Update Blocker/Enabler
echo.
echo         	  3. Start Windows updates For Win10 21H2
echo         	   A. Start Win10_21H2_Silent_cab_updater
echo.
echo         	  4. Start Windows updates For Win10 22H2
echo         	   B. Start Win10_22H2_Silent_cab_updater
echo.
echo         	  5. Start Windows updates For Win11 23H2
echo         	   C. Start Win11_23H2_Silent_cab_updater
echo.
echo         	  6. Start Windows updates For Win11 24H2
echo         	   D. Start Win11_24H2_Silent_cab_updater
echo.
echo         	  9. Reboot Computer 
echo.
echo                   ===== OR PRESS 'Q' TO QUIT =======
SET INPUT=
SET /P INPUT=Please choose a number: 

IF /I '%INPUT%'=='1' GOTO PauseUpdates
IF /I '%INPUT%'=='2' GOTO Wub
IF /I '%INPUT%'=='3' GOTO 10.21H2.x64
IF /I '%INPUT%'=='A' GOTO 10.21H2.x64_cab
IF /I '%INPUT%'=='4' GOTO 10.22H2.x64
IF /I '%INPUT%'=='B' GOTO 10.22H2.x64_cab
IF /I '%INPUT%'=='5' GOTO 11.23H2.x64
IF /I '%INPUT%'=='C' GOTO 11.23H2.x64_cab
IF /I '%INPUT%'=='6' GOTO 11.24H2.x64
IF /I '%INPUT%'=='D' GOTO 11.24H2.x64_cab
IF /I '%INPUT%'=='9' GOTO Reboot
IF /I '%INPUT%'=='Q' GOTO Quit

cls
mode con:cols=78 lines=26
color C0

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
echo   		         ===== INVALID INPUT =======
echo.
echo      		   Please select a number between 1 and 9
echo      		         or select 'Q' to quit
echo.
echo   		     ===== PRESS A KEY TO CONTINUE ======

PAUSE > NUL
GOTO MENU

:PauseUpdates
start .\Wub\Morphs_Pause_Update_31-12-3000.cmd
GOTO MENU

:Wub
start .\Wub\Wub_x64.exe
GOTO MENU

:10.21H2.x64
start .\10.21H2.x64\Morphs_Win10_21H2_Updates.cmd
GOTO MENU

:10.21H2.x64_cab
start .\10.21H2.x64\Morphs_Win10_21H2_Silent_cab_updater.cmd
GOTO MENU

:10.22H2.x64
start .\10.22H2.x64\Morphs_Win10_22H2_Updates.cmd
GOTO MENU

:10.22H2.x64_cab
start .\10.22H2.x64\Morphs_Win10_22H2_Silent_cab_updater.cmd
GOTO MENU

:11.23H2.x64
start .\11.23H2.x64\Morphs_Win11_23H2_Updates.cmd
GOTO MENU

:11.23H2.x64_cab
start .\11.23H2.x64\Morphs_Win11_23H2_Silent_cab_updater.cmd
GOTO MENU

:11.24H2.x64
start .\11.24H2.x64\Morphs_Win11_24H2_Updates.cmd
GOTO MENU

:11.24H2.x64_cab
start .\11.24H2.x64\Morphs_Win11_24H2_Silent_cab_updater.cmd
GOTO MENU

:Reboot
color 1F
mode con:cols=78 lines=26

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
echo 			Are you sure you want to shutdown? 
echo		    if not you will need to close this window 
echo		 	otherwise press enter to continue
pause
shutdown /r /f /t 6 /c "Rebooting your computer in a few seconds...."
echo.
GOTO Quit

:Quit
cls
mode con:cols=78 lines=26
color 0E

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
echo             	 ** For more of my amazing releases **
echo        	    *** Be sure to check out Morph69's uploads ***
echo	         	   *** ^@^ https://www.teamos.xyz/ ***
echo.
echo Exiting shortly..         
timeout 3
EXIT