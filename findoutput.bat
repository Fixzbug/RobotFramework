@echo off
SETLOCAL EnableDelayedExpansion

REM Initialize variables
SET "NewestFile="
REM Loop through the files and find the newest *.xml file
FOR /F "eol=| delims=" %%I IN ('DIR "D:\Automate\RobotFramework\Results\TC_login\*.xml" /A-D /B /O-D /TW 2^>nul') DO (
    SET "NewestFile=%%I"
    GOTO FoundFile
)

REM If no *.xml file found, echo a message and exit
ECHO No *.xml file found!
GOTO :EOF

REM Once the newest file is found, extract the desired substring
:FoundFile

REM Extract substring
SET "NewestFileSubstring=!NewestFile:~6,16!"
ECHO !NewestFileSubstring!
ENDLOCAL