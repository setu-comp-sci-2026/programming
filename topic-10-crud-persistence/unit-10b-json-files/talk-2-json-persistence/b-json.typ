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
    subtitle: [JSON Persistence],
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

= What is JSON?

== JavaScript Object Notation

JSON is a *text format* for storing and exchanging structured data. It is:
- Human-readable
- Language-independent
- The most common data format for web APIs and config files

```json
{
  "name": "Apple",
  "price": 1.99,
  "product_id": 101
}
```

Python maps: `dict` ↔ JSON object, `list` ↔ JSON array, `str/int/float/bool/None` ↔ their JSON equivalents.

= `json.dumps()` and `json.loads()`

== Strings ↔ Python objects

```python
import json

# Python dict → JSON string
data = {"name": "Apple", "price": 1.99, "id": 101}
json_str = json.dumps(data, indent=2)
print(json_str)
# {
#   "name": "Apple",
#   "price": 1.99,
#   "id": 101
# }

# JSON string → Python dict
loaded = json.loads(json_str)
print(loaded["name"])   # Apple
print(type(loaded))     # <class 'dict'>
```

= `json.dump()` and `json.load()`

== Files ↔ Python objects

```python
import json

data = [{"name": "Apple", "price": 1.99, "id": 101},
        {"name": "Bread", "price": 2.50, "id": 102}]

# Write to file
with open("products.json", "w") as f:
    json.dump(data, f, indent=2)

# Read from file
with open("products.json", "r") as f:
    loaded = json.load(f)

print(loaded[0]["name"])   # Apple
```

= Saving Product Objects

== Using `__dict__`

```python
# Each Product object has a __dict__ — but with mangled names
# Better: add a to_dict() method to Product

class Product:
    def to_dict(self) -> dict:
        return {
            "name": self.__name,
            "price": self.__price,
            "product_id": self.__product_id,
        }
```

```python
# Saving
products = shop.get_all_products()
data = [p.to_dict() for p in products]
with open("shop.json", "w") as f:
    json.dump(data, f, indent=2)
print(f"Saved {len(data)} products.")
```

= Loading Product Objects Back

== Using a class method

```python
class Product:
    @classmethod
    def from_dict(cls, d: dict) -> "Product":
        return cls(d["name"], d["price"], d["product_id"])
```

```python
# Loading
def load_shop(shop: Shop, filename: str):
    try:
        with open(filename, "r") as f:
            data = json.load(f)
        for item in data:
            shop.add_product(Product.from_dict(item))
        print(f"Loaded {len(data)} products.")
    except FileNotFoundError:
        print("No saved data found — starting fresh.")
    except (json.JSONDecodeError, KeyError) as e:
        print(f"Error loading data: {e}")
```

= Full Shop Save and Load

```python
# In shop.py
import json
from product import Product

class Shop:
    def save_to_json(self, filename: str = "shop.json"):
        data = {
            "name": self.__name,
            "products": [p.to_dict() for p in self.__products]
        }
        with open(filename, "w") as f:
            json.dump(data, f, indent=2)

    def load_from_json(self, filename: str = "shop.json"):
        with open(filename, "r") as f:
            data = json.load(f)
        self.__name = data["name"]
        self.__products = [
            Product.from_dict(p) for p in data["products"]
        ]
```

= Integrating with the Menu

```python
def main():
    shop = Shop("My Shop")
    # Load on startup
    try:
        shop.load_from_json()
        print("Previous data loaded.")
    except FileNotFoundError:
        print("Starting with empty shop.")

    while True:
        show_menu()
        match input("Choice: ").strip():
            # ... CRUD cases ...
            case "s":
                shop.save_to_json()
                print("Saved.")
            case "0":
                shop.save_to_json()   # auto-save on exit
                print("Data saved. Goodbye!")
                break
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

