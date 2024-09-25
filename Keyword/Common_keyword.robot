*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${sel_name_for_click_locator}
${sel_name_locator}

# Set Global
${Customer_xxx}
${get_list_value}
${sel_name_for_click_locator}
${sel_name_locator}
${attribute_value}
${new_date}

*** Keywords ***

CLOSE ALL BROWSERS TEARDOWN
    BuiltIn.Run keyword and ignore error    SeleniumLibrary.Close Browser


OPEN INTRANET
    SeleniumLibrary.Open Browser    ${URL_Intranet}     ${BrowserChrome}    headless=True 
        SeleniumLibrary.Maximize Browser Window  
            SeleniumLibrary.Delete All Cookies

# Smart use
SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}
   
    OPEN INTRANET
    CLICK SSO ICON
            
    [Timeout]    180s
    # หน้า login #User Authentication
    #Verify
    SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    60

    # LOG IN
    # User name
    SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
    SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
    # Password
    SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
    SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  

    # Click login button
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    USER_AUTHENTICATION
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
    SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}

# Work
CONVERT DATE FORMAT
    [Arguments]    ${original_date}

    [Documentation]    # ถ้าไม่กรอก ใส่ วันที่ ปัจุบันอัตโนมัติ
    # ถ้ากรอกแต่ไม่ตรง ให้แปลงให้ตรง ทั้ง วัน เดือน ปั แก้ปัญหา พ.ศ - ค.ศ , ค.ศ - พ.ศ

    IF  '${original_date}' == 'none'
        ${converted_date}=    GET DATE IN FORMATTED DATE TIME
        ${converted_date}    BuiltIn.Convert To String    ${converted_date} 
        BuiltIn.Log To Console    \nSkip date use local date->${converted_date}
    ELSE

        ${date_parts}=    String.Split String    ${original_date}    ${SPACE}
        ${date}=   BuiltIn.Set Variable   ${date_parts}[0]
        ${new_date}=    String.Split String    ${date}   -
        ${day}    BuiltIn.Convert To String    ${new_date}[2]    
        ${month}    BuiltIn.Convert To String    ${new_date}[1] 
        ${year}    BuiltIn.Convert To String    ${new_date}[0]
        
        ${current_date}    DateTime.Get Current Date    result_format=%d/%m/%Y  
        ${current_date}    String.Split String    ${current_date}    /
        ${current_thai_year}    BuiltIn.Evaluate    ${current_date}[2]+543

        IF  '${year}' != '${current_thai_year}'   
            ${years}=    BuiltIn.Set Variable    ${current_thai_year} 
        ELSE
            ${years}=    BuiltIn.Set Variable    ${year}
        END
        
        ${converted_date}=    BuiltIn.Catenate    ${day}/${month}/${years}
    END  

    RETURN    ${converted_date}

# Work
CONVERT DATA SPLIT AND STRIP BY OPTION
    [Arguments]    ${data}    ${option}=${SPACE}
    
    IF  '${data}' != 'none'
        @{list}    String.Split String    ${data}    ${option}
        # Use Evaluate to strip whitespace from each element in the list 
        ${stripped_list}=    BuiltIn.Evaluate    [item.strip() for item in @{list}]
        BuiltIn.Log To Console    '\nSplit String->${stripped_list}
    END

    RETURN    ${stripped_list}


# Work
CONVERT DATA SPLIT AND STRIP BY OPTION WITH SIGLE QUOTE
    [Arguments]    ${data}    ${option}=${SPACE}
    [Documentation]    #for case '  = Custome[r's] Mitigation_01
   
    @{list}    String.Split String    ${data}    ${option}
    # Use Evaluate to strip whitespace from each element in the list 
    ${stripped_list}=    BuiltIn.Evaluate    [item.strip() for item in @{list}]
    BuiltIn.Log To Console    '\nSplit String->${stripped_list}

    RETURN    ${stripped_list}

# Work
CONVERT DATA TO ANYTYPE BY OPTION
    [Arguments]    ${data}    ${option}

    IF  '${option}' == 'int'
        BuiltIn.Convert To Integer    ${data}
    ELSE IF  '${option}' == 'number'
        BuiltIn.Convert To Number    ${data}
    ELSE IF  '${option}' == 'string'
        BuiltIn.Convert To String    ${data}
    END

