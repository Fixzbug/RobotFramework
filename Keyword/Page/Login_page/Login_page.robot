*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# request no
${result_request_no}

# write data
${Rows}
${point}
${count}


# set globle for debug
${DBUG}

*** Keywords ***

# SET FORMAT DATA TYPE 01 - WRITE
#     [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
#     ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
#     FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1 

#         ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
#             ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
#                 BuiltIn.Set Global Variable    ${group_data}

#                 ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[8]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
#                 ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[9]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 
                    
#                 IF  ${Request_No} == 'none' and ${State} == 'none'             # none, none -> make
                                        
#                     ${Rows}    BuiltIn.Evaluate    ${index} + 2                # +2 because add title at row 2 
#                     BuiltIn.Set Global Variable    ${Rows}   
#                     BuiltIn.Log    ----------------------------------------    WARN 
#                     BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
#                     BuiltIn.Log    ----------------------------------------    WARN

#                     # input Contract no, ID card, business
#                     Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REQUEST TYPE - LOGIN PAGE

#                     # click aprrove
#                     Login_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - LOGIN PAGE
                    
#                     # get data from web before run
#                     ${value_customer_name}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_customer_name}
#                     ${value_total_os_balance}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_total_os_balance}
#                     ${value_team}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_team}
                    
#                     IF  '${value_customer_name}' != 'none' and '${value_total_os_balance}' != 'none' and '${value_team}' != 'none'
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=11    data=${value_customer_name}  
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=13    data=${value_total_os_balance}    
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=18    data=${value_team}  
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=32    data=${value_customer_name}
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=16    data=${group_user}[${keys_group_user}[3]]    #P2503064  
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=29    data=${group_user}[${keys_group_user}[3]]    #P2503064  
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=33    data=${group_user}[${keys_group_user}[3]]    #P2503064
#                     ELSE
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=9    data=FAIL  
#                         Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_01}    row=${Rows}    column=10    data=FAIL  
#                     END  

#                     BREAK
                    
#                 END
              
#     END

SET FORMAT DATA TYPE 01 - USING
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}    ${user_level}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1 
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
            ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
                BuiltIn.Set Global Variable    ${group_data}

                ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[8]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
                ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[9]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 
                    
                IF  '${DBUG}' == 'TRUE'
                        BuiltIn.Log    ${result_excel}    WARN
                ELSE

                    IF  '${point}' == '0' and '${count}' == '3'    # case point = 0 mean error and counter fail 3 time just Break
                        BREAK
                    ELSE IF  '${point}' == '1' and '${count}' == '1'    # case point = 1 mean pass and counter fix 1 time just Break
                        BREAK
                    END

                    IF  ${Request_No} == 'none' and ${State} == 'none' and '${count}' <= '3'             # none, none -> make
                                           
                        ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
                        BuiltIn.Set Global Variable    ${Rows}   
                        BuiltIn.Log    ----------------------------------------    WARN 
                        BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
                        BuiltIn.Log    ----------------------------------------    WARN

                        # input Contract no, ID card, business
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REQUEST TYPE - LOGIN PAGE

                        # click aprrove
                        Login_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - LOGIN PAGE
                        
                        # verify lable
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - LOGIN PAGE    
            
                        # verify data
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - DATA REQUEST PAGE - LOGIN PAGE     

                        # กรอก receipt no
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - RECEIPT NO - LOGIN PAGE

                        # verify data
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - DATA REQUEST PAGE - TOTAL PENALTY - LOGIN PAGE

                        # กรอก waive amount
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - WAIVE AMOUNT - LOGIN PAGE

                        # เลือก reason
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REASON - LOGIN PAGE

                        # กรอก reason note
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - REASON NOTE - LOGIN PAGE

                        # verify title -> send to , note ,  input send to , note 
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - SEND TO - LOGIN PAGE    user_level=1   # Send to User_1 = P2510033

                        # verify note
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - NOTE - LOGIN PAGE

                        # input data note
                        Login_feature.SET FEATURE - TYPE - 01 - INPUT - NOTE - LOGIN PAGE

                        # กด approve
                        Login_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - LOGIN PAGE    

                        # verify pop up
                        Login_feature.SET FEATURE - TYPE - 01 - VERIFY - APPROVE POPUP - LOGIN PAGE    

                        # verify pop up
                        Login_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE POPUP - CLICK OK - LOGIN PAGE   

                        # get data at current page request no
                        Login_feature.SET FEATURE - TYPE - 01 - SAVE DATA - REQUSET NO - LOGIN PAGE  

                        # wait for check excel write
                        Login_feature.SET FEATURE - TYPE - 01 - SAVE DATA TO EXCEL - BY STATE 
                        
                    END
                END
    END

                
