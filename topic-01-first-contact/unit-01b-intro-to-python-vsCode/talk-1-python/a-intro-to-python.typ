#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Python as a Language],
    subtitle: [Interpretation, History & Evolution],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],

    logo: image("assets/python.png", width: 1.5cm, height: 1.5cm),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(
  background: place(left + top, dx: 8.5em, dy: 1em,)[
#opaque-logo]
   )
#title-slide()
#set page(background: none)
#outline-slide()


= What is Python?

- High-level, dynamically-typed, interpreted programming language
- Created by Guido van Rossum in 1991
- Designed to be easy to read and write
- Versatile: web, data science, automation, AI, etc.
- Open-source and free
- Named after "Monty Python's Flying Circus"

= How Python Works
== Interpreted Language
The Execution Process:

1. *Writing the Code* — Create a `.py` file
2. *Parsing* — Interpreter reads your code
3. *Compilation to Bytecode* — Source code converted to bytecode
4. *Bytecode Execution* — Python Virtual Machine executes bytecode

#v(.5em)
#text(size: 12pt)[
#align(center)[
```
Your Python Code (.py)
        ↓
Python Interpreter
        ↓
Bytecode (.pyc)
        ↓
Python Virtual Machine (PVM)
        ↓
Machine Code (CPU)
```
]]
== Interpreted vs Compiled Languages

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,

    // Compiled
    align(left)[
      *Compiled (C, C++)*

      - Fast execution
      - Compiled once
      - Errors at compile time
      - Platform-specific
      - Slower development
    ],

    // Interpreted
    align(left)[
      *Interpreted (Python)*

      - Slower execution
      - Compiled at runtime
      - Errors at runtime
      - Cross-platform
      - Faster development
    ]
  )
]

== Python's Virtual Machine (PVM)

The *Python Virtual Machine* is an abstract computing machine that executes Python bytecode.

#v(1em)

It's the layer between your code and the actual computer hardware.

#v(1em)

This design enables:
- *Development Speed* — No compilation step needed
- *Cross-Platform* — Same code runs everywhere
- *Portability* — Windows, Mac, Linux without changes


= History of Python

== Historical Timeline

#align(left)[
  #text(size: 12pt)[
    1989 → Guido van Rossum creates Python at CWI (Amsterdam) starts development

    1991 → Python 0.9 released

    1994 → Python 1.0 (first stable)

    2000 → Python 2.0 (industry standard)

    *2008 → Python 3.0 (breaking change)*

    2010s → Python 2 vs 3 war

    2020 → Python 2 officially ends

    2024 → Python 3.12+ (modern, fast)
  ]
]
== Python Implementations

Different implementations of the Python language:

- *CPython* — Most common (written in C)
- *PyPy* — Faster with JIT compilation
- *Jython* — Runs on Java Virtual Machine
- *IronPython* — Runs on .NET


== Why Python Exploded in Popularity

1. *Data Science Boom* — NumPy, Pandas, Scikit-learn
2. *AI/Machine Learning* — TensorFlow, PyTorch, default choice
3. *Simple Syntax* — Perfect for teaching
4. *Web Development* — Django, Flask frameworks
5. *Automation* — DevOps and scripting
6. *Community* — Stack Overflow, GitHub, Reddit

== Adoption Milestones

- *1994-2000* — System administration and scripting
- *2006-2010* — Data science libraries emerge
- *2010-2015* — Machine learning revolution
- *2015+* — #1 language for AI/ML
- *2020+* — Surpasses Java in popularity

== Current State (2024)

Python is now:

- *#1-2 most popular language* (competing with JavaScript)
- *Default for data science, AI, and ML*
- *Growing in web development* (FastAPI, etc.)
- *Essential in education* — taught worldwide
- *Industry standard* for automation and DevOps

= Guido van Rossum's Philosophy

The "Zen of Python" (PEP 20) summarizes the language:

_Beautiful is better than ugly_

_Explicit is better than implicit_

_Simple is better than complex_

_Readability counts_

This philosophy has guided Python for 30+ years and explains its success.


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
