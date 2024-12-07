# Robot Framework Guide: Using Variables and Loops

## Description
This code provides an example of using commands in Robot Framework to log data to the console and loop through various data processing tasks using predefined variables. It checks the status of the `${DBUG}` variable first. If the value is `TRUE`, it logs various data as specified.

## Code Structure

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

## Explanation of Each Section

### Importing Library and Defining Variables

- **BuiltIn Library**: Used for basic commands in Robot Framework.
- **Variables**: Various variables like `${DBUG}`, `${group_data}`, `${CASE}`, `${group_data_label}`, and `${keys_group_data_label}` are defined.

### Checking the Value of `${DBUG}`

```robot
*** Keyword ***
Example Test Case
    IF    '${DBUG}' == 'TRUE'
```
- Checks if the value of `${DBUG}` is `TRUE`. If it is, the block of code will execute.

### Logging Data to the Console

```robot
*** Keyword ***
Example Test Case
    BuiltIn.Log To Console    'ngroup_data->${group_data}'
    BuiltIn.Log To Console    'nCASE->${CASE}'
    BuiltIn.Log To Console    'nkeys + group->${group_data_label}'
```
- Logs the values of `${group_data}`, `${CASE}`, and `${group_data_label}` to the console.

### Looping

```robot
*** Keyword ***
Example Test Case
    FOR    ${index}    IN RANGE    1    2
```
- Loops from index value 1 to 1 (since `IN RANGE 1 2`).

### Setting Variables and Logging Data in the Loop

- **Setting the Variable `${header_title}` and Logging to the Console**
```robot
*** Keyword ***
Example Test Case
    ${header_title}=    Set Variable    ${group_data_label}[${keys_group_data_label}[${index}]]
    BuiltIn.Log To Console    'Header_title->${header_title}'
```
- **Setting the Variable `${data_excel}` and Logging to the Console for Each Example**

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

## Example Execution

- If `${DBUG}` is `TRUE`, it logs the data of `${group_data}`, `${CASE}`, and `${group_data_label}` to the console.
- It then loops through the index from 1 to 1, logging the values of `${header_title}` and `${data_excel}` for each example.