# add new
LOGIN PAGE - TYPE 01 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
LOGIN PAGE - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        LOGIN PAGE - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        LOGIN PAGE - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        LOGIN PAGE - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        LOGIN PAGE - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        LOGIN PAGE - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
LOGIN PAGE - TYPE 01 - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}    ${user_level}

    [Timeout]    180s
        # หน้า login #User Authentication
        #Verify
        SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    timeout=60s    # User Authentication
        
        # Username
        SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
        SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
        # Password
        SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
        SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
            
        # Click login button
        Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER LEVEL - ${user_level} USER - ${username}
        SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
        SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}


# LOGIN PAGE - TYPE 01 - [CLICK] - LINK 
#     ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
#     Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# # wait update page 
# LOGIN PAGE - TYPE 01 - [WAIT] - [VERIFY] PAGE
#     Common_keyword.WAITING FOR DATA UPDATE    1s    

# LOGIN PAGE - TYPE 01 - [CLICK] - [MENU]
#     [Arguments]    ${menu} 
#     ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# LOGIN PAGE - TYPE 01 - [CLICK] - [SUB MENU]
#     [Arguments]    ${sub_menu} 
#     ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# # เลือก iframe
# LOGIN PAGE - TYPE 01 - [SELCET] - [FRAME] IFRAME
#     Common_keyword.SELECT IFRAME    ${iframe_locator}

# # เลือก iframe
# LOGIN PAGE - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
#     Common_keyword.UNSELECT IFRAME   

# # เลือก request type
# LOGIN PAGE - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE
#     Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_request_type_locator}    ${group_user}[${keys_group_user}[1]]
    
# LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] APPROVE
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

# #verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] BUSINESS
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_business}    5s          

# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] CONTRACT NO 
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_contract_no}    5s          

# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] ID CARD 
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_id_card}    5s       

# # input 
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] ID CARD 
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_id_card}    ${group_data}[${keys_group_data_label}[2]]     

# LOGIN PAGE - TYPE 01 - [SELECT] - [DROPDOWN] BUSINESS
#     Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_business}    ${group_data}[${keys_group_data_label}[3]]   
  
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] CONTRACT NO  
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_contract_no}    ${group_data}[${keys_group_data_label}[4]]    
  
# #verify 
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUEST TYPE
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_request_type}    ${group_data_label}[${keys_group_data_label}[1]]   
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CUSTOMER ID
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CUSTOMER NAME
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_customer_name}    ${group_data_label}[${keys_group_data_label}[10]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] BUSINESS
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_business}    ${group_data_label}[${keys_group_data_label}[3]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] CONTRACT NO
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_contract_no}    ${group_data_label}[${keys_group_data_label}[4]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUEST DATE
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_request_date}    ${group_data_label}[${keys_group_data_label}[16]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] REQUESTER
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_requester}    ${group_data_label}[${keys_group_data_label}[15]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TEAM
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_team}    ${group_data_label}[${keys_group_data_label}[17]]
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] OD STATUS
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_status}    ${group_data_label}[${keys_group_data_label}[11]]

# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TOTAL O/S BALANCE
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_total_os_balance}    ${group_data_label}[${keys_group_data_label}[12]]

# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABELS] TOTAL PENALTY
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_total_penalty}    ${group_data_label}[${keys_group_data_label}[13]]

# # verify loading
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LOADING] 
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=10s

# #verify data
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUEST TYPE
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_request_type}    ${group_data}[${keys_group_data_label}[1]]    
      
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CUSTOMER ID
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS   ${txt_customer_id}    ${group_data}[${keys_group_data_label}[2]]    

# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] BUSINESS
#     Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_business}    ${group_data}[${keys_group_data_label}[3]]    
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CONTRACT NO
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_contract_no}    ${group_data}[${keys_group_data_label}[4]]    
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] CUSTOMER NAME
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_customer_name}    ${group_data}[${keys_group_data_label}[10]]    
     
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] OD STATUS
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_status}    ${group_data}[${keys_group_data_label}[11]]    

# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUEST DATE
#     ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[16]]
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_request_date}    ${con_date}    
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] REQUESTER
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_requester}    ${group_data}[${keys_group_data_label}[15]]    
    
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TEAM
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_team}    ${group_data}[${keys_group_data_label}[17]]    
    

