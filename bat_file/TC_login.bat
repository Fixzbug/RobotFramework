@echo off
robot -T -d D:/Automate/RobotFramework/Testcase/SIT -L trace -d ../../Results/TC_login/ D:/Automate/RobotFramework/Testcase/SIT/TC_login.robot
timeout /t 10 > nul