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
    subtitle: [Basics of Print and Input],
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

= The `print()` Function

`print()` displays output in the terminal.

```python
print("Hello, World!")
print("My name is Python")
```

Output:
```
Hello, World!
My name is Python
```

#pause

You can print *numbers* and *expressions* too:

```python
print(42)
print(10 + 5)
print(3.14)
```

= Printing Multiple Values

You can pass multiple values to `print()` separated by commas — it adds a *space* between them by default:

```python
name = "Alice"
age  = 20

print("Name:", name)
print("Age:", age)
print("Name:", name, "Age:", age)
```

Output:
```
Name: Alice
Age: 20
Name: Alice Age: 20
```

== Changing the Separator

Use `sep=` to change what goes between values:

```python
print("Alice", "Bob", "Carol", sep=", ")
print(2026, 6, 18, sep="-")
```

Output:
```
Alice, Bob, Carol
2026-6-18
```

== Staying on the Same Line

By default `print()` adds a newline at the end. Use `end=` to change this:

```python
print("Loading", end="")
print("...")
```

Output:
```
Loading...
```

= The `input()` Function

`input()` *pauses* the program and waits for the user to type something and press Enter.

The text inside the brackets is the *prompt* shown to the user.

```python
name = input("What is your name? ")
print("Hello,", name)
```

Running this:
```
What is your name? Alice
Hello, Alice
```

#pause

#block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
)[
  *Important:* `input()` *always* returns a *string*, even if the user types a number.
]

= `input()` Always Returns a String

```python
age = input("Enter your age: ")
print(age)
print(type(age))
```

Output (if user types `20`):
```
20
<class 'str'>
```

#pagebreak()

To use the value as a *number*, convert it with `int()` or `float()`:

```python
age    = int(input("Enter your age: "))
height = float(input("Enter your height (m): "))

print("Age:", age)
print("Height:", height)
print(type(age))     # <class 'int'>
print(type(height))  # <class 'float'>
```

= Formatted Output with f-strings

Prefix a string with `f` to embed *expressions* directly inside `{}`:

```python
name = "Alice"
age  = 20

print(f"Hello, {name}!")
print(f"Next year you will be {age + 1}")
```

Output:
```
Hello, Alice!
Next year you will be 21
```
#pagebreak()
You can control number formatting inside the `{}` with a colon:

```python
price = 9.5
pi    = 3.14159

print(f"Price:  £{price:.2f}")   # 2 decimal places
print(f"Pi ≈ {pi:.4f}")          # 4 decimal places
print(f"Score: {0.756:.0%}")     # percentage
```

Output:
```
Price:  £9.50
Pi ≈ 3.1416
Score: 76%
```

#block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 12pt,
  width: 100%,
)[
  f-strings are the *recommended* way to format output — you will see them throughout the course.
]

= Putting It Together

A simple program that asks for two numbers and prints their sum:

```python
num1 = float(input("Enter first number:  "))
num2 = float(input("Enter second number: "))

total = num1 + num2

print("Sum:", total)
```

Running this:
```
Enter first number:  12.5
Enter second number: 7.5
Sum: 20.0
```

#pagebreak()

A personal greeting:

```python
first_name = input("First name: ")
last_name  = input("Last name:  ")

print("Welcome,", first_name, last_name)
```

#slide(title: none, header: none, footer: none, align: center + horizon)[
  #text(size: 2em, weight: "bold")[
    Thanks for Watching - Any questions?

    #v(2em)

    #image("assets/thanks.png", width: 5cm)
  ]
]
