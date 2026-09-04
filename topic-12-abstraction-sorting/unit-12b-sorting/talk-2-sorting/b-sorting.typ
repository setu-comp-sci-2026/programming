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
    subtitle: [Sorting Algorithms],
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

= Why Sorting?

Sorted data is essential for:
- *Binary search* (requires sorted input)
- *Displaying* data in a meaningful order
- *Finding* min/max efficiently
- *Removing duplicates* (adjacent equal items are easy to spot)

We study two classic algorithms (Bubble Sort, Selection Sort) to understand sorting fundamentals, then use Python's built-in sort in practice.

= Bubble Sort

== Compare and swap adjacent pairs

```python
def bubble_sort(lst: list) -> list:
    data = lst.copy()          # don't modify original
    n = len(data)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if data[j] > data[j + 1]:
                data[j], data[j + 1] = data[j + 1], data[j]
    return data

nums = [64, 25, 12, 22, 11]
print(bubble_sort(nums))   # [11, 12, 22, 25, 64]
```

Each pass "bubbles" the largest unsorted element to its correct position.

= Bubble Sort Trace

Starting: `[64, 25, 12, 22, 11]`

Pass 1 (i=0): compare adjacent pairs
```
[64, 25] → swap → [25, 64, 12, 22, 11]
[64, 12] → swap → [25, 12, 64, 22, 11]
[64, 22] → swap → [25, 12, 22, 64, 11]
[64, 11] → swap → [25, 12, 22, 11, 64]  ← 64 in place
```

Pass 2 (i=1): `[25, 12, 22, 11, 64]`
```
→ [12, 25, 22, 11, 64]
→ [12, 22, 25, 11, 64]
→ [12, 22, 11, 25, 64]  ← 25 in place
```

= Selection Sort

== Find minimum, move to front

```python
def selection_sort(lst: list) -> list:
    data = lst.copy()
    n = len(data)
    for i in range(n - 1):
        min_idx = i
        for j in range(i + 1, n):
            if data[j] < data[min_idx]:
                min_idx = j
        if min_idx != i:
            data[i], data[min_idx] = data[min_idx], data[i]
    return data

nums = [64, 25, 12, 22, 11]
print(selection_sort(nums))   # [11, 12, 22, 25, 64]
```

Each pass finds the smallest remaining element and places it at the front.

= Python's Built-in Sort — Timsort

```python
# sort() — in place
numbers = [3, 1, 4, 1, 5, 9]
numbers.sort()
print(numbers)   # [1, 1, 3, 4, 5, 9]

# sorted() — returns new list
words = ["banana", "apple", "cherry"]
print(sorted(words))   # ['apple', 'banana', 'cherry']

# With key=
products.sort(key=lambda p: p.get_price())

# Reverse
products.sort(key=lambda p: p.get_price(), reverse=True)
```

Python's sort is *Timsort* — a hybrid of merge sort and insertion sort, O(n log n) in all cases.

= Time Complexity

#table(
  columns: (auto, auto, auto, auto),
  stroke: 0.5pt,
  inset: 8pt,
  [*Algorithm*], [*Best*], [*Average*], [*Worst*],
  [Bubble Sort], [O(n)], [O(n²)], [O(n²)],
  [Selection Sort], [O(n²)], [O(n²)], [O(n²)],
  [Python sort()], [O(n)], [O(n log n)], [O(n log n)],
)

#v(.5em)
For real code: always use Python's built-in sort.

For learning: implement Bubble/Selection to understand the concept.

n=1000: O(n²) → 1,000,000 operations. O(n log n) → ~10,000. The difference matters!

= Sorting Objects

```python
from product import Product

products = [
    Product("Butter", 3.00, 104),
    Product("Apple",  1.99, 101),
    Product("Milk",   1.20, 103),
]

# By price
by_price = sorted(products, key=lambda p: p.get_price())

# By name
by_name  = sorted(products, key=lambda p: p.get_name())

# Multiple criteria: first by category, then by price
products.sort(key=lambda p: (p.get_category(), p.get_price()))
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
