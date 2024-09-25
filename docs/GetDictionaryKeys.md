
# Robot Framework Get Dictionary Keys Example

In Robot Framework, the `Get Dictionary Keys` keyword is used to retrieve the keys of a dictionary. The `sort_keys` argument determines whether the keys should be sorted alphabetically. If `sort_keys` is set to `False`, the keys will be returned in their original order.

## Example Usage

Let's say you have the following dictionary in your Robot Framework test:

```robot
*** Variables ***
${json_dict}    {"name": "Alice", "age": 30, "city": "Wonderland"}

*** Test Cases ***
Example Test Case
    ${keys_group}=    Get Dictionary Keys    ${json_dict}    sort_keys=False
    Log    ${keys_group}
```

## Explanation

1. **`${json_dict}`**: This is a dictionary with keys `name`, `age`, and `city`.
2. **`Get Dictionary Keys`**: This keyword retrieves the keys of the dictionary.
3. **`sort_keys=False`**: This argument specifies that the keys should not be sorted. The keys will be returned in the order they appear in the dictionary.
4. **`Log ${keys_group}`**: This logs the list of keys retrieved from the dictionary.

## Example Output

Given the dictionary:

```json
{"name": "Alice", "age": 30, "city": "Wonderland"}
```

The output would be:

```
[name, age, city]
```

The keys are returned in the order they appear in the dictionary: `name`, `age`, and `city`.

## Complete Example in Robot Framework

```robot
*** Settings ***
Library    Collections

*** Variables ***
${json_dict}    {"name": "Alice", "age": 30, "city": "Wonderland"}

*** Test Cases ***
Example Test Case
    ${keys_group}=    Get Dictionary Keys    ${json_dict}    sort_keys=False
    Log    ${keys_group}
```

In this complete example:
- We use the `Collections` library to access the `Get Dictionary Keys` keyword.
- The dictionary `${json_dict}` is defined with three key-value pairs.
- The `Get Dictionary Keys` keyword retrieves the keys of the dictionary without sorting them.
- The `Log` keyword outputs the list of keys to the console.

This demonstrates how you can use the `Get Dictionary Keys` keyword in Robot Framework to retrieve dictionary keys in their original order.
