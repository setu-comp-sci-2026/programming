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
    subtitle: [For Loops],
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

= For Loop Syntax

A *for loop* iterates over every item in a sequence (list, string, range, …).

```python
for variable in sequence:
    # body — executed once per item
```

#pause

```python
fruits = ["apple", "banana", "cherry"]

for fruit in fruits:
    print(fruit)
```

Output:
```
apple
banana
cherry
```

#pause

The loop variable (`fruit`) takes on each value in turn. You choose the name — make it meaningful!

= The range() Function

`range()` generates a sequence of integers — perfect for counting loops.

```python
range(stop)             # 0, 1, 2, ..., stop-1
range(start, stop)      # start, start+1, ..., stop-1
range(start, stop, step)# start, start+step, ...
```

#pause

```python
for i in range(5):
    print(i)        # 0 1 2 3 4

for i in range(1, 6):
    print(i)        # 1 2 3 4 5

for i in range(0, 10, 2):
    print(i)        # 0 2 4 6 8

for i in range(10, 0, -1):
    print(i)        # 10 9 8 7 6 5 4 3 2 1
```

= Looping Over Lists and Strings

*Looping over a list:*

```python
scores = [85, 92, 78, 95, 61]
total = 0

for score in scores:
    total += score

average = total / len(scores)
print(f"Average score: {average:.1f}")   # 82.2
```

#pause

*Looping over a string — character by character:*

```python
word = "Python"

for char in word:
    print(char, end=" ")    # P y t h o n

vowels = 0
for char in word.lower():
    if char in "aeiou":
        vowels += 1
print(f"\n{word} has {vowels} vowels")   # 1 vowel
```

= enumerate() — Index and Value Together

`enumerate()` gives you both the *index* and the *value* in each iteration.

```python
fruits = ["apple", "banana", "cherry"]

for index, fruit in enumerate(fruits):
    print(f"{index}: {fruit}")
```

Output:
```
0: apple
1: banana
2: cherry
```

#pause

Start counting from 1:

```python
for i, fruit in enumerate(fruits, start=1):
    print(f"{i}. {fruit}")
# 1. apple
# 2. banana
# 3. cherry
```

= zip() — Loop Over Two Lists in Parallel

`zip()` pairs up elements from two (or more) sequences.

```python
names = ["Alice", "Bob", "Carol"]
scores = [88, 74, 95]

for name, score in zip(names, scores):
    print(f"{name}: {score}")
```

Output:
```
Alice: 88
Bob: 74
Carol: 95
```

#pause

```python
# Practical: calculate grades
grades = []
for name, score in zip(names, scores):
    grade = "Pass" if score >= 60 else "Fail"
    grades.append((name, grade))

for name, grade in grades:
    print(f"{name} — {grade}")
```

= Nested Loops

A loop *inside* another loop — the inner loop runs fully for each iteration of the outer loop.

```python
for row in range(1, 4):
    for col in range(1, 4):
        print(f"{row}×{col}={row*col}", end="  ")
    print()     # new line after each row
```

Output:
```
1×1=1  1×2=2  1×3=3
2×1=2  2×2=4  2×3=6
3×1=3  3×2=6  3×3=9
```

#pause

*Pattern printing:*
```python
rows = 5
for i in range(1, rows + 1):
    print("*" * i)
# *
# **
# ***
# ****
# *****
```

= List Comprehensions — A Sneak Peek

A concise way to build a list using a for loop in a single line.

```python
# Traditional for loop
squares = []
for x in range(1, 6):
    squares.append(x ** 2)

# List comprehension — same result
squares = [x ** 2 for x in range(1, 6)]
print(squares)  # [1, 4, 9, 16, 25]
```

#pause

With a condition:

```python
# Only even squares
even_squares = [x ** 2 for x in range(1, 11) if x % 2 == 0]
print(even_squares)  # [4, 16, 36, 64, 100]

# Uppercase all words
words = ["hello", "world", "python"]
upper = [w.upper() for w in words]
print(upper)    # ['HELLO', 'WORLD', 'PYTHON']
```

#slide(title: none, header: none, footer: none, align: center + horizon)[
  #text(size: 2em, weight: "bold")[Thanks for Watching - Any questions?]
]
