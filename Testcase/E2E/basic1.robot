*** Settings ***
Library     DateTime    # Make sure this line is present
Library     SeleniumLibrary
Library     ${CURDIR}/../../Resources/Library/TypeChecker.py
Library     ${CURDIR}/../../Resources/Library/MyLibrary.py


*** Variables ***
${URL}              https://www.google.co.th/
${Browser}          Chrome

@{list1}            1    2    3    4    5    6    7    8
${list2}            1    2    3    4    5    6    7    8
${Var_Scalar}       Hello World
@{Var_DataList}     Data1    Data2    Data3    Data4
&{Var_DataDict}     Value1=DTC1    Value2=DTC2    Value3=DTC3

${ENDTEST}          Finished Test!

${ELEMENT}          //input[@class='gNO89b']

${date_and_Time}    ${EMPTY}


*** Test Cases ***
Example date
    ${date}=    GET CURRENT    # ${date}=    ก็คือการกำหนดตัวแปล ว่าให้ทำกับอะไร
    BuiltIn.Log To Console    ${date.day}
    BuiltIn.Should Be True    '${date.day}' == '${date.day}'    # ใช้กับ string
    ${time}=    Add Time To Time    1 minute    42
    BuiltIn.Should Be Equal    ${time}    ${102}

Example Evaluate
    ${a}=    BuiltIn.Set Variable    1    # กำหนดตัวแปลแบบเจาะจง
    ${b}=    BuiltIn.Set Variable    1

    ${x}=    BuiltIn.Evaluate    ${a} == ${b}    # ใช้กับตัวแปลต้องการการ มี codition ทีหลัง
    BuiltIn.Log To Console    ${x}
    ${x}=    BuiltIn.Evaluate    ${a} >= ${b}
    BuiltIn.Log To Console    ${x}
    ${x}=    BuiltIn.Evaluate    ${a} <= ${b}
    BuiltIn.Log To Console    ${x}
    ${x}=    BuiltIn.Evaluate    ${a} != ${b}
    BuiltIn.Log To Console    ${x}
    ${x}=    BuiltIn.Evaluate    ${a} and ${b}
    BuiltIn.Log To Console    ${x}
    ${x}=    BuiltIn.Evaluate    ${a} or ${b}
    BuiltIn.Log To Console    ${x}

Example For loop
    FOR    ${index}    IN    @{list1}
        BuiltIn.Log To Console    ${index}
    END

Example For loop 2
    ${x}=    BuiltIn.Set Variable    5
    FOR    ${index}    IN    @{list1}
        BuiltIn.Log To Console    ${index}
        IF    '${index}' == '${x}'    BREAK
    END

Example For loop 3
    FOR    ${index}    IN    @{list1}
        ${remainder}=    BuiltIn.Evaluate    ${index} % 2
        IF    ${remainder} == 0
            BuiltIn.Log To Console    ${index} is even
        ELSE
            BuiltIn.Log To Console    ${index} is odd
        END
    END

Example crate list
    ${test}=    BuiltIn.Create List    a    b    c
    BuiltIn.Log To Console    ${test}[0]

Example crate list Dictionary
    ${test}=    BuiltIn.Create Dictionary    index0=aa    index1=bb    index2=cc
    BuiltIn.Log To Console    ${test}[index0]

Example Test string
    ${test}=    BuiltIn.Set Variable    YourStringHere
    BuiltIn.Log To Console    ${test}

Example Test number + string
    ${number}=    BuiltIn.Set Variable    42
    ${string}=    BuiltIn.Set Variable    YourStringHere
    ${result}=    BuiltIn.Catenate    ${string}    ${number}
    BuiltIn.Log To Console    ${result}

TEST Continue For Loop
    BuiltIn.Comment    ทำทุกเลขยกเว้นเลขที่เช็คไม่ทำ ข้ามเลย
    FOR    ${var}    IN    @{list1}
        IF    '${var}' == '5'    CONTINUE
        BuiltIn.Log To Console    ${var}
    END

TEST Continue For Loop If
    BuiltIn.Comment    ทำทุกเลขยกเว้นเลขที่เช็คไม่ทำ ข้ามเลย เหบือนแบบแรก
    FOR    ${var}    IN    @{list1}
        IF    '${var}' == '5'    CONTINUE
        BuiltIn.Log To Console    ${var}
    END

TEST Exit For Loop
    BuiltIn.Comment    ทำไปก่อนเมื่อเจอเลขตรงแล้วออกก่อนถึงเลข เพราะใช้ ==    เพราะเลขที่เช็คไม่เอา
    FOR    ${var}    IN    @{list1}
        IF    '${var}' == '5'    BREAK
        BuiltIn.Log To Console    ${var}
    END

TEST Exit For Loop If
    BuiltIn.Comment    ทำไปก่อนเมื่อเจอเลขตรงแล้วออกก่อนถึงเลข เพราะใช้ ==    เพราะเลขที่เช็คไม่เอา
    FOR    ${var}    IN    @{list1}
        IF    '${var}' == '5'    BREAK
        BuiltIn.Log To Console    ${var}
    END

Example Count
    ${count}=    GET COUNTS    ${list1}
    BuiltIn.Should Be Equal As Numbers    ${count}    8

Example Count2
    ${str}=    BuiltIn.Set Variable    testing robotframework
    BuiltIn.Log To Console    ${str}

    ${count}=    BuiltIn.Get Count    ${str}    g
    BuiltIn.Log To Console    ${count}

    Should Be True    ${count} < 10
    Should Be Equal As Numbers    ${count}    8

