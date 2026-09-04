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
    subtitle: [Exception Handling],
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

= What are Exceptions?

== Errors that happen at runtime

```python
int("hello")       # ValueError
10 / 0             # ZeroDivisionError
my_list[100]       # IndexError
my_dict["key"]     # KeyError
open("missing.txt") # FileNotFoundError
```

Without handling: the program *crashes* with a traceback.

With handling: the program *recovers* gracefully and continues (or exits cleanly).

= `try` / `except`

```python
try:
    value = int(input("Enter a number: "))
    result = 100 / value
    print(f"100 / {value} = {result}")
except ValueError:
    print("That was not a valid integer!")
except ZeroDivisionError:
    print("Cannot divide by zero!")
```

- The `try` block contains code that *might* raise an exception
- Each `except` block handles a *specific* exception type
- If no exception: `except` blocks are skipped

= `else` and `finally`

```python
try:
    f = open("data.txt", "r")
    content = f.read()
except FileNotFoundError:
    print("File not found!")
    content = ""
else:
    # Runs only if try succeeded (no exception)
    print(f"Read {len(content)} characters")
finally:
    # ALWAYS runs — exception or not
    print("Done attempting to read file.")
    # good place to close resources
```

= Common Python Exceptions

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Exception*], [*When raised*],
  [`ValueError`], [Wrong value type/range (e.g. `int("abc")`)],
  [`TypeError`], [Wrong type in operation],
  [`IndexError`], [List index out of range],
  [`KeyError`], [Dict key not found],
  [`FileNotFoundError`], [File does not exist],
  [`ZeroDivisionError`], [Division by zero],
  [`AttributeError`], [Object has no such attribute],
  [`NameError`], [Variable not defined],
)

= Capturing the Exception Object

```python
try:
    product = Product("Apple", -5.0, 101)
except ValueError as e:
    print(f"Could not create product: {e}")
    # Output: Could not create product: Price must be > 0

# Multiple except, one handler
try:
    data = process_input(raw)
except (ValueError, TypeError) as e:
    print(f"Bad input: {e}")
```

= Raising Exceptions

== Signal errors from your code

```python
def set_price(self, price: float):
    if price <= 0:
        raise ValueError(f"Price must be > 0, got {price}")
    self.__price = price

def find_by_id(self, pid: int):
    for p in self.__products:
        if p.get_product_id() == pid:
            return p
    raise KeyError(f"No product with ID {pid}")
```

Use `raise` to push the problem *up to the caller*, who may be able to handle it better.

= Custom Exceptions

```python
class ShopError(Exception):
    """Base exception for Shop application."""
    pass

class DuplicateProductError(ShopError):
    def __init__(self, product_id: int):
        super().__init__(
            f"Product with ID {product_id} already exists"
        )
        self.product_id = product_id

class ProductNotFoundError(ShopError):
    def __init__(self, name: str):
        super().__init__(f"Product '{name}' not found")
        self.name = name

# Usage
raise DuplicateProductError(101)
```

= Exception Hierarchy

```
BaseException
└── Exception
    ├── ValueError
    ├── TypeError
    ├── IndexError
    ├── KeyError
    ├── FileNotFoundError  (subclass of OSError)
    └── ... (your custom exceptions here)
```

Catching a *parent* class catches all its subclasses:
```python
except Exception as e:   # catches almost everything
    print(f"Unexpected error: {e}")
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

