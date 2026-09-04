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
    subtitle: [The Product Class],
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

= Designing the Product Class

== What does a Product need?

Every product in our shop has:
- *name* — a string (e.g. `"Apple"`)
- *price* — a float (e.g. `1.99`)
- *product_id* — an integer (e.g. `101`)

We model this as a class so we can create many product objects from one blueprint.

#v(1em)
```python
class Product:
    def __init__(self, name, price, product_id):
        self.__name = name
        self.__price = price
        self.__product_id = product_id
```

= The `__init__` Method

== Initialising a Product

`__init__` is the *constructor* — it runs automatically when you create a new object.

```python
class Product:
    def __init__(self, name: str, price: float, product_id: int):
        self.__name = name
        self.__price = price
        self.__product_id = product_id
```

#v(.5em)
- The double underscore prefix (`__`) makes attributes *private*
- Private attributes cannot be accessed directly from outside the class
- This is *encapsulation* — hiding internal data

= Getters and Setters

== Accessing Private Attributes

```python
class Product:
    # ... __init__ as above ...

    def get_name(self) -> str:
        return self.__name

    def set_name(self, name: str):
        self.__name = name

    def get_price(self) -> float:
        return self.__price

    def set_price(self, price: float):
        self.__price = price

    def get_product_id(self) -> int:
        return self.__product_id
```

#v(.5em)
Getters *return* the value. Setters *update* the value (and can validate it).

= The `__str__` Method

== Human-readable representation

```python
class Product:
    # ... previous code ...

    def __str__(self) -> str:
        return (f"Product [{self.__product_id}]: "
                f"{self.__name} — €{self.__price:.2f}")
```

#v(.5em)
`__str__` is a *dunder method* (double underscore). Python calls it automatically when you:
- use `print(product)`
- use `str(product)`
- embed the object in an f-string: `f"{product}"`

= Creating Product Instances

== Using the class

```python
# Create product objects
apple = Product("Apple", 1.99, 101)
bread = Product("Bread", 2.50, 102)
milk  = Product("Milk",  1.20, 103)

# Print them — calls __str__
print(apple)
print(bread)
print(milk)
```

#v(.5em)
Output:
```
Product [101]: Apple — €1.99
Product [102]: Bread — €2.50
Product [103]: Milk — €1.20
```

= Full Product Class

```python
class Product:
    def __init__(self, name: str, price: float, product_id: int):
        self.__name = name
        self.__price = price
        self.__product_id = product_id

    def get_name(self) -> str:
        return self.__name
    def set_name(self, name: str):
        self.__name = name

    def get_price(self) -> float:
        return self.__price
    def set_price(self, price: float):
        self.__price = price

    def get_product_id(self) -> int:
        return self.__product_id

    def __str__(self) -> str:
        return (f"Product [{self.__product_id}]: "
                f"{self.__name} — €{self.__price:.2f}")
```

= UML Class Diagram

== Product

#align(center)[
  #table(
    columns: 1,
    align: left,
    stroke: 1pt,
    inset: 8pt,
    [*Product*],
    [- \_\_name: str \ - \_\_price: float \ - \_\_product_id: int],
    [+ get_name() : str \ + set_name(name: str) \ + get_price() : float \ + set_price(price: float) \ + get_product_id() : int \ + \_\_str\_\_() : str],
  )
]
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