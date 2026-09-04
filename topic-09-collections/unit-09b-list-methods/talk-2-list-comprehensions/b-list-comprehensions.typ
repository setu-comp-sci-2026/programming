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
    subtitle: [List Comprehensions],
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

= What is a List Comprehension?

== Concise list construction

A list comprehension builds a new list from an existing iterable in *one line*.

#v(.5em)
Traditional loop:
```python
squares = []
for n in range(1, 6):
    squares.append(n ** 2)
# [1, 4, 9, 16, 25]
```

List comprehension:
```python
squares = [n ** 2 for n in range(1, 6)]
# [1, 4, 9, 16, 25]
```

= Syntax

== `[expression for item in iterable]`

```
[ expression   for   variable   in   iterable ]
  ^^^^^^^^^^         ^^^^^^^^        ^^^^^^^^
  what to put        loop var        source
  in the list
```

Examples:
```python
names = ["apple", "bread", "milk"]

# Uppercase all names
upper = [n.upper() for n in names]
# ['APPLE', 'BREAD', 'MILK']

# Get lengths
lengths = [len(n) for n in names]
# [5, 5, 4]
```

= Filtering with `if`

== `[expression for item in iterable if condition]`

```python
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

evens = [n for n in numbers if n % 2 == 0]
# [2, 4, 6, 8, 10]

odds = [n for n in numbers if n % 2 != 0]
# [1, 3, 5, 7, 9]
```

With objects:
```python
products = shop.get_all_products()

cheap = [p for p in products if p.get_price() < 2.00]
expensive = [p for p in products if p.get_price() >= 3.00]
names_only = [p.get_name() for p in products]
```

= List Comprehensions with Objects

```python
from shop import Shop
from product import Product

shop = Shop("Test")
shop.add_product(Product("Apple",  1.99, 101))
shop.add_product(Product("Bread",  2.50, 102))
shop.add_product(Product("Milk",   1.20, 103))
shop.add_product(Product("Cheese", 4.50, 104))

products = shop.get_all_products()

# Names of products costing less than €2
cheap_names = [p.get_name()
               for p in products
               if p.get_price() < 2.00]
# ['Apple', 'Milk']

# Prices as a list
prices = [p.get_price() for p in products]
# [1.99, 2.50, 1.20, 4.50]
```

= Dict Comprehensions

```python
products = shop.get_all_products()

# {name: price} dictionary
price_map = {p.get_name(): p.get_price()
             for p in products}
# {'Apple': 1.99, 'Bread': 2.50, ...}

# {id: product object}
id_map = {p.get_product_id(): p
          for p in products}
# {101: <Product>, 102: <Product>, ...}

# Look up a product by id
product_101 = id_map.get(101)
```

= When to Use Comprehensions vs Loops

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Use comprehension*], [*Use a regular loop*],
  [Simple transformation], [Complex multi-step logic],
  [Filtering a list], [Multiple statements per iteration],
  [Building a new list quickly], [Side effects (printing, etc.)],
  [One-line readable expression], [When clarity suffers],
)

#v(.5em)
Rule of thumb: if it fits on one readable line, a comprehension is fine.

= Nested Comprehensions

```python
# Flatten a 2D list
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flat = [n for row in matrix for n in row]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# All combinations
colours = ["red", "blue"]
sizes   = ["S", "M", "L"]
combos  = [(c, s) for c in colours for s in sizes]
# [('red', 'S'), ('red', 'M'), ...]
```

Use nested comprehensions sparingly — readability matters.
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
