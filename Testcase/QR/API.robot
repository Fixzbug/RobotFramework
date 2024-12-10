*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
test Teardown    SeleniumLibrary.Close All Browsers

*** Variables ***

${URL_API1}    https://washmevmm.com/fridayqr-sdk-apiv2/api/pay.php
${PAYLOAD}     {"type": "native_pay", "device_id": "QR0001", "total_fee": 1}
${Browser_chrome}    chrome    


*** Test Cases ***
API PAYMENT
    [Tags]    API001
    BuiltIn.Log    TEST    WARN
    # SeleniumLibrary.Open Browser    url=${URL_API1}    browser=${Browser_chrome}

    # # Send POST request with form data
    # ${response}    RequestsLibrary.POST    ${URL_API1}    data=${PAYLOAD}    

    # # Validate the response
    # BuiltIn.Should Be Equal As Numbers    ${response.status_code}    200
    # ${json_data}    BuiltIn.Evaluate    dict(${response.json()})
    # BuiltIn.Log    ${json_data}    WARN
    # # BuiltIn.Log To Console    ${json_data}



