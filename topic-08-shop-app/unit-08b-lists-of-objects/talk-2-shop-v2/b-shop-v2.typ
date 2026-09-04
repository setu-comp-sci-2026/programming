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
    subtitle: [Shop v2.0 — Lists of Objects],
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

= The Shop Class

== A container for Product objects

```python
from product import Product

class Shop:
    def __init__(self, name: str):
        self.__name = name
        self.__products = []   # list of Product objects

    def get_name(self) -> str:
        return self.__name

    def get_all_products(self) -> list:
        return self.__products

    def __str__(self) -> str:
        return f"Shop: {self.__name} ({len(self.__products)} products)"
```

= `add_product()`

```python
class Shop:
    # ...
    def add_product(self, product: Product):
        if not isinstance(product, Product):
            raise TypeError("Must add a Product object")
        self.__products.append(product)
        return True
```

#v(.5em)
- `isinstance(product, Product)` checks the type
- `append()` adds to the end of the list
- Returns `True` so the caller knows it succeeded

= `get_all_products()` and Iteration

```python
class Shop:
    def get_all_products(self) -> list:
        return self.__products

    def display_all(self):
        if not self.__products:
            print("Shop is empty.")
            return
        print(f"\n--- {self.__name} ---")
        for product in self.__products:
            print(f"  {product}")
        print(f"  Total: {len(self.__products)} product(s)")
```

Iterating a list of objects is just like iterating a list of strings — `for product in self.__products:` gives you each Product in turn.

= `find_by_name()`

== Searching the list

```python
class Shop:
    def find_by_name(self, name: str):
        name = name.strip().lower()
        for product in self.__products:
            if product.get_name().lower() == name:
                return product
        return None   # not found
```

#v(.5em)
- `.lower()` makes the search case-insensitive
- Returns the *Product object* if found, `None` otherwise
- The caller checks: `if result is None:`

= `remove_product()`

```python
class Shop:
    def remove_product(self, name: str) -> bool:
        product = self.find_by_name(name)
        if product:
            self.__products.remove(product)
            return True
        return False
```

#v(.5em)
- Reuses `find_by_name()` — don't repeat yourself (DRY)
- `list.remove(item)` removes the *first* occurrence
- Returns `True` if removed, `False` if not found

= `total_value()`

```python
class Shop:
    def total_value(self) -> float:
        total = 0.0
        for product in self.__products:
            total += product.get_price()
        return total
```

#v(.5em)
Or using the built-in `sum()`:

```python
    def total_value(self) -> float:
        return sum(p.get_price() for p in self.__products)
```

Both are correct — the `sum()` version is more "Pythonic".

= Complete Shop Class Summary

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Method*], [*Description*],
  [`add_product(p)`], [Add a Product to the list],
  [`get_all_products()`], [Return the full list],
  [`find_by_name(name)`], [Search by name, return Product or None],
  [`remove_product(name)`], [Remove by name, return bool],
  [`total_value()`], [Sum of all product prices],
  [`display_all()`], [Print all products],
  [`__str__()`], [Summary string],
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