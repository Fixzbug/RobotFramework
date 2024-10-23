*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://example.com
${USERNAME}   test_user
${PASSWORD}   password123

*** Test Cases ***
User Can Successfully Log In
    [Documentation]  This test checks if a user can log into the system successfully.
    Given the user is on the login page
    When the user enters valid credentials
    Then the user should be logged in successfully

*** Keywords ***
Given the user is on the login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

When the user enters valid credentials
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button

Then the user should be logged in successfully
    Element Should Be Visible    xpath=//div[@id="welcome-message"]
    [Teardown]    Close Browser
