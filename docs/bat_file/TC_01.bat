@echo off
:CheckAdmin
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    echo Running with Administrator privileges.
) else (
    echo Requesting Administrator privileges...
    powershell Start-Process '%~0' -Verb runAs
    exit /b
)

cd D:\CI_Robot\Repositories\CI_CUSTOMER_REQUEST\Testcase\SIT
robot -T -d D:\CI_Robot\Repositories\CI_CUSTOMER_REQUEST\Testcase\SIT -i TC_01 -L trace -d ../../Results/Inquiry_and_report/ALLCASE/ TC_Inquiry_and_report.robot
timeout /t 5 >nul