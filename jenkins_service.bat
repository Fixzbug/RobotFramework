@echo off
:: Jenkins Service Control Script with Interactive Menu

set SERVICE_NAME=jenkins

:menu
cls
echo ======================================
echo      Jenkins Service Control Script
echo ======================================
echo 1. Start Jenkins Service
echo 2. Stop Jenkins Service
echo 3. Restart Jenkins Service
echo 4. Exit
echo ======================================
set /p choice=Enter your choice [1-4]: 

if "%choice%"=="1" goto start
if "%choice%"=="2" goto stop
if "%choice%"=="3" goto restart
if "%choice%"=="4" goto end

echo Invalid choice! Please try again.
pause
goto menu

:start
echo Starting Jenkins service...
"C:\Program Files\Jenkins\jenkins.exe" start
pause
goto menu

:stop
echo Stopping Jenkins service...
"C:\Program Files\Jenkins\jenkins.exe" stop
pause
goto menu

:restart
echo Restarting Jenkins service...
"C:\Program Files\Jenkins\jenkins.exe" restart
pause
goto menu

:end
echo Exiting Jenkins Service Control Script. Goodbye!
pause
exit
