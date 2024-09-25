# JSONPath Filtering in Robot Framework

This README provides an example of using JSONPath to filter JSON data in Robot Framework.

## Introduction

JSONPath is a query language for JSON, similar to XPath for XML. It allows you to select and filter elements from JSON structures. In this example, we'll demonstrate how to use a JSONPath expression to filter elements of a JSON array based on a specific condition.

## Example JSON

Consider the following JSON array stored in a file called `data.json`:

```json
[
  { "TC": "TC1", "Description": "Test Case 1" },
  { "TC": "TC2", "Description": "Test Case 2" },
  { "TC": "TC3", "Description": "Test Case 3" }
]
```

## JSONPath Expression

The JSONPath expression `$[?(@.TC == '${set_tc_name}')]` is used to filter elements of a JSON array where the value of the `TC` property matches a specified variable.

### Components of the Expression

- **`$`**: Represents the root element of the JSON structure.
- **`[?()]`**: A filter expression used to filter array elements based on a condition.
- **`@`**: Refers to the current element being processed in the filter expression.
- **`.TC`**: The property of the current element that the filter expression evaluates.
- **`==`**: The equality operator used to compare the value of the property `.TC` with the given value `${set_tc_name}`.
- **`${set_tc_name}`**: A variable in Robot Framework whose actual value will be used in the comparison.

## Robot Framework Test Case

Below is an example of how to use this JSONPath expression in a Robot Framework test case:

### Robot Framework Test Suite (`test_suite.robot`)

```robot
*** Settings ***
Library    JSONLibrary

*** Variables ***
${set_tc_name}    TC2
${JSON_FILE}      data.json

*** Test Cases ***
Filter JSON Array By TC
    # Load JSON from file
    ${json_data}=    Load JSON From File    ${JSON_FILE}

    # Use JSONPath to filter the array
    ${filtered_data}=    Get Value From JSON    ${json_data}    $[?(@.TC == '${set_tc_name}')]

    # Log the filtered data
    Log    ${filtered_data}
```

### Explanation

1. **Variables**:
    - `${set_tc_name}` is set to `TC2`.
    - `${JSON_FILE}` holds the path to the JSON file.

2. **Test Case**:
    - `Load JSON From File` loads the JSON array from `data.json` into the variable `${json_data}`.
    - `Get Value From JSON` uses the JSONPath expression to filter the array and retrieve elements where the `TC` property equals `TC2`. This filtered data is stored in `${filtered_data}`.
    - `Log` keyword logs the filtered data to the console.

### Result

Given the example JSON array, the value of `${filtered_data}` would be:

```json
[
  { "TC": "TC2", "Description": "Test Case 2" }
]
```

This demonstrates how the JSONPath expression `$[?(@.TC == '${set_tc_name}')]` is used to filter elements in a JSON array based on a specified condition in Robot Framework.
