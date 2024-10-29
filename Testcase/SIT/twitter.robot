*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore  
# Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

*** Test Cases *** 

Login
    [Tags]    TC002
    BuiltIn.Log    TEST    WARN
    SeleniumLibrary.Open Browser    url=https://www.saucedemo.com/    browser=Chrome
    SeleniumLibrary.Input Text    id=user-name    standard_user    
    SeleniumLibrary.Input Text    id=password    secret_sauce 
    SeleniumLibrary.Click Button    id=login-button


