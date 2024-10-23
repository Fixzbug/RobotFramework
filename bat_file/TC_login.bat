@echo off
robot -T -d D:/RobotFramework/Testcase/SIT/ -i TC002 -L trace -d D:/RobotFramework/Results/TC_login/ D:/RobotFramework/Testcase/SIT/TC_login.robot
timeout /t 5 > nul