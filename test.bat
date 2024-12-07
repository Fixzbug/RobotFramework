@echo off
robot -T -i CASE01 -L trace -d C:/ProgramData/Jenkins/.jenkins/workspace/Result/Automate/TC_login C:/ProgramData/Jenkins/.jenkins/workspace/Automate/Testcase/TC.robot
timeout /t 5 > nul