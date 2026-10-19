# Solutions — CRUD Challenges

Use the original student records:

```python
students = [
    {"id": 101, "name": "Mary", "mark": 72},
    {"id": 102, "name": "John", "mark": 38},
    {"id": 103, "name": "Sarah", "mark": 55},
    {"id": 104, "name": "Adam", "mark": 81},
    {"id": 105, "name": "Niamh", "mark": 40}
]
```

## Challenge 1 — Search by name (ignore case)

```python
def find_student_by_name(students, search_name):
    for student in students:
        if student["name"].lower() == search_name.lower():
            return student
    return None


student = find_student_by_name(students, "mArY")

if student is not None:
    print(student["id"], student["name"], student["mark"])
else:
    print("Student not found")
```

Expected output:

```text
101 Mary 72
```

`.lower()` makes the comparison case-insensitive.

## Challenge 2 — Return the best student

```python
def find_highest_student(students):
    if len(students) == 0:
        return None

    highest_student = students[0]

    for student in students:
        if student["mark"] > highest_student["mark"]:
            highest_student = student

    return highest_student


best = find_highest_student(students)

if best is not None:
    print(best["name"], best["mark"])
else:
    print("No students found")
```

Expected output:

```text
Adam 81
```

We return the **whole dictionary**, not just `81`, so the calling code can access the name, ID and mark.

## Challenge 3 — Display a summary

This version reuses the functions from Challenges 1 and 2 and the `count_passes()` and `calculate_average()` functions from Student Example 2.

```python
def count_passes(students):
    passes = 0

    for student in students:
        if student["mark"] >= 40:
            passes = passes + 1

    return passes


def calculate_average(students):
    if len(students) == 0:
        return None

    total = 0
    for student in students:
        total = total + student["mark"]

    return total / len(students)


def display_summary(students):
    number_of_students = len(students)
    passes = count_passes(students)
    fails = number_of_students - passes
    average = calculate_average(students)
    highest_student = find_highest_student(students)

    print("Number of students:", number_of_students)
    print("Passes:", passes)
    print("Fails:", fails)

    if average is None:
        print("Average: Not available")
    else:
        print("Average:", average)

    if highest_student is None:
        print("Highest mark: Not available")
    else:
        print("Highest mark:", highest_student["mark"])
        print("Best student:", highest_student["name"])


display_summary(students)
```

Expected output:

```text
Number of students: 5
Passes: 4
Fails: 1
Average: 57.2
Highest mark: 81
Best student: Adam
```

## Before you finish — Key concepts

- **List of dictionaries:** a list containing several records, each stored as a dictionary.
- **Loop variable:** `student` refers to one dictionary during each iteration.
- **Selection inside iteration:** `if` can test each student's mark.
- **Counter:** increases by one for each matching record.
- **Accumulator:** adds values together, such as the total of all marks.
- **Returning a record:** makes the dictionary available for other code to use.
- **CRUD:** Create, Read, Update and Delete.
