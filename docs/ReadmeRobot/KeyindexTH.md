# คู่มือการใช้งาน Robot Framework: การใช้ตัวแปรและการวนลูป

## คำอธิบาย
โค้ดนี้เป็นตัวอย่างการใช้คำสั่งใน Robot Framework เพื่อทำการบันทึกข้อมูลลงในคอนโซลและการวนลูปเพื่อประมวลผลข้อมูลต่าง ๆ จากตัวแปรที่กำหนดไว้ โดยจะทำการตรวจสอบสถานะของตัวแปร `${DBUG}` ก่อน ถ้าค่าเป็น `TRUE` จะทำการบันทึกข้อมูลต่าง ๆ ตามที่ระบุ

## โครงสร้างของโค้ด

```robot
*** Settings ***
Library    BuiltIn

*** Variables ***
${DBUG}                  TRUE
${group_data}            {'TC': 'TC_1', 'Case': 'cancel', 'ID Number:': '3100502003018', 'Date From:': '2024-07-01 00:00:00'}
${CASE}                  cancel
${group_data_label}      {'TC': 'TLB_1', 'Case': 'Case', 'ID_Number': 'ID Number:', 'Date_From': 'Date From:'}
${keys_group_data_label}    [TC, Case, ID_Number, Date_From]

*** Test Cases ***
Example Test Case
    IF    '${DBUG}' == 'TRUE'
        BuiltIn.Log To Console    'ngroup_data->${group_data}'
        BuiltIn.Log To Console    'nCASE->${CASE}'
        BuiltIn.Log To Console    'nkeys + group->${group_data_label}'
        
        FOR    ${index}    IN RANGE    1    2
            ${header_title}=    Set Variable    ${group_data_label}[${keys_group_data_label}[${index}]]
            BuiltIn.Log To Console    'Header_title->${header_title}'

            # Ex 1
            ${data_excel}=    Set Variable    ${group_data}[ID Number:]
            BuiltIn.Log To Console    'Data_excel->${data_excel}'

            # Ex 2
            ${data_excel}=    Set Variable    ${group_data}[${header_title}]
            BuiltIn.Log To Console    'Data_excel->${data_excel}'

            # Ex 3
            ${data_excel}=    Set Variable    ${group_data}[${group_data_label}[${keys_group_data_label}[${index}]]]
            BuiltIn.Log To Console    'Data_excel->${data_excel}'
        END
    END
```

## การอธิบายแต่ละส่วน

### การนำเข้า Library และการกำหนดตัวแปร

- **BuiltIn Library**: ใช้สำหรับการใช้คำสั่งพื้นฐานของ Robot Framework
- **ตัวแปร**: กำหนดตัวแปรต่าง ๆ เช่น `${DBUG}`, `${group_data}`, `${CASE}`, `${group_data_label}`, และ `${keys_group_data_label}`

### การตรวจสอบค่า `${DBUG}`

```robot
*** Keyword ***
Example Test Case
    IF    '${DBUG}' == 'TRUE'
```
- ตรวจสอบว่าค่า `${DBUG}` เป็น `TRUE` หรือไม่ ถ้าใช่จะทำงานในบล็อกนี้

### การบันทึกข้อมูลลงในคอนโซล

```robot
*** Keyword ***
Example Test Case
    BuiltIn.Log To Console    'ngroup_data->${group_data}'
    BuiltIn.Log To Console    'nCASE->${CASE}'
    BuiltIn.Log To Console    'nkeys + group->${group_data_label}'
```
- บันทึกค่าของ `${group_data}`, `${CASE}`, และ `${group_data_label}` ลงในคอนโซล

### การวนลูป

```robot
*** Keyword ***
Example Test Case
    FOR    ${index}    IN RANGE    1    2
```
- วนลูปตั้งแต่ index ค่า 1 ถึง 1 (เนื่องจาก `IN RANGE 1 2`)

### การตั้งค่าตัวแปรและบันทึกข้อมูลในลูป

- **ตั้งค่าตัวแปร `${header_title}` และบันทึกลงในคอนโซล**
```robot
*** Keyword ***
Example Test Case
${header_title}=    Set Variable    ${group_data_label}[${keys_group_data_label}[${index}]]
BuiltIn.Log To Console    'Header_title->${header_title}'
```
- **ตั้งค่าตัวแปร `${data_excel}` และบันทึกลงในคอนโซลในแต่ละตัวอย่าง**

```robot
*** Keyword ***
Example Test Case
    # Ex 1
    ${data_excel}=    Set Variable    ${group_data}[ID Number:]
    BuiltIn.Log To Console    'Data_excel->${data_excel}'

    # Ex 2
    ${data_excel}=    Set Variable    ${group_data}[${header_title}]
    BuiltIn.Log To Console    'Data_excel->${data_excel}'

    # Ex 3
    ${data_excel}=    Set Variable    ${group_data}[${group_data_label}[${keys_group_data_label}[${index}]]]
    BuiltIn.Log To Console    'Data_excel->${data_excel}'
```

## ตัวอย่างการทำงาน

- หาก `${DBUG}` เป็น `TRUE` จะบันทึกข้อมูลของ `${group_data}`, `${CASE}`, และ `${group_data_label}` ลงในคอนโซล
- จากนั้นจะวนลูปตามค่า index ตั้งแต่ 1 ถึง 1 และบันทึกค่าของ `${header_title}` และ `${data_excel}` ในแต่ละตัวอย่าง
