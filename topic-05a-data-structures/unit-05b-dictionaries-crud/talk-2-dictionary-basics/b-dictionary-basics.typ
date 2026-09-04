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
    subtitle: [Dictionary Basics],
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

= Creating a Dictionary

```python
movie = {
    "title": "Jaws",
    "year": 1975,
    "rating": 5
}
```

#pause

A dictionary uses:

```text
key: value
```

= Accessing Values

```python
print(movie["title"])
print(movie["year"])
```

#pause

If the key does not exist, Python raises a `KeyError`.

```python
print(movie["director"])
```

= Safer Access with get()

```python
movie = {"title": "Jaws", "year": 1975}

print(movie.get("title"))
print(movie.get("director"))
print(movie.get("director", "Unknown"))
```

#pause

`get()` is useful when a key might not exist.

= Adding and Updating

```python
movie = {"title": "Jaws", "year": 1975}

movie["rating"] = 5
movie["year"] = 1976

print(movie)
```

#pause

The same syntax is used to add or update.

= Useful Dictionary Methods

```python
student = {
    "name": "Ava",
    "age": 19,
    "course": "Computing"
}

print(student.keys())
print(student.values())
print(student.items())
```

#pause

Looping over key-value pairs:

```python
for key, value in student.items():
    print(key, value)
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
