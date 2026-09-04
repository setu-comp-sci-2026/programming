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
    subtitle: [Why Collections?],
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

= The Problem

So far, we can store one value at a time.

```python
student1 = "Ava"
student2 = "Ben"
student3 = "Cara"
```

#pause

This works for three students, but not for thirty.

*Collections* let us store many related values under one name.

= Python Lists as Arrays

In many languages, students first meet *arrays*.

In Python, the closest beginner-friendly equivalent is a *list*.

```python
students = ["Ava", "Ben", "Cara"]
grades = [72, 81, 65, 90]
```

#pause

A list is:
- ordered
- changeable
- indexed from 0
- able to grow and shrink

= Why This Matters

Collections are used everywhere:

- grades in a class
- items in a shopping basket
- sensor readings
- names in a booking system
- records loaded from a file

#pause

They also form the basis of later topics:

- files and JSON
- CRUD programs
- classes and objects
- data processing

= Today's Goal

By the end of this session, you should be able to:

- create a list
- access items by position
- change list contents
- use strings as sequences
- slice lists and strings
- process lists using loops
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