# Work
CONVERT STRING TO ALL TYPE BY OPTION 
    [Arguments]    ${data}    ${option}
    IF  '${option}' == 'upper'
        ${result}=    BuiltIn.Evaluate   '${data}'.upper()  
    ELSE IF  '${option}' == 'lower'
        ${result}=    BuiltIn.Evaluate   '${data}'.lower()  
    ELSE IF  '${option}' == 'capitalize'
        ${result}=    BuiltIn.Evaluate   '${data}'.capitalize()  
    END
    RETURN   ${result}
    

PRESS KEY
    [Arguments]    ${locator}    ${key}
    SeleniumLibrary.Press Keys    ${locator}    ${key}


CLICK SSO ICON
    BuiltIn.Sleep    1s
        SeleniumLibrary.Wait Until Element Is Visible    ${btn_SSO}    
            SeleniumLibrary.Click Element    ${btn_SSO}


CLICK BUTTON RELOAD
    [Arguments]    ${btn_reload}
    SeleniumLibrary.Wait Until Element Is Visible   ${btn_reload}
        SeleniumLibrary.Click Button    ${btn_reload}


CLICK ELEMENT BY LOCATOR
    [Arguments]    ${locator}   
    SeleniumLibrary.Click Element    ${locator}


CLICK ELEMENT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
        SeleniumLibrary.Click Element    ${locator}    


CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX
    [Arguments]    ${locator}    ${time_out}=60s

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
        SeleniumLibrary.Click Element    ${locator}


GET DATE IN FORMATTED DATE TIME
    [Documentation]    Set date time format by fotmat thai date
    [Arguments]        ${format_date}=%d/%m/%Y    ${add_date}=00

    ${current_date}    DateTime.Get Current Date    result_format=${format_date}   
    ${current_date}    String.Split String    ${current_date}    /
    ${current_thai_year}    BuiltIn.Evaluate    ${current_date}[2]+543
    ${current_thai_date}    BuiltIn.Set Variable    ${current_date}[0]/${current_date}[1]/${current_thai_year}

    RETURN    ${current_thai_date}


GET TITLE BY LOCATOR
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s     
        ${data}     SeleniumLibrary.Get text      ${locator}
    RETURN    ${data}  

GET TEXT AND VERIFY DATA
    [Arguments]    ${data}    ${locator}

    ${data_test}    SeleniumLibrary.Get Text    ${locator}                 
        BuiltIn.Should Be Equal    ${data}    ${data_test}

GET TEXT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
        ${text}    SeleniumLibrary.Get Text          ${locator}

    RETURN    ${text}

# Work
GET DATA JSON GET ONLY KEY
    [Arguments]    ${keys_group}

    ${indexed_keys}=    Get Dictionary Keys    ${keys_group}    sort_keys=False   
    RETURN    ${indexed_keys}     


GET DATA VALUE BY LOCATOR
    [Arguments]     ${name_tap}

    SeleniumLibrary.Wait Until Element Is Visible    ${name_tap} 
    @{data}     SeleniumLibrary.Get WebElements      ${name_tap}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        ${text}     SeleniumLibrary.Get value   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA VALUE BY LOCATOR AND SCROLL
    [Arguments]     ${name_tap}

    SeleniumLibrary.Wait Until Element Is Visible    ${name_tap} 
    @{data}     SeleniumLibrary.Get WebElements      ${name_tap}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get value   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        ${text}     SeleniumLibrary.Get Text   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR AND SCROLL
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get Text   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}

GET ELEMENT ATTRIBUTE BY LOCATOR
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get Element Attribute    ${i}    value
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}

#Start Get text ZONE -----------------------------------------------------------------------------------

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR TESTER
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text->${data}

# Work
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR
    [Arguments]     ${locator}    ${text}

    IF  '${text}' != 'none'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s        
            SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
                ${data}=    SeleniumLibrary.Get Text    ${locator}      
                    BuiltIn.Log To Console    '\nGet Text->${data}
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END

