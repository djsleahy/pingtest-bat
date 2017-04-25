@echo off
setlocal enabledelayedexpansion



set /A runs=0
set /A limit=1000
echo RUNNING %limit% TIMES>results.txt
echo RUNNING %limit% TIMES
:LOOP
set /A runs=%runs%+1
echo Run:%runs%
CALL pingtest.bat>>results.txt
if %runs% geq %limit% @goto :eof
goto LOOP