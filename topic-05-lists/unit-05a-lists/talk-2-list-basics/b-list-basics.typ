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
    subtitle: [List Basics],
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

= What is a List?

A *list* is an ordered, mutable collection of items.

```python
fruits = ["apple", "banana", "cherry"]
numbers = [10, 20, 30, 40, 50]
mixed = [42, "hello", 3.14, True]
empty = []
nested = [[1, 2], [3, 4], [5, 6]]
```

#pause

*Key properties:*
- *Ordered* — items have a fixed position (index)
- *Mutable* — you can add, remove, or change items
- *Allow duplicates* — the same value can appear multiple times
- *Mixed types* — a single list can hold different types (but usually stick to one type)

= Indexing

Each item in a list has an *index* — its position.

```python
fruits = ["apple", "banana", "cherry", "date"]
#           0         1         2        3      (positive)
#          -4        -3        -2       -1      (negative)

print(fruits[0])    # apple
print(fruits[2])    # cherry
print(fruits[-1])   # date    (last item)
print(fruits[-2])   # cherry  (second to last)
```

#pause

*Modifying* an item by index:

```python
fruits[1] = "blueberry"
print(fruits)   # ['apple', 'blueberry', 'cherry', 'date']
```

= Slicing

Slicing extracts a *sub-list* using `[start:stop:step]`.

```python
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

print(numbers[2:5])     # [2, 3, 4]   stop is exclusive
print(numbers[:4])      # [0, 1, 2, 3]
print(numbers[6:])      # [6, 7, 8, 9]
print(numbers[::2])     # [0, 2, 4, 6, 8]  every 2nd element
print(numbers[::-1])    # [9, 8, ..., 0]   reversed
```

#pause

*Practical uses:*

```python
data = [10, 20, 30, 40, 50, 60, 70]
first_three = data[:3]    # [10, 20, 30]
last_two    = data[-2:]   # [60, 70]
middle      = data[2:-2]  # [30, 40, 50]
copy        = data[:]     # full copy
```

= len() and Membership

```python
fruits = ["apple", "banana", "cherry"]

print(len(fruits))                  # 3
print("banana" in fruits)           # True
print("grape" in fruits)            # False
print("grape" not in fruits)        # True
```

#pause

```python
# Safe access — avoid IndexError
def safe_get(lst, index):
    if 0 <= index < len(lst):
        return lst[index]
    return None

scores = [85, 92, 78]
print(safe_get(scores, 1))    # 92
print(safe_get(scores, 10))   # None
```

= Nested Lists

```python
student = ["Alice", 21, "Dublin", [85, 92, 78]]
name   = student[0]     # "Alice"
scores = student[3]     # [85, 92, 78]

# Access nested items
first_score = student[3][0]    # 85
```

#pause

*A 2D grid as a list of lists:*

```python
grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
]

print(grid[1][2])   # 6  (row 1, column 2)

for row in grid:
    print(" ".join(str(cell) for cell in row))
```

= Building Lists Dynamically

```python
# Start empty, add items one by one
squares = []
for i in range(1, 8):
    squares.append(i ** 2)
print(squares)   # [1, 4, 9, 16, 25, 36, 49]
```

#pause

```python
# Collecting user input into a list
names = []
print("Enter names (blank line to stop):")
while True:
    name = input("> ").strip()
    if not name:
        break
    names.append(name)

print(f"You entered {len(names)} names:")
for i, name in enumerate(names, start=1):
    print(f"  {i}. {name}")
```

= Converting Between Types

```python
# str -> list -> str
sentence = "the quick brown fox"
words = sentence.split()
rejoined = " ".join(words)
print(words)      # ['the', 'quick', 'brown', 'fox']
print(rejoined)   # the quick brown fox

# range -> list
nums = list(range(1, 6))
print(nums)    # [1, 2, 3, 4, 5]

# string -> list of characters
chars = list("Python")
print(chars)   # ['P', 'y', 't', 'h', 'o', 'n']
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