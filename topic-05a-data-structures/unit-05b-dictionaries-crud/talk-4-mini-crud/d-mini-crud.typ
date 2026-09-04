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
    subtitle: [Mini CRUD with Dictionaries],
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

= CRUD

CRUD stands for:

- *Create* — add a new record
- *Read* — view records
- *Update* — change a record
- *Delete* — remove a record

#pause

CRUD is the backbone of many applications.

= Program Structure

```python
movies = []

def show_menu():
    print("1. Add movie")
    print("2. View movies")
    print("3. Search movie")
    print("4. Exit")
```

#pause

A menu lets the user repeatedly choose an action.

= Add Movie

```python
def add_movie(movies):
    movie = {
        "title": input("Title: "),
        "year": int(input("Year: ")),
        "rating": int(input("Rating: "))
    }
    movies.append(movie)
    print("Movie added")
```

= View Movies

```python
def view_movies(movies):
    if len(movies) == 0:
        print("No movies yet")
    else:
        for movie in movies:
            print(f"{movie['title']} ({movie['year']}) - {movie['rating']}/5")
```

= Main Loop

```python
while True:
    show_menu()
    choice = input("Choose: ")

    if choice == "1":
        add_movie(movies)
    elif choice == "2":
        view_movies(movies)
    elif choice == "4":
        break
    else:
        print("Invalid choice")
```

#pause

This is a complete application pattern.
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
