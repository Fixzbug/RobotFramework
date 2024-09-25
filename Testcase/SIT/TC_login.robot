*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore  
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

*** Variables ***
${DBUG}    FALSE
${user_level}
${Sheet_login}    User_Login
${Excel_login}    DATAFILE_WORKFLOW_USER_LOGIN
${Excel_name}    DATAFILE_WORKFLOW_TYPE_01
   
# FALSE ACTION WEB 
# TRUE ACTION ONLY EXCEL


*** Test Cases *** 
# TC001 - REQUEST WAIVE 01 - LOGIN PAGE     
#     [Tags]    TC001

#     BuiltIn.Set Global Variable    ${Excel_name}
    
#     ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

#     # read sheet user
#     Common_feature.SET - LOGIN    ${DBUG}    excel_name=${Excel_login}    sheet_name=${Sheet_login}    row=SYS_1    

#     # open browser
#     Login_page.LOGIN PAGE - TYPE 01 - OPEN INRANET

#     # go to page login input username password page 
#     Login_feature.SET FEATURE - TYPE - 01 - GO TO - LOGIN PAGE - BY USER LEVEL    user_level=${user_level}    # login web -> # P2503064  request send to P2510033  approve

#     # select menu
#     Login_feature.SET FEATURE - TYPE - 01 - SELECT MENU - LOGIN PAGE    menu=Work Process    sub_menu=Request Waive    # select menu

#     # select dropdown request type
#     Login_feature.SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - LOGIN PAGE     # select menu

#     # click approve
#     Login_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - LOGIN PAGE     # input data

#     # read data sheet 
#     Common_feature.GET - DATA FROM EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}
    
#     # read data label
#     Common_feature.SET - VERIFY - TITLE    excel_name=${Excel_name}    sheet_name=${type_01}    row=TITLE

#     # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Contract no, ID card, business
#     ${user_level}    BuiltIn.Evaluate    ${user_level} + 1    # Send to1 User_1 = P2510033
#     ${data_count_row}    BuiltIn.Evaluate    ${data_count_row} - 1
#     Login_page.SET FORMAT DATA TYPE 01 - USING    row=TC    start_at_case=1   end_at_case=${data_count_row}    user_level=${user_level}    # auto count row


TC002 - TEST
    [Tags]    TC002
    BuiltIn.Log    TEST    WARN
    BuiltIn.Sleep    10s