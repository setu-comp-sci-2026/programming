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

= Creating Lists

A list stores multiple values in one variable.

```python
names = ["Ava", "Ben", "Cara"]
numbers = [10, 20, 30, 40]
mixed = ["Ava", 19, True]
empty = []
```

#pause

Although Python allows mixed types, beginners should usually keep a list focused:

```python
grades = [65, 72, 81, 90]
```

= Indexing

Each item has a position called an *index*.

```python
names = ["Ava", "Ben", "Cara", "Dylan"]
#          0      1       2        3

print(names[0])   # Ava
print(names[2])   # Cara
```

#pause

Python also supports negative indexing.

```python
print(names[-1])  # Dylan
print(names[-2])  # Cara
```

= Updating Items

Lists are *mutable*, which means they can be changed.

```python
names = ["Ava", "Ben", "Cara"]

names[1] = "Brendan"

print(names)
```

#pause

Output:

```text
['Ava', 'Brendan', 'Cara']
```

= Length and Membership

```python
names = ["Ava", "Ben", "Cara"]

print(len(names)) #3
print("Ben" in names) #true
print("Zara" not in names) #true
```

#pause

Useful questions:

```python
if "Ben" in names:
    print("Ben is in the class list")
```

= Common Error: IndexError

```python
names = ["Ava", "Ben", "Cara"]
print(names[3])
```

#pause

There is no index 3.

Valid indexes are 0, 1, and 2.

```text
IndexError: list index out of range
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
