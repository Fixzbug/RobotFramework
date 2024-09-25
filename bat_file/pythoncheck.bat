@echo off
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed or not in the system PATH.
) ELSE (
    python --version
)
pause
