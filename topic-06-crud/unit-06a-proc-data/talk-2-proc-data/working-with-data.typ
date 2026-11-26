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
    subtitle: [Week 6 — Working with Data],
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

#slide(title: [Where Are We Now?])[
  We can now:
  - store information using *variables*
  - make decisions using *selection*
  - organise code using *functions*
  - repeat code using *iteration*
  - store collections using *lists and dictionaries*
  #pause
  #note[This week is about bringing those ideas together.]
]

#slide(title: [From Data Structures to Useful Programs])[
  We already know how to store data:
  ```python
  marks = [72, 38, 55, 90, 41]
  ```
  and how to describe one item:
  ```python
  student = {"name": "Mary", "mark": 72}
  ```
  #pause
  The next question is: *what can our program do with the data?*
]

#slide(title: [A Collection of Records])[
  ```python
  students = [
      {"id": 101, "name": "Mary", "mark": 72},
      {"id": 102, "name": "John", "mark": 38},
      {"id": 103, "name": "Sarah", "mark": 55}
  ]
  ```
  #pause
  A *list* stores the collection.
  
  Each *dictionary* represents one student record.
]

#slide(title: [Think About the Data])[
  Given our `students` collection, what might a useful program need to do?
  #pause
  - display all students
  - find a particular student
  - calculate an average
  - count passing students
  - add a new student
  - change a mark
  - remove a student
  #pause
  These are all examples of *processing data*.
]

#slide(title: [Reading Every Record])[
  Iteration lets us process each record:
  ```python
  for student in students:
      print(student["name"], student["mark"])
  ```
  #pause
  Trace it: what does `student` refer to on each pass through the loop?
]

#slide(title: [Selection Inside Iteration])[
  We can make a decision for every record:
  ```python
  for student in students:
      if student["mark"] >= 40:
          print(student["name"], "Pass")
      else:
          print(student["name"], "Fail")
  ```
  #pause
  #note[Iteration chooses *which record*. Selection chooses *what to do with it*.]
]

#slide(title: [Processing Pattern: Count])[
  ```python
  passes = 0

  for student in students:
      if student["mark"] >= 40:
          passes = passes + 1

  print("Number of passes:", passes)
  ```
  #pause
  We have seen this pattern before — the difference is that our data is now structured.
]

#slide(title: [Processing Pattern: Total and Average])[
  ```python
  total = 0

  for student in students:
      total = total + student["mark"]

  average = total / len(students)
  print("Average:", average)
  ```
  #pause
  What happens if `students` is empty?
]

#slide(title: [Processing Pattern: Search])[
  ```python
  search_id = int(input("Student ID: "))
  found = False

  for student in students:
      if student["id"] == search_id:
          print(student)
          found = True

  if found == False:
      print("Student not found")
  ```
  #pause
  Why is the `found` variable useful?
]

#slide(title: [Put the Search in a Function])[
  ```python
  def find_student(students, search_id):
      for student in students:
          if student["id"] == search_id:
              return student

      return None
  ```
  #pause
  ```python
  student = find_student(students, 102)
  ```
  #note[The function has one job: find and return a student.]
]

#slide(title: [Why Return the Student?])[
  Compare:
  ```python
  def find_student(students, search_id):
      # ...
      print(student)
  ```
  with:
  ```python
  def find_student(students, search_id):
      # ...
      return student
  ```
  #pause
  Returning the record means the rest of our program can decide what to do with it.
]

#slide(title: [A New Way to Think About Our Program])[
  Instead of one long script, we can give functions responsibilities:
  ```text
  display_students()
  find_student()
  calculate_average()
  count_passes()
  ```
  #pause
  #note[Functions organise the *operations*. Lists and dictionaries organise the *data*.]
]

#slide(title: [Now We Want to Change the Data])[
  So far we have mostly *read* and processed existing data.
  
  What if the user needs to:
  - add a student?
  - change a student's mark?
  - remove a student?
  #pause
  These operations have a very common name.
]

#slide(title: [CRUD])[
  *CRUD* describes four basic operations used in data-driven programs:
  #table(
    columns: (1fr, 2fr),
    [*Operation*], [*Meaning*],
    [Create], [Add new data],
    [Read], [View or find data],
    [Update], [Change existing data],
    [Delete], [Remove data],
  )
]

#slide(title: [CRUD Is Already Familiar])[
  Think about an app you use regularly.
  
  A contacts app might let you:
  - *Create* a contact
  - *Read* your contacts
  - *Update* a phone number
  - *Delete* a contact
  #pause
  The terminology is new. The ideas are not.
]

#slide(title: [Mini Activity — Design the Operations])[
  Imagine a simple *Dog Day Care Manager*.
  
  Each dog has:
  ```text
  id, name, breed, age
  ```
  For each CRUD operation, write down:
  - what information the user needs to provide
  - what the program needs to find or change
  - what could go wrong
  #pause
  We will use exactly this thinking when we build CRUD code.
]

#slide(title: [Lecture 1 — Key Ideas])[
  - Lists can hold collections of records
  - Dictionaries can represent individual records
  - Loops let us process every record
  - Selection lets us decide what to do with each record
  - Functions give operations clear responsibilities
  - CRUD means *Create, Read, Update, Delete*
  #pause
  #note[Next: we turn these ideas into a small working CRUD application.]
]
