*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}      http://127.0.0.1:5500/RobotFramework/Testcase/Basic/index.html


*** Test Cases ***
Handle JavaScript Alert
    Open Browser    ${URL}    chrome
    # Trigger the alert by clicking the button
    Click Element    id=alert-button
    Sleep    2s
    # Verify the alert is present
    Alert Should Be Present
