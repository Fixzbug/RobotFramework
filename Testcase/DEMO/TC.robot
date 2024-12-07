*** Settings ***
Library    SeleniumLibrary
Test Setup    SeleniumLibrary.Open Browser    url=${URL}    browser=${Browser_chrome}    
test Teardown    SeleniumLibrary.Close All Browsers

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${Browser_chrome}    chrome    
${username_locator}    id=username
${password_locator}    id=password

*** Test Cases ***
CASE01 - Login success
    [Tags]    CASE01

    ${username}    BuiltIn.Set Variable    tomsmith
    ${password}    BuiltIn.Set Variable    SuperSecretPassword!

    SeleniumLibrary.Input Text    ${username_locator}    ${username}
    SeleniumLibrary.Input Text    ${password_locator}    ${password}
    SeleniumLibrary.Click Button     class:radius
    SeleniumLibrary.Element Should Contain    id=flash    You logged into a secure area!
    SeleniumLibrary.Click Link    Logout
    SeleniumLibrary.Close Browser


CASE02 - Login failed - Password incorrect
    [Tags]    CASE02

    ${username}    BuiltIn.Set Variable    tomsmith
    ${password}    BuiltIn.Set Variable    Password!

    SeleniumLibrary.Input Text    ${username_locator}    ${username}
    SeleniumLibrary.Input Text    ${password_locator}    ${password}
    SeleniumLibrary.Click Button     class:radius

    ${status_login}    BuiltIn.Run Keyword And Return Status     SeleniumLibrary.Element Should Contain    id=flash    You logged into a secure area!
    BuiltIn.Log    ${status_login}    WARN
    ${error}    SeleniumLibrary.Get Text    id=flash

    IF  ${status_login} == False
        BuiltIn.Log    ${error}    WARN
        BuiltIn.fail    Your password is invalid!' is shown
    END
    

    
CASE03 - Login failed - Username not found
    [Tags]    CASE03

    ${username}    BuiltIn.Set Variable    tomholland
    ${password}    BuiltIn.Set Variable    Password!

    SeleniumLibrary.Input Text    ${username_locator}    ${username}
    SeleniumLibrary.Input Text    ${password_locator}    ${password}
    SeleniumLibrary.Click Button     class:radius

    ${status_login}    BuiltIn.Run Keyword And Return Status     SeleniumLibrary.Element Should Contain    id=flash    You logged into a secure area!
    BuiltIn.Log    ${status_login}    WARN
    ${error}    SeleniumLibrary.Get Text    id=flash

    IF  ${status_login} == False
        BuiltIn.Log    ${error}    WARN
        BuiltIn.fail    Your username is invalid!' is shown
    END
    

    

