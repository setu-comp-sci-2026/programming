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
    subtitle: [Selection 1 — Decisions with if and if-else],
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

- Explain sequence and selection.
- Recognise Boolean conditions.
- Use relational operators correctly.
- Write `if` and `if-else` statements.
- Trace a program and predict which branch runs.
- Use indentation correctly in Python.
]

= Warm-up: What happens next?
#slide[
```python
name = input("Name: ")
print("Hello", name)
print("Welcome to SETU")
```
#pause
Every statement runs, from top to bottom.

#note[*This is sequence:* the default flow of execution.]
]

= Flow of Control
#slide[
#table(
 columns: (auto, 1fr), inset: 12pt,
 fill: (c,r) => if c == 0 { rgb("#d9d9df") } else { white },
 [*Sequence*], [Statements run in order],
 [*Selection*], [Statements run only when a condition is satisfied],
 [*Iteration*], [Statements are repeated],
)
#pause
Today we move from programs that always do the same thing to programs that can *make decisions*.
]

= A Real Decision
#slide[
A cinema might ask:

```python
age = int(input("Enter your age: "))
```

#pause
What should happen next?

- If age is 18 or more → allow entry.
- Otherwise → refuse entry.

#pause
The program needs a condition whose answer is either *True* or *False*.
]

= Boolean Values
#slide[
Python has a Boolean data type: `bool`.

```python
is_raining = True
logged_in = False
```
#pause
There are only two Boolean values:

- `True`
- `False`

#pause
Notice the capital letters.
]

= Boolean Expressions
#slide[
A Boolean expression produces `True` or `False`.

```python
age >= 18
mark >= 40
password == "python"
number < 0
```
#pause
Try these in the Python REPL:

```python
>>> 10 > 5
True
>>> 10 == 5
False
```
]

= Relational Operators
#slide[
#table(
 columns: (auto, auto, 1fr), inset: 8pt,
 table.header([*Operator*], [*Example*], [*Meaning*]),
 [`>`], [`x > y`], [greater than],
 [`>=`], [`x >= y`], [greater than or equal to],
 [`<`], [`x < y`], [less than],
 [`<=`], [`x <= y`], [less than or equal to],
 [#text(fill:red)[`==`]], [#text(fill:red)[`x == y`]], [equal to],
 [`!=`], [`x != y`], [not equal to],
)
]

= = versus ==
#slide[
```python
age = 18
```
means *put 18 into age*.

#pause
```python
age == 18
```
asks *is age equal to 18?*

#pause
#note[*Common beginner error:* `=` assigns; `==` compares.]
]

= Predict the Result
#slide[
What does each expression produce?

```python
10 > 3
7 == 7
5 != 5
12 <= 10
"cat" == "cat"
```
#pause
Answers: `True`, `True`, `False`, `False`, `True`.
]

= The if Statement
#slide[
```python
if condition:
    statement
```

#pause
Example:

```python
age = 20

if age >= 18:
    print("You are an adult")
```
#pause
The indented statement runs *only if* the condition is `True`.
]

= Indentation Matters
#slide[
Correct:
```python
if mark >= 40:
    print("Pass")
    print("Well done")
```

#pause
Incorrect:
```python
if mark >= 40:
print("Pass")
```

#note[Python uses indentation to define the block belonging to the `if`.]
]

= Trace an if
#slide[
```python
temperature = 25

if temperature > 20:
    print("Warm day")

print("Finished")
```
#pause
Output:
```text
Warm day
Finished
```
#pause
What changes if `temperature = 12`?
]

= One-way Selection
#slide[
An `if` statement is *one-way selection*.

```python
balance = 100
withdrawal = 40

if withdrawal <= balance:
    balance = balance - withdrawal

print(balance)
```
#pause
If the condition is false, Python simply skips the indented block.
]

= Mini Activity: Free Delivery
#slide[
An online shop gives free delivery when an order is €50 or more.

Complete:
```python
order_total = float(input("Order total: €"))

# your selection here
```
#pause
#note[Write the condition first. Then decide what statement belongs inside the block.]
]

= Activity Solution
#slide[
```python
order_total = float(input("Order total: €"))

if order_total >= 50:
    print("Free delivery")
```

#pause
Question: what happens for an order of €30?
]

= When We Need Two Outcomes
#slide[
Suppose every mark must be classified as either:

- Pass
- Fail

#pause
We could write two separate `if` statements...

```python
if mark >= 40:
    print("Pass")
if mark < 40:
    print("Fail")
```

But Python gives us a clearer structure.
]

= if-else
#slide[
```python
if condition:
    statements_when_true
else:
    statements_when_false
```
#pause
Exactly *one* branch runs.
]

= Pass or Fail
#slide[
```python
mark = int(input("Enter mark: "))

if mark >= 40:
    print("Pass")
else:
    print("Fail")
```
#pause
Trace it for:

- `mark = 72`
- `mark = 38`
- `mark = 40`
]

= Boundary Values Matter
#slide[
Consider:
```python
if age > 18:
    print("Adult")
else:
    print("Not adult")
```
#pause
What happens when `age == 18`?

#pause
If 18 counts as adult, the condition should be:
```python
if age >= 18:
```
#note[Always test values *at the boundary*.]
]

= Strings in Conditions
#slide[
Selection is not limited to numbers.

```python
answer = input("Continue? y/n: ")

if answer == "y":
    print("Continuing...")
else:
    print("Stopping...")
```
#pause
String comparisons are case-sensitive: `"Y" != "y"`.
]

= Making String Input Friendlier
#slide[
```python
answer = input("Continue? y/n: ").lower()

if answer == "y":
    print("Continuing...")
else:
    print("Stopping...")
```
#pause
Now `Y` and `y` are both treated as `"y"`.
]

= Common Errors
#slide[
Which errors can you spot?

```python
age = input("Age: ")

if age = 18
    print("You are 18")
else
print("You are not 18")
```
#pause
Problems:
- `input()` returns a string.
- `=` should be `==` for comparison.
- `:` is missing.
- indentation is missing.
]

= Fix the Program
#slide[
Correct version:
```python
age = int(input("Age: "))

if age == 18:
    print("You are 18")
else:
    print("You are not 18")
```
]

= Mini-program: Ticket Price
#slide[
Requirement:

- Under 16 → €8
- Everyone else → €12

#pause
```python
age = int(input("Age: "))

if age < 16:
    price = 8
else:
    price = 12

print("Ticket price: €", price)
```
]

= Think Before You Code
#slide[
For each problem, identify:

1. What data do I need?
2. What is the Boolean condition?
3. What happens when it is true?
4. Do I need an `else`?

#pause
This planning habit becomes increasingly important as selection gets more complex.
]

= Practice Challenge
#slide[
Write a program that asks for a number.

- If it is positive, print `Positive`.
- Otherwise print `Zero or negative`.

#pause
Extension: how could you distinguish between *zero* and *negative*?

That leads us into the next session.
]

= Session 1 Recap
#slide[
You should now be comfortable with:

- Boolean values and conditions
- `>`, `<`, `>=`, `<=`, `==`, `!=`
- `if`
- `if-else`
- indentation
- tracing branches
- testing boundary values

Next: *more than two choices* and *combining conditions*.
]