# Work 
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS
    [Arguments]     ${locator}    ${text}

    IF  '${text}' != 'none'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s    
            SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
                ${data}=    SeleniumLibrary.Get Text    ${locator}      
                    BuiltIn.Log To Console    '\nGet Text->${data}
                    BuiltIn.Should Be Equal As Strings    '${data}'    '${text}'
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END                   


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL NUMBERS
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text->${data}
                BuiltIn.Should Be Equal As Numbers    ${data}    ${text}        


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL INTEGERS
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text->${data}
                BuiltIn.Should Be Equal As Integers    ${data}    ${text}  

#End Get text ZONE -----------------------------------------------------------------------------------

#Start Get value ZONE -----------------------------------------------------------------------------------

# Work
WAIT FOR BUTTON TO BE DISABLED
    [Arguments]    ${locator}    ${timeout}=60s
    BuiltIn.Wait Until Keyword Succeeds    ${timeout}    1s    BUTTON SHOULD BE DISABLED    ${locator}
    ${attribute_value}=    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
    BuiltIn.Run Keyword If    '${attribute_value}' == 'None'    Return From Keyword    False
    RETURN    True

# Work
BUTTON SHOULD BE DISABLED
    [Arguments]    ${locator}
    ${attribute_value}=    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
    BuiltIn.Run Keyword If    '${attribute_value}' == 'None'    Fail    Button is not disabled yet



GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Value    ${locator}      
                BuiltIn.Log To Console    '\nGet Text->${data}


# Work
GET VALUE ELEMENT BY LOCATOR AND RETURN
    [Arguments]     ${locator}    ${timeout}=60s

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout} 
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Value    ${locator}
            IF  '${data}' == '${EMPTY}'
                ${data}=    BuiltIn.Set Variable    none
                BuiltIn.Log To Console    '\nGet Value->${data}
            ELSE
                BuiltIn.Log To Console    '\nGet Value->${data}
            END

    RETURN    ${data} 

# Work
GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS 
    [Arguments]     ${locator}    ${text}
    [Documentation]    # if ! none ทำ 

    IF  '${text}' != 'none'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s          
            ${data}=    SeleniumLibrary.Get Value    ${locator}      
                BuiltIn.Log To Console    '\nGet Value->${data}
                    BuiltIn.Should Be Equal As Strings    ${data}    ${text}
    ELSE
        BuiltIn.Log To Console    '\n->Skip
    END

# Work
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS 
    [Arguments]     ${locator}    ${text}
    [Documentation]    # if ! none ทำ 

    IF  '${text}' != 'none'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s    
            SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
                ${data}=    SeleniumLibrary.Get Value    ${locator}      
                    BuiltIn.Log To Console    '\nGet Value->${data}
                        BuiltIn.Should Be Equal As Strings    ${data}    ${text}
    ELSE
        BuiltIn.Log To Console    '\n->Skip
    END
                    


GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL NUMBERS 
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Value    ${locator}      
                BuiltIn.Log To Console    '\nGet Value->${data}
                BuiltIn.Should Be Equal As Numbers    ${data}    ${text}   


GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL INTEGERS 
    [Arguments]     ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Value    ${locator}      
                BuiltIn.Log To Console    '\nGet Value->${data}
                BuiltIn.Should Be Equal As Integers    ${data}    ${text}   


#End Get value ZONE -----------------------------------------------------------------------------------

#Start Get text and return ZONE -----------------------------------------------------------------------------------
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}
            IF  '${data}' == '${EMPTY}'
                ${data}=    BuiltIn.Set Variable    none
                    BuiltIn.Log To Console    '\nGet Text->${data}
            ELSE
                ${data}=    String.Strip String    ${data}
                    BuiltIn.Log To Console    '\nGet Text->${data}
            END
    RETURN    ${data}


#End Get text and return ZONE -----------------------------------------------------------------------------------

#Start Get value and return ZONE -----------------------------------------------------------------------------------
# Work
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN
    [Arguments]     ${locator}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Value    ${locator}
            IF  '${data}' == '${EMPTY}'
                ${data}=    BuiltIn.Set Variable    none
                    BuiltIn.Log To Console    '\nGet Value->${data}
            ELSE
                ${data}=    String.Strip String    ${data}
                    BuiltIn.Log To Console    '\nGet Value->${data}
            END
    RETURN    ${data}
    
