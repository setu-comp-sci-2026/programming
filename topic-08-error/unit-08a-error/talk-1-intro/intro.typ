#import "@preview/touying:0.7.3": *
#import themes.stargazer: *

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Week 7 Revision — Files and JSON],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#set text(size: 19pt)
#title-slide()

#slide(title: [Today — A Quick Week 7 Recap])[
  #columns(2, gutter: 1.3em)[
    - What is a file?
    - Why do we save data?
    - How do we open files in Python?
  ]
]

#slide(title: [What Is a File?])[
  #columns(2, gutter: 1.2em)[
    A *file* is data stored on a computer so we can use it again later.

    Examples:
    - `notes.txt` — plain text
    - `scores.json` — structured data
    - `results.csv` — rows and columns
  ]
    #image("assets/files.svg", width: 100%)
  
]

#slide(title: [Why Save Data to a File?])[
  #columns(2, gutter: 1.2em)[
    Without a file, data stored in variables is normally lost when the program ends.

    With a file, we can:
    - save information
    - close the program
    - load it again next time

    *This is called persistence.*
  ]
    #image("assets/persistence.svg", width: 100%)
  
]

#slide(title: [Why Use JSON?])[
  #columns(2, gutter: 1.2em)[
    JSON stores *structured data* using keys, values, lists and objects.

    - easy for people to read
    - works well with Python dictionaries and lists
    - separates stored data from program logic
    - can be updated without editing Python code
  ]
    #image("assets/json.svg", width: 100%)
  
]

#slide(title: [A Simple JSON File])[
  `student.json` contains:
  ```json
  {
    "name": "Alex",
    "score": 8,
    "subjects": ["Python", "Maths"]
  }
  ```
  *Question:* Which values are a string, a number and a list?
]

#slide(title: [Ways to Open a File])[
  #table(
    columns: (0.55fr, 1.8fr, 1.55fr),
    inset: 10pt,
    stroke: rgb("#cad7e3"),
    table.header([*Mode*], [*What it does*], [*Example*]),
    [`"r"`], [Read an existing file. Fails if missing.], [`open("notes.txt", "r")`],
    [`"w"`], [Write. Creates or *overwrites* a file.], [`open("notes.txt", "w")`],
    [`"a"`], [Append to the end. Creates if missing.], [`open("notes.txt", "a")`],
    [`"x"`], [Create a new file. Fails if it exists.], [`open("notes.txt", "x")`],
  )
  #image("assets/modes.svg", height: 30%)
]

#slide(title: [Reading a Text File — `"r"`])[
  Imagine `notes.txt` already contains `Remember your lab!`.
  ```python
  with open("notes.txt", "r", encoding="utf-8") as file:
      content = file.read()

  print(content)
  ```
  Output: `Remember your lab!`

  *`with` closes the file automatically.*
]

#slide(title: [Writing a Text File — `"w"`])[
  ```python
  with open("notes.txt", "w", encoding="utf-8") as file:
      file.write("Hello from Python!\n")
  ```
  - Creates `notes.txt` if it does not exist.
  - *Warning:* replaces its existing contents if it does exist.
  - `\n` starts a new line.
]

#slide(title: [Appending to a Text File — `"a"`])[
  ```python
  with open("notes.txt", "a", encoding="utf-8") as file:
      file.write("One more note.\n")
  ```
  - Adds text to the *end* of the file.
  - Keeps the text already there.
  - Creates the file if needed.
]

#slide(title: [Saving a Dictionary as JSON])[
  ```python
  import json

  student = {"name": "Alex", "score": 8}

  with open("student.json", "w", encoding="utf-8") as file:
      json.dump(student, file, indent=4)
  ```
  `json.dump()` writes Python data to a JSON file.
]

#slide(title: [Loading Data from JSON])[
  ```python
  import json

  with open("student.json", "r", encoding="utf-8") as file:
      student = json.load(file)

  print(student["name"])
  ```
  Output: `Alex`

  `json.load()` reads JSON into Python data (here, a dictionary).
]

#slide(title: [Remember the Working Directory])[
  `open("notes.txt")` looks relative to the *current working directory*.

  ```python
  import os
  print(os.getcwd())
  ```

  For project files, we can build a path relative to our script:
  ```python
  from pathlib import Path
  path = Path(__file__).resolve().parent / "notes.txt"
  ```
]

#slide(title: [Quick Check — Can You Explain?])[
  #columns(2, gutter: 1.1em)[
    1. Why save data in a file?
    2. What is JSON useful for?
    3. Which mode adds text without deleting existing text?
    4. What is the danger of `"w"`?
    5. What does `with` do for us?
  ]
  
  
]
