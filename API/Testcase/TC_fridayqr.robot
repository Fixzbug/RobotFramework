*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:8100/
${USERNAME}       admin
${PASSWORD}       admin

*** Test Cases ***
TC01 - Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text      //input[@formcontrolname='username']   ${USERNAME}
    Input Password  //input[@formcontrolname='password']    ${PASSWORD}
    Click Button    //button[@type='submit']

TC02 - report menu
    Click Button    //ion-card-content[@class="card-content card-content-ios"]  

    
TC02 - input date from report menu
    Input Text      //input[@formcontrolname='form']   01/05/2024
    Click Button    //button[@type='submit']


    # Page Should Contain    Welcome, ${USERNAME}
    # Close Browser

    