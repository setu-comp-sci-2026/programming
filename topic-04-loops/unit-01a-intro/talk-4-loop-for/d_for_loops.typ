#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *
#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [For Loops in Python],
    subtitle: [Known Repetition, Collections and Nested Loops],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set text(size: 21pt)

#let teal = rgb("#20B2AA")
#let blue = rgb("#287bd3")
#let red = rgb("#E63946")
#let pale = rgb("#eef9f8")
#let callout(body) = rect(fill: teal, inset: 1em, radius: 8pt)[#text(fill: white, weight: "bold")[#body]]

#title-slide()
#outline-slide()

= Learning outcomes
== By the end of this lecture

You should be able to:

- Explain when a `for` loop is useful
- Use `range()` with start, stop and step values
- Iterate through strings
- Iterate through lists
- Use selection inside a loop
- Use accumulators with `for` loops
- Write nested loops
- Create simple text patterns

= Why another loop?
== Review: while loop

```python
i = 1

while i <= 10:
    print(i)
    i += 1
```

Use `while` when we may not know how many repetitions are needed.

== A simpler way when we know the count

```python
for i in range(1, 11):
    print(i)
```

#callout([A `for` loop is useful when we know what sequence we want to process.])

== While versus for

#columns(2)[

#rect(fill: pale, inset: 1em, radius: 8pt)[
  *while loop*

  Use when repetition depends on a condition.

  Examples:
  - password validation
  - menu loops
  - sentinel loops
]

#rect(fill: pale, inset: 1em, radius: 8pt)[
  *for loop*

  Use when processing a sequence.

  Examples:
  - numbers in a range
  - characters in a string
  - items in a list
]

]
= For loop basics
== Syntax

```python
for variable in sequence:
    statements
```

Examples of sequences:

- `range(5)`
- a string such as `"Python"`
- a list such as `[70, 80, 90]`

== First for loop

```python
for i in range(5):
    print(i)
```

Output:

```text
0
1
2
3
4
```

== Important: range stops before the end

```python
range(5)
```

Produces:

```text
0, 1, 2, 3, 4
```

It does not include 5.

= Using range()
== Start and stop

```python
for i in range(1, 11):
    print(i)
```

This prints 1 to 10.

#v(1em)
`range(start, stop)` includes the start but excludes the stop.

== Step value

```python
for i in range(0, 21, 2):
    print(i)
```

This prints even numbers from 0 to 20.

== Counting backwards

```python
for i in range(10, 0, -1):
    print(i)
```

This prints 10 down to 1.

== Activity: predict the output

```python
for i in range(2, 12, 3):
    print(i)
```

Questions:

- What is the first value?
- What is added each time?
- Why is 12 not printed?

== Quick challenges

Write `for` loops to print:

1. 1 to 20
2. 10 to 1
3. Multiples of 5 from 5 to 50
4. Odd numbers from 1 to 19

= Accumulators with for loops
== Sum numbers 1 to 100

```python
total = 0

for i in range(1, 101):
    total += i

print(total)
```

== Calculate an average

```python
total = 0

for i in range(5):
    mark = int(input("Enter mark: "))
    total += mark

average = total / 5
print("Average:", average)
```

== Add validation

```python
total = 0

for i in range(5):
    mark = int(input("Enter mark: "))

    while mark < 0 or mark > 100:
        mark = int(input("Invalid. Try again: "))

    total += mark

print("Average:", total / 5)
```

This combines `for`, `while`, and `or`.

= Iterating through strings
== Strings are sequences

```python
for letter in "Python":
    print(letter)
```

Output:

```text
P
y
t
h
o
n
```

== Count vowels

```python
word = input("Enter word: ")
vowels = 0

for letter in word:
    if letter in "aeiouAEIOU":
        vowels += 1

print("Vowels:", vowels)
```

== Activity: count spaces

Write a program that asks for a sentence and counts how many spaces it contains.

Hint:

```python
if character == " ":
```
== Solution: count spaces


```python
sentence = input("Enter a sentence: ")

space_count = 0

for character in sentence:
    if character == " ":
        space_count += 1

print("Number of spaces:", space_count)
```
= Iterating through lists
== What is a list?

A list stores multiple values in one variable.

```python
marks = [75, 60, 80, 90]
```

