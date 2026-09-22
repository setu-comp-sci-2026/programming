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
    subtitle: [Modules and Imports],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)

#let note(body) = block(
  fill: rgb("#c6f1c7"),
  stroke: (paint: rgb("#4caf50"), thickness: 1.5pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
  body
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

= What Is a Module?
A *module* is simply a Python file — a `.py` file containing functions, constants, or classes that other files can use.

#pause

You have already met the idea twice:

- In the last talk, *constants* such as `PI` and `GRAVITY` were described as living at *module level* — the top of the file
- Some functions (`print`, `len`, `input`) are always available; others are not

#pause

#note[
  *The big idea:* every `.py` file you write is a module. Once you can import one file into another, you can split a large program into small, readable files — and reuse the functions you already wrote instead of copying and pasting them.
]

= Built-in vs Library Functions

Python gives you a small set of *built-in* functions with no effort at all:

```python
print("hello")
length = len("Waterford")
value  = int("42")
```

#pagebreak()

But most of Python's power lives in the *standard library* — hundreds of modules that ship with Python but are *not* loaded until you ask for them:

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Module*], [*What it gives you*],
  [`math`], [`pi`, `sqrt`, `floor`, `ceil`, trigonometry],
  [`random`], [`randint`, `choice`, `shuffle`],
  [`turtle`], [Simple drawing and graphics],
  [`csv`], [Reading and writing CSV files],
  [`json`], [Saving and loading structured data],
)

#pagebreak()

Without an import, Python does not know the name:

```python
print(sqrt(16))
```

```
NameError: name 'sqrt' is not defined
```

#pause

The fix is to *import the module that defines it*.

= Importing modules
We can either import the whole module, or just a few names from it.
== Importing full modules:
```python
import math

radius = 5
area   = math.pi * radius ** 2

print(f"Area: {area:.2f}")       # Area: 78.54
print(math.sqrt(16))             # 4.0
print(math.floor(9.7))           # 9
```

#pause

- The `import` line goes at the *very top* of the file
- You then use `module_name.function_name()` — the dot says "look inside `math`"
- `math.pi` is a *constant* the module defines for you

#pagebreak()

The same pattern with `random`:

```python
import random

secret = random.randint(1, 100)
greeting = random.choice(["Hi", "Hello", "Hey"])

print(greeting)
```

#note[
  *NOTE:* `random.randint(1, 100)` includes *both* endpoints — unlike `range(1, 100)`, which stops at 99. Modules will not always behave the way the rest of the language does, so read the documentation.
]

== Importing individual names
`from module import name`

You can pull individual names *out* of a module, so you use them without the prefix:

```python
from math import pi, sqrt

radius = 5
area   = pi * radius ** 2        # no "math." needed

print(f"Area: {area:.2f}")
print(sqrt(16))
```

#pause

Same result, different style. So which should you use?

#pagebreak()

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [], [`import math`], [`from math import pi`],
  [*Written as*], [`math.pi`], [`pi`],
  [*Reads as*], [Clear where it came from], [Shorter, but origin hidden],
  [*Risk*], [None], [Can *clash* with your own names],
)

#pagebreak()

The clash is the real danger:

```python
from math import pi

pi = 3            # oops — your own variable wins from here on
print(pi * 4)     # 12, not 12.57
```
#pagebreak()

#note[
  *House rule for this module:* prefer `import math` and write `math.pi`. It is a few more characters, and anyone reading your code can see instantly where the name came from. Use `from ... import` when you need just one or two names and the source is obvious.
]

== Renaming on Import (`as`)

Occasionally a module name is long, or clashes with something. You can rename it as you import:

```python
import random as rnd

print(rnd.randint(1, 6))
```

#pause

You will see this constantly in data work (`import pandas as pd`). For now, know what it means when you see it — you rarely need it yourself.

= Your Own File Is a Module


Suppose you write `shapes.py`:

```python
"""Functions for calculating areas and perimeters."""
import math

def circle_area(radius):
    """Return the area of a circle with the given radius."""
    return math.pi * radius ** 2

def rectangle_area(width, height):
    """Return the area of a rectangle."""
    return width * height
```
#pause

Notice: `shapes.py` *itself* imports `math`. Modules import other modules — that is normal.

#pagebreak()

Now a *second* file, `test_shapes.py`, can use those functions:

