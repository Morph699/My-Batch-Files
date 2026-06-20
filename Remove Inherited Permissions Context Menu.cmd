@echo off
chcp 65001 >nul
CD /d "%~dp0"
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; MajorGeeks.Com
REM ; Add Inherited Permissions Context Menu
REM ; https://www.majorgeeks.com/content/page/how_to_add_inherited_permissions_context_menu.html
Reg.exe delete "HKCR\*\shell\InheritedPermissions" /f
Reg.exe delete "HKCR\Directory\shell\InheritedPermissions" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
