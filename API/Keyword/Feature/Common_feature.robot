*** Settings ***
Library    ${CURDIR}/../../Resources/Library/Excel_reader.py
Library    ${CURDIR}/../../Resources/Library/Json_reader.py
Resource    ${CURDIR}/../../Import/Import.robot    # robotcode: ignore

*** Variables ***

${data_from_excel_sheet_name}
${data_from_sheet_name}   
${amount_row_from_sheet_name}    
${amount_col_from_sheet_name}    
${result_user}
${data_from_json} 

*** Keywords ***

KEYWORD_COMMON_FETURE (GET DATA FROM EXCEL WITHOUT COUNT)  
    [Arguments]     ${excel_file}    ${sheet_name}
    [Tags]    KEYWORD_COMMON_FETURE (GET DATA FROM EXCEL WITHOUT COUNT)  
    [Documentation]
    ...    อ่านข้อมูลทั้งหมดจาก sheet แบบไม่นับว่ามีกี่แถว

    ${data_from_excel_sheet_name}    Excel_Reader.Read_Excel_Sheet     ${drive}${excel_file}     ${sheet_name}   
    BuiltIn.Set global variable      ${data_from_excel_sheet_name}   


KEYWORD_COMMON_FETURE (GET DATA FROM EXCEL WITH COUNT)  
    [Arguments]     ${excel_file}    ${sheet_name} 
    [Tags]    KEYWORD_COMMON_FETURE (GET DATA FROM EXCEL WITH COUNT)  
    [Documentation]
    ...    อ่านข้อมูลทั้งหมดจาก sheet แบบไม่นับว่ามีกี่แถว

    ${All_data}    Excel_Reader.Read_Excel_Sheet_Count    ${drive}${excel_file}     ${sheet_name}

        ${data_from_sheet_name}=    BuiltIn.Set Variable    ${All_data}[0]    #ข้อมูลทั้งหมด ที่ index 0 
        ${amount_row_from_sheet_name}=    BuiltIn.Set Variable    ${All_data}[1]    #จำนวนแถวทั้งหมดที่ index 1
        ${amount_col_from_sheet_name}=    BuiltIn.Set Variable    ${All_data}[2]    #จำนวนแถวทั้งหมดที่ index 1

            BuiltIn.Set global variable    ${data_from_sheet_name}   
            BuiltIn.Set global variable    ${amount_row_from_sheet_name}    
            BuiltIn.Set global variable    ${amount_col_from_sheet_name}    


KEYWORD_COMMON_FETURE (GET DATA FROM JSON)  
    [Arguments]     ${json_file}
    [Tags]    KEYWORD_COMMON_FETURE (GET DATA FROM JSON)  
    [Documentation]
    ...     อ่านข้อมูลทั้งหมดจาก json แบบนับว่ามีกี่แถว

    ${data_from_json}    Json_reader.Parse Json File    ${drive}${json_file}
    # BuiltIn.Log To Console    ${data_from_json}
    BuiltIn.Set global variable    ${data_from_json}   



KEYWORD_COMMON_FETURE (GET RESULT FORM PARAMETOR) 
    [Arguments]    ${index}    ${title_col}    ${data_row}
    [Tags]    KEYWORD_COMMON_FETURE (READ DATA EXCEL BY SHEETNAME) SHOW RESULT USER
    [Documentation]
    ...     อ่านข้อมูลทั้งหมดจาก sheet แบบไม่นับว่ามีกี่แถว

    IF    ${index} >= 0
        ${result_user}    JSONLibrary.Get Value From Json    ${data_from_excel_sheet_name}    $[?(@.'${title_col}' == '${data_row}')]
        BuiltIn.Log To Console    ${result_user}
        IF  ${result_user} == ""
            BuiltIn.Log    [Can't Read data on excel]    WARN
        ELSE
            BuiltIn.Log    [Read data on excel]    WARN
            BuiltIn.Set global variable    ${result_user}    # ทำให้ตัวแปรค่านี้เรียกใช้ได้ทุกที่แต่ต้องระบุ key 
        END
    ELSE
       BuiltIn.Log To Console    Row Out of length 
    END


KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE
    [Arguments]    ${type}    
    [Tags]    KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE
    [Documentation]
    ...     ใช้กับ api

    ${json}=  Collections.Convert To Dictionary    ${data_from_json}[${type}]
    ${response}=    RequestsLibrary.POST    ${URL_API}     json=${json}

    BuiltIn.Should Be Equal As Numbers    ${response.status_code}    200
    # Convert response content from bytes to string
    ${response_string}=    BuiltIn.Convert To String    ${response.content}
    # Remove leading 'b' character from the string
    ${response_string}=    BuiltIn.Evaluate    '${response_string}'.lstrip('b')
    # Parse response content as JSON
    ${response_dict}=    BuiltIn.Evaluate    eval($response_string)
    # Log To Console    ${response_dict}[status]

    IF  ${response_dict}[status] == 200
        BuiltIn.Should Be Equal As Numbers   ${response_dict}[status]    200
        BuiltIn.Log To Console    "PASS CASE"
    ELSE
        BuiltIn.Log To Console    "FAIL CASE"
        BuiltIn.Log To Console    ${response_dict}[status]
        BuiltIn.Log To Console    "FAIL CASE"
    END