```python
import shapes

print(shapes.circle_area(3))            # 28.274333882308138
print(shapes.rectangle_area(4, 5))      # 20

print(f"Circle r=3:  {shapes.circle_area(3):.2f}")
print(f"Rect 4x5:    {shapes.rectangle_area(4, 5):.2f}")
```

#pause

- `import shapes` — the *file name* without the `.py`
- `shapes.circle_area(3)` — the same dot notation as `math.sqrt(16)`

#pause

There is nothing special about `math` or `random`. They are files someone else wrote. Yours work exactly the same way.

= The Same-Folder Rule

For `import shapes` to work, both files must sit in the *same folder*:

```
lab03/
├── shapes.py          ← defines the functions
└── test_shapes.py     ← imports and uses them
```

#pause

Then, in VS Code, run `test_shapes.py`. Python looks for `shapes.py` *beside the file being run*.


#pagebreak()
```
ModuleNotFoundError: No module named 'shapes'
```

Most of the time,  this means one of:

- The two files are in *different* folders
- The file name is misspelled (`Shapes.py` is not `shapes.py`)
- You are running the file from the wrong working directory

== A Common Error and how to fix it

Never name your own file after a module you want to use:

```
lab03/
├── random.py          ← YOUR file
└── game.py            ← contains: import random
```

#pause

```python
# game.py
import random
print(random.randint(1, 10))
```
#pagebreak()
```
AttributeError: module 'random' has no attribute 'randint'
```

#pause

Python found *your* `random.py` first and imported that instead. The same applies to `math.py`, `csv.py`, `json.py`, `turtle.py`.

#note[
  *Name your files for what they do* — `shapes.py`, `physics.py`, `mortgage.py`, `unit_converter.py` — and this never bites you.
]


= Worked Example — Splitting a Program

*Before* — one file, everything mixed together:

```python
# guessing_game.py
import random

secret = random.randint(1, 100)
guess = int(input("Guess: "))

if guess < secret:
    print("Too low")
elif guess > secret:
    print("Too high")
else:
    print("Correct - well done!")
```

#pagebreak()

*After* — pure logic in one module, the program in another.

```python
# guess_logic.py
"""Pure functions for the guessing game."""
import random

def get_secret_number():
    """Return a random integer between 1 and 100."""
    return random.randint(1, 100)

```
#pagebreak()
```python
def check_guess(secret, guess):
    """Return 'Too low', 'Too high' or 'Correct' for the given guess."""
    if guess < secret:
        return "Too low"
    elif guess > secret:
        return "Too high"
    else:
        return "Correct - well done! "
```

#pagebreak()

```python
# game.py
import guess_logic

secret   = guess_logic.get_secret_number()
guess = int(input("Guess: "))

result = guess_logic.check_guess(secret, guess)
print(result)
```

#pause

`check_guess` is a *pure function* in its own file — easy to read, easy to reuse, and easy to test without ever playing the game.

==  One Thing to Watch For

When you `import` a file, Python *runs* it from top to bottom.

```python
# shapes.py
import math

def circle_area(radius):
    return math.pi * radius ** 2

print("Loading shapes...")     # this runs on import!
```

```python
# test_shapes.py
import shapes                  # prints "Loading shapes..."
```

#pause

Definitions are harmless — but stray `print()` calls and `input()` prompts at module level will fire the moment someone imports your file.

#pagebreak()

#note[
  *For now:* keep your module files to `import` lines, constants, and `def` blocks. Put the code that *does* things in the file you actually run.

]

= Recap

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Task*], [*Code*],
  [Use a library module], [`import math` then `math.sqrt(16)`],
  [Pull out one name], [`from math import pi` then `pi`],
  [Rename on import], [`import random as rnd`],
  [Use your own file], [`import shapes` then `shapes.circle_area(3)`],
)

#pause

- A module is just a `.py` file
- `import` goes at the top of the file
- Your file and the file you import must be in the *same folder*
- Never name a file after a standard library module
- Module files should *define*, not *do*

// = Over to You

// Try these before the next lab:

// + Write `physics.py` with the constants `GRAVITY`, `SPEED_OF_LIGHT`, `AIR_DENSITY` and the three functions from Exercise 4. Then write `test_physics.py` that imports it and prints results for a few realistic values.
// + Write `shapes.py` (Challenge 3) with all five functions, each with a docstring, and a separate `test_shapes.py` that imports `shapes` and checks every function with two sets of inputs.
// + Open a terminal, type `python3`, then `import shapes` followed by `help(shapes)`. Your docstrings become the documentation.

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
