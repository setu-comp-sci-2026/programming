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
    subtitle: [Driver and Main Function],
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

= What is a Driver?

== Separating Concerns

In OOP, we separate:
- *Model classes* — `Product`, `Shop` (define data + behaviour)
- *Driver* — the file that *uses* those classes (the "main" program)

#v(.5em)
Benefits:
- Classes stay reusable across multiple programs
- Driver is easy to read — it tells the story of the program
- Easier to test each part independently

= The `main()` Function

== Writing a clean entry point

```python
# driver.py
from product import Product

def main():
    apple = Product("Apple", 1.99, 101)
    bread = Product("Bread", 2.50, 102)
    milk  = Product("Milk",  1.20, 103)

    print(apple)
    print(bread)
    print(milk)

    # Update a product
    apple.set_price(2.29)
    print(f"Updated price: {apple}")

if __name__ == "__main__":
    main()
```

= Importing the Class

== Using `from ... import`

```python
from product import Product
```

- `product` is the *file name* (without `.py`)
- `Product` is the *class name* inside that file
- Both files must be in the *same folder*

#v(.5em)
File structure:
```
shop_app/
├── product.py    ← defines the Product class
└── driver.py     ← imports and uses Product
```

= Creating Products in main()

```python
def main():
    # Create several Product instances
    products = [
        Product("Apple",  1.99, 101),
        Product("Bread",  2.50, 102),
        Product("Milk",   1.20, 103),
        Product("Butter", 3.00, 104),
    ]

    # Print each product
    for p in products:
        print(p)

    print(f"\nTotal products: {len(products)}")
```

Output:
```
Product [101]: Apple — €1.99
Product [102]: Bread — €2.50
...
```

= The `if __name__ == "__main__"` Guard

== Why do we need it?

```python
if __name__ == "__main__":
    main()
```

#v(.5em)
- When Python runs a file directly, `__name__` equals `"__main__"`
- When a file is *imported* by another module, `__name__` equals the module name
- The guard ensures `main()` only runs when the file is run *directly*

#v(.5em)
*Without the guard:* importing `driver.py` elsewhere would run `main()` immediately — almost always unwanted.

= Calling Methods on Objects

```python
def main():
    apple = Product("Apple", 1.99, 101)

    # Read attribute
    print(apple.get_name())     # Apple
    print(apple.get_price())    # 1.99
    print(apple.get_product_id())  # 101

    # Update attribute
    apple.set_price(2.49)
    apple.set_name("Granny Smith Apple")

    print(apple)
    # Product [101]: Granny Smith Apple — €2.49
```

= Printing Product Details

== Formatted output

```python
def print_product_details(product: Product):
    print("=" * 40)
    print(f"  ID    : {product.get_product_id()}")
    print(f"  Name  : {product.get_name()}")
    print(f"  Price : €{product.get_price():.2f}")
    print("=" * 40)

def main():
    apple = Product("Apple", 1.99, 101)
    print_product_details(apple)
```

Output:
```
========================================
  ID    : 101
  Name  : Apple
  Price : €1.99
========================================
```

#slide(title: none, header: none, footer: none, align: center + horizon)[
  #text(size: 2em, weight: "bold")[Thanks for Watching - Any questions?]
]
