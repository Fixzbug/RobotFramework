
# Robot Framework Range Example

This example demonstrates how to use the `FOR` loop with `IN RANGE` in Robot Framework to iterate over a sequence of numbers.

## Explanation

In the context of the Robot Framework `FOR` loop, the `IN RANGE` statement is used to specify the start, stop, and step values for the range. The values `1 4 1` represent the following:

1. **Start Value (1)**: The range will start from this value (inclusive).
2. **Stop Value (4)**: The range will go up to, but not include, this value (exclusive).
3. **Step Value (1)**: The increment between each value in the range.

So, `IN RANGE 1 4 1` means the loop will iterate over the values `1, 2, 3`. It starts at 1 and stops before reaching 4, incrementing by 1 each time.

## Example

Here's an example demonstrating this in a Robot Framework test case:

```robot
*** Test Cases ***
Example Test Case
    FOR    ${INDEX}    IN RANGE    1    4    1
        Log To Console    \n${INDEX}
        Log To Console    ${INDEX}_RANDOM_STRING
    END
```

## Explanation

- `FOR ${INDEX} IN RANGE 1 4 1`: This loop will run with `INDEX` taking the values `1, 2, 3` in sequence.
- `Log To Console \n${INDEX}`: Logs the current index value.
- `Log To Console ${INDEX}_RANDOM_STRING`: Logs the index value concatenated with the string `_RANDOM_STRING`.

This would produce the following output:

```
1
1_RANDOM_STRING
2
2_RANDOM_STRING
3
3_RANDOM_STRING
```

The values `1, 4, 1` in the `IN RANGE` clause define the start, stop, and step of the range for the loop iteration.
