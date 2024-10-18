*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore  
# Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

*** Test Cases *** 

Login
    [Tags]    TC002
    BuiltIn.Log    TEST    WARN
    SeleniumLibrary.Open Browser    url=https://x.com/home    browser=Chrome

