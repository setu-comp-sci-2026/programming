# Solutions — Student Example 1

Use the data from the lab:

```python
students = [
    {"id": 101, "name": "Mary", "mark": 72},
    {"id": 102, "name": "John", "mark": 38},
    {"id": 103, "name": "Sarah", "mark": 55},
    {"id": 104, "name": "Adam", "mark": 81},
    {"id": 105, "name": "Niamh", "mark": 40}
]
```

## 1. Identify the data

- `students` is a **list**.
- `{"id": 101, "name": "Mary", "mark": 72}` is a **dictionary**.
- Its keys are `"id"`, `"name"` and `"mark"`.
- Its values are `101`, `"Mary"` and `72`.

## 2. Reading the records — include the ID

```python
for student in students:
    print(student["id"], student["name"], student["mark"])
```

On each iteration, `student` refers to **one dictionary** from the list.

## Exercise 1 — Distinction, Pass or Fail

```python
for student in students:
    if student["mark"] >= 70:
        print(student["name"], "- Distinction")
    elif student["mark"] >= 40:
        print(student["name"], "- Pass")
    else:
        print(student["name"], "- Fail")
```

Expected output:

```text
Mary - Distinction
John - Fail
Sarah - Pass
Adam - Distinction
Niamh - Pass
```

**Why this order?** We check `>= 70` first. Otherwise a mark of 72 would be classified as a Pass before we reached Distinction.

## Exercise 2 — Count passes and fails

```python
passes = 0
fails = 0

for student in students:
    if student["mark"] >= 40:
        passes = passes + 1
    else:
        fails = fails + 1

print("Number of passes:", passes)
print("Number of fails:", fails)
```

Expected output:

```text
Number of passes: 4
Number of fails: 1
```

A **counter** starts at zero and increases whenever the condition is met.
