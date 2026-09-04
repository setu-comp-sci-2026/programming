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
    subtitle: [Shop v3.0 — Full CRUD],
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

= CRUD Overview

== Create · Read · Update · Delete

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Letter*], [*Operation*], [*Shop method*],
  [C], [Create], [`add_product(product)`],
  [R], [Read], [`get_all_products()`, `find_by_name()`],
  [U], [Update], [`update_price(name, new_price)`],
  [D], [Delete], [`remove_product(name)`],
)

#v(.5em)
CRUD is the foundation of almost every data-driven application.

= Create — `add_product()`

```python
# In shop.py
def add_product(self, product: Product):
    # Check for duplicate ID
    for p in self.__products:
        if p.get_product_id() == product.get_product_id():
            raise ValueError(
                f"Product ID {product.get_product_id()} already exists"
            )
    self.__products.append(product)
```

```python
# In driver.py
def add_product_menu(shop: Shop):
    try:
        name  = input("Product name: ").strip()
        price = float(input("Price: €"))
        pid   = int(input("Product ID: "))
        shop.add_product(Product(name, price, pid))
        print(f"Added successfully!")
    except (ValueError, TypeError) as e:
        print(f"Error: {e}")
```

= Read — List and Find

```python
# In driver.py
def list_all(shop: Shop):
    products = shop.get_all_products()
    if not products:
        print("Shop is empty.")
        return
    print(f"\n{'ID':>5}  {'Name':<20} {'Price':>8}")
    print("-" * 37)
    for p in products:
        print(f"{p.get_product_id():>5}  "
              f"{p.get_name():<20} "
              f"€{p.get_price():>7.2f}")

def find_product_menu(shop: Shop):
    name = input("Search by name: ").strip()
    p = shop.find_by_name(name)
    print(f"Found: {p}" if p else "Not found.")
```

= Update — `update_price()`

```python
# In shop.py
def update_price(self, name: str, new_price: float) -> bool:
    p = self.find_by_name(name)
    if p is None:
        return False
    p.set_price(new_price)   # setter validates > 0
    return True
```

```python
# In driver.py
def update_product_menu(shop: Shop):
    name = input("Product to update: ").strip()
    try:
        new_price = float(input("New price: €"))
        if shop.update_price(name, new_price):
            print("Price updated.")
        else:
            print(f"'{name}' not found.")
    except ValueError as e:
        print(f"Error: {e}")
```

= Delete — `remove_product()`

```python
# In shop.py (already have this)
def remove_product(self, name: str) -> bool:
    p = self.find_by_name(name)
    if p:
        self.__products.remove(p)
        return True
    return False
```

```python
# In driver.py
def remove_product_menu(shop: Shop):
    name = input("Product to remove: ").strip()
    p = shop.find_by_name(name)
    if p is None:
        print(f"'{name}' not found.")
        return
    confirm = input(f"Remove '{p.get_name()}'? (y/n): ")
    if confirm.lower() == "y":
        shop.remove_product(name)
        print("Removed.")
    else:
        print("Cancelled.")
```

= Full Menu Integration

```python
def show_menu():
    print("\n=== Shop v3.0 ===")
    print("1. Add product")
    print("2. List all products")
    print("3. Find product")
    print("4. Update price")
    print("5. Remove product")
    print("0. Exit")

def main():
    shop = Shop("My Shop")
    while True:
        show_menu()
        match input("Choice: ").strip():
            case "1": add_product_menu(shop)
            case "2": list_all(shop)
            case "3": find_product_menu(shop)
            case "4": update_product_menu(shop)
            case "5": remove_product_menu(shop)
            case "0": break
            case _:   print("Invalid option.")
```

= Summary

#align(center)[
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*CRUD*], [*Python*],
  [Create], [`list.append()`],
  [Read], [for loop · `list.index()`],
  [Update], [find + modify attribute],
  [Delete], [`list.remove()`],
)
]

#v(1em)
The menu is just the *user interface* — the real logic lives in `Shop` and `Product`.
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
