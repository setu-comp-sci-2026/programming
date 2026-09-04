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
    subtitle: [Parameters and Return Values],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
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

= Positional Parameters

*Parameters* are variables that receive values when the function is called.
*Arguments* are the values passed by the caller.

```python
def greet(name, time_of_day):      # name, time_of_day are parameters
    print(f"Good {time_of_day}, {name}!")

greet("Alice", "morning")          # positional — order matters
greet("Bob", "evening")
```

#pagebreak()

*Positional* arguments are matched to parameters *in order* — the first argument goes to the first parameter, the second to the second, and so on.

```python
def power(base, exponent):
    return base ** exponent

print(power(2, 8))    # 2^8 = 256
print(power(8, 2))    # 8^2 = 64  (different order, different result!)
```

= Keyword Arguments

*Keyword* arguments are passed by *name*, so order doesn't matter.

```python
def create_user(username, email, age):
    print(f"User: {username}, Email: {email}, Age: {age}")

# Keyword arguments — any order
create_user(email="alice@example.com", age=25, username="alice99")
```

#pause

You can *mix* positional and keyword arguments — positional must come first:

```python
create_user("alice99", age=25, email="alice@example.com")  # OK
# create_user(username="alice99", "alice@example.com", 25) # SyntaxError
```

= Default Parameter Values

Give a parameter a *default value* so it becomes optional at the call site.

```python
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")              # Hello, Alice!
greet("Bob", "Hi")          # Hi, Bob!
greet("Carol", greeting="Good morning")   # Good morning, Carol!
```

#pagebreak()

// *Practical example — configurable repeat:*

// ```python
// def repeat_print(message, times=3, separator="-"):
//     for i in range(times):
//         print(message)
//     print(separator * len(message))

// repeat_print("Hello")               # 3 times, dashes
// repeat_print("Warning!", times=5)   # 5 times, dashes
// repeat_print("Hi", times=2, separator="=")   # 2 times, equals
// ```

= The return Statement

`return` sends a value back to the caller and *immediately exits* the function.

```python
def square(n):
    return n * n

result = square(7)      # result = 49
print(square(5) + 1)    # 26
print(square(square(3)))# 81
```

#pagebreak()

A function can have *multiple return statements* — the first one reached exits the function:

```python
def absolute_value(n):
    if n < 0:
        return -n       # exits here for negatives
    return n            # exits here for non-negatives

print(absolute_value(-5))   # 5
print(absolute_value(7))    # 7
```

= Multiple Return Values

Python functions can return *multiple values* as a tuple.

```python
def min_max(numbers):
    """Return the minimum and maximum of a list."""
    return min(numbers), max(numbers)

lo, hi = min_max([3, 1, 7, 4, 2, 8, 5])
print(f"Min: {lo}, Max: {hi}")   # Min: 1, Max: 8
```

#pagebreak()

*Tuple unpacking* on the left side:

```python
def divide_with_remainder(a, b):
    quotient = a // b
    remainder = a % b
    return quotient, remainder

q, r = divide_with_remainder(17, 5)
print(f"17 ÷ 5 = {q} remainder {r}")   # 17 ÷ 5 = 3 remainder 2

# Or get the full tuple:
result = divide_with_remainder(100, 7)
print(result)   # (14, 2)
```

= Conditional Returns

== Ternary Expression

A *ternary expression* returns one of two values on a single line:

```
return <value_if_true> if <condition> else <value_if_false>
```

#pause

```python
def is_even(n):
    return "even" if n % 2 == 0 else "odd"

def absolute_value(n):
    return n if n >= 0 else -n

print(is_even(4))           # even
print(is_even(7))           # odd
print(absolute_value(-5))   # 5
```

#pause

#block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 14pt,
  width: 100%,
)[
  Use the ternary when there are exactly *two* outcomes and both fit clearly on one line. For three or more branches, use chained returns instead (see next slide).
]

== Chained Early Returns

When a function has *multiple branches*, return from each one immediately — no `elif` needed. The first `return` reached exits the function:

```python
def calculate_grade(score):
    """Return a letter grade for a numeric score."""
    if score >= 90: return "A"
    if score >= 80: return "B"
    if score >= 70: return "C"
    if score >= 60: return "D"
    return "F"           # fallback — only reached if all above are False

print(calculate_grade(95))   # A
print(calculate_grade(73))   # C
print(calculate_grade(42))   # F
```

#pagebreak()

*Why not `elif`?* Once a `return` fires, the function is already finished — Python never reaches the next `if`. This means `elif` is unnecessary, and removing it makes the logic easier to scan top to bottom.

#pause

#block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 14pt,
  width: 100%,
)[
  The final bare `return "F"` is the *catch-all* — it only runs if every condition above was `False`.
]

= Designing Good Functions

*Good functions:*
- Do *one thing* well (single responsibility)
- Have a clear, descriptive name
- Have a docstring
- Accept inputs as parameters
- Return output via `return` (don't `print` inside unless displaying is the function's job)

#pagebreak()

```python
# BAD — function does too many things and mixes I/O with logic
def process():
    name = input("Name: ")
    score = float(input("Score: "))
    grade = "Pass" if score >= 60 else "Fail"
    print(f"{name}: {grade}")

# GOOD — separate concerns
def get_input(prompt):
    return input(prompt)

def calculate_grade(score):
    return "Pass" if score >= 60 else "Fail"

def display_result(name, grade):
    print(f"{name}: {grade}")

name = get_input("Name: ")
score = float(get_input("Score: "))
grade = calculate_grade(score)
display_result(name, grade)
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