#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *
#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [While Loops in Python],
    subtitle: [Unknown Repetition, Validation and Menus],
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

- Explain when a `while` loop is useful
- Write a simple `while` loop in Python
- Use counters and accumulators
- Write validation loops
- Write sentinel-controlled loops
- Create a simple menu loop
- Identify and avoid infinite loops

= From selection to iteration
== You already know selection

```python
age = int(input("Enter age: "))

if age >= 18:
    print("Adult")
else:
    print("Minor")
```

Selection makes a decision once.

== What if we need to keep deciding?

Example:

- Keep asking for a password until it is correct.
- Keep asking for a mark until it is between 0 and 100.
- Keep displaying a menu until the user chooses Exit.

#callout([A loop lets us repeat a block of code.])

== Selection versus while loop

```python
if condition:
    print("Runs once if condition is true")
```

```python
while condition:
    print("Runs again and again while condition is true")
```

#v(1em)
The condition is checked before each repetition.

= Basic while loops
== Syntax

```python
while condition:
    statement_1
    statement_2
```

#v(1em)
Important:

- The colon `:` starts the loop body.
- Indentation shows which statements belong inside the loop.

== First example

```python
count = 1

while count <= 5:
    print("Hello")
    count += 1
```

#v(1em)
This prints `Hello` five times.

== Anatomy of the loop

```python
count = 1          # setup

while count <= 5:  # test
    print(count)   # repeated action
    count += 1     # update
```

#callout([Setup, test, action, update.])

== Trace table

```python
count = 1

while count <= 3:
    print(count)
    count += 1
```

#table(
  columns: (1fr, 1fr, 1fr),
  inset: .6em,
  align: center,
  [*count*], [*condition*], [*output*],
  [1], [True], [1],
  [2], [True], [2],
  [3], [True], [3],
  [4], [False], [Stop],
)

== Activity: predict the output

```python
x = 3

while x <= 9:
    print(x)
    x += 2
```

#v(1em)
Questions:

- What is the first value printed?
- What is the last value printed?
- Why does the loop stop?

= Counting loops
== Count from 1 to 10

```python
i = 1

while i <= 10:
    print(i)
    i += 1
```

== Count backwards

```python
i = 10

while i >= 1:
    print(i)
    i -= 1
```

== Count by twos

```python
i = 0

while i <= 20:
    print(i)
    i += 2
```

== Quick challenge

Write a `while` loop that prints:

```text
5
10
15
20
25
30
```
== Quick challenge Solution

```python
x = 5

while x <= 30:
    print(x)
    x += 5
```
= Accumulators and counters
== Counter pattern

A counter keeps track of how many times something happens.

```python
count = 0
count += 1
```

Examples:

- number of valid marks entered
- number of failed login attempts
- number of products sold

== Accumulator pattern

An accumulator builds up a total.

```python
total = 0
total += value
```

Examples:

- total marks
- total cost
- total distance

== Sum numbers 1 to 5

```python
total = 0
num = 1

while num <= 5:
    total += num
    num += 1

print(total)
```

Output:

```text
15
```

== Trace the accumulator

#table(
  columns: (1fr, 1fr, 1fr),
  inset: .6em,
  align: center,
  [*num*], [*total before*], [*total after*],
  [1], [0], [1],
  [2], [1], [3],
  [3], [3], [6],
  [4], [6], [10],
  [5], [10], [15],
)

= Validation loops
== Why validation loops?

User input cannot always be trusted.

Examples:

- A mark must be between 0 and 100.
- A menu choice must be one of the options.
- A password must match.

#callout([A validation loop repeats until the input is acceptable.])

== Validating a mark

```python
mark = int(input("Enter mark: "))

while mark < 0 or mark > 100:
    print("Invalid mark")
    mark = int(input("Enter mark: "))

print("Accepted")
```

This uses `or`, which students have already met.

== Validating a positive number