Example Get Length
    ${length}=    BuiltIn.Get Length    Hello, world!
    BuiltIn.Log To Console    length of : ${length}
    BuiltIn.Should Be Equal As Integers    ${length}    13
    BuiltIn.Comment    หมายความว่าเช็คว่าจำนวนข้อความที่เช็ค ยาวเท่ากับ 13 มั้ย เลย13 คือ ความยาวที่เรารู้

    @{list}=    BuiltIn.Create List    Hello,    world!
    BuiltIn.Comment    สร้าง list ขี้นมาแล้วทำการเช็คจำนวนสตริง
    ${length}=    BuiltIn.Get Length    ${list}
    BuiltIn.Log To Console    length of : ${length}
    BuiltIn.Should Be Equal As Integers    ${length}    2

Scalar
    Log To Console    \n${Var_Scalar}

Data List
    Log To Console    \n${Var_DataList}
    Log To Console    \n${Var_DataList}[1]    # ${Var_DataList}[1] can use ${Var_DataList[1]}

Data Dictionary
    Log To Console    \n${var DataDict}
    Log To Console    \n${Var_DataDict}[Value2]
    Log To Console    \n${Var_DataDict}[Value1]

# Wait For Element To Be Present
#    Open Browser    ${URL}    chrome
#    Wait Until Keyword Succeeds    10x    1s    Element Should Be Visible    ${ELEMENT}
#    Close Browser

Test Case1
    Keywords Run KeyWord IF
    Keywords-Run-Keyword-And-Ignore-Error
    Log To Console    ${ENDTEST}

Run For Loop แบบ For-Loop-In Range
    For-Loop-In Range

Run For Loop แบบ For-Loop-Element
    For-Loop-Element

Run For Loop แบบ For-Loop-Exit
    For-Loop-Exiting

Logging Example
    Log    This is an info message.
    Log    This is a debug message.    DEBUG
    Log    This is a warning message.    WARN
    Log    This is an error message.    ERROR

Check Variable Type
    ${var}=    Set Variable    123
    ${type}=    Get Type    ${var}
    Log    ${type}    WARN

Check Variable Types
    ${var}=    Set Variable    123
    ${type}=    Evaluate    str(type(${var}))
    Log    ${type}    WARN

Check If Variable Is Integer
    ${var}=    Set Variable    123
    ${type}=    Evaluate    str(type(${var}))
    Should Contain    ${type}    int

Test Greet Person
    ${greeting}=    Greet Person    John
    Log    ${greeting}    WARN


*** Keywords ***
GET CURRENT
    ${current}=    DateTime.Get Current Date    result_format=datetime
    BuiltIn.Log To Console    Current date: ${current.year}-${current.month}-${current.day}
    RETURN    ${current}

GET COUNTS
    [Arguments]    ${list}
    ${count}=    BuiltIn.Get Length    ${list}
    BuiltIn.Log To Console    Count: ${count}
    RETURN    ${count}

Keywords Run KeyWord IF
    ${Lucky Number}=    Set Variable    13
    IF    ${Lucky Number} == 10    Log To Console    \nTest1
    IF    ${Lucky Number} == 12    Log To Console    \nTest2
    IF    ${Lucky Number} == 13    Log To Console    \nTest Success!
    IF    ${Lucky Number} == 14    Log To Console    \nTest4

Keywords-Run-Keyword-And-Ignore-Error
    ${TEXT1}=    Set Variable    TEST_A
    ${TEXT2}=    Set Variable    TEST_B
    Should be Equal    ${TEXT1}    ${TEXT2}

Test_Get_Time
    ${time}=    Get Time
    Log To Console    \n${time}
    BuiltIn.Set Global Variable    ${time}
    Set Global Variable    ${time}

Test_Get_Date_and_Time
    ${date_and_Time}=    Get Current Date
    Log To Console    \n${date_and_Time}
    BuiltIn.Set Global Variable    ${date_and_Time}
    Set Global Variable    ${date_and_Time}

Test_Convert_Date
    ${Date_Format1}=    Convert Date    ${date_and_Time}    %d-%m-%Y %H-%M-%S
    ${Date_Format2}=    Convert Date    ${date_and_Time}    %d-%m-%Y
    Log To Console    \n${Date_Format1}
    Log To Console    \n${Date_Format2}
    Set Global Variable    ${Date_Format1}
    Set Global Variable    ${Date_Format2}

For-Loop-In Range
    FOR    ${INDEX}    IN RANGE    1    10    2
        Log To Console    \n${INDEX}
        Log To Console    $${INDEX}_RANDOM_STRING
    END

# วน Loop จนกว่าจะไม่พบข้อมูล

For-Loop-Element
    @{ITEM}=    Create List    Bot1    Bot2    Bot3    Bot4
    FOR    ${ELEMENT}    IN    @{ITEM}
        Log To Console    \n${ELEMENT}
    END

# วน Loop จนกว่าจะเจอเงื่อนไขที่กำหนดไว้ให้ออกจาก Loop

For-Loop-Exiting
    @{ITEM}=    Create List    รอบที่ 1    รอบที่ 2    หยุดวน Loop    รอบที่ 4
    FOR    ${ELEMENT}    IN    @{ITEM}
        Log To Console    \n${ELEMENT}
        IF    '${ELEMENT}' == 'หยุดวน Loop'    BREAK
        Log To Console    วน Loop ต่อไป
    END
