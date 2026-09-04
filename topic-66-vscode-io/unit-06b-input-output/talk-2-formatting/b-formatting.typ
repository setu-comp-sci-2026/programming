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
    subtitle: [Formatting Output],
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

= f-Strings — Basics

*f-strings* (formatted string literals) are the modern way to embed values in strings.

```python
name = "Alice"
age  = 25
gpa  = 3.87

# Basic embedding
print(f"Name: {name}")
print(f"Age: {age}")
print(f"GPA: {gpa}")

# Expressions in {}
print(f"In 5 years: {age + 5}")
print(f"GPA rounded: {round(gpa, 1)}")
print(f"Initials: {name[0]}.")

# Method calls in {}
print(f"Upper: {name.upper()}")
print(f"Words: {len(name.split())}")
```

= f-String Format Specifiers

Add a `:` after the expression to specify formatting.

```python
pi = 3.14159265

# Decimal places
print(f"{pi:.2f}")      # 3.14
print(f"{pi:.4f}")      # 3.1416
print(f"{pi:.0f}")      # 3

# Width
print(f"{pi:10.2f}")    # "      3.14"  (width 10)
print(f"{42:05d}")      # "00042"       (zero-padded)

# Thousands separator
big = 1234567.89
print(f"{big:,.2f}")    # 1,234,567.89
print(f"{big:,.0f}")    # 1,234,568

# Percentage
ratio = 0.8523
print(f"{ratio:.1%}")   # 85.2%
print(f"{ratio:.2%}")   # 85.23%
```

= Alignment

```python
name = "Alice"

# Left-align (default for strings)
print(f"|{name:<10}|")    # |Alice     |

# Right-align (default for numbers)
print(f"|{name:>10}|")    # |     Alice|

# Centre-align
print(f"|{name:^10}|")    # |  Alice   |

# Custom fill character
print(f"|{name:*<10}|")   # |Alice*****|
print(f"|{name:->10}|")   # |-----Alice|
print(f"|{name:-^10}|")   # |--Alice---|
```

#pause

*Practical — printing a table:*

```python
items = [("Apple", 0.99, 5), ("Bread", 2.49, 2), ("Milk", 1.29, 3)]
print(f"{'Item':<12} {'Price':>8} {'Qty':>5} {'Total':>8}")
print("-" * 36)
for name, price, qty in items:
    total = price * qty
    print(f"{name:<12} {price:>8.2f} {qty:>5} {total:>8.2f}")
```

= Format Specifier Summary

#table(
  columns: (auto, 1fr, auto),
  inset: 8pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Spec*], [*Meaning*], [*Example*],
  [`:.2f`], [2 decimal places (float)], [`3.14`],
  [`:d`], [Integer], [`42`],
  [`:,`], [Thousands separator], [`1,234`],
  [`:,.2f`], [Thousands + 2 decimals], [`1,234.57`],
  [`:.1%`], [Percentage, 1 decimal], [`85.2%`],
  [`:<10`], [Left-align, width 10], [`hello     `],
  [`:>10`], [Right-align, width 10], [`     hello`],
  [`:^10`], [Centre, width 10], [`  hello   `],
  [`:05d`], [Zero-padded integer], [`00042`],
  [`:e`], [Scientific notation], [`3.14e+00`],
)

= Old-Style Formatting vs f-Strings

Python has several ways to format strings. Know them so you can read older code.

```python
name = "Bob"
score = 87.5

# Old %-style (Python 2 era — avoid in new code)
print("Name: %s, Score: %.1f" % (name, score))

# str.format() method (Python 3.0+)
print("Name: {}, Score: {:.1f}".format(name, score))
print("Name: {n}, Score: {s:.1f}".format(n=name, s=score))

# f-string (Python 3.6+ — preferred)
print(f"Name: {name}, Score: {score:.1f}")
```

#pause

*Use f-strings* for all new code — they are the most readable and fastest.

= Pretty Printing Tables

Build neat tabular output using alignment specifiers.

```python
def print_report(students):
    """Print a formatted student report table."""
    header = f"{'Name':<12} {'Score':>6} {'Grade':>6} {'Status':>8}"
    separator = "-" * len(header)

    print(header)
    print(separator)

    for name, score in students:
        if score >= 90:   grade = "A"
        elif score >= 80: grade = "B"
        elif score >= 70: grade = "C"
        elif score >= 60: grade = "D"
        else:             grade = "F"
        status = "Pass" if score >= 60 else "Fail"
        print(f"{name:<12} {score:>6.1f} {grade:>6} {status:>8}")

students = [("Alice", 92.5), ("Bob", 74.0), ("Carol", 58.5), ("Dave", 85.0)]
print_report(students)
```

= Combining Input and Formatted Output

```python
def get_float(prompt, minimum=None, maximum=None):
    while True:
        try:
            value = float(input(prompt))
            if minimum is not None and value < minimum:
                print(f"Minimum value is {minimum}")
                continue
            if maximum is not None and value > maximum:
                print(f"Maximum value is {maximum}")
                continue
            return value
        except ValueError:
            print("Please enter a number")

print("=== Loan Calculator ===")
principal = get_float("Loan amount (EUR): ", 0)
rate      = get_float("Annual interest rate (%): ", 0, 100) / 100
years     = int(get_float("Term (years): ", 1, 30))

monthly_rate = rate / 12
months = years * 12
monthly = principal * monthly_rate / (1 - (1 + monthly_rate) ** -months)
total = monthly * months

print(f"\nMonthly payment: €{monthly:,.2f}")
print(f"Total repaid:    €{total:,.2f}")
print(f"Interest paid:   €{total - principal:,.2f}")
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