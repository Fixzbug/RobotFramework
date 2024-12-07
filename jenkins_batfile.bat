@echo off
IF NOT "%1"=="null" SET tag=-i %1
SET resultpath=%2
SET robotpath=%3

@REM echo input: %1
@REM echo tag: %tag%   
@REM echo resultpath: %resultpath%   
@REM echo robotpath: %robotpath%   
echo robot -T %tag% -L trace -d %resultpath% %robotpath%
robot -T %tag% -L trace -d %resultpath% %robotpath%