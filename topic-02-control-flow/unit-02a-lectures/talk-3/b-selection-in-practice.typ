#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.5.0": canvas, draw
#import "@preview/numbly:0.1.0": numbly

#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)
#let blue = rgb("#287bd3")
#let red = rgb("#E63946")
#let green = rgb("#2A9D55")
#let note(body) = block(fill: blue.lighten(85%), stroke: (paint: blue.lighten(50%), thickness: 1pt), radius: 8pt, inset: 16pt, width: 100%, body)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Selection 2 — Multiple Choices and Logical Operators],
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

= Today
#slide[
By the end of this session you should be able to:

- Use `if-elif-else` for multiple alternatives.
- Explain the difference between separate `if`s and an `elif` chain.
- Combine conditions using `and`, `or` and `not`.
- Check ranges correctly.
- Use nested selection when appropriate.
- Apply selection to validation and small programs.
]

= Quick Recap
#slide[
What will this print?
```python
mark = 40

if mark >= 40:
    print("Pass")
else:
    print("Fail")
```
#pause
`Pass` — because 40 is included in `>= 40`.
]

= More Than Two Choices
#slide[
Suppose we want:

- 70+ → Distinction
- 40–69 → Pass
- below 40 → Fail

#pause
An `if-else` only gives us two branches.

We need `elif` — *else if*.
]

= if-elif-else Syntax
#slide[
```python
if condition1:
    statements
elif condition2:
    statements
else:
    statements
```
#pause
Python tests from top to bottom and stops at the *first true branch*.
]

= Grade Classification
#slide[
```python
mark = int(input("Mark: "))

if mark >= 70:
    print("Distinction")
elif mark >= 40:
    print("Pass")
else:
    print("Fail")
```
#pause
Why does the second condition not need `mark < 70`?
]

= Order Matters
#slide[
This is wrong:
```python
if mark >= 40:
    print("Pass")
elif mark >= 70:
    print("Distinction")
else:
    print("Fail")
```
#pause
For `mark = 85`, the first condition is already true.

The `elif` is never reached.
#note[When testing thresholds, usually test the most restrictive/highest threshold first.]
]

= Trace the Chain
#slide[
For each value, which branch runs?

```python
if score >= 80:
    print("A")
elif score >= 60:
    print("B")
elif score >= 40:
    print("C")
else:
    print("D")
```

- 90
- 65
- 40
- 39
]

= Separate ifs or elif?
#slide[
```python
if temperature > 20:
    print("Warm")
if temperature > 30:
    print("Very warm")
```
#pause
If temperature is 35, *both* messages print.

#pause
With `elif`, only one branch in the chain can run.
]

= Choosing the Right Structure
#slide[
Use separate `if` statements when:

- several conditions may all be true.

Use `if-elif-else` when:

- the choices are mutually exclusive.

#pause
Example: a person can be both a student *and* employed — separate tests may make sense.
]

= Logical Operators
#slide[
Sometimes one comparison is not enough.

Python provides:

- `and` — both conditions must be true
- `or` — at least one condition must be true
- `not` — reverses a Boolean value
]

= and
#slide[
A theme park ride requires:

- age 12 or older
- height at least 140 cm

```python
if age >= 12 and height >= 140:
    print("You may ride")
else:
    print("Sorry")
```
#pause
Both tests must be `True`.
]

= Truth Table: and
#slide[
#table(
 columns: (auto, auto, auto), inset: 10pt,
 table.header([*A*], [*B*], [*A and B*]),
 [`True`], [`True`], [`True`],
 [`True`], [`False`], [`False`],
 [`False`], [`True`], [`False`],
 [`False`], [`False`], [`False`],
)
]

= or
#slide[
A discount is available if the customer is:

- a student, *or*
- aged 65 or over.

```python
if is_student or age >= 65:
    print("Discount applies")
```
#pause
Only one condition needs to be `True`.
]

= Truth Table: or
#slide[
#table(
 columns: (auto, auto, auto), inset: 10pt,
 table.header([*A*], [*B*], [*A or B*]),
 [`True`], [`True`], [`True`],
 [`True`], [`False`], [`True`],
 [`False`], [`True`], [`True`],
 [`False`], [`False`], [`False`],
)
]

= not
#slide[
`not` reverses a Boolean result.

```python
logged_in = False

if not logged_in:
    print("Please log in")
```
#pause
`not False` becomes `True`.
]

= Checking a Range
#slide[
Is `mark` between 40 and 69 inclusive?