#End Get value and return ZONE -----------------------------------------------------------------------------------

#Start Get text no split ZONE -----------------------------------------------------------------------------------

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT 
    [Arguments]    ${locator}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data}=    SeleniumLibrary.Get Text    ${locator}
            BuiltIn.Log To Console    '\nGet Text->${data}

    RETURN    ${data}

#End Get text no split ZONE -----------------------------------------------------------------------------------

#Start Get value no split ZONE -----------------------------------------------------------------------------------
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT 
    [Arguments]    ${locator}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data}=    SeleniumLibrary.Get Value    ${locator}
            BuiltIn.Log To Console    '\nGet Value->${data}
  
#End Get text no split ZONE -----------------------------------------------------------------------------------

#Start Get text no split and return ZONE -----------------------------------------------------------------------------------
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT AND RETURN
    [Arguments]    ${locator}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data}=    SeleniumLibrary.Get Text    ${locator}
            BuiltIn.Log To Console    '\nGet Text->${data}
    
    RETURN    ${data}

#End Get text no split and return ZONE -----------------------------------------------------------------------------------

#Start Get value no split and return ZONE -----------------------------------------------------------------------------------
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT AND RETURN 
    [Arguments]    ${locator}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data}=    SeleniumLibrary.Get Value    ${locator}
            BuiltIn.Log To Console    '\nGet Value->${data}
    
    RETURN    ${data}
#End Get value no split and return ZONE -----------------------------------------------------------------------------------

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR SPLIT OPTION AND RETURN LIST
    [Arguments]    ${locator}    ${option}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
    ${data}=    SeleniumLibrary.Get Text    ${locator}

        ${result}    String.Split String    ${data}    ${option}
        @{new_result}    BuiltIn.Set Variable    ${result}
            BuiltIn.Log To Console    '\nSplit String->${new_result}
            
    RETURN    @{new_result}


GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR SPLIT OPTION AND RETURN LIST
    [Arguments]    ${locator}    ${option}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
    ${data}=    SeleniumLibrary.Get Value    ${locator}

        ${result}    String.Split String    ${data}    ${option}
        @{new_result}    BuiltIn.Set Variable    ${result}
            BuiltIn.Log To Console    '\nSplit String->${new_result}
            
    RETURN    @{new_result}


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR SPLIT AND STRIP
    [Arguments]    ${locator}    ${option}

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
    ${data}=    SeleniumLibrary.Get Text    ${locator}

        ${result}    String.Split String    ${data}    ${option}
        ${result}=    String.Strip String    ${result}
            BuiltIn.Log To Console    '\nData Strip->${result}
        @{new_result}    BuiltIn.Set Variable    ${result}
            BuiltIn.Log To Console    '\nSplit String->${new_result}
            
    RETURN    @{new_result}


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP
    [Arguments]    ${locator}    ${data_excel}     

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    
    ${data_from_locator}=    SeleniumLibrary.Get Text    ${locator}
        ${result}=    String.Strip String    ${data_from_locator}
        BuiltIn.Log To Console    '\nData Strip->${result}

# Work
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR STRIP
    [Arguments]    ${locator}    ${data_excel}     
    [Documentation]    # if ! none ทำ 
    
    IF  '${data_excel}' != 'none'
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data_from_locator}=    SeleniumLibrary.Get Value    ${locator}
            ${result}=    String.Strip String    ${data_from_locator}
            BuiltIn.Log To Console    '\nData Strip->${result}
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END 


# Work
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS 
    [Arguments]    ${locator}    ${data_excel}     
    [Documentation]    # if ! none ทำ 

    IF  '${data_excel}' != 'none'
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data_from_locator}=    SeleniumLibrary.Get Text    ${locator}
            ${result}=    String.Strip String    ${data_from_locator}
            BuiltIn.Log To Console    '\nData Strip->${result}
                BuiltIn.Should Be Equal As Strings   ${result}    ${data_excel}
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END 

# Work 
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS SIGLE QUOTE
    [Arguments]    ${locator}    ${data_excel}     
    [Documentation]    #for case '  = Custome[r's] Mitigation_01


    SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
    ${data_from_locator}=    SeleniumLibrary.Get Text    ${locator}
        ${result}=    String.Strip String    ${data_from_locator}
        BuiltIn.Log To Console    '\nData Strip->${result}
            BuiltIn.Should Be Equal As Strings   ${result}    ${data_excel}


