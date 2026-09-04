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
    subtitle: [Validation and Defensive Programming],
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

= Why Validate?

== Garbage In, Garbage Out

Without validation, bad data silently corrupts our program:

```python
# No validation — these "work" but make no sense
p1 = Product("Apple", -5.00, 101)   # negative price!
p2 = Product("",       1.99, 102)   # empty name!
p3 = Product("Milk",   0.00, 103)   # free milk?
```

#v(.5em)
*Defensive programming* means checking inputs *before* storing them, so problems are caught early with clear error messages.

= Validating Price

== Price must be greater than zero

```python
class Product:
    def set_price(self, price: float):
        if price <= 0:
            raise ValueError(
                f"Price must be greater than 0, got {price}"
            )
        self.__price = price

    def __init__(self, name: str, price: float, product_id: int):
        self.__name = ""
        self.__price = 0.0
        self.__product_id = product_id
        self.set_name(name)    # validate via setter
        self.set_price(price)  # validate via setter
```

= Validating Name

== Name must not be empty

```python
class Product:
    def set_name(self, name: str):
        name = name.strip()          # remove whitespace
        if not name:
            raise ValueError(
                "Product name cannot be empty"
            )
        self.__name = name
```

#v(.5em)
`.strip()` removes leading/trailing spaces, so `"  "` becomes `""` which fails the check — good!

= Raising `ValueError`

== Python's built-in exception for bad values

```python
raise ValueError("message describing the problem")
```

#v(.5em)
- `ValueError` is the standard Python exception for invalid values
- `raise` immediately stops execution of the current function
- The caller must handle it or the program crashes with a helpful message

#v(.5em)
Other useful exceptions:
- `TypeError` — wrong type passed in
- `IndexError` — index out of range
- `KeyError` — key not found in dict

= Handling Exceptions with `try/except`

```python
from product import Product

def main():
    try:
        p = Product("Apple", -1.99, 101)  # will raise!
        print(p)
    except ValueError as e:
        print(f"Could not create product: {e}")

    # Program continues here
    print("Program still running...")

if __name__ == "__main__":
    main()
```

Output:
```
Could not create product: Price must be greater than 0, got -1.99
Program still running...
```

= Defensive Programming in the Driver

```python
def create_product_safely(name, price, pid):
    try:
        return Product(name, price, pid)
    except ValueError as e:
        print(f"  [ERROR] {e}")
        return None

def main():
    products_data = [
        ("Apple",  1.99, 101),
        ("",       2.50, 102),   # bad name
        ("Milk",  -1.00, 103),   # bad price
        ("Bread",  2.00, 104),
    ]
    products = []
    for name, price, pid in products_data:
        p = create_product_safely(name, price, pid)
        if p:
            products.append(p)
    print(f"\n{len(products)} valid products created")
```

= Updated Product Class with Validation

```python
class Product:
    def __init__(self, name: str, price: float,
                 product_id: int):
        self.__product_id = product_id
        self.__name = ""
        self.__price = 0.0
        self.set_name(name)
        self.set_price(price)

    def set_name(self, name: str):
        name = name.strip()
        if not name:
            raise ValueError("Name cannot be empty")
        self.__name = name

    def set_price(self, price: float):
        if price <= 0:
            raise ValueError(
                f"Price must be > 0, got {price}")
        self.__price = price
```

= Summary

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Concept*], [*Purpose*],
  [`raise ValueError`], [Signal that a value is invalid],
  [`try/except`], [Handle errors gracefully],
  [Setter validation], [Enforce rules when data is set],
  [`name.strip()`], [Clean whitespace before checking],
  [Call setters in `__init__`], [Validate on construction too],
)

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
