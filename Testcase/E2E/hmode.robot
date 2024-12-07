*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HEADLESS}    --headless
${BROWSER}     Chrome

*** Test Cases ***
Test Headless Chrome
    Open Browser    https://www.google.co.th/    ${BROWSER}    headless=True
    [Teardown]    Close Browser