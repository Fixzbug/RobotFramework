*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}
${value_customer_name}    
${value_team}    
${value_total_os_balance}    


*** Keywords ***
SET FEATURE - TYPE - 01 - GO TO - LOGIN PAGE - BY USER LEVEL
    [Arguments]    ${user_level}
    Login_page.LOGIN PAGE - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - LINK
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 01 - SELECT MENU - LOGIN PAGE
    [Arguments]    ${menu}    ${sub_menu}
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [MENU]    ${menu} 
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Login_page.LOGIN PAGE - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# input zone step 1
SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REQUEST TYPE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] CONTRACT NO
    Login_page.LOGIN PAGE - TYPE 01 - [SELECT] - [DROPDOWN] BUSINESS
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] ID CARD
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] CONTRACT NO 
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] ID CARD
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] BUSINESS  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# btn approve
SET FEATURE - TYPE - 01 - CLICK - APPROVE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# verify zone
SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Login_page.LOGIN PAGE - TYPE 01 - [SELCET] - [FRAME] IFRAME
    #BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LOADING]
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUEST DATE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TEAM
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] OD STATUS
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TOTAL O/S BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TOTAL PENALTY
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - REQUEST PAGE


# verify data zone
SET FEATURE - TYPE - 01 - VERIFY - DATA REQUEST PAGE - LOGIN PAGE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUEST DATE
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TEAM
    BuiltIn.Run Keyword And Continue On Failure    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] OD STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - REQUEST PAGE


# input zone step 2    
SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - RECEIPT NO - LOGIN PAGE 
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] RECEIPT NO
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] RECEIPT NO
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] RECEIPT NO ADD
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [TABLE] RECEIPT NO TABLE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    RECEIPT NO


# verify data zone
SET FEATURE - TYPE - 01 - VERIFY - DATA REQUEST PAGE - TOTAL PENALTY - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TOTAL O/S BALANCE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TOTAL PENALTY
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - REQUEST PAGE


SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - WAIVE AMOUNT - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] WAIVE AMOUNT
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] WAIVE AMOUNT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WAIVE AMOUNT


SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REASON - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] REASON
    Login_page.LOGIN PAGE - TYPE 01 - [SELECT] - [SELECT] REASON
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REASON


SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REASON NOTE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] REASON NOTE
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] REASON NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REASON NOTE


# verify table
SET FEATURE - TYPE - 01 - VERIFY - SEND TO - LOGIN PAGE
    [Arguments]    ${user_level}
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] SEND TO    ${user_level}
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    SEND TO


# verify note
SET FEATURE - TYPE - 01 - VERIFY - NOTE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# input data note
SET FEATURE - TYPE - 01 - INPUT - NOTE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# verify title popup
SET FEATURE - TYPE - 01 - VERIFY - APPROVE POPUP - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [TITLE] APPROVE 


SET FEATURE - TYPE - 01 - CLICK - APPROVE POPUP - CLICK OK - LOGIN PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Login_page.LOGIN PAGE - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK


# wait for check excel write
SET FEATURE - TYPE - 01 - SAVE DATA - WAIT MAKE REMARK NOTE - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [WAIT] - WAIT MAKE REMARK NOTE


# save data to excel zone
SET FEATURE - TYPE - 01 - SAVE DATA - REQUSET NO - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    SAVE DATA - REQUSET NO


# wait page display
SET FEATURE - TYPE - 01 - WAIT - VERIFY - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [WAIT] - [VERIFY] PAGE


# click back button
SET FEATURE - TYPE - 01 - CLICK BTN BACK
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] BACK


# logout
SET FEATURE - TYPE - 01 - CLICK - LOGOUT - LOGIN PAGE
    Login_page.LOGIN PAGE - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Login_page.LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] LOGOUT


SET FEATURE - TYPE - 01 - SAVE DATA TO EXCEL - BY STATE
    [Documentation]    # check pass and fail pass 1 time / fail 3 time

    IF  '${point}' == '1'    # ทำได้จบ flow

        ${count}    BuiltIn.Evaluate    1    # fix 1 time
        BuiltIn.Set Global Variable    ${count}    

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=9    data=${result_request_no}    # Rows global ,colum fix ,data global

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=28    data=${result_request_no}    # req no.

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=10    data=Request    # Rows global ,colum fix ,data global
        
        # wait for check excel write
        SET FEATURE - TYPE - 01 - SAVE DATA - WAIT MAKE REMARK NOTE - LOGIN PAGE

        # click logout button
        SET FEATURE - TYPE - 01 - CLICK - LOGOUT - LOGIN PAGE
        BuiltIn.Log    COUNT->${count}    WARN
       

    ELSE IF  '${point}' == '0'    # ทำผิด ให้ save error แล้วกดกลับ
        
        ${count}    BuiltIn.Evaluate    ${count} + 1    # counter 3 time for check fail 3 time process
        BuiltIn.Set Global Variable    ${count}    

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=9    data=${result_request_no}    # Rows global ,colum fix ,data global

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=10    data=FAIL    # Rows global ,colum fix ,data global
 
        # click back button
        SET FEATURE - TYPE - 01 - CLICK BTN BACK
        BuiltIn.Log    COUNT FAIL->${count}    WARN
 
        IF  '${count}' == '3'        # counter fail 3 time just logout end process   
            # click logout button
            SET FEATURE - TYPE - 01 - CLICK - LOGOUT - LOGIN PAGE
            BuiltIn.Log    LOGOUT AT FAIL->${count}    WARN
        END

    END