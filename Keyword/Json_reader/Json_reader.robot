*** Settings ***
Library    ${CURDIR}/../../Resources/Library/Json_reader.py
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# GET DATA FROM JSON
${data_from_json}

*** Keywords ***

GET DATA FROM JSON
    [Arguments]    ${json_file}
    [Tags]   GET DATA FROM JSON  
    ${data_from_json}    Json_reader.Parse Json File    file_path=${drive}${json_file}
    BuiltIn.Set global variable    ${data_from_json}  