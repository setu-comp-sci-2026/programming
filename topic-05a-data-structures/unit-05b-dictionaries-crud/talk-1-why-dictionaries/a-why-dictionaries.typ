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
    subtitle: [Why Dictionaries?],
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

= Lists Are Good, But...

A list can store related values:

```python
student = ["Ava", 19, "Computing", 82]
```

#pause

But what does each position mean?

```python
print(student[2])
```

Is that course? County? Email?

= Dictionaries Use Keys

A dictionary stores data as key-value pairs.

```python
student = {
    "name": "Ava",
    "age": 19,
    "course": "Computing",
    "mark": 82
}
```

#pause

This is much easier to read.

```python
print(student["course"])
```

= Records

A dictionary is a natural way to represent a *record*.

Examples:

- one student
- one book
- one dog
- one product
- one planet

#pause

This prepares students for:

- JSON
- APIs
- file storage
- CRUD applications

= Lists of Dictionaries

A list can store many dictionary records.

```python
students = [
    {"name": "Ava", "mark": 82},
    {"name": "Ben", "mark": 71},
    {"name": "Cara", "mark": 90}
]
```

#pause

This is our first simple database structure.
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
