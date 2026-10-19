# Solutions — Student Example CRUD

## 10. What does CRUD mean?

| Operation | Meaning | Student example |
|---|---|---|
| **Create** | Add a record | Add a new student dictionary to the list |
| **Read** | View or find a record | Display all students or find one by ID |
| **Update** | Change an existing record | Change a student's mark |
| **Delete** | Remove a record | Remove a student dictionary from the list |

## 11. Exercise — Design before coding

The lab asks for steps **in plain English**, rather than a working program.

### Create — Add a student

1. Ask for the student's ID, name and mark.
2. Check whether that ID is already in the list.
3. If it exists, explain that the ID is already in use.
4. Otherwise, create a dictionary with the three fields.
5. Append the new dictionary to `students`.
6. Confirm that the student was added.

### Read — Display or search

1. For display, loop through the list and print each student's details.
2. For search, ask for an ID.
3. Check each student until the ID matches.
4. Display the matching student.
5. If no match is found, display "Student not found".

### Update — Change a mark

1. Ask for the student ID.
2. Search for the matching dictionary.
3. If no match exists, display "Student not found".
4. Otherwise, ask for the new mark.
5. Change the `"mark"` value in that dictionary.
6. Confirm that the record was updated.

### Delete — Remove a student

1. Ask for the student ID.
2. Search for the matching dictionary.
3. If no match exists, display "Student not found".
4. Otherwise, remove that dictionary from the list.
5. Confirm that the student was deleted.

## Optional illustration — CRUD in Python

The lab asks only for a design, so the code below is an **extra lecturer example**, not a required student solution.

```python
def find_student(students, student_id):
    for student in students:
        if student["id"] == student_id:
            return student
    return None


def add_student(students, student_id, name, mark):
    if find_student(students, student_id) is not None:
        print("Student ID already exists")
        return

    students.append({
        "id": student_id,
        "name": name,
        "mark": mark
    })


def update_mark(students, student_id, new_mark):
    student = find_student(students, student_id)

    if student is None:
        print("Student not found")
    else:
        student["mark"] = new_mark


def delete_student(students, student_id):
    student = find_student(students, student_id)

    if student is None:
        print("Student not found")
    else:
        students.remove(student)
```

These functions change the list in memory. Saving changes between runs will be introduced later.