#callout([A `for` loop is ideal for processing every item in a list.])

== Print each mark

```python
marks = [75, 60, 80, 90]

for mark in marks:
    print(mark)
```

== Total and average

```python
marks = [75, 60, 80, 90]
total = 0

for mark in marks:
    total += mark

average = total / len(marks)
print("Average:", average)
```

== Find the highest mark

```python
marks = [75, 60, 80, 90]
highest = marks[0]

for mark in marks:
    if mark > highest:
        highest = mark

print("Highest:", highest)
```

== Count passes

```python
marks = [75, 40, 32, 81, 55]
passes = 0

for mark in marks:
    if mark >= 40:
        passes += 1

print("Passes:", passes)
```

= Nested loops
== What is a nested loop?

A nested loop is a loop inside another loop.

#rect(fill: pale, inset: 1em, radius: 8pt)[
Outer loop controls the main repetition.

Inner loop completes all of its repetitions for each one repetition of the outer loop.
]

== Rows and Seats Analogy

#grid(
  columns: (1fr, 1.3fr),
  gutter: 1em,

  [
    #rect(
      fill: rgb("#eaf4ff"),
      radius: 8pt,
      inset: 1em,
    )[
      *Imagine a classroom:*

      - 3 rows
      - 4 seats in each row

      For every row, check every seat.

      #v(1em)

      The *outer loop* selects the row.

      The *inner loop* selects each seat in that row.

      #v(1em)

      
    ]
  ],

  [
    #align(center)[
      #image("assets/rowseatstart.png", height: 90%)
    ]
  ]
)

== Rows and Seats Analogy Continued
#align(center)[
      #image("assets/rowseats.png", height: 90%)
    ]
== Rows and Seats Analogy Code

```python
for row in range(4):
    for seat in range(6):
        print(row, seat)
```

== Trace the idea

```text
row 0: seat 0, seat 1, seat 2, seat 3, seat 4, seat 5
row 1: seat 0, seat 1, seat 2, seat 3, seat 4, seat 5
row 2: seat 0, seat 1, seat 2, seat 3, seat 4, seat 5
row 3: seat 0, seat 1, seat 2, seat 3, seat 4, seat 6
```

The inner loop runs completely for each value of `row`.

== Is this code better?

```python
for row in range(1,5):
    print("\nRow ",row, end=' ')
    for seat in range(1,7):
        print(" Seat ", seat, end=' ')
```

= Pattern examples
== Print a square

```python
for row in range(5):
    print("*" * 5)
```

Output:

```text
*****
*****
*****
*****
*****
```

== Print a triangle

```python
for row in range(1, 6):
    print("*" * row)
```

Output:

```text
*
**
***
****
*****
```

== Multiplication table

```python
for i in range(1, 11):
    print(i, "x 7 =", i * 7)
```

== 1 to 10 tables

```python
for table in range(1, 11):
    print("Table", table)

    for i in range(1, 11):
        print(i, "x", table, "=", i * table)

    print()
```

= Common mistakes
== Off-by-one errors

```python
for i in range(1, 10):
    print(i)
```

This prints 1 to 9, not 1 to 10.

#callout([The stop value is excluded.])

== Indentation errors

```python
for i in range(5):
print(i)
```

Python needs indentation to show what belongs inside the loop.

== Changing the wrong variable

```python
total = 0

for mark in [50, 60, 70]:
    total = mark
```

This replaces the total each time.

Better:

```python
total += mark
```

= Bringing it together
== Mini-program: mark report

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

== What does this combine?

- Lists
- `for` loops
- Selection
- Counters
- Accumulators
- Highest value pattern
- `len()` function

= Summary
== Today we learned

- Use `for` loops to process a sequence.
- `range()` generates numbers.
- The stop value in `range()` is excluded.
- Strings and lists can be looped through directly.
- Selection can be placed inside loops.
- Nested loops are useful for grids, tables and patterns.

== Practice exercises

1. Print numbers from 1 to 50.
2. Print multiples of 3 from 3 to 60.
3. Print each character in your name.
4. Count vowels in a sentence.
5. Calculate the total of a list of numbers.
6. Count how many marks are passes.
7. Find the highest number in a list.
8. Print a 5 by 5 square of stars.
9. Print a right-angled triangle.
10. Challenge: print multiplication tables from 1 to 10.
