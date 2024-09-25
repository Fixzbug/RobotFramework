*** Settings ***
Resource    ${CURDIR}/../Import/Import.robot    # robotcode: ignore


*** Variables ***
# Excel
${All_data}
${data_from_sheet_name}
${amount_row_from_sheet_name}
${amount_col_from_sheet_name}

#Json
${data_from_json}

*** Keywords ***

KEYWORD_COMMOM_KEYWORD (OPEN INTRANET)
    [Documentation]    เปิด browser
    SeleniumLibrary.Open Browser    ${URL_Intranet}     ${BrowserChrome}
    SeleniumLibrary.Maximize Browser Window  
    SeleniumLibrary.Delete All Cookies

KEYWORD_COMMOM_KEYWORD (OPEN INTRANET API)
    [Documentation]    เปิด browser
    SeleniumLibrary.Open Browser    ${URL_Intranet}     ${BrowserChrome}
    SeleniumLibrary.Delete All Cookies

KEYWORD_COMMOM_KEYWORD (CLOSE ALL BROWSER)
    [Documentation]    ปิด browser
    BuiltIn.Run keyword and ignore error    SeleniumLibrary.Close all browsers

