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
    subtitle: [Input and Output],
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

= The input() Function

`input()` reads a line of text from the user and always returns a *string*.

```python
name = input("What is your name? ")
print(f"Hello, {name}!")

# The return value is ALWAYS a string
age_str = input("How old are you? ")
print(type(age_str))    # <class 'str'>
print(age_str + 1)      # TypeError! Can't add str and int
```

#pause

*Key point:* even if the user types `25`, Python stores it as the string `"25"`, not the integer `25`.

You must *convert* it if you want to do arithmetic.

= Type Conversion

Convert the string returned by `input()` to the type you need.

```python
# int() — convert to integer
age = int(input("Age: "))
next_year = age + 1
print(f"Next year you'll be {next_year}")

# float() — convert to decimal
price = float(input("Price: "))
with_tax = price * 1.23
print(f"With 23% VAT: €{with_tax:.2f}")

# str() — convert to string (rarely needed with input)
number = 42
message = "The answer is " + str(number)

# bool() — almost never used with input — use comparison instead
response = input("Continue? (Y/N): ")
going = response.upper() == "Y"
```

= Handling Bad Input with try/except

If the user types something that can't be converted, Python raises an exception.

```python
# This crashes if user types "hello" instead of a number
age = int(input("Age: "))   # ValueError if not a number
```

#pause

*Safe version with try/except:*

```python
while True:
    try:
        age = int(input("Enter your age: "))
        if age < 0 or age > 120:
            print("Please enter a realistic age")
            continue
        break
    except ValueError:
        print("That's not a valid number. Please try again.")

print(f"You are {age} years old")
```

= Input Validation Pattern

*The clean, reusable pattern for validated input:*

```python
def get_integer(prompt, minimum=None, maximum=None):
    """Prompt user until they enter a valid integer in range."""
    while True:
        try:
            value = int(input(prompt))
            if minimum is not None and value < minimum:
                print(f"Please enter at least {minimum}")
                continue
            if maximum is not None and value > maximum:
                print(f"Please enter at most {maximum}")
                continue
            return value
        except ValueError:
            print("Please enter a whole number")

age   = get_integer("Age: ", 0, 120)
score = get_integer("Score (0-100): ", 0, 100)
```

= The print() Function

`print()` supports several useful options:

```python
# Basic print
print("Hello, World!")

# Multiple values — separated by space by default
print("Name:", "Alice", "Age:", 25)
# Name: Alice Age: 25

# Custom separator
print("Alice", "Bob", "Carol", sep=", ")
# Alice, Bob, Carol

print(1, 2, 3, 4, 5, sep=" | ")
# 1 | 2 | 3 | 4 | 5

# Custom end (default is newline \n)
print("Loading", end="")
print(".", end="")
print(".", end="")
print(". Done!")
# Loading... Done!
```

= print() for Debugging

```python
# Check variable values
x = 42
print(f"{x = }")    # x = 42  (Python 3.8+ f-string debug syntax)

# Check multiple variables
a, b, c = 10, 20, 30
print(f"{a = }, {b = }, {c = }")   # a = 10, b = 20, c = 30

# Print with type info
value = 3.14
print(f"value = {value!r} (type: {type(value).__name__})")
# value = 3.14 (type: float)
```

#pause

```python
# Tracing a loop
for i in range(5):
    print(f"Loop iteration {i}: value = {i**2}")
```

= Practical — Interactive Calculator

```python
def get_number(prompt):
    while True:
        try:
            return float(input(prompt))
        except ValueError:
            print("Please enter a number")

def get_operator():
    while True:
        op = input("Operator (+, -, *, /): ").strip()
        if op in "+-*/":
            return op
        print("Please enter +, -, * or /")

a = get_number("First number: ")
op = get_operator()
b = get_number("Second number: ")

if op == "+":  result = a + b
elif op == "-": result = a - b
elif op == "*": result = a * b
elif op == "/":
    if b == 0:
        print("Cannot divide by zero")
    else:
        result = a / b
        print(f"{a} {op} {b} = {result:.4g}")
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