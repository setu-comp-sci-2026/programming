#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly

#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Python Programming Fundamentals],
    subtitle: [CSV Files],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= What is CSV?

*CSV* (Comma-Separated Values) is a simple plain-text format for tabular data.

```
name,age,city,score
Alice,22,Dublin,88
Bob,25,Cork,74
Carol,21,Galway,95
Dave,23,Limerick,62
```

#pause

*Why CSV?*
- Universal — opens in Excel, Google Sheets, any text editor
- Simple — no special software needed
- Lightweight — just text
- Supported by virtually every programming language and database

#pause

CSV files may use other delimiters: `;`, `\t` (tab), `|`. The Python `csv` module handles all of these.

= Reading CSV with the csv Module

```python
import csv

with open("students.csv", "r", newline="") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)   # each row is a list of strings
```

Output:
```
['name', 'age', 'city', 'score']
['Alice', '22', 'Dublin', '88']
['Bob', '25', 'Cork', '74']
```

#pause

*Skip the header row:*

```python
with open("students.csv", "r", newline="") as f:
    reader = csv.reader(f)
    header = next(reader)   # consume the first row
    for row in reader:
        name, age, city, score = row
        print(f"{name} from {city}: {score}")
```

= Writing CSV

```python
import csv

students = [
    ["name", "age", "city", "score"],  # header
    ["Alice", 22, "Dublin", 88],
    ["Bob", 25, "Cork", 74],
    ["Carol", 21, "Galway", 95],
]

with open("output.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(students)   # write all rows at once

print("CSV written successfully")
```

#pause

*Write row by row:*

```python
with open("log.csv", "a", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["2024-01-15", "Alice", "Login", "Success"])
```

= DictReader — Rows as Dictionaries

`csv.DictReader` maps each row to a `dict` using the header row as keys.

```python
import csv

with open("students.csv", "r", newline="") as f:
    reader = csv.DictReader(f)
    for student in reader:
        # student is a dict: {'name': 'Alice', 'age': '22', ...}
        name  = student["name"]
        score = int(student["score"])   # convert from string!
        grade = "Pass" if score >= 60 else "Fail"
        print(f"{name}: {score} -> {grade}")
```

#pause

*Load all records into a list:*

```python
with open("students.csv", "r", newline="") as f:
    reader = csv.DictReader(f)
    students = list(reader)   # list of dicts

# Now you can work with the data
scores = [int(s["score"]) for s in students]
print(f"Average score: {sum(scores)/len(scores):.1f}")
```

= DictWriter — Write from Dicts

```python
import csv

students = [
    {"name": "Alice", "age": 22, "city": "Dublin", "score": 88},
    {"name": "Bob",   "age": 25, "city": "Cork",   "score": 74},
    {"name": "Carol", "age": 21, "city": "Galway",  "score": 95},
]

fields = ["name", "age", "city", "score"]

with open("students_out.csv", "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=fields)
    writer.writeheader()        # write the header row
    writer.writerows(students)  # write all data rows
```

= Practical Example — Student Analysis

```python
import csv

def load_students(filename):
    students = []
    with open(filename, "r", newline="") as f:
        for row in csv.DictReader(f):
            students.append({
                "name":  row["name"],
                "score": int(row["score"]),
                "city":  row["city"],
            })
    return students

def print_report(students):
    scores = [s["score"] for s in students]
    print(f"Students: {len(students)}")
    print(f"Average:  {sum(scores)/len(scores):.1f}")
    print(f"Highest:  {max(scores)}")
    print(f"Lowest:   {min(scores)}")
    print("\nFailed students:")
    for s in students:
        if s["score"] < 60:
            print(f"  {s['name']} ({s['score']})")

students = load_students("students.csv")
print_report(students)
```

#slide(
    title: none,
    header: none,
    footer: none,
    align: center + horizon)[
    #text(size: 2em, weight: "bold")[
  
    Thanks for Watching - Any questions?
    
    #v(2em)
    
    #image("assets/thanks.png", width: 5cm)
  ]]
