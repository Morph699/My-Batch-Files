@echo off
chcp 65001 >nul
CD /d "%~dp0"
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
echo Please wait whilst loading configs...
echo.
::================================================================================================
:: Run Script as Administrator

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo.
    echo  Requesting Administrative Privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

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

TITLE Corel Blocker Key Verificator

ECHO.
ECHO  - Corel Blocker Key Verificator...
ECHO.
ECHO  - Editing the hosts file with string "127.0.0.1                   iws.corel.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   mc.corel.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   apps.corel.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   deploy.akamaitechnologies.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   compute-1.amazonaws.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   origin-mc.corel.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   ipm.corel.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   dev1.ipm.corel.public.corel.net"
ECHO  - Editing the hosts file with string "127.0.0.1                   tsccloud.cloudapp.net"
ECHO  - Editing the hosts file with string "127.0.0.1                   2.18.12.147"
ECHO  - Editing the hosts file with string "127.0.0.1                   googletagmanager.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   corelstore.com"
ECHO  - Editing the hosts file with string "127.0.0.1                   www.corelstore.com"

attrib -r %WINDIR%\system32\drivers\etc\hosts
SET localhosttitle=# Corel Blocker Key Verificator
SET localhost01=127.0.0.1                   iws.corel.com
SET localhost02=127.0.0.1                   mc.corel.com
SET localhost03=127.0.0.1                   apps.corel.com
SET localhost04=127.0.0.1                   deploy.akamaitechnologies.com
SET localhost05=127.0.0.1                   compute-1.amazonaws.com
SET localhost06=127.0.0.1                   origin-mc.corel.com
SET localhost07=127.0.0.1                   ipm.corel.com
SET localhost08=127.0.0.1                   dev1.ipm.corel.public.corel.net
SET localhost09=127.0.0.1                   tsccloud.cloudapp.net
SET localhost10=127.0.0.1                   2.18.12.147
SET localhost11=127.0.0.1                   googletagmanager.com
SET localhost12=127.0.0.1                   corelstore.com
SET localhost13=127.0.0.1                   www.corelstore.com

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
SET NEWLINE=^& echo.

FIND /C /I "%localhosttitle%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhosttitle%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost01%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost01%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost02%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost02%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost03%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost03%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost04%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost04%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost05%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost05%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost06%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost06%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost07%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost07%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost08%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost08%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost09%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost09%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost10%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost10%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost11%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost11%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost12%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost12%>>%WINDIR%\system32\drivers\etc\hosts

SET NEWLINE=^& echo.

FIND /C /I "%localhost13%" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO ^%localhost13%>>%WINDIR%\system32\drivers\etc\hosts

attrib +r %WINDIR%\system32\drivers\etc\hosts
cls 
ECHO.
ECHO  - Corel Blocker Key Verificator...
ECHO.
ECHO  - DONE  
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
exit