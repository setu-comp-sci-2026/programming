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
    subtitle: [Searching Algorithms],
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

= Two Main Search Algorithms

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Linear Search*], [*Binary Search*],
  [Works on any list], [Requires *sorted* list],
  [O(n) — checks each item], [O(log n) — halves search space],
  [Simple to implement], [More complex],
  [Best for small/unsorted data], [Best for large sorted data],
)

= Linear Search

```python
def linear_search(lst: list, target) -> int:
    """Return index of target, or -1 if not found."""
    for i, item in enumerate(lst):
        if item == target:
            return i
    return -1

numbers = [15, 8, 3, 42, 7, 19]
idx = linear_search(numbers, 42)
print(idx)   # 3

# Searching objects
def find_product_by_name(products: list, name: str):
    for p in products:
        if p.get_name().lower() == name.lower():
            return p
    return None
```

= Binary Search

== Divide and conquer on a sorted list

```python
def binary_search(lst: list, target) -> int:
    """Return index of target in sorted lst, or -1."""
    low, high = 0, len(lst) - 1
    while low <= high:
        mid = (low + high) // 2
        if lst[mid] == target:
            return mid
        elif lst[mid] < target:
            low = mid + 1    # target is in right half
        else:
            high = mid - 1   # target is in left half
    return -1

sorted_nums = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
print(binary_search(sorted_nums, 23))   # 5
print(binary_search(sorted_nums, 10))   # -1
```

= Binary Search Trace

Searching for `23` in `[2, 5, 8, 12, 16, 23, 38, 56, 72, 91]`

```
Step 1: low=0, high=9, mid=4 → lst[4]=16 < 23 → low=5
Step 2: low=5, high=9, mid=7 → lst[7]=56 > 23 → high=6
Step 3: low=5, high=6, mid=5 → lst[5]=23 == 23 → return 5
```

Only 3 steps to search 10 items! Linear would take up to 10.

For 1,000,000 items: binary search takes at most log₂(1,000,000) ≈ 20 steps.

= Python's `bisect` Module

```python
import bisect

sorted_prices = [1.20, 1.99, 2.50, 3.00, 4.50]

# Find insertion point for 2.00
idx = bisect.bisect_left(sorted_prices, 2.00)
print(idx)   # 2  ← insert at position 2

# Insert while keeping sorted
bisect.insort(sorted_prices, 2.00)
print(sorted_prices)   # [1.20, 1.99, 2.00, 2.50, 3.00, 4.50]
```

`bisect` uses binary search internally — O(log n) lookup.

= Searching Sorted Objects

```python
# Sort by price first
products = sorted(shop.get_all_products(),
                  key=lambda p: p.get_price())

prices = [p.get_price() for p in products]

def find_by_price(products: list, target_price: float):
    prices = [p.get_price() for p in products]
    idx = binary_search(prices, target_price)
    if idx != -1:
        return products[idx]
    return None

# Or use bisect
import bisect
idx = bisect.bisect_left(prices, 2.50)
if idx < len(prices) and prices[idx] == 2.50:
    print(products[idx])
```

= Complexity Summary

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*n items*], [*Linear*], [*Binary*],
  [10], [10 steps max], [4 steps max],
  [1,000], [1,000 steps], [10 steps],
  [1,000,000], [1,000,000 steps], [20 steps],
  [1,000,000,000], [1 billion steps], [30 steps],
)

Binary search is *dramatically* faster on large sorted data.
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
