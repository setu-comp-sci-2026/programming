#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Week 8 — Importing Python Modules],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#set text(size: 19pt)
#title-slide()
#slide(title: [Why Do We Use `import`?])[
Imagine writing every tool you need from scratch: random numbers, JSON reading, maths, and every function from previous projects.

*`import` lets one Python file use code from another module.*

A *module* is usually a Python file containing functions, variables or classes.

*Question:* Have we already imported anything in our programs? (`json`, `random`, `pathlib`)
]

#slide(title: [Three Places Python Code Can Come From])[
#table(columns: (1.5fr, 2.5fr, 2.5fr),
  [*Source*], [*Examples*], [*How we get it*],
  [Standard library], [`random`, `json`, `math`], [Included with Python],
  [Third-party packages], [`requests`, `numpy`], [Installed separately, often with `pip`],
  [Our own modules], [`calculator.py`], [We create the `.py` file],
)

*Important:* `import` does not install a missing package.
]

#slide(title: [Example 1 — Import a Standard Library Module])[
```python
import random

number = random.randint(1, 6)
print("Dice roll:", number)
```

- `random` is the module.
- `randint()` is a function inside that module.
- The dot means *look inside this module*.

*Try:* Change `6` to `20`. What values could be printed?
]

#slide(title: [Two Ways to Import])[
```python
import math
print(math.sqrt(25))

from math import sqrt
print(sqrt(25))
```

Both print `5.0`.

- `import math` keeps the module name visible.
- `from math import sqrt` brings that name directly into this file.

*Beginner tip:* `import math` often makes the source of a function clearer.
]

#slide(title: [Example 2 — Create Our Own Module])[
*File 1: `calculator.py`*
```python
def add(a, b):
    return a + b

def divide(a, b):
    return a / b
```

This file defines reusable functions. It does not need to ask for input or print a menu.
]

#slide(title: [Example 2 — Use It from Another File])[
*File 2: `main.py`*
```python
import calculator

answer = calculator.add(10, 5)
print("Total:", answer)
```

*Folder:*
```text
MyProject/
    main.py
    calculator.py
```

Both files are in the same folder. Python can normally find `calculator.py` when running `main.py`.
]

#slide(title: [Import Just One Function])[
```python
from calculator import add

answer = add(10, 5)
print("Total:", answer)
```

*Compare:*
- `import calculator` → `calculator.add(10, 5)`
- `from calculator import add` → `add(10, 5)`

*Question:* Which version makes it clearer where `add` was defined?
]

#slide(title: [What Runs When We Import?])[
Python executes a module's top-level statements when it is first imported in a process.

*In `greetings.py`:*
```python
print("Module is loading")

def say_hello():
    print("Hello!")
```

Importing `greetings` prints `Module is loading` — even without calling `say_hello()`.

*Good practice:* Keep reusable functions in modules; put interactive program startup in `main.py`.
]

#slide(title: [Optional — The `__name__` Guard])[
```python
def add(a, b):
    return a + b

if __name__ == "__main__":
    print(add(2, 3))
```

- Running this file directly: the test prints `5`.
- Importing this file: the test does *not* run.

*You do not need to memorise it today.*
]


