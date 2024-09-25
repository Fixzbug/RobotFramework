
# Robot Framework - FOR Loop Types

This document provides an overview of different `FOR` loop types available in Robot Framework. Below are the descriptions and examples for each type.

## 1. IN RANGE (ในช่วง)
Used to loop over a range of numbers, where you can specify the start, end, and step values.

ใช้ในการทำซ้ำในช่วงของตัวเลข ซึ่งคุณสามารถระบุจุดเริ่มต้น, จุดสิ้นสุด และค่าก้าว (step) ได้

```robot
*** Test Cases ***
Example In Range Loop
    FOR    ${i}    IN RANGE    1    5
        Log    ${i}
    END
```

## 2. IN (ในรายการ)
Used to loop over each item in a list, tuple, or even string.

ใช้ในการทำซ้ำสำหรับทุกค่าที่อยู่ในลิสต์ หรือ Tuple หรือแม้กระทั่ง String

```robot
*** Test Cases ***
Example In Loop
    FOR    ${item}    IN    apple    banana    cherry
        Log    ${item}
    END
```

## 3. IN ENUMERATE (พร้อมดัชนี)
Used to loop over each item in a list along with its index.

ใช้ในการทำซ้ำโดยที่ได้รับทั้งดัชนี (index) และค่าของแต่ละองค์ประกอบในลิสต์

```robot
*** Test Cases ***
Example In Enumerate Loop
    FOR    ${index}    ${item}    IN ENUMERATE    apple    banana    cherry
        Log    ${index}: ${item}
    END
```

## 4. IN ZIP (รวมรายการ)
Used to loop over multiple lists in parallel.

ใช้ในการทำซ้ำพร้อมกันสำหรับหลายลิสต์ โดยในแต่ละรอบของลูปจะได้ค่าจากลิสต์แต่ละลิสต์ในตำแหน่งเดียวกัน

```robot
*** Test Cases ***
Example In Zip Loop
    FOR    ${fruit}    ${color}    IN ZIP    apple    banana    cherry    red    yellow    dark red
        Log    ${fruit} is ${color}
    END
```

## 5. IN RANGE WITH STEP (ในช่วงพร้อมค่าก้าว)
A variant of `IN RANGE` that allows specifying a step value.

เป็นการใช้งาน `IN RANGE` แต่คุณสามารถระบุ `step` ได้เพื่อกระโดดค่าตัวเลขตามที่กำหนด

```robot
*** Test Cases ***
Example In Range With Step Loop
    FOR    ${i}    IN RANGE    0    10    2
        Log    ${i}
    END
```

## 6. IN REVERSE (ในลำดับถอยหลัง)
Used to loop over a list in reverse order.

ใช้ในการทำซ้ำลิสต์ในลำดับถอยหลัง

```robot
*** Test Cases ***
Example In Reverse Loop
    FOR    ${item}    IN REVERSE    @{items}
        Log    ${item}
    END
```

## 7. IN ENUMERATE REVERSE (พร้อมดัชนีในลำดับถอยหลัง)
Combines `IN ENUMERATE` with `IN REVERSE` to loop over a list with both index and value in reverse order.

เป็นการผสมผสานระหว่าง `IN ENUMERATE` และ `IN REVERSE` โดยจะได้ทั้งดัชนี (index) และค่า ในลำดับถอยหลัง

```robot
*** Test Cases ***
Example In Enumerate Reverse Loop
    FOR    ${index}    ${item}    IN ENUMERATE REVERSE    @{items}
        Log    ${index}: ${item}
    END
```

