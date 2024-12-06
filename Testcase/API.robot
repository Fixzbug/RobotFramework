*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
test Teardown    SeleniumLibrary.Close All Browsers

*** Variables ***

${URL_API1}    https://reqres.in/api/users/12
${URL_API2}    https://reqres.in/api/users/1234
${Browser_chrome}    chrome    

${EXPECTED_ID}    12
${EXPECTED_EMAIL}    rachel.howell@reqres.in
${EXPECTED_FIRST_NAME}    Rachel
${EXPECTED_LAST_NAME}    Howell
${EXPECTED_AVATAR}    https://reqres.in/img/faces/12-image.jpg


*** Test Cases ***
Get user profile success

    SeleniumLibrary.Open Browser    url=${URL_API1}    browser=${Browser_chrome}    
    ${response}    RequestsLibrary.GET    ${URL_API1}
    BuiltIn.Should Be Equal As Numbers    ${response.status_code}    200
    ${json_data}    BuiltIn.Evaluate    dict(${response.json()})
    BuiltIn.Should Be Equal As Numbers    ${json_data['data']['id']}    ${EXPECTED_ID}
    BuiltIn.Should Be Equal As Strings    ${json_data['data']['email']}    ${EXPECTED_EMAIL}
    BuiltIn.Should Be Equal As Strings    ${json_data['data']['first_name']}    ${EXPECTED_FIRST_NAME}
    BuiltIn.Should Be Equal As Strings    ${json_data['data']['last_name']}    ${EXPECTED_LAST_NAME}
    BuiltIn.Should Be Equal As Strings    ${json_data['data']['avatar']}    ${EXPECTED_AVATAR}


Get user profile but user not found
    
    SeleniumLibrary.Open Browser    url=${URL_API2}    browser=${Browser_chrome}  
    ${response}    RequestsLibrary.GET    ${URL_API2}
    BuiltIn.Should Be Equal As Numbers    ${response.status_code}    404
    ${json_data}    Evaluate    dict(${response.json()})
    BuiltIn.Should Be Equal As Strings    ${json_data}    {}
