*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    SeleniumLibrary
Library    String


*** Variables ***
${BASE_URL}         http://127.0.0.1:5500/RobotFramework/Testcase/pdf.html
${PDF_LINK_XPATH}   //a[@id='pdfload']  # Change this to the actual XPath of the PDF link
${OUTPUT_DIR}       D:/automate/RobotFramework
${PDF_ENDPOINT}     /sc.pdf
${FILE_NAME}        sc.pdf


*** Keywords ***

Save Response Content

    [Arguments]    ${content}    ${file_path}
    Create Binary File    ${file_path}    ${content}

Switch To New Tab
    ${handles}=    Get Window Handles
    Switch Window    ${handles[-1]}


Change HTTPS to HTTP
    [Arguments]    ${url}
    RETURN    ${url.replace('https', 'http')}


Download PDF
    [Arguments]    ${url}    ${[dir]}
    
    
    Create Session    mysession    ${url}
    Log    ${url}    WARN
   
   
    ${response}=    GET On Session    mysession    ${PDF_ENDPOINT}   

    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.status_code}    WARN
    Save Response Content    ${response.content}    ${OUTPUT_DIR}/${FILE_NAME}


*** Test Cases ***

Download PDF From New Tab

    Open Browser    ${BASE_URL}    chrome

    Click Link    ${PDF_LINK_XPATH}

    Sleep    2s  # Wait for the new tab to open

    Switch To New Tab

    ${pdf_url}=    Get Location
    Log    ${pdf_url}     WARN

    ${pdf_url}    Set Variable    ${pdf_url.replace('https', 'http')}
    Log    ${pdf_url}    WARN

    ${pdf_url}    Split String    ${pdf_url}    separator=/
    Log    ${pdf_url}    WARN

    ${http}    Set Variable    ${pdf_url}[0]//${pdf_url}[2]
    Log    ${http}    WARN
    
    # Close Browser
    Download PDF    ${http}    ${OUTPUT_DIR}



