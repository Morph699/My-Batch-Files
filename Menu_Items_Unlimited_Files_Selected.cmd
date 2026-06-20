@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; Created by: Shawn Brink
REM ; http://www.sevenforums.com
REM ; Tutorial:  http://www.sevenforums.com/tutorials/131470-context-menu-items-missing-fix-when-more-than-15-files-selected.html
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "10000" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
