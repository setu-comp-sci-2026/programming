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
    subtitle: [Sorting Lists of Objects],
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

= `sort()` vs `sorted()`

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*`list.sort()`*], [*`sorted(iterable)`*],
  [Modifies the list *in place*], [Returns a *new* sorted list],
  [Returns `None`], [Original list unchanged],
  [Only works on lists], [Works on any iterable],
)

```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]

numbers.sort()          # modifies numbers
print(numbers)          # [1, 1, 2, 3, 4, 5, 6, 9]

result = sorted(numbers, reverse=True)
print(result)           # [9, 6, 5, 4, 3, 2, 1, 1]
print(numbers)          # unchanged
```

= Sorting Strings

```python
names = ["Milk", "Apple", "Bread", "Butter"]

names.sort()              # alphabetical, in place
print(names)              # ['Apple', 'Bread', 'Butter', 'Milk']

sorted_names = sorted(names, reverse=True)
print(sorted_names)       # ['Milk', 'Butter', 'Bread', 'Apple']

# Case-insensitive sort
words = ["banana", "Apple", "cherry"]
words.sort(key=str.lower)
print(words)              # ['Apple', 'banana', 'cherry']
```

= The `key` Parameter

== Sorting by a function

```python
# key= takes a function that extracts the sort value
numbers = [3, -1, 4, -2, 5]
numbers.sort(key=abs)       # sort by absolute value
print(numbers)              # [-1, -2, 3, 4, 5]

words = ["fig", "banana", "apple", "date"]
words.sort(key=len)         # sort by length
print(words)                # ['fig', 'fig', 'date', 'apple', 'banana']
```

= Sorting Objects with `key=`

== Using `lambda`

```python
products = shop.get_all_products()

# Sort by price (cheapest first)
by_price = sorted(products, key=lambda p: p.get_price())

# Sort by name (A-Z)
by_name = sorted(products, key=lambda p: p.get_name().lower())

# Sort by price descending (most expensive first)
by_price_desc = sorted(products,
                        key=lambda p: p.get_price(),
                        reverse=True)

for p in by_price:
    print(f"  €{p.get_price():.2f}  {p.get_name()}")
```

= `lambda` Functions

== Anonymous, one-expression functions

```python
# Regular function
def get_price(product):
    return product.get_price()

# Equivalent lambda
get_price = lambda product: product.get_price()

# Used inline — no need to define separately
sorted(products, key=lambda p: p.get_price())
```

#v(.5em)
`lambda arguments: expression`

Lambda is ideal for *short, single-use* functions — especially as `key=` arguments.

= Sorting with Multiple Keys

```python
students = [
    ("Alice", "B", 20),
    ("Bob",   "A", 22),
    ("Carol", "B", 19),
    ("Dave",  "A", 20),
]

# Sort by grade first, then by name
students.sort(key=lambda s: (s[1], s[0]))
# [('Bob', 'A', 22), ('Dave', 'A', 20),
#  ('Alice', 'B', 20), ('Carol', 'B', 19)]
```

For objects:
```python
# Sort by category, then by price
products.sort(key=lambda p: (
    p.get_category(),
    p.get_price()
))
```

= Adding Sort to Shop

```python
# In shop.py
def get_sorted_by_price(self, reverse: bool = False) -> list:
    return sorted(self.__products,
                  key=lambda p: p.get_price(),
                  reverse=reverse)

def get_sorted_by_name(self) -> list:
    return sorted(self.__products,
                  key=lambda p: p.get_name().lower())
```

```python
# In driver.py
print("\nSorted by price:")
for p in shop.get_sorted_by_price():
    print(f"  {p}")

print("\nSorted by name:")
for p in shop.get_sorted_by_name():
    print(f"  {p}")
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

