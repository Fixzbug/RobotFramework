*** Settings ***
Library     SeleniumLibrary
Library     Dialogs


*** Variables ***
${URL}      https://makerzcoding.com/robot/api/api.php?type=login&username=admin&password=admin


*** Test Cases ***
Test Case With User Dialog
    [Documentation]    This is a test case that includes a user dialog for manual verification.
    [Tags]    dialog
    Open Browser To Example Site
    Verify Content Manually
    Close Browser


*** Keywords ***
Open Browser To Example Site
    [Documentation]    This keyword opens the browser and navigates to the example site.
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain    Example Domain

Verify Content Manually
    [Documentation]    This keyword prompts the user to verify the content of the page.
    ${result}=    Get Selection From User    Is the content correct?    Yes    No
    IF    '${result}' == 'No'    Fail    Content is not as expected.
    Log    User confirmed the content is correct.

Close Browser
    [Documentation]    This keyword closes the browser.
    Close Browser
