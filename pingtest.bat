@echo off
setlocal enabledelayedexpansion
SET /A serverNum=1
SET /A errorIndex=0

::echo serverNum: %serverNum%
::echo errorIndex: %errorIndex%

:PINGTEST
if %serverNum% geq 29 goto OUTPUT

ping -n 1 192.168.%serverNum%.250 | find "TTL=" >nul
::if %errorlevel% equ 1 @echo %errorlevel%
if ERRORLEVEL 1 (
::!!!FOLLOWING LINE SHOULD BE REPLACED IF/WHEN SERVER 12 GOES LIVE!!!
	if %serverNum% equ 12 @goto INCREMENTSERVER
	SET errorArray[%errorIndex%]=%serverNum%
	goTo INCREMENTERROR
)

:INCREMENTSERVER
SET /A serverNum=%serverNum%+1
::echo INCREMENTED serverNum: %serverNum%
goto PINGTEST

:INCREMENTERROR
SET /A errorIndex=%errorIndex%+1
::echo Server Down:%errorArray[0]% -- ServerNum:%serverNum%
::echo INCREMENTED errorIndex: %errorIndex%
goto INCREMENTSERVER

:OUTPUT
if %errorIndex% equ 0 (
echo All Servers Responding
) else (
for /l %%n in (0,1,%errorIndex-1%) do (
   ping -n 1 192.168.!errorArray[%%n]!.250 | find "TTL=" >nul
   if ERRORLEVEL 1 (
	echo Server!errorArray[%%n]! offline
   ) else (
	echo Possible Issues with Server!errorArray[%%n]!
   )
)
)

goto :eof