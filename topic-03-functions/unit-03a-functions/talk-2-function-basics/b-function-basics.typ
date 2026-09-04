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
    subtitle: [Function Basics],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)
#let note(body) = block(
  fill: rgb("#c6f1c7"),
  stroke: (paint: rgb("#4caf50"), thickness: 1.5pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
  body
)
#show raw.where(block: true): it => block(
  fill: rgb("#dbeafe"),
  stroke: (paint: rgb("#3572A5"), thickness: 1.5pt),
  radius: 6pt,
  inset: 12pt,
  width: 100%,
  it
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= What is a Function?

A *function* is a named, reusable block of code that performs a specific task.

#pause

*Why use functions?*

- *Reuse* — write once, call many times
- *Abstraction* — hide complexity behind a simple name
- *Organisation* — break a big program into small, understandable parts
- *Testing* — test each piece independently
- *Maintenance* — fix a bug in one place, fixed everywhere

#pause

You have already used built-in functions: `print()`, `input()`, `float()`, `int()`.

Now you will write your *own*.

= The `def` Keyword

```python
def function_name(parameters):
    """Optional docstring."""
    # function body
    return value   # optional
```
#note[
  *NOTE:*
  
The return statement (when there) has two purposes:
  - to return a value from the function
  - to exit the function (wherever it appears - see later with *if statements*)
  
  ]
#pagebreak()

*Simplest possible function:*

```python
def say_hello():
    print("Hello, World!")

# Call the function
say_hello()     # Hello, World!
say_hello()     # Hello, World!
say_hello()     # Hello, World!
```

The function is *defined* once with `def` and *called* as many times as you like.

= Calling a Function

A function does nothing until it is *called* (invoked).

```python
def greet():
    print("Good morning!")
    print("Welcome to Python.")

# Nothing happens yet — we haven't called it

greet()     # Now it runs
greet()     # Runs again
```

#slide[

*Functions can call other functions:*

```python
def draw_line():
    print("-" * 30)  # 30 hyphens

def print_header(title):
    draw_line()
    print(title)
    draw_line()

print_header("Student Report") # prints ---- Student Report ----
```
]
= Void Functions and None

A function that has no `return` statement implicitly returns the special value `None`.

```python
def greet(name):
    print(f"Hello, {name}!")

result = greet("Alice")     # prints Hello, Alice!
print(result)               # None
print(type(result))         # <class 'NoneType'>
```

#pause
#note[ 
  *NOTE:*
*`None`* represents "no value" in Python. It is *not* zero, not an empty string — it is the absence of a value.]

#pagebreak()
*Common mistake:*

```python
def add(a, b):
    print(a + b)    # prints but does NOT return

result = add(3, 4)      # prints 7
doubled = result * 2    # TypeError: NoneType * int
```

= Docstrings

A *docstring* is a string literal at the top of a function body. It documents what the function does.
#pagebreak()

```python
:
(part of the calculate.py file)
:
def calculate_area(width, height):
    """Calculate and return the area of a rectangle.

    Args:
        width: The width of the rectangle (number).
        height: The height of the rectangle (number).

    Returns:
        The area as a number (width * height).
    """
    return width * height
```

#pagebreak()
#list(
[Access docstrings with `help()` or `.__doc__`:],


[Use REPL (gp to terminal and run 
     ```python
     $python3   #loads the interpreter (REPL)
     >>> import calculate #imports the calculate.py file

     ```
    
```python
>>> print(fi.calculate_area.__doc__)
Calculate and return the area of a rectangle.

Args:
    width: The width of the rectangle (number).
    height: The height of the rectangle (number).

Returns:
    The area as a number (width * height).
```
     ])
#pagebreak()
#note[*NOTE*
*Best practice:* every function should have a docstring.]

= Functions in Practice

```python
def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit."""
    return (celsius * 9 / 5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius."""
    return (fahrenheit - 32) * 5 / 9

# Use the functions
boiling_c = 100
boiling_f = celsius_to_fahrenheit(boiling_c)
print(f"{boiling_c}°C = {boiling_f}°F")     # 100°C = 212.0°F

freezing_f = 32
freezing_c = fahrenheit_to_celsius(freezing_f)
print(f"{freezing_f}°F = {freezing_c}°C")   # 32°F = 0.0°C
```

= Building a Program with Functions
#text(size: 13pt)[
```python
def get_student_data():
    """Prompt user for student name and score."""
    name = input("Student name: ")
    score = float(input("Score (0-100): "))
    return name, score
```
#pause
```python
def calculate_grade(score):
    """Return letter grade for a numeric score."""
    if score >= 90: return "A"
    if score >= 80: return "B"
    if score >= 70: return "C"
    if score >= 60: return "D"
    return "F"
```
#pause
```python
def print_result(name, score, grade):
    """Print formatted student result."""
    print(f"\n{name}: {score:.1f} → Grade {grade}")
```
#pause
```python
# Main program
name, score = get_student_data()
grade = calculate_grade(score)
print_result(name, score, grade)
```
]
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