# #verify
# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TOTAL O/S BALANCE
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_total_os_balance}    ${group_data}[${keys_group_data_label}[12]]    

# LOGIN PAGE - TYPE 01 - [VERIFY] - [DATA] TOTAL PENALTY
#     Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_total_penalty}    ${group_data}[${keys_group_data_label}[13]]    

# #verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] RECEIPT NO
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_receipt_no}       

# # input 
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] RECEIPT NO
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_receipt_no}    ${group_data}[${keys_group_data_label}[5]]   

# # button 
# LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] RECEIPT NO ADD
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_receipt_add}

# # veify
# LOGIN PAGE - TYPE 01 - [VERIFY] - [TABLE] RECEIPT NO TABLE
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${table_receipt}    

# # verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] WAIVE AMOUNT
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_waive_amount}       

# # input 
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] WAIVE AMOUNT
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_waive_amount}    ${group_data}[${keys_group_data_label}[14]]   

# #verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] REASON
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_reason}       

# # input 
# LOGIN PAGE - TYPE 01 - [SELECT] - [SELECT] REASON
#     Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_reason}    ${group_data}[${keys_group_data_label}[18]]  

# #verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] REASON NOTE
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_reason_note}       

# # input 
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] REASON NOTE
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_reason_note}    ${group_data}[${keys_group_data_label}[19]]   

# # verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] SEND TO
#     [Arguments]    ${user_level}
#     ${status}=    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_send_to}    10s
#     IF  '${status}' == 'True'
#         IF  '${user_level}' == '0'
#             Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_data}[${keys_group_data_label}[15]]    # Send to 1 = P2503064
#         ELSE IF  '${user_level}' == '1'
#             Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_data}[${keys_group_data_label}[23]]    # Send to 2 = P2510033 
#         ELSE IF  '${user_level}' == '3'
#             Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_data}[${keys_group_data_label}[24]]    # Send to 3 = P2503067 
#         ELSE IF  '${user_level}' == '4'
#             Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_data}[${keys_group_data_label}[25]]    # Send to 4 = P2106010 
#         ELSE IF  '${user_level}' == '5'
#             Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_data}[${keys_group_data_label}[26]]    # Send to 5 = KIMURA 
#         END
#     END


# # verify   
# LOGIN PAGE - TYPE 01 - [VERIFY] - [LABEL] NOTE
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_note}       

# # input 
# LOGIN PAGE - TYPE 01 - [INPUT] - [TEXT] NOTE
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_note}    ${group_data}[${keys_group_data_label}[20]]   
    

# # verify title popup
# LOGIN PAGE - TYPE 01 - [VERIFY] - [TITLE] APPROVE 
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

# LOGIN PAGE - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

# LOGIN PAGE - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    


# # get requst no save to excel
# LOGIN PAGE - TYPE 01 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    
#     # wait finish loading..
#     LOGIN PAGE - TYPE 01 - [VERIFY] - [LOADING]

#     ${state}=    Common_keyword.RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${table_manager_locator}    30s
#     BuiltIn.Log    STATE SAVE->${state}    WARN

#     IF  '${state}' == 'True'    # ถ้าเจอ
#         ${point}    BuiltIn.Evaluate    1
#         BuiltIn.Set Global Variable    ${point}
#         Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_cancel_req_locator}    5s        # makesure title is true
#         Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_request_no}    5s                         # get req No to save
#         ${result_request_no}=    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_request_no}
#         BuiltIn.Log    REQ_NO_SAVE->${result_request_no}    WARN
#         BuiltIn.Set Global Variable    ${result_request_no}

#     ELSE IF  '${state}' == 'False'    # ถ้าไม่เจอ
#         ${point}    BuiltIn.Evaluate    0
#         BuiltIn.Set Global Variable    ${point}
#         Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_req_locator}    5s               # verify table before title -> Request
#         Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_error}    5s 
#         ${msgerror}=    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT    ${txt_error}  
#         BuiltIn.Log    MSG ERROR->${msgerror}    WARN
#         ${result_request_no}    BuiltIn.Set Variable    ${msgerror}    
#         BuiltIn.Set Global Variable    ${result_request_no}

#     END

# # wait for check excel write
# LOGIN PAGE - TYPE 01 - [WAIT] - WAIT MAKE REMARK NOTE
#     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_request_no}    10s    # get req No to save
#     Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_note}    ${group_data}[${keys_group_data_label}[20]] 

# # btn back 
# LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] BACK
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_back}    10s

# # logout
# LOGIN PAGE - TYPE 01 - [CLICK] - [BTN] LOGOUT
#     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    10s