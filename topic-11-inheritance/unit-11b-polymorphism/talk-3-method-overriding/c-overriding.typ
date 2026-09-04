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
    subtitle: [Dunder Methods and Operator Overloading],
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

= Dunder (Magic) Methods

== Python's special method protocol

Methods with double underscores (`__name__`) are called *dunder* or *magic* methods. Python calls them automatically in specific situations.

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Method*], [*Trigger*], [*Purpose*],
  [`__str__`], [`print(obj)`, `str(obj)`], [Human-readable string],
  [`__repr__`], [REPL, debugging], [Developer string],
  [`__eq__`], [`obj1 == obj2`], [Equality check],
  [`__lt__`], [`obj1 < obj2`], [Less-than comparison],
  [`__len__`], [`len(obj)`], [Length],
  [`__add__`], [`obj1 + obj2`], [Addition],
)

= Overriding `__str__`

```python
class Product:
    # Without __str__:
    # print(p) → <product.Product object at 0x7f...>

    def __str__(self) -> str:
        return (f"Product [{self.__product_id}]: "
                f"{self.__name} — €{self.__price:.2f}")

p = Product("Apple", 1.99, 101)
print(p)               # Product [101]: Apple — €1.99
print(f"Item: {p}")    # Item: Product [101]: Apple — €1.99
```

= Overriding `__eq__`

```python
class Product:
    def __eq__(self, other) -> bool:
        if not isinstance(other, Product):
            return NotImplemented
        return self.__product_id == other.__product_id

p1 = Product("Apple", 1.99, 101)
p2 = Product("Apple", 2.50, 101)   # same ID, different price
p3 = Product("Bread", 2.50, 102)

print(p1 == p2)   # True  (same ID)
print(p1 == p3)   # False (different IDs)
```

Without `__eq__`, Python compares by *object identity* (`is`) which is rarely what you want.

= Overriding `__lt__`

== Enabling sorting

```python
class Product:
    def __lt__(self, other) -> bool:
        if not isinstance(other, Product):
            return NotImplemented
        return self.__price < other.__price

products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]

products.sort()    # uses __lt__ — sorts by price
for p in products:
    print(p)
# Product [103]: Milk — €1.20
# Product [101]: Apple — €1.99
# Product [104]: Butter — €3.00
```

= `__repr__`

== Developer-facing representation

```python
class Product:
    def __repr__(self) -> str:
        return (f"Product(name={self.__name!r}, "
                f"price={self.__price!r}, "
                f"product_id={self.__product_id!r})")

p = Product("Apple", 1.99, 101)
print(repr(p))
# Product(name='Apple', price=1.99, product_id=101)

# In a list, Python uses __repr__:
print([p])
# [Product(name='Apple', price=1.99, product_id=101)]
```

= Operator Overloading: `__add__`

```python
class Vector:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y

    def __add__(self, other: "Vector") -> "Vector":
        return Vector(self.x + other.x, self.y + other.y)

    def __str__(self) -> str:
        return f"Vector({self.x}, {self.y})"

v1 = Vector(1, 2)
v2 = Vector(3, 4)
v3 = v1 + v2         # calls v1.__add__(v2)
print(v3)             # Vector(4, 6)
```

= Summary

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Override when...*], [*Method*],
  [You want readable `print()` output], [`__str__`],
  [You want meaningful equality (`==`)], [`__eq__`],
  [You want `sort()` to work on your objects], [`__lt__`],
  [You want REPL to show useful info], [`__repr__`],
  [You want `+`, `-`, `*` to work], [`__add__`, `__sub__`, `__mul__`],
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