Python allows chained comparisons:
```python
if 40 <= mark <= 69:
    print("Pass")
```
#pause
You can also write:
```python
if mark >= 40 and mark <= 69:
```

The first form is especially readable in Python.
]

= Common Range Error
#slide[
This does *not* mean between 40 and 69:
```python
if mark >= 40 or mark <= 69:
```
#pause
Why?

Almost every number satisfies at least one side.

For a value to be inside a range, we usually need `and`.
]

= Activity: Login Rule
#slide[
A user may log in only when:

- username is `student`
- password is `python123`

Write the condition.

```python
username = input("Username: ")
password = input("Password: ")
```
]

= Login Solution
#slide[
```python
if username == "student" and password == "python123":
    print("Access granted")
else:
    print("Access denied")
```
#pause
Extension: should passwords be case-sensitive? Should usernames?
]

= Nested Selection
#slide[
An `if` can appear inside another `if`.

```python
if age >= 18:
    if has_ticket:
        print("Enter")
    else:
        print("You need a ticket")
else:
    print("You must be 18+")
```
]

= Nested or and?
#slide[
Sometimes nesting explains *why* a user failed:

```python
if age >= 18:
    if has_ticket:
        print("Enter")
    else:
        print("You need a ticket")
else:
    print("You must be 18+")
```

#pause
If you only need one yes/no answer, this may be simpler:
```python
if age >= 18 and has_ticket:
```
]

= Input Validation with Selection
#slide[
```python
mark = int(input("Enter mark (0-100): "))

if mark < 0 or mark > 100:
    print("Invalid mark")
else:
    print("Valid mark")
```
#pause
Selection can detect bad input — but it does not ask again.

Iteration will later let us repeat until the input is valid.
]

= Full Example: Mark Report
#slide[
#set text(size: 17pt)
```python
mark = int(input("Enter mark: "))

if mark < 0 or mark > 100:
    print("Invalid mark")
elif mark >= 70:
    print("Distinction")
elif mark >= 40:
    print("Pass")
else:
    print("Fail")
```
#set text(size: 21pt)
]

= Full Example: Delivery Charge
#slide[
#set text(size: 17pt)
```python
order = float(input("Order value: €"))
member = input("Member? y/n: ").lower()

if order >= 50 or member == "y":
    delivery = 0
else:
    delivery = 5

print("Delivery: €", delivery)
```
#set text(size: 21pt)
]

= Debugging Challenge
#slide[
Find the problems:
```python
age = int(input("Age: "))

if age >= 13 and <= 19:
    print("Teenager")
elif age > 19
    print("Adult")
else:
print("Child")
```
#pause
There are three syntax/structure problems.
]

= Debugging Solution
#slide[
```python
age = int(input("Age: "))

if 13 <= age <= 19:
    print("Teenager")
elif age > 19:
    print("Adult")
else:
    print("Child")
```
]

= Design Activity: Cinema Ticket
#slide[
Design a program using these rules:

- Under 5 → Free
- 5–15 → €8
- 16–64 → €12
- 65+ → €9

Before coding, write the conditions in the order Python should test them.
]

= Cinema Ticket Solution
#slide[
#set text(size: 17pt)
```python
age = int(input("Age: "))

if age < 5:
    price = 0
elif age <= 15:
    price = 8
elif age <= 64:
    price = 12
else:
    price = 9

print("Ticket price: €", price)
```
#set text(size: 21pt)
]

= Mini Challenge: Leap Year Thinking
#slide[
A simplified rule:

A year is a leap year if it is divisible by 4.

Hint: modulo `%` gives the remainder.

```python
year % 4 == 0
```
#pause
Write a program that prints `Leap year` or `Not a leap year`.
]

= Selection + Functions
#slide[
Selection works naturally inside functions:

```python
def result(mark):
    if mark >= 40:
        return "Pass"
    else:
        return "Fail"

print(result(72))
```
#pause
This prepares us to build larger programs from small, reusable pieces.
]

= Final Check
#slide[
Which structure would you choose?

1. Print a warning if temperature is below zero.
2. Print Pass or Fail.
3. Classify a mark as Distinction / Pass / Fail.
4. Allow entry only if age and ticket conditions are satisfied.

#pause
`if`, `if-else`, `if-elif-else`, `and`.
]

= Session 2 Recap
#slide[
You should now be able to use:

- `if`, `elif`, `else`
- separate versus mutually-exclusive conditions
- `and`, `or`, `not`
- chained comparisons
- nested selection
- selection for basic validation

Most importantly: *write the decision rules clearly before writing the Python.*
]
