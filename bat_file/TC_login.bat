@echo off
@REM :CheckAdmin
@REM NET SESSION >nul 2>&1
@REM if %errorLevel% == 0 (
@REM     echo Running with Administrator privileges.
@REM ) else (
@REM     echo Requesting Administrator privileges...
@REM     powershell Start-Process '%~0' -Verb runAs
@REM     exit /b
@REM )

robot -T -d D:/RobotFramework/Testcase/SIT/ -i TC002 -L trace -d D:/RobotFramework/Results/TC_login/ D:/RobotFramework/Testcase/SIT/TC_login.robot
@REM timeout /t 5 > nul