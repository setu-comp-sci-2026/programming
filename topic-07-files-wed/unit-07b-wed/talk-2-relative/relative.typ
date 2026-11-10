#import "@preview/touying:0.7.3": *
#import themes.stargazer: *

#let note(body) = block(
  fill: rgb("#eaf4ef"),
  stroke: (paint: rgb("#77a98d"), thickness: 1pt),
  radius: 7pt,
  inset: 12pt,
  width: 100%,
  body,
)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Week 7 — Relative File Paths and `main()`],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#set text(size: 20pt)
#title-slide()

#slide(title: [Two Small Ideas That Make Programs Easier to Run])[
  Today we will learn:
  - where Python looks for files
  - how to use *relative file paths*
  - how to organise a program around a `main()` function
  - what `if __name__ == "__main__":` means

  #note[These ideas will help us organise the PC Troubleshooter and its JSON knowledge file.]
]

#slide(title: [A Familiar Problem])[
  You have a file called `knowledge.json`.

  ```python
  with open("knowledge.json", "r") as file:
      data = file.read()
  ```

  But Python says: `FileNotFoundError`.

  #pause
  *The file exists, so why might Python not find it?*
]

#slide(title: [A Project Has Folders and Files])[
  ```text
  pc_troubleshooter/
  |-- troubleshooter.py
  |-- knowledge.json
  |-- data/
      |-- history.json
  ```

  Files have *locations*, not just names.

  The path tells Python which file to use.
]

#slide(title: [Absolute and Relative Paths])[
  *Absolute path:* starts from a fixed location on the computer.

  ```text
  C:\\Users\\Student\\Projects\\pc_troubleshooter\\knowledge.json
  ```

  *Relative path:* starts from the program's *current working directory*.

  ```text
  knowledge.json
  data/history.json
  ```

  #note[Relative paths make projects easier to move between computers — provided the working directory is set correctly.]
]

#slide(title: [Where Does Python Start Looking?])[
  A relative path is normally resolved from the *current working directory* (CWD).

  ```python
  import os

  print(os.getcwd())
  ```

  The CWD is not necessarily the folder containing the Python script.

  #pause
  *What happens if you run the script from a different folder?*
]

#slide(title: [Try It: Read a File in the Same Folder])[
  If the working directory is `pc_troubleshooter/`:

  ```python
  with open("knowledge.json", "r") as file:
      contents = file.read()

  print(contents)
  ```

  *Live task:* Put a small text or JSON file in your project folder and read it.
]

#slide(title: [Try It: Read a File in a Subfolder])[
  To access `data/history.json`:

  ```python
  with open("data/history.json", "r") as file:
      contents = file.read()
  ```

  The `/` separates folders in a path.

  #note[Use forward slashes in these examples; they also work in Python paths on Windows.]
]

#slide(title: [What Does `..` Mean?])[
  Relative paths can include:
  - `.` — the current directory
  - `..` — the parent directory

  ```text
  ../knowledge.json
  ```

  This means: *go up one folder, then find `knowledge.json`.*

  #pause
  *Question:* Would this work from every working directory?
]

#slide(title: [A More Reliable Approach: `pathlib`])[
  Sometimes we want a path relative to the *script*, not the CWD.

  ```python
  from pathlib import Path

  folder = Path(__file__).resolve().parent
  knowledge_file = folder / "knowledge.json"

  print(knowledge_file)
  ```

  `Path(__file__)` refers to the Python file being run.

  #note[Useful for Assignment 2: keep your JSON file beside your Python file.]
]

#slide(title: [Read JSON Using a Script-Relative Path])[
  ```python
  import json
  from pathlib import Path

  folder = Path(__file__).resolve().parent
  filename = folder / "knowledge.json"

  with open(filename, "r", encoding="utf-8") as file:
      knowledge = json.load(file)
  ```

  *Note:* `json.load()` reads JSON and converts it to Python data.
]

#slide(title: [Quick Check: Which Path Would You Use?])[
  ```text
  project/
  |-- app.py
  |-- rules.json
  |-- data/
      |-- history.json
  ```

  Assume the CWD is `project/`.

  1. How do we open `rules.json`?
  2. How do we open `history.json`?
  3. What changes if the CWD is the folder above `project/`?

  #pause
  *Answers:* `rules.json`, `data/history.json`; from the parent use `project/rules.json` and `project/data/history.json`.
]

#slide(title: [Next: Where Should Our Program Start?])[
  So far, we have written functions such as:

  ```python
  def display_menu():
      print("1. Start troubleshooting")
      print("2. Exit")
  ```

  But where do we put the code that *runs the whole program*?

  #note[We can create a `main()` function to organise the starting point.]
]

#slide(title: [Introducing `main()`])[
  ```python
  def display_menu():
      print("Welcome to PC Troubleshooter")

  def main():
      display_menu()
      print("Ready to begin!")

  main()
  ```

  `main()` is an ordinary function — we choose that name by convention.
]

#slide(title: [Why Use a `main()` Function?])[
  It helps us:
  - see where the program starts
  - keep the main sequence of steps together
  - avoid a long block of loose code
  - reuse and test other functions separately

  #note[Think of `main()` as the organiser that calls the other functions.]
]

#slide(title: [A Typical Menu-Driven `main()`])[
  ```python
  def main():
      choice = ""
      while choice != "2":
          print("1. Troubleshoot a problem")
          print("2. Exit")
          choice = input("Choose an option: ")

          if choice == "1":
              print("Starting troubleshooting...")

  main()
  ```

  *Question:* Which parts would you move into separate functions?
]

#slide(title: [A Special Line You Will Often See])[
  ```python
  if __name__ == "__main__":
      main()
  ```

  Python automatically sets the variable `__name__`.

  When we run a file directly, its `__name__` is `"__main__"`.

  This line means: *run `main()` only if this file was started directly.*
]

#slide(title: [Why Not Just Write `main()`?])[
  Imagine another Python file imports your functions.

  If you write `main()` at the bottom, the program starts *during the import*.

  If you write:

  ```python
  if __name__ == "__main__":
      main()
  ```

  the functions can be imported without automatically running the menu.

  #note[You don't need to memorise every detail yet — recognise this as the standard way to start a Python program.]
]

#slide(title: [Our PC Troubleshooter: Putting It Together])[
  ```python
  import json
  from pathlib import Path

  def load_knowledge():
      path = Path(__file__).resolve().parent / "knowledge.json"
      with open(path, "r", encoding="utf-8") as file:
          return json.load(file)

  def main():
      knowledge = load_knowledge()
      print("Knowledge loaded successfully!")

  if __name__ == "__main__":
      main()
  ```
]

#slide(title: [Your Turn: Improve the Program])[
  Working with the PC Troubleshooter:

  1. Put `knowledge.json` beside your Python file.
  2. Create a `load_knowledge()` function.
  3. Add a `main()` function that calls it.
  4. Add the standard `if __name__ == "__main__":` line.
  5. Run the program and check that the file loads.

  *Challenge:* Move the JSON file into a `data/` folder and update the path.
]

#slide(title: [Before We Finish])[
  You should now be able to explain:
  - the difference between an absolute and relative path
  - what the current working directory is
  - why `Path(__file__).resolve().parent` is useful
  - what a `main()` function does
  - why we use `if __name__ == "__main__":`

  #note[Next week: debugging and exception handling — including what to do when a file is missing or contains invalid data.]
]
