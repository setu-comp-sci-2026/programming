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
    subtitle: [Driving the Shop Class],
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

= Basic Shop Driver

```python
from product import Product
from shop import Shop

def main():
    my_shop = Shop("Green Grocer")

    my_shop.add_product(Product("Apple",  1.99, 101))
    my_shop.add_product(Product("Bread",  2.50, 102))
    my_shop.add_product(Product("Milk",   1.20, 103))
    my_shop.add_product(Product("Butter", 3.00, 104))

    print(my_shop)
    my_shop.display_all()
    print(f"\nTotal stock value: €{my_shop.total_value():.2f}")

if __name__ == "__main__":
    main()
```

= Iterating Over Products

== Printing formatted output

```python
def print_all_products(shop: Shop):
    products = shop.get_all_products()
    print(f"\n{'ID':>5}  {'Name':<20} {'Price':>8}")
    print("-" * 37)
    for p in products:
        print(f"{p.get_product_id():>5}  "
              f"{p.get_name():<20} "
              f"€{p.get_price():>7.2f}")
    print("-" * 37)
    print(f"{'Total':>27} €{shop.total_value():>7.2f}")
```

Output:
```
   ID  Name                    Price
-------------------------------------
  101  Apple                  €  1.99
  102  Bread                  €  2.50
```

= Finding a Product

```python
def find_product(shop: Shop):
    name = input("Enter product name to find: ")
    result = shop.find_by_name(name)
    if result:
        print(f"Found: {result}")
    else:
        print(f"No product named '{name}' found.")
```

= Removing a Product

```python
def remove_product(shop: Shop):
    name = input("Enter product name to remove: ")
    if shop.remove_product(name):
        print(f"'{name}' removed successfully.")
    else:
        print(f"'{name}' not found — nothing removed.")
```

= A Simple Text Menu

```python
def show_menu():
    print("\n=== Shop Menu ===")
    print("1. List all products")
    print("2. Find product")
    print("3. Remove product")
    print("4. Show total value")
    print("0. Exit")

def main():
    shop = Shop("Green Grocer")
    # ... add initial products ...
    running = True
    while running:
        show_menu()
        choice = input("Choose: ")
        if choice == "1":    shop.display_all()
        elif choice == "2":  find_product(shop)
        elif choice == "3":  remove_product(shop)
        elif choice == "4":  print(f"€{shop.total_value():.2f}")
        elif choice == "0":  running = False
```

= Putting It All Together

#align(center)[
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*File*], [*Responsibility*],
  [`product.py`], [Product class — data + validation],
  [`shop.py`], [Shop class — manages list of Products],
  [`driver.py`], [main() — menu + user interaction],
)
]

#v(1em)
This three-file structure is a mini *three-layer architecture*:
- Model (Product, Shop)
- Controller (driver functions)
- View (print functions)
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