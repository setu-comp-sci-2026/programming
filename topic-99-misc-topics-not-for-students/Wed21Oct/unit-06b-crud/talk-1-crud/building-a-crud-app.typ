#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly

#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)
#let note(body) = block(fill: blue.lighten(85%), stroke: (paint: blue.lighten(50%), thickness: 1pt), radius: 8pt, inset: 14pt, width: 100%, body)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Week 6 — Building a CRUD Application],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)
#set text(size: 20pt)
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)

#slide(title: [Last Time])[
  We combined concepts we already knew:
  
  *lists + dictionaries + loops + selection + functions*
  #pause
  and introduced:
  
  #align(center)[#text(size: 1.4em, weight: "bold")[Create — Read — Update — Delete]]
]

#slide(title: [Our Running Example])[
  We will build a small *Dog Day Care Manager*.
  ```python
  dogs = [
      {"id": 1, "name": "Buddy", "breed": "Golden Retriever", "age": 4},
      {"id": 2, "name": "Luna", "breed": "Labrador", "age": 2}
  ]
  ```
  #pause
  Today the data exists only while the program is running.
]

#slide(title: [Start with Read])[
  Before changing data, make sure we can display it clearly.
  ```python
  def display_dogs(dogs):
      for dog in dogs:
          print(dog["id"], dog["name"], dog["breed"], dog["age"])
  ```
  #pause
  Why pass `dogs` as a parameter?
]

#slide(title: [Find One Record])[
  Several CRUD operations need to find a dog first.
  ```python
  def find_dog(dogs, dog_id):
      for dog in dogs:
          if dog["id"] == dog_id:
              return dog

      return None
  ```
  #pause
  #note[Write the search once. Reuse it wherever it is needed.]
]

#slide(title: [Using `None`])[
  ```python
  dog = find_dog(dogs, 2)

  if dog is not None:
      print(dog["name"])
  else:
      print("Dog not found")
  ```
  #pause
  `None` means that the function did not find a matching record.
]

#slide(title: [Create — Add a New Record])[
  ```python
  def add_dog(dogs):
      dog_id = int(input("ID: "))
      name = input("Name: ")
      breed = input("Breed: ")
      age = int(input("Age: "))

      dog = {
          "id": dog_id,
          "name": name,
          "breed": breed,
          "age": age
      }

      dogs.append(dog)
  ```
]

#slide(title: [Create — What Could Go Wrong?])[
  Before adding a dog, ask:
  
  *Should two dogs be allowed to have the same ID?*
  #pause
  ```python
  existing = find_dog(dogs, dog_id)

  if existing is not None:
      print("That ID already exists")
  else:
      # create and append the new dog
  ```
  #pause
  We are combining *Create* with *Read/search*.
]

#slide(title: [Update — Find, Then Change])[
  ```python
  def update_dog(dogs):
      dog_id = int(input("Dog ID: "))
      dog = find_dog(dogs, dog_id)

      if dog is not None:
          dog["age"] = int(input("New age: "))
          print("Dog updated")
      else:
          print("Dog not found")
  ```
  #pause
  We don't create a new dictionary — we change the existing one.
]

#slide(title: [Update More Than One Field?])[
  We could also allow the user to update other values:
  ```python
  dog["name"] = input("New name: ")
  dog["breed"] = input("New breed: ")
  dog["age"] = int(input("New age: "))
  ```
  #pause
  Design question: should the user have to change *everything*?
  
  There is often more than one reasonable solution.
]

#slide(title: [Delete — Find, Then Remove])[
  ```python
  def delete_dog(dogs):
      dog_id = int(input("Dog ID: "))
      dog = find_dog(dogs, dog_id)

      if dog is not None:
          dogs.remove(dog)
          print("Dog deleted")
      else:
          print("Dog not found")
  ```
]

#slide(title: [CRUD Functions])[
  Our program now has clear operations:
  ```text
  add_dog()       → Create
  display_dogs()  → Read
  find_dog()      → Read/Search
  update_dog()    → Update
  delete_dog()    → Delete
  ```
  #pause
  Each function has a clear responsibility.
]

#slide(title: [How Does the User Choose?])[
  We already know how to build this:
  ```python
  print("1. Add dog")
  print("2. View dogs")
  print("3. Update dog")
  print("4. Delete dog")
  print("0. Exit")

  choice = input("Choose an option: ")
  ```
  #pause
  What do we need if we want the menu to appear again?
]

#slide(title: [A Menu Loop])[
  ```python
  choice = ""

  while choice != "0":
      print("1. Add dog")
      print("2. View dogs")
      print("3. Update dog")
      print("4. Delete dog")
      print("0. Exit")

      choice = input("Choose an option: ")
  ```
  #pause
  This is why we learned `while` loops.
]

#slide(title: [Connect the Menu to the Functions])[
  ```python
  if choice == "1":
      add_dog(dogs)
  elif choice == "2":
      display_dogs(dogs)
  elif choice == "3":
      update_dog(dogs)
  elif choice == "4":
      delete_dog(dogs)
  elif choice != "0":
      print("Invalid option")
  ```
  #pause
  Selection decides which operation to perform.
]

#slide(title: [Look at What We Have Combined])[
  Our small CRUD application uses:
  #table(
    columns: (1fr, 2fr),
    [*Concept*], [*Job in the program*],
    [Variables], [Store individual values],
    [Selection], [Choose actions and handle decisions],
    [Functions], [Organise operations],
    [Iteration], [Repeat menus and process records],
    [Lists], [Store the collection],
    [Dictionaries], [Represent each record],
  )
]

#slide(title: [Important Limitation])[
  Add a dog, then stop the program and run it again.
  
  What happens?
  #pause
  *The new dog is gone.*
  #pause
  Our list only exists in memory while Python is running.
  #note[This gives us our next problem to solve: persistence using files / JSON.]
]

#slide(title: [Mini Activity — Trace a CRUD Operation])[
  Choose one operation: *Create, Read, Update or Delete*.
  
  Write its steps in plain English before looking at the Python.
  
  Example for Update:
  ```text
  1. Ask for the ID
  2. Search for the record
  3. If found, ask for the new value
  4. Change the record
  5. Otherwise display an error
  ```
  #pause
  Then identify where selection, iteration and functions are needed.
]

#slide(title: [Week 6 — Key Takeaways])[
  - CRUD is a pattern for managing collections of data
  - CRUD is not a new Python feature
  - It combines concepts we already know
  - Searching is an important reusable operation
  - Functions keep each operation manageable
  - Our data currently disappears when the program ends
  #pause
  #note[We now have the foundations for a much more realistic data-driven program.]
]
