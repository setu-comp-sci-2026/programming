"""
Week 6 — Working with Data

"""

# A list holds the collection; each dictionary holds one student.
students = [
    {"id": 101, "name": "Mary", "mark": 72},
    {"id": 102, "name": "John", "mark": 38},
    {"id": 103, "name": "Sarah", "mark": 55}
]


# READ: Display every student.
def display_students(students):
    print("\nAll students:")
    for student in students:
        print(student["id"], student["name"], student["mark"])


# Selection inside iteration: Decide pass or fail for every student.
def display_results(students):
    print("\nResults:")
    for student in students:
        if student["mark"] >= 40:
            print(student["name"], "Pass")
        else:
            print(student["name"], "Fail")


# Processing pattern: Count records that meet a condition.
def count_passes(students):
    passes = 0
    for student in students:
        if student["mark"] >= 40:
            passes = passes + 1
    return passes


# Processing pattern: Total and average.
def calculate_average(students):
    if len(students) == 0:
        return None

    total = 0
    for student in students:
        total = total + student["mark"]

    return total / len(students)


# READ: Search for one record by its ID.
def find_student(students, search_id):
    for student in students:
        if student["id"] == search_id:
            return student

    return None


# CREATE: Add a new record.
def add_student(students, student_id, name, mark):
    if find_student(students, student_id) is not None:
        print("Cannot add student: ID already exists.")
        return

    new_student = {"id": student_id, "name": name, "mark": mark}
    students.append(new_student)
    print("Student added:", name)


# UPDATE: Change an existing student's mark.
def update_mark(students, student_id, new_mark):
    student = find_student(students, student_id)

    if student is None:
        print("Cannot update: student not found.")
    else:
        student["mark"] = new_mark
        print("Mark updated for", student["name"])


# DELETE: Remove an existing student.
def delete_student(students, student_id):
    student = find_student(students, student_id)

    if student is None:
        print("Cannot delete: student not found.")
    else:
        students.remove(student)
        print("Student deleted:", student["name"])


# Run the examples in the same order as the lecture.
def main():
    print("WEEK 6 — WORKING WITH DATA")

    # Read each record.
    display_students(students)

    # Selection inside a loop.
    display_results(students)

    # Count and average.
    print("\nNumber of passes:", count_passes(students))

    average = calculate_average(students)
    if average is None:
        print("No students: cannot calculate an average.")
    else:
        print("Average mark:", average)

    # Search: Returning the dictionary allows us to use it.
    print("\nSearching for student ID 102:")
    student = find_student(students, 102)
    if student is not None:
        print("Found:", student["name"], student["mark"])
    else:
        print("Student not found.")

    # Try a missing ID.
    print("\nSearching for student ID 999:")
    student = find_student(students, 999)
    if student is None:
        print("Student not found.")

    # CRUD demonstrations.
    print("\n--- CRUD DEMONSTRATION ---")

    add_student(students, 104, "Adam", 81)
    display_students(students)

    update_mark(students, 102, 45)
    display_students(students)

    delete_student(students, 103)
    display_students(students)

    # Check an error case: duplicate ID.
    add_student(students, 104, "Another Adam", 60)

    # What if the list is empty?
    print("\nAverage of an empty list:", calculate_average([]))


if __name__ == "__main__":
    main()
