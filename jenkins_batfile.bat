@echo off
IF NOT "%1"=="null" SET tag=-i %1
SET resultpath=%2
SET robotpath=%3

echo input: %1
echo robot -T %tag% -L trace -d %resultpath% %robotpath%
robot -T %tag% -L trace -d %resultpath% %robotpath%