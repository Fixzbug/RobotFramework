*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${btn}     //input[@id="ctl00_phContents_ASPxRoundPanel1_B_submit"]

*** Keywords ***
WAIT FOR BUTTON TO BE DISABLED
    [Arguments]    ${locator}    ${timeout}=30s
    BuiltIn.Wait Until Keyword Succeeds    ${timeout}    1s    BUTTON SHOULD BE DISABLED    ${locator}
    ${attribute_value}=    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
    BuiltIn.Run Keyword If    '${attribute_value}' == 'None'    Return From Keyword    False
    RETURN    True

BUTTON SHOULD BE DISABLED
    [Arguments]    ${locator}
    ${attribute_value}=    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
    BuiltIn.Run Keyword If    '${attribute_value}' == 'None'    Fail    Button is not disabled yet

*** Test Cases ***
Check Button Disabled Status
    SeleniumLibrary.Open Browser    http://127.0.0.1:5500/RobotFramework/Testcase/btn.html    chrome
    SeleniumLibrary.Click Button    ${btn}
    ${is_disabled}=    WAIT FOR BUTTON TO BE DISABLED    ${btn}    timeout=30s
    Log    ${is_disabled}    WARN
    SeleniumLibrary.Close Browser