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
    subtitle: [Working with Data Structures and CRUD — Talk 1: Why Process Data?],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))
#set text(size: 21pt)
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

#let teal = rgb("#20B2AA")
#let blue = rgb("#287bd3")
#let red = rgb("#E63946")
#let pale = rgb("#eef9f8")
#let callout(body) = rect(fill: teal, inset: 0.8em, radius: 8pt)[#text(fill: white, weight: "bold")[#body]]
#let small-code(body) = text(size: 15pt)[#body]

= Why Process Data?

#align(center)[
  #text(size: 1.5em, weight: "bold")[Every useful program processes data.]
]

#v(1em)

- Student record systems process marks and attendance
- Online shops process orders and stock
- Games process scores and positions
- AI systems process large datasets

= Today's Big Idea

Most programs follow this pattern:

#align(center)[
  #text(size: 1.3em, weight: "bold")[Input → Process → Output]
]

#v(1em)

Example:

```text
student marks → calculate average → mark report
```

= Learning Outcomes

By the end of this talk you should be able to:

- Explain what data processing means
- Identify common processing tasks
- Understand why lists and dictionaries are useful
- Recognise patterns such as total, count, search and maximum
- Prepare for CRUD-style applications

= Think–Pair–Share

Pick one app you use regularly.

#v(0.8em)

Discuss:

- What data does it store?
- What does it do with that data?
- What output does it show to the user?

#v(0.8em)

Examples: Spotify, TikTok, Netflix, Moodle, banking apps.

= What Is Data?

Data is information stored in a program.

```python
name = "Mary"
age = 20
grade = 72
```

This is fine for one student.

= The Problem: One Variable at a Time

What if we have five marks?

```python
grade1 = 72
grade2 = 38
grade3 = 55
grade4 = 90
grade5 = 41
```

This works, but it does not scale well.

= A Better Solution: A List

```python
marks = [72, 38, 55, 90, 41]
```

A list lets us store many values under one name.

#v(0.8em)

This makes it easier to:

- loop through the values
- calculate summaries
- search for values
- update the collection

= Common Data Processing Tasks

When we have a collection of data, we often want to:

- calculate a total
- calculate an average
- count matching items
- search for a value
- find the highest or lowest value
- filter the data

= Running Example: Marks

We will use this dataset:

```python
marks = [72, 38, 55, 90, 41]
```

A lecturer might want to know:

- What is the average mark?
- How many students passed?
- What was the highest mark?

= Pattern 1: Total

```python
marks = [72, 38, 55, 90, 41]

total = 0

for mark in marks:
    total += mark

print(total)
```

#v(0.5em)

This is an *accumulator* pattern.

= Understanding the Accumulator

At the start:

```python
total = 0
```

Then each mark is added in turn:

```text
0 + 72 = 72
72 + 38 = 110
110 + 55 = 165
165 + 90 = 255
255 + 41 = 296
```

= Pattern 2: Average

Average needs two pieces of information:

- the total
- the number of items

```python
average = total / len(marks)
print(average)
```

#v(0.5em)

`len(marks)` tells us how many items are in the list.

= Pattern 3: Count

Count the number of passing marks.

```python
passes = 0

for mark in marks:
    if mark >= 40:
        passes += 1

print(passes)
```

This is a *counter* pattern.

= Pattern 4: Search

Check whether a mark of 90 exists.

```python
found = False

for mark in marks:
    if mark == 90:
        found = True

print(found)
```

The variable `found` remembers whether the search succeeded.

= Pattern 5: Highest Value

```python
highest = marks[0]

for mark in marks:
    if mark > highest:
        highest = mark

print(highest)
```

Why do we start with `marks[0]` instead of `0`?

= Mini-Program: Mark Report


```python
marks = [72, 38, 55, 90, 41]

total = 0
passes = 0
highest = marks[0]

for mark in marks:
    total += mark

    if mark >= 40:
        passes += 1

    if mark > highest:
        highest = mark

print("Average:", total / len(marks))
print("Passes:", passes)
print("Highest:", highest)
```


= Classroom Activity

Given this data:

```python
temperatures = [12, 15, 17, 14, 18, 20, 16]
```

Write down the steps needed to find:

- the highest temperature
- the average temperature
- how many temperatures are above 15

= Why This Matters for CRUD

CRUD means:

- *Create* data
- *Read* data
- *Update* data
- *Delete* data

#v(0.8em)

Before we can build CRUD applications, we need to be able to process collections of data.

= From Lists to Records

A list of marks stores simple values:

```python
marks = [72, 38, 55]
```

A dictionary can store a record:

```python
student = {
    "name": "Mary",
    "mark": 72
}
```

= From Records to Systems

A list of dictionaries can store many records:

```python
students = [
    {"name": "Mary", "mark": 72},
    {"name": "John", "mark": 38},
    {"name": "Sarah", "mark": 55}
]
```

This is the starting point for a small Student Manager system.

= Key Takeaways

- Data processing is central to programming
- Lists let us store multiple values
- Loops let us process every item
- Common patterns include total, average, count, search and highest value
- These patterns prepare us for CRUD applications

#slide(
  title: none,
  header: none,
  footer: none,
  align: center + horizon,
)[
  #text(size: 2em, weight: "bold")[Thanks for Watching — Any questions?]

  #v(2em)

  #image("assets/thanks.png", width: 5cm)
]
