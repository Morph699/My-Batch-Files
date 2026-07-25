@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; Created by: Shawn Brink
REM ; http://www.tenforums.com
REM ; Tutorial: http://www.tenforums.com/tutorials/2933-pin-quick-access-context-menu-remove-windows-10-a.html
Reg.exe delete "HKCR\Folder\shell\pintohome" /f
Reg.exe delete "HKLM\SOFTWARE\Classes\Folder\shell\pintohome" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
