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
    subtitle: [Type Hints, Multiple Assignment and Lambda],
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

// Baseline-aligned bullet markers (theme default hangs below the text)
#set list(
  marker: (
    text(fill: rgb("#3572A5"))[•],
    text(fill: rgb("#3572A5"))[‣],
    text(fill: rgb("#3572A5"))[–],
  ),
  indent: 0.6em,
  body-indent: 0.6em,
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= Type Hints

== Describing parameters and return values

So far we've written functions like this:

```python
def total_price(price, quantity):
    return price * quantity
```

With *type hints* we can say what types we expect:

```python
def total_price(price: float, quantity: int) -> float:
    return price * quantity
```

- `price: float` — the parameter `price` should be a `float`
- `-> float` — the function *returns* a `float`

Compare Java: `public double totalPrice(double price, int quantity)`

== Common hints — and what Python does with them

```python
def greet(name: str) -> None:        # returns nothing
    print(f"Hello, {name}")

def is_adult(age: int) -> bool:
    return age >= 18

def average(marks: list) -> float:
    return sum(marks) / len(marks)
```

Python does *not* enforce hints — this still runs:

```python
print(total_price("ab", 3))   # ababab  (no error!)
```

Hints are documentation for *people* and *tools* (VS Code warns you about mismatches). Unlike Java, the program itself ignores them.

= Multiple Assignment

== Assigning several variables at once

Python lets you assign several variables in one line:

```python
x, y = 1, 2
print(x, y)            # 1 2

low, high = 0, len([5, 8, 13]) - 1
print(low, high)       # 0 2

name, price = ("Apple", 1.99)    # unpacking a tuple
print(name, price)     # Apple 1.99
```

- The right-hand side is evaluated *first*, building a tuple
- The values are then *unpacked* into the names on the left, in order
- The number of names must match the number of values

You've already seen this in 
```python
for i, item in enumerate(lst):
```

== Swapping — the classic way: a temporary variable

To swap two variables you need somewhere to "park" one value:

```python
a = 5
b = 9

temp = a      # park a's value
a = b         # a is now 9
b = temp      # b gets the parked 5

print(a, b)   # 9 5
```

Without `temp`, writing `a = b` first would overwrite `a` — its original value is lost.

== Swapping — the Python way: `x, y = y, x`

Python can do the whole swap in one line:

```python
a = 5
b = 9

a, b = b, a

print(a, b)   # 9 5
```

How it works:
- The right-hand side `b, a` is evaluated *first*, building the tuple `(9, 5)`
- That tuple is then *unpacked* into `a` and `b`, left to right
- No temporary variable needed — Python makes one for you behind the scenes

== Swapping elements in a list

The same idea works on list positions — this is exactly what the sorting algorithms do:

```python
data = [64, 25, 12]

data[0], data[1] = data[1], data[0]
print(data)   # [25, 64, 12]

i, j = 0, 2
data[i], data[j] = data[j], data[i]
print(data)   # [12, 64, 25]
```

You'll see this line in Bubble Sort and Selection Sort:

`data[j], data[j + 1] = data[j + 1], data[j]`

= Lambda Functions

== Functions as arguments — `key=`

`sorted()` and `sort()` take a `key` argument: a *function* that is applied to each item to decide its sort position.

```python
def get_length(word):
    return len(word)

words = ["banana", "fig", "apple"]

print(sorted(words, key=get_length))   # ['fig', 'apple', 'banana']
```

Note: we pass `get_length` *without brackets* — we hand over the function itself, we don't call it. `sorted()` calls it on each word for us.

== Lambda — a small, nameless function

Writing a whole `def` for a one-line function is a lot of ceremony. A *lambda* does the same job inline:

```python
# These two are equivalent
def get_length(word):
    return len(word)

lambda word: len(word)
```

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [`lambda`], [keyword: "here comes a function"],
  [`word`], [the parameter(s), before the colon],
  [`len(word)`], [a *single expression* — its value is returned automatically (no `return`)],
)

== Lambdas with `key=`

```python
words = ["banana", "fig", "apple"]
print(sorted(words, key=lambda word: len(word)))
# ['fig', 'apple', 'banana']

nums = [-7, 3, -1, 5]
print(sorted(nums, key=lambda n: abs(n)))
# [-1, 3, 5, -7]

# With objects: sort Products by price
products.sort(key=lambda p: p.get_price())
```

Read `lambda p: p.get_price()` as: _"given a product `p`, use its price"_.

Use a lambda for short, throw-away functions; use `def` for anything longer or reused.

== Writing a function that *takes* a function

So far we've passed functions *to* `sorted()`. We can write our own functions that accept one too:

```python
def show_all(items: list, key) -> None:
    for item in items:
        print(item, "→", key(item))    # call whatever function we were given

show_all(["banana", "fig"], key=len)
# banana → 6
# fig → 3

show_all([-7, 3], key=lambda n: abs(n))
# -7 → 7
# 3 → 3
```

- `key` is just an ordinary parameter — but the value it holds is a *function*
- `key(item)` *calls* that function, exactly as `sorted()` does internally

== Example: searching with a key function

The same idea lets one search function find items by *any* attribute:

```python
def linear_search_by(lst: list, target, key) -> int:
    """Return index of first item where key(item) == target, or -1."""
    for i, item in enumerate(lst):
        if key(item) == target:
            return i
    return -1

idx = linear_search_by(products, "Apple", key=lambda p: p.get_name())
idx = linear_search_by(products, 103,     key=lambda p: p.get_product_id())
```

One function, many searches — the caller decides *what* to compare. You'll use this in the lab.

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
