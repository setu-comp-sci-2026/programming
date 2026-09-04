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
    subtitle: [List Methods and Loops],
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

= Adding Items

```python
shopping = []

shopping.append("milk")
shopping.append("bread")
shopping.append("eggs")

print(shopping)
```

#pause

`append()` adds an item to the end of the list.

= Removing Items

```python
shopping = ["milk", "bread", "eggs"]

shopping.remove("bread")
last_item = shopping.pop()

print(shopping)
print(last_item)
```

#pause

- `remove(value)` removes a matching value
- `pop()` removes and returns an item

= Looping Through a List

```python
names = ["Ava", "Ben", "Cara"]

for name in names:
    print(name)
```

#pause

This is the most Pythonic way when you need each item.

= Looping With Indexes

Sometimes you need positions too.

```python
names = ["Ava", "Ben", "Cara"]

for i in range(len(names)):
    print(i, names[i])
```

#pause

Python also has `enumerate()`:

```python
for i, name in enumerate(names):
    print(i, name)
```

= Processing Numeric Lists

```python
grades = [55, 72, 81, 90, 66]

total = 0
for grade in grades:
    total = total + grade

average = total / len(grades)
print(average)
```

#pause

This is the start of data processing.
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
