*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    JSONLibrary
Library    ${CURDIR}/../../Resources/Library/Json_reader.py


*** Variables ***
${BROWSER}    chrome
${URL}    file:///C:/Users/Makerz/Desktop/automate/index.html
${TEXTAREA_ID}    atext
${OUTPUT_FILE}    output.json
${KEY_TO_UPDATE}    card_number
${NEW_VALUE}      1111111111111111
${textarea_value}    
${json_data}
${updated_json}

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    # Maximize Browser Window

Get Textarea Data
    ${textarea_value}=    Get Value    id=${TEXTAREA_ID}
    Set Suite Variable    ${textarea_value}

Update JSON Data
    ${json_data}=    Json_reader.json_to_dict    ${textarea_value}
    # Log To Console    ${json_data}[identifier]
    Set To Dictionary    ${json_data}[identifier]   ${KEY_TO_UPDATE}   ${NEW_VALUE}
    ${updated_json}=    Json_reader.dict_to_json    ${json_data}
    Set Suite Variable    ${updated_json}
    # Log To Console    ${updated_json}


ReWrite to textarea 

    # Create File    ${OUTPUT_FILE}    ${updated_json}
    # ${file_content}=    Get File    ${OUTPUT_FILE}
    # # Log To Console    ${file_content}
    Wait Until Element Is Visible    ${TEXTAREA_ID}
    Execute JavaScript    document.getElementById('${TEXTAREA_ID}').value =  JSON.stringify(${updated_json}, null, 2)
    # Execute JavaScript    document.querySelector('${TEXTAREA_ID}').value = '${updated_json}'

*** Test Cases ***
Get Data From Textarea And Update JSON
    [Setup]    Open Browser To Page
    Get Textarea Data
    Update JSON Data
    ReWrite to textarea 
    # [Teardown]    Close Browser

