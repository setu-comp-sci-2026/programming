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
    subtitle: [Scope of Variables],
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

= What is Scope?

*Scope* refers to the region of a program where a variable is accessible.

#pause

Python uses *LEGB* scope rules:
- *L* — Local: variables defined inside the current function
- *E* — Enclosing: variables in any enclosing functions
- *G* — Global: variables defined at module level
- *B* — Built-in: Python's built-in names (`len`, `print`, `range`, ...)

#pause
```python
x = 10          # global scope
def my_func():
    y = 20      # local scope
    print(x)    # can read global x
    print(y)    # can read local y
my_func()
print(y)        # NameError: y is not defined here
```

= Local Variables 1

Variables created *inside* a function exist only for the duration of that function call.

#pause

```python
def calculate_area(width, height):
    area = width * height   # 'area' is local
    return area

result = calculate_area(5, 3)
print(result)   # 15

# print(area)   # NameError — 'area' doesn't exist here
```
= Local Variables 2

Each call creates a *fresh* set of local variables:

```python
def count_up(start):
    count = start       # new 'count' each call
    count += 1
    return count

print(count_up(0))   # 1
print(count_up(5))   # 6
```

= Global Variables 1

Variables defined *outside* all functions are global and can be *read* anywhere.

```python
greeting = "Hello"      # global

def say_hello(name):
    print(greeting + ", " + name)   # reads global

say_hello("Alice")   # Hello, Alice
say_hello("Bob")     # Hello, Bob
```

= Global Variables 2

*Why avoid global variables?*

- Functions become harder to test (hidden dependencies)
- Any part of the program can modify them accidentally
- Makes code harder to understand and debug
- Prefer passing values as *parameters* and returning *results*

= The `global` Keyword

If you need to *assign* to a global variable inside a function, use the `global` keyword.

```python
counter = 0     # global

def increment():
    global counter      # declare we want the global
    counter += 1        # now this modifies the global

increment()
increment()
increment()
print(counter)  # 3
```

#pause

*Without* `global`, Python creates a new local variable:

= The `global` Keyword

```python
counter = 0

def broken_increment():
    counter += 1    # UnboundLocalError!
    # Python sees an assignment → treats as local
    # but local 'counter' hasn't been defined yet

broken_increment()
```

#pause

*Best practice:* avoid `global` — pass the value in and return the updated value instead.

= Scope Examples

*Example 1 — Shadowing:*

```python
value = 100

def show():
    value = 999     # new LOCAL variable, shadows global
    print(value)    # 999

show()
print(value)        # 100 — global unchanged
```

= Scope Examples
*Example 1 — Better version*

```python
value = 100

def show(value):
    value = 999     # update value
    print(value)    # 999
    return value

value = show(value)
print(value)        # 999 updated value
```
= Scope Examples
*Example 2 — Correct pattern (no globals needed):*

```python
def add_tax(price, rate=0.23):
    tax = price * rate
    total = price + tax
    return total

item_price = 50.00
final_price = add_tax(item_price)
print(f"Total: €{final_price:.2f}")   # Total: €61.50
```

= Scope Best Practices

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#d8b4fe") } else { white },
  [*Do This*], [*Reason*],
  [Pass data as parameters], [Explicit, testable, no hidden dependencies],
  [Return results from functions], [Caller controls what to do with the result],
  [Keep functions short and focused], [Easier to reason about scope],
  [Avoid `global` keyword], [Global state leads to bugs],
  [Use constants in UPPER_CASE], [Signals "don't modify this"],
)

= Scope Best Practices
```python
# Good pattern
MAX_SCORE = 100     # module-level constant (acceptable)

def calculate_grade(score):
    percentage = (score / MAX_SCORE) * 100
    if percentage >= 70:
        return "Pass"
    return "Fail"
```

// #slide(title: none, header: none, footer: none, align: center + horizon)[
//   #text(size: 2em, weight: "bold")[Thanks for Watching - Any questions?]
// ]

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