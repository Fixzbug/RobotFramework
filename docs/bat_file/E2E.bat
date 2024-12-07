@echo off
robot -T -d D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT -L trace -d ../../Results/CI_WORKFLOW_SYSTEM/E2E_01/ D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT/TC_Request_waive_01.robot
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

robot -T -d D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT -L trace -d ../../Results/CI_WORKFLOW_SYSTEM/E2E_01/ D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT/TC_Approve_request_penalty_01.robot
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

robot -T -d D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT -L trace -d ../../Results/CI_WORKFLOW_SYSTEM/E2E_01/ D:/Jenkins_agent/workspace/CI_ROBOT/REPOSITORIES/CI_WORK_FLOW/01_Waive_Penalty-UAT/Testcase/SIT/TC_Inquiry_01.robot
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%