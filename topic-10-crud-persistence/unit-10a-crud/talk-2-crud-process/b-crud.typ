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
    subtitle: [CRUD Operations],
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

= What is CRUD?

== The four fundamental data operations

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  inset: 10pt,
  [*Letter*], [*Meaning*], [*HTTP verb*],
  [C], [Create — add new data], [POST],
  [R], [Read — retrieve data], [GET],
  [U], [Update — modify existing data], [PUT / PATCH],
  [D], [Delete — remove data], [DELETE],
)
]

CRUD is the backbone of databases, REST APIs, and any persistent system. Our Shop app implements CRUD on a list of Products.

= Create — Adding a Product

```python
# In shop.py
def add_product(self, product: Product):
    # Check for duplicate ID
    if self.find_by_id(product.get_product_id()):
        raise ValueError(
            f"Product ID {product.get_product_id()} already exists"
        )
    self.__products.append(product)

# In driver.py
def create_product(shop: Shop):
    name  = input("Name: ").strip()
    price = float(input("Price: €"))
    pid   = int(input("ID: "))
    shop.add_product(Product(name, price, pid))
    print("Product created.")
```

= Read — Getting Data

== Retrieving one or all records

```python
# Get all
def get_all_products(self) -> list:
    return list(self.__products)  # return a copy

# Get by name
def find_by_name(self, name: str):
    for p in self.__products:
        if p.get_name().lower() == name.strip().lower():
            return p
    return None

# Get by ID
def find_by_id(self, pid: int):
    for p in self.__products:
        if p.get_product_id() == pid:
            return p
    return None
```

= Update — Modifying a Record

```python
# In shop.py
def update_product(self, pid: int,
                   new_name: str = None,
                   new_price: float = None) -> bool:
    p = self.find_by_id(pid)
    if p is None:
        return False
    if new_name is not None:
        p.set_name(new_name)
    if new_price is not None:
        p.set_price(new_price)
    return True

# In driver.py
def update_product_menu(shop: Shop):
    pid = int(input("Product ID to update: "))
    new_price = float(input("New price (or 0 to skip): "))
    updated = shop.update_product(
        pid,
        new_price=new_price if new_price > 0 else None
    )
    print("Updated." if updated else "Not found.")
```

= Delete — Removing a Record

```python
# In shop.py
def delete_product(self, pid: int) -> bool:
    p = self.find_by_id(pid)
    if p:
        self.__products.remove(p)
        return True
    return False

# In driver.py
def delete_product_menu(shop: Shop):
    pid = int(input("Product ID to delete: "))
    p = shop.find_by_id(pid)
    if p is None:
        print("Not found.")
        return
    confirm = input(f"Delete '{p.get_name()}'? (y/n): ")
    if confirm.lower() == "y":
        shop.delete_product(pid)
        print("Deleted.")
    else:
        print("Cancelled.")
```

= CRUD in the Menu

```python
def show_menu():
    print("\n=== Shop CRUD ===")
    print("1. Create (add product)")
    print("2. Read all (list products)")
    print("3. Read one (find by ID)")
    print("4. Update (change price)")
    print("5. Delete (remove product)")
    print("0. Exit")

def main():
    shop = Shop("My Shop")
    while True:
        show_menu()
        match input("Choice: ").strip():
            case "1": create_product(shop)
            case "2": shop.display_all()
            case "3":
                pid = int(input("ID: "))
                p = shop.find_by_id(pid)
                print(p if p else "Not found.")
            case "4": update_product_menu(shop)
            case "5": delete_product_menu(shop)
            case "0": break
```

= Summary

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*CRUD*], [*Python list op*], [*Our method*],
  [Create], [`append()`], [`add_product()`],
  [Read all], [for loop], [`get_all_products()`],
  [Read one], [linear search], [`find_by_id()`],
  [Update], [find + set attr], [`update_product()`],
  [Delete], [`remove()`], [`delete_product()`],
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
