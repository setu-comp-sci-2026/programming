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
print(movie["title"]) # Jaws
print(movie["year"]) # 1975
print(movie["rating"]) # 5  
```

#pause

If the key does not exist, Python raises a `KeyError`.

```python
print(movie["director"]) # KeyError
```

= Safer Access with get()

```python
movie = {"title": "Jaws", "year": 1975}

print(movie.get("title")) # Jaws    
print(movie.get("title", "Unknown Title")) # Jaws

print(movie.get("director")) # None
print(movie.get("director", "Unknown director"))# Unknown director
```

#pause

`get()` is useful when a key might not exist because it will return `None` or a default value instead of raising an error.

= Adding and Updating

```python
movie = {"title": "Jaws", "year": 1975}

movie["rating"] = 5 # Add a new key-value pair
movie["year"] = 1976 # Update an existing key

print(movie) # {'title': 'Jaws', 'year': 1976, 'rating': 5}
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


print(student.keys()) #dict_keys(['name', 'age', 'course', 'mark'])
print(student.values()) #dict_values(['Ava', 19, 'Computing', 85])
print(student.items()) # dict_items([('name', 'Ava'), ('age', 19), ('course', 'Computing'), ('mark', 85)])```

#pause

== Looping over key-value pairs:

```python
for key, value in student.items():
    print(key, value) # name Ava
                      #age 19
                      #course Computing
                      #mark 82
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
