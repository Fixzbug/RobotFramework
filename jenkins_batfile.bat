@REM @echo off
@REM IF NOT "%1"=="null" SET tag=-i %1
@REM SET resultpath=%2
@REM SET robotpath=%3

@REM echo input: %1
@REM echo tag: %tag%   
@REM echo resultpath: %resultpath%   
@REM echo robotpath: %robotpath%   
@REM echo robot -T %tag% -L trace -d %resultpath% %robotpath%
@REM robot -T %tag% -L trace -d %resultpath% %robotpath%

robot -T -i TC001 -L trace -d C:\ProgramData\Jenkins\.jenkins\workspace\Result\Automate\TC_login C:/ProgramData/Jenkins/.jenkins/workspace/Automate/Testcase/SIT/TC_login.robot