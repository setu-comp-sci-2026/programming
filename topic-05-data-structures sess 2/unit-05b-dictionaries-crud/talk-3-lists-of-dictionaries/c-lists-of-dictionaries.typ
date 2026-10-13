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
    subtitle: [Lists of Dictionaries],
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

= A List of Records

```python
movies = [
    {"title": "Jaws", "year": 1975, "rating": 5},
    {"title": "Alien", "year": 1979, "rating": 5},
    {"title": "Shrek", "year": 2001, "rating": 4}
]
```

#pause

Each dictionary is one record.

The list stores the collection.

= Displaying Records

```python
for movie in movies:
    print(movie["title"], movie["year"])
      #Jaws 1975
      #Alien 1979
      #Shrek 2001
```

#pause

Formatted output:

```python
for movie in movies:
    print(f"{movie['title']} ({movie['year']})")
    # Shrek 2001
    # Jaws (1975)
    # Alien (1979)
    # Shrek (2001)
```

= Searching

```python
search_title = input("Enter title: ")

for movie in movies:
    if movie["title"].lower() == search_title.lower():
        print("Found:", movie)

        # e.g. input: Shrek
        # output: Found: {'title': 'Shrek', 'year': 2001, 'rating': 4}
```

#pause

Important ideas:

- loop through each record
- check one field (make both search_title and movie["title"] lowercase for case-insensitive comparison)
- display the matching record

= Filtering

```python
for movie in movies:
    if movie["rating"] >= 5:
        print(movie["title"])
                # output: Jaws
                # output: Alien
```

#pause

Filtering means selecting only the records that match a condition.

= Adding New Records

```python
new_movie = {
    "title": input("Title: "),
    "year": int(input("Year: ")),
    "rating": int(input("Rating: "))
}

movies.append(new_movie) # add the new record
```

#pagebreak()
```python 
# continued from above
# test by printing the list of movies again
for movie in movies:
    print(movie["title"], movie["year"])
    #assume I entered "Odessey" for title, 2026 for year, and 5 for rating
    # output: Shrek 2001
    # output: Jaws 1975
    # output: Alien 1979
    # output: Odessey 2026 
```

#pause

This is an example of the Create step in CRUD.
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