```python
number = int(input("Enter a positive number: "))

while number <= 0:
    print("That is not positive")
    number = int(input("Try again: "))

print("Thank you")
```

== Password example

```python
password = input("Password: ")

while password != "python":
    password = input("Incorrect. Try again: ")

print("Access granted")
```

== Activity: fix the validation

This code accepts invalid marks. Why?

```python
mark = int(input("Mark: "))

while mark < 0 and mark > 100:
    print("Invalid")
    mark = int(input("Mark: "))
```

Hint: think about `and` versus `or`.

== Activity: Solution

This code accepts invalid marks. Why?

```python
mark = int(input("Mark: "))

while mark < 0 or mark > 100:
    print("Invalid")
    mark = int(input("Mark: "))
```

= Sentinel loops
== What is a sentinel?

A sentinel is a special value that means stop.

Examples:

- `-1` to stop entering numbers
- `quit` to stop entering commands
- `0` to stop entering product codes

== Print numbers until -1

```python
number = int(input("Number (-1 to stop): "))

while number != -1:
    print(number)
    number = int(input("Number (-1 to stop): "))
```

== Total numbers until -1

```python
total = 0
number = int(input("Number (-1 to stop): "))

while number != -1:
    total += number
    number = int(input("Number (-1 to stop): "))

print("Total:", total)
```

== Count numbers until -1

```python
count = 0
number = int(input("Number (-1 to stop): "))

while number != -1:
    count += 1
    number = int(input("Number (-1 to stop): "))

print("You entered", count, "numbers")
```

= Menu loops
== Why menu loops?

Many programs keep running until the user chooses to exit.

Examples:

- ATM menu
- shop system
- student record system
- game menu

== Basic menu loop

```python
choice = ""

while choice != "4":
    print("1. Add")
    print("2. Search")
    print("3. Report")
    print("4. Exit")

    choice = input("Choice: ")
```

== Menu with selection

```python
choice = ""

while choice != "4":
    print("1. Add")
    print("2. Search")
    print("3. Report")
    print("4. Exit")

    choice = input("Choice: ")

    if choice == "1":
        print("Add selected")
    elif choice == "2":
        print("Search selected")
    elif choice == "3":
        print("Report selected")
    elif choice != "4":
        print("Invalid choice")
```

= Infinite loops
== Common cause

```python
i = 1

while i <= 5:
    print(i)
```

The update is missing.

`i` never changes, so the condition never becomes false.

== Intentional infinite loop

```python
while True:
    command = input("Enter command: ")

    if command == "quit":
        break

    print("You entered", command)
```

It is better to write the loop condition so that the loop naturally stops, rather than using `break`

== Better without break

```python
command = input("Enter command: ")

while command != "quit":
    print("You entered", command)
    command = input("Enter command: ")

print("Quitting")
```

= Bringing it together
== Mini-program: average valid marks

```python
total = 0
count = 0

while count < 5:
    mark = int(input("Enter mark: "))

    while mark < 0 or mark > 100:
        mark = int(input("Invalid. Try again: "))

    total += mark
    count += 1

average = total / count
print("Average:", average)
```

== What does this combine?

- Input and output
- Selection-style conditions
- `or`
- Nested `while` loop
- Counter
- Accumulator
- Average calculation

= Summary
== Today we learned

- `while` loops repeat while a condition is true.
- Counters count events.
- Accumulators build totals.
- Validation loops keep asking until input is valid.
- Sentinel loops stop when a special value is entered.
- Menu loops keep programs running.
- Infinite loops often happen when the update is missing.

== Practice exercises

1. Print your name 10 times.
2. Count from 1 to 20.
3. Count backwards from 20 to 1.
4. Print even numbers from 2 to 50.
5. Calculate the sum of numbers from 1 to 100.
6. Ask repeatedly for a positive number.
7. Ask for marks until `-1` is entered, then print the average.
8. Create a menu that repeats until the user chooses Exit.