# Work
GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS
    [Arguments]    ${locator}    ${data_excel}     
    
    [Documentation]    # if ! none ทำ 

    IF  '${data_excel}' != 'none'
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
        ${data_from_locator}=    SeleniumLibrary.Get Value    ${locator}
            ${result}=    String.Strip String    ${data_from_locator}
            BuiltIn.Log To Console    '\nData Strip->${result}
            BuiltIn.Should Be Equal As Strings   ${result}    ${data_excel}
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END 
        
#Start Get text replace zone -----------------------------------------------------------------------------------    
GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE
    [Arguments]     ${text}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}->${text}

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS
    [Arguments]    ${txt_replace_locator}    ${text}

    ${locator}    String.Replace string    ${txt_replace_locator}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}->${text}
                BuiltIn.Should Be Equal As Strings    ${data}    ${text}      


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE AND EQUAL STRINGS
    [Arguments]     ${text}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}->${text}
                BuiltIn.Should Be Equal As Strings    ${data}    ${text}      


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE AND EQUAL NUMBERS
    [Arguments]     ${text}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}->${text}
                BuiltIn.Should Be Equal As Numbers    ${data}    ${text}    


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE AND EQUAL INTEGERS
    [Arguments]     ${text}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}->${text}
                BuiltIn.Should Be Equal As Integers    ${data}    ${text}    
#End Get text replace zone ----------------------------------------------------------------------------------- 

#Start Get text option replace zone ----------------------------------------------------------------------------------- 

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE OPTION 
    [Arguments]     ${locator_option}    ${text}

    ${locator}    String.Replace string    ${locator_option}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}
      

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE OPTION AND EQUAL STRINGS
    [Arguments]     ${locator_option}    ${text}

    ${locator}    String.Replace string    ${locator_option}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}
                BuiltIn.Should Be Equal As Strings    ${data}    ${text}      


GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE OPTION AND EQUAL NUMBER
    [Arguments]     ${locator_option}    ${text}

    ${locator}    String.Replace string    ${locator_option}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}
                BuiltIn.Should Be Equal As Numbers    ${data}    ${text}      



GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR REPLACE OPTION AND EQUAL INTEGERS
    [Arguments]     ${locator_option}    ${text}

    ${locator}    String.Replace string    ${locator_option}    ***replace***    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s    
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}        
            ${data}=    SeleniumLibrary.Get Text    ${locator}      
                BuiltIn.Log To Console    '\nGet Text Replace->${data}
                BuiltIn.Should Be Equal As Integers    ${data}    ${text}      


#End Get text option replace zone ----------------------------------------------------------------------------------- 

# Start Get text excel to verify page and replace locator zone -----------------------------------------------------------------------------------  

GET TEXT VERIFY DATA TEXT BY TABLE AND EXCEL AND EQUAL STRINGS
    [Arguments]     ${data_excel}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}        

        SeleniumLibrary.Wait Until Page Contains Element    ${locator}         # get text contains on table <tag td>
        ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 

            BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
            BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel} 

# Work set timeout
GET TEXT VERIFY DATA AND PAGE PEPLACR LOCATORT OPTION AND EQUAL STRINGS
    [Arguments]     ${locator_option}    ${data_excel}    ${timeout}=5s
    
    IF  '${data_excel}' != 'none'
        ${locator}    String.Replace string    ${locator_option}    ***replace***    ${data_excel}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}        

            SeleniumLibrary.Wait Until Page Contains Element    ${locator}             # get text contains on table <tag td>
            ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 

                BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
                BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel}
    ELSE
        BuiltIn.Log To Console    '\nSkip
    END 


# Work set timeout
GET TEXT VERIFY DATA AND PAGE PEPLACR LOCATORT OPTION AND EQUAL STRINGS SIGLE QUOTE
    [Arguments]     ${locator_option}    ${data_excel}    ${timeout}=5s
    [Documentation]    #for case '  = Custome[r's] Mitigation_01

        ${locator}    String.Replace string    ${locator_option}    ***replace***    ${data_excel}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}        

            SeleniumLibrary.Wait Until Page Contains Element    ${locator}             # get text contains on table <tag td>
            ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 

                BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
                BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel}


GET VALUE VERIFY DATA TEXT BY TABLE AND EXCEL
    [Arguments]     ${data_excel}

    ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}        

        SeleniumLibrary.Wait Until Page Contains Element    ${locator}         # get text contains on table <tag td>
        ${data_from_locator}=    SeleniumLibrary.Get Value     ${locator} 

            BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
            BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel} 


GET VALUE VERIFY DATA TEXT BY TABLE AND EXCEL OPTION
    [Arguments]     ${locator_option}    ${data_excel}

    ${locator}    String.Replace string    ${locator_option}    ***replace***    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}        

        SeleniumLibrary.Wait Until Page Contains Element    ${locator}         # get text contains on table <tag td>
        ${data_from_locator}=    SeleniumLibrary.Get Value     ${locator} 

            BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
            BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel} 


VERIFY FULL DATE TIME DATA TEXT BY TABLE AND EXCEL
    [Arguments]     ${data_excel}


        ${locator}    String.Replace string    ${txt_replace}    ***replace***    ${data_excel}
            SeleniumLibrary.Wait Until Element Is Visible    ${locator}        
                SeleniumLibrary.Wait Until Page Contains Element    ${locator}         # get text contains on table <tag td>

                    ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 
                    ${date}    String.Split String    ${data_from_locator}    separator=

                        BuiltIn.Log To Console    '\nData Web->${date}[0]<-With Excel->${data_excel}  
                        BuiltIn.Should Be Equal    '${date}[0]'    '${data_excel}'  
 
VERIFY DATA PAGE BY FILE INDEX
    [Arguments]      ${data_excel}    ${data_from_page} 

    BuiltIn.Should Be Equal     ${data_excel}    ${data_from_page} 

# End Get text excel to verify page and replace locator zone -----------------------------------------------------------------------------------  
  
INPUT TEXT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${data}    ${time_out}=60s

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
        SeleniumLibrary.Input Text    ${locator}    ${data}

CLEAR ELEMENT VALUE IN INPUT TEXT AREA
    [Arguments]     ${locator}  

    SeleniumLibrary.Wait until element is visible   ${locator}
        ${value}    SeleniumLibrary.Get value    ${locator}
            ${value_length}    BuiltIn.Get length    ${value}
            FOR    ${index}    IN RANGE    ${value_length} + 1
                SeleniumLibrary.Clear Element Text    ${locator}
                Clear Element Text    ${locator}
            END

WAITING FOR DATA UPDATE
    [Arguments]    ${time_sleep}=2s

    Sleep    ${time_sleep}

RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR 
   [Arguments]    ${locator}    ${time_out}=60s

    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    ${element_visible}=    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Element Should Be Visible    ${locator}
    
    RETURN    ${element_visible}

# Work 
WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR 
    [Arguments]    ${locator}    ${time_out}=60s

    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}

# Work
WAITING ELEMENT WHEN ELEMENT IS NOT VISIBLE BY LOCATOR 
    [Arguments]    ${locator}    ${time_out}=60s

    SeleniumLibrary.Wait Until Element Is Not Visible    ${locator}    ${time_out}


WAITING ELEMENT WHEN ELEMENT CONTAINS BY LOCATOR
    [Arguments]    ${locator}    ${text}

    SeleniumLibrary.Wait Until Element Contains    ${locator}    ${text}    
    
    
COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL     
    [Arguments]    ${index_excel}    ${index_page}    ${data_excel}    ${data_value_page}
    [Documentation]    # เปรียบเทียบระหว่าง EXCEL และ PAGE และ YAML โดยการ SHOULD BE EQUAL

    ${data_excel}    BuiltIn.Set Variable If    ${data_excel} == 'none'    data_is_empty    ${data_excel}
        ${data_from_page}    BuiltIn.Set Variable If    ${data_value_page} == '${EMPTY}'    data_is_empty    ${data_value_page}  
            VERIFY DATA PAGE BY FILE INDEX     ${data_excel}    ${data_from_page} 

# Work
REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID
    [Arguments]     ${locator}    ${data_excel}

    ${locator}      String.Replace string       ${locator}    ***replace***     ${data_excel}
    
    RETURN    ${locator}

REPLACE BY DATA EXCEL 2 FILE AND RETURN LOCATOR DATA GRID
    [Arguments]     ${locator}    ${data_excel_1}    ${data_excel_2}

    ${locator}           String.Replace string       ${locator}    ***replace***       ${data_excel_1}
        ${last_locator}      String.Replace string       ${locator}    ***replace_2***     ${data_excel_2}
    
    RETURN    ${last_locator}

# Work
SELECT IFRAME
    [Arguments]    ${iframe} 

    SeleniumLibrary.Select Frame    ${iframe}

# Work
UNSELECT IFRAME

    SeleniumLibrary.Unselect Frame

SELECT OPTION SELECT FROM LIST BY LABEL 

    [Arguments]    ${locator}    ${value}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s           
        SeleniumLibrary.Select From List By Label    ${locator}    ${value}

# Work
SELECT OPTION BY LABEL NAME INSIDE IFREAM
    [Arguments]    ${iframe}    ${locator}    ${value}

    SeleniumLibrary.Select Frame    ${iframe}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s       
            SeleniumLibrary.Select From List By Label    ${locator}    ${value}

SELECT OPTION BY LABEL NAME
    [Arguments]    ${lable_name}    ${value}

    ${locator}           String.Replace string       ${sel_name_for_click_locator}    ***replace***       ${lable_name}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}       
            SeleniumLibrary.Click Element    ${locator}

    ${locator_sel}           String.Replace string       ${sel_name_locator}    ***replace***       ${lable_name}
        SeleniumLibrary.Select From List By Label    ${locator_sel}    ${value}

SELCET OPTION
    [Arguments]    ${sel_locator}    ${txt_locator}    ${value}

    SeleniumLibrary.Wait Until Element Is Visible    ${sel_locator}    
        SeleniumLibrary.Click Element    ${sel_locator}
            
            SeleniumLibrary.Input Text    ${txt_locator}    ${value}
                SeleniumLibrary.Press Keys     ${txt_locator}       ENTER


###--------------------- SMART ---------------------###
GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE
    [Arguments]    ${locator}    ${data_excel}
    ${replace_locator}    String.Replace String    ${locator}    ***replace***    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${replace_locator}   15
    ${data_web}    SeleniumLibrary.Get Text    ${replace_locator}                 
    BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
    BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}


GET TEXT AND VERIFY DATA FROM EXCEL
    [Arguments]    ${locator}    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Text    ${locator}
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END
    # ${data_excel}    BuiltIn.Set Variable If      "${data_excel}" == "none"      Data is empty    ${data_excel}
    # ${data_web}      BuiltIn.Set Variable If      "${data_web}" == "${EMPTY}"    Data is empty    ${data_web}


GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING
    [Arguments]    ${locator}    ${data_excel}    ${mode}=both
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Text    ${locator}
    ${data_web}    String.Strip String    ${data_web}        mode=${mode}
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END

    

GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL
    [Arguments]    ${locator}    ${data_excel}    ${attribute}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute}  
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END

GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL
    [Arguments]    ${locator}    ${data_excel}    ${attribute}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute}               
    ${data_excel}    CONVERT DATE FORMAT    ${data_excel}
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END


GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL WITH STRIP STRING
    [Arguments]    ${locator}    ${data_excel}    ${attribute}    ${mode}=both
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute}      
    ${data_web}    String.Strip String    ${data_web}        mode=${mode}
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END


GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL AND REPLACE COMMA
    [Arguments]    ${locator}    ${data_excel}    ${attribute}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute}  
    ${data_web}    Evaluate    "${data_web}".replace(",", "").replace(".00", "")
    IF  "${data_excel}" == "none"
        BuiltIn.Log To Console    '\nSkip
    ELSE IF    "${data_web}"=="${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END


WRITE DATA TO EXCEL
    [Arguments]    ${file_path}    ${sheet_name}    ${row}    ${column}    ${data}        
    Excel_reader.Write_Excel_by_Sheet     ${file_path}    ${sheet_name}    ${row}    ${column}    ${data}