*** Settings ***
Resource    ${CURDIR}/../../../Import/Import.robot    # robotcode: ignore


*** Keywords ***

SETUP [GET DATA TO PAGE ADMIN]
    [Arguments]    ${index}    ${title_col}    ${data_row}    ${get_title_col1}    ${get_title_col2}
    [Tags]    SETUP (GET DATA TO) [PAGE ADMIN]
    [Documentation]    
    ...    เรียกใช้ feature ย่อยของหน้านั้นๆ หรือฟังชั่นเล็กๆที่เขียนสำเร็จ
    Common_feature.KEYWORD_COMMON_FETURE (GET RESULT FORM PARAMETOR)    index=${index}    title_col=${title_col}   data_row=${data_row}   
    Common_keyword.KEYWORD_COMMOM_KEYWORD (OPEN INTRANET)
    Admin_feature.ADMIN FEATURE (SET LOGIN)    username=${result_user}[${index}][${get_title_col1}]    password=${result_user}[${index}][${get_title_col2}] 
    Capture_screen.CAPTURE_SCREEN (WITH TEXT)    text_output=loginpage   stamp_system=makerzlabs    option_capture=current_page
    Admin_feature.ADMIN FEATURE (SET LOGOUT)
    Common_keyword.KEYWORD_COMMOM_KEYWORD (CLOSE ALL BROWSER)
  
    
