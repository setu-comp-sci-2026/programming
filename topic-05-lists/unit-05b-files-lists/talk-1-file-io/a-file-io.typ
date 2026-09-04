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
    subtitle: [File Input and Output],
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

= Why Files?

So far our programs lose all data when they exit. *Files* let us:
- *Persist* data between program runs
- *Share* data between programs
- Process *large datasets* that don't fit in the program code
- Read *configuration* from external files

#pause

Python can read and write:
- Plain text files (`.txt`)
- CSV files (`.csv`)
- JSON files (`.json`)
- And many more with the right library

= Opening Files

```python
file = open("filename.txt", mode)
```

#table(
  columns: (auto, 1fr),
  inset: 9pt,
  fill: (col, row) => if col == 0 { rgb("#fed7aa") } else { white },
  [*Mode*], [*Description*],
  [`"r"`], [Read (default). Error if file doesn't exist.],
  [`"w"`], [Write. Creates file or *overwrites* existing content.],
  [`"a"`], [Append. Creates file or adds to end of existing content.],
  [`"x"`], [Exclusive create. Error if file already exists.],
  [`"r+"`], [Read and write.],
)

#pause

*Always close files when done:*

```python
file = open("data.txt", "r")
content = file.read()
file.close()       # MUST close — frees the resource
```

= The `with` Statement

The `with` statement *automatically closes* the file when the block ends, even if an error occurs.

```python
# Preferred way to open files
with open("data.txt", "r") as file:
    content = file.read()
    print(content)
# file is automatically closed here
```

#pause

*Writing a file:*

```python
with open("output.txt", "w") as file:
    file.write("Hello, World!\n")
    file.write("Second line\n")
```

*Appending to a file:*

```python
with open("log.txt", "a") as file:
    file.write("New entry added\n")
```

= Reading Methods

```python
# read() — entire file as one string
with open("poem.txt", "r") as f:
    text = f.read()
    print(text)

# readline() — one line at a time
with open("data.txt", "r") as f:
    first_line = f.readline()
    second_line = f.readline()

# readlines() — list of all lines (with \n)
with open("names.txt", "r") as f:
    lines = f.readlines()
    print(lines)   # ['Alice\n', 'Bob\n', 'Carol\n']
```

#pause

*Most common pattern — iterate line by line:*

```python
with open("scores.txt", "r") as f:
    for line in f:
        line = line.strip()    # remove \n
        if line:               # skip blank lines
            score = int(line)
            print(f"Score: {score}")
```

= Writing Files

```python
students = [
    ("Alice", 88),
    ("Bob", 74),
    ("Carol", 95),
    ("Dave", 62),
]

with open("results.txt", "w") as f:
    f.write("Student Results\n")
    f.write("=" * 20 + "\n")
    for name, score in students:
        grade = "Pass" if score >= 60 else "Fail"
        f.write(f"{name:<10} {score:3}  {grade}\n")

print("Results saved to results.txt")
```

#pause

```python
# Reading it back
with open("results.txt", "r") as f:
    print(f.read())
```

= Exception Handling with Files

Files can fail: the file might not exist, disk might be full, permissions might be denied.

```python
try:
    with open("data.txt", "r") as f:
        content = f.read()
        print(content)
except FileNotFoundError:
    print("Error: file not found")
except PermissionError:
    print("Error: no permission to read this file")
except IOError as e:
    print(f"IO Error: {e}")
```

#pause

*Safe file reading function:*

```python
def read_file(filename):
    """Read a file and return its contents, or None on error."""
    try:
        with open(filename, "r") as f:
            return f.read()
    except FileNotFoundError:
        print(f"'{filename}' not found")
        return None

content = read_file("notes.txt")
if content:
    print(content)
```

= Practical Example — Log File

```python
import datetime

def log_event(filename, message):
    """Append a timestamped log entry to a file."""
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(filename, "a") as f:
        f.write(f"[{timestamp}] {message}\n")

def read_log(filename):
    """Print all log entries."""
    try:
        with open(filename, "r") as f:
            for line in f:
                print(line.strip())
    except FileNotFoundError:
        print("No log file yet.")

log_event("app.log", "Application started")
log_event("app.log", "User logged in: Alice")
log_event("app.log", "File processed: data.csv")
read_log("app.log")
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