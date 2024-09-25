@echo off
robot -T -d D:/RobotFramework/Testcase/SIT -L trace -d ../../Results/TC_login/ D:/RobotFramework/Testcase/SIT/TC_login.robot
timeout /t 5 > nul