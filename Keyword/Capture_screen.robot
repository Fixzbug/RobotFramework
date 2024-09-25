*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

${stamp_date}
${stamp_time}
${stamp_system}
${text_output}    

# Set Global Variable
${stamp_date}
${stamp_time}

# test tag
@{TEST_TAGS}

*** Keywords ***

#Create PIC format : DDMMYYY_TIMEHHMM_SYSTEM_TCNUMBER_NAMESCREEN.png
CAPTURE SCREEN DATE AND TIME
    ${stamp_date}    Get Current Date    result_format=%Y.%m.%d
    ${stamp_time}    Get Current Date    result_format=%H.%M.%S

        Set Global Variable    ${stamp_date}
        Set Global Variable    ${stamp_time}

CAPTURE_SCREEN (WITH TEXT)
    [Arguments]    ${text_output}    ${stamp_system}    ${option_capture}
    ${text_output}    BuiltIn.Set Variable    ${text_output}
    ${stamp_system}    BuiltIn.Set Variable    ${stamp_system}
    BuiltIn.Set Global Variable    ${text_output}
    BuiltIn.Set Global Variable    ${stamp_system}
    CAPTURE SCREEN DATE AND TIME
    IF    '${option_capture}' == 'intro_page'
        CAPTURE SCREEN (INTRO PAGE)
    ELSE IF    '${option_capture}' == 'current_page'
        CAPTURE SCREEN (CURRENT PAGE)
    END
            
            
CAPTURE SCREEN (INTRO PAGE)
    SeleniumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date}_${stamp_time} - ${stamp_system} - ${text_output}.png

CAPTURE SCREEN (CURRENT PAGE)
    SeleniumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date}_${stamp_time} - ${stamp_system} - TestCase_No_@{TEST_TAGS} - ${text_output}.png

CUSTOM CAPTURE WITH SYSTEM AND CASE
    [Arguments]    ${system_name}    ${case}
    CAPTURE SCREEN DATE AND TIME
    SeleniumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${system_name} @{TEST_TAGS} ${case}.png