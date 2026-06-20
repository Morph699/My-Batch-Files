@echo off
chcp 65001 >nul
CD /d "%~dp0"
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; Created by: Shawn Brink
REM ; Created on: August 30th 2017
REM ; Updated on: April 8, 2021
REM ; Tutorial: https://www.tenforums.com/tutorials/92433-enable-disable-remote-desktop-connections-windows-10-pc.html
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "updateRDStatus" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "UserAuthentication" /t REG_DWORD /d "0" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
