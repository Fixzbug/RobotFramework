*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

# group user
${group_user}
${keys_group_user}
${result_excel_user}

# group label
${group_data_label}
${keys_group_data_label}
${result_excel_data_label}

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# set globle for debug
${DBUG}


*** Keywords ***

SET - FORMAT DATA EXCEL - SHEET USER FOR LOGIN
    [Arguments]   ${row}   
    ${result_excel_user}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
        ${group_user}    BuiltIn.Set Variable   ${result_excel_user}[0]         # แปลง data 
        BuiltIn.Set Global Variable    ${group_user}
            ${keys_group_user}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_user}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
            BuiltIn.Set Global Variable    ${keys_group_user}


SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY
    [Arguments]    ${row}
    ${result_excel_data_label}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
        ${group_data_label}    BuiltIn.Set Variable   ${result_excel_data_label}[0]    # แปลง data
        BuiltIn.Set Global Variable    ${group_data_label}
            ${keys_group_data_label}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_data_label}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
            BuiltIn.Set Global Variable    ${keys_group_data_label}


# Write data to excel
SET - DATA TO EXCEL 
    [Arguments]     ${excel_name}    ${sheet_name}    ${row}    ${column}    ${data}
    Excel_reader.SET DATA FROM EXCEL BY SHEET   file_name=${excel_file}[${excel_name}]   sheet_name=${sheet_name}    row=${row}    column=${column}    data=${data}


# Read data from excel
GET - DATA FROM EXCEL
    [Arguments]    ${excel_name}    ${sheet_name}
    Excel_reader.GET DATA FROM EXCEL BY SHEET    file_name=${excel_file}[${excel_name}]    sheet_name=${sheet_name}


# Verify label from excel
SET - VERIFY - TITLE 
    [Arguments]   ${excel_name}    ${sheet_name}    ${row}
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
        SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY    row=${row}    # get table label


# SET LOGIN
SET - LOGIN
    [Arguments]    ${DBUG}    ${excel_name}    ${sheet_name}    ${row}     
    BuiltIn.Set Global Variable    ${DBUG}    # set gbug all project
        GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
            SET - FORMAT DATA EXCEL- SHEET USER FOR LOGIN   row=${row}    # get user