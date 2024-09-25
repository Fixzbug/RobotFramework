*** Settings ***
Resource    ${CURDIR}/../../../Import/Import.robot    # robotcode: ignore

*** Variables ***
${result_user}

*** Keywords ***

Horizontal_page (SET FORMAT DATA) 
    [Arguments]    ${index}    ${title_col}    ${data_row}    ${get_title_col1}    ${get_title_col2}
    [Documentation]
    ...
    IF  ${index} >= 0
        ${result_user}    JSONLibrary.Get Value From Json    ${data_from_excel_sheet_name}    $[?(@.'${title_col}' == '${data_row}')]
        IF  ${result_user} == ""
            BuiltIn.Log    Can't finding data on excel    WARN
        ELSE
            BuiltIn.Log    Read data on excel    WARN
            # BuiltIn.Log To Console    ${result_user}[${index}]
            # Common_keyword.KEYWORD_COMMOM_KEYWORD (OPEN INTRANET)
            Horizontal_feature.Horizontal_feature (READ EXCEL BY SHEETNAME)    ${index}    ${result_user}[${index}][${get_title_col1}]    ${result_user}[${index}][${get_title_col2}] 
        END
    
    END
    
  
        
