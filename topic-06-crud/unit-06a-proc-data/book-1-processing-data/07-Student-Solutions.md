# Solutions — Student Example 2

Use the same `students` list from Student Example 1.

## 5. Total and average

The example code in the lab is correct:

```python
total = 0

for student in students:
    total = total + student["mark"]

average = total / len(students)
print("Total:", total)
print("Average:", average)
```

Expected output:

```text
Total: 286
Average: 57.2
```

## Exercise 3 — Highest mark

```python
highest_mark = students[0]["mark"]

for student in students:
    if student["mark"] > highest_mark:
        highest_mark = student["mark"]

print("Highest mark:", highest_mark)
```

Expected output:

```text
Highest mark: 81
```

We start with the first student's mark, rather than `0`, so the approach works with any non-empty list of marks.

## 6. Searching for data

The search code supplied in the lab is correct. Example tests:

| ID entered | Expected result |
|---|---|
| `101` | Mary, 72 (first record) |
| `105` | Niamh, 40 (last record) |
| `103` | Sarah, 55 |
| `999` | Student not found |

**Why is `found` useful?** It remembers whether any matching record was discovered. We print "Student not found" only after checking the entire list.

## 7. Search using a function

```python
def find_student(students, search_id):
    for student in students:
        if student["id"] == search_id:
            return student
    return None


student = find_student(students, 103)

if student is not None:
    print(student["name"], student["mark"])
else:
    print("Student not found")
```

Returning the dictionary is more useful than printing it inside the function because the calling code can decide whether to display it, update it or use its values in another calculation.

**Important:** `return None` must be *outside* the loop. Otherwise the function might stop after checking only the first record.

## 8. Display students

The function supplied in the lab is:

```python
def display_students(students):
    for student in students:
        print(student["id"], student["name"], student["mark"])
```

## Exercise 4 — Count passes function

```python
def count_passes(students):
    passes = 0

    for student in students:
        if student["mark"] >= 40:
            passes = passes + 1

    return passes


print("Number of passes:", count_passes(students))
```

Expected result: `4`.

## 9. Exercise — Calculate the average

```python
def calculate_average(students):
    if len(students) == 0:
        return None

    total = 0

    for student in students:
        total = total + student["mark"]

    return total / len(students)


average = calculate_average(students)

if average is not None:
    print("Average:", average)
else:
    print("No students to calculate an average.")
```

Expected result: `57.2`.

If the list is empty and we do not check first, dividing by `len(students)` causes a `ZeroDivisionError`. Returning `None` is one reasonable way to indicate that no average can be calculated.
