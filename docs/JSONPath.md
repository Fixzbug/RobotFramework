
# JSONPath Expression Explanation

The expression `$[?(@.'${lable}' == '${case}')]` is a JSONPath expression, commonly used to query JSON data. JSONPath is a powerful tool to extract specific elements from a JSON structure, similar to how XPath is used for XML.

## Explanation of the Expression

Let's break down the expression `$[?(@.'${lable}' == '${case}')]`:

1. **`$`**: This symbol represents the root element of the JSON structure. It indicates that the query should start from the root.

2. **`[?()]`**: This is a filter expression. The `?()` syntax is used to apply a filter to the elements within the array. It allows you to filter elements based on a condition.

3. **`@`**: This symbol represents the current element being processed in the filter expression.

4. **`${lable}`**: This is a placeholder for a dynamic value, which will be replaced by the actual value of the variable `${lable}`. It represents a key or field name within the JSON objects.

5. **`${case}`**: This is another placeholder for a dynamic value, which will be replaced by the actual value of the variable `${case}`. It represents the value that the specified field (`${lable}`) should match.

6. **`@.'${lable}' == '${case}'`**: This is the actual condition used in the filter expression. It checks if the value of the field `${lable}` in the current element equals the value `${case}`.

## Putting It All Together

The expression `$[?(@.'${lable}' == '${case}')]` will filter the elements in the root array of the JSON structure and return only those elements where the value of the field specified by `${lable}` matches the value `${case}`.

## Example

Suppose you have the following JSON data:

```json
[
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 30}
]
```

And you want to filter the elements where the `age` is `30`. You would replace `${lable}` with `age` and `${case}` with `30`:

```jsonpath
$[?(@.age == 30)]
```

This would return the following result:

```json
[
    {"name": "Alice", "age": 30},
    {"name": "Charlie", "age": 30}
]
```

In summary, the JSONPath expression `$[?(@.'${lable}' == '${case}')]` is used to filter and return elements from a JSON array where a specified field (`${lable}`) matches a specified value (`${case}`).
