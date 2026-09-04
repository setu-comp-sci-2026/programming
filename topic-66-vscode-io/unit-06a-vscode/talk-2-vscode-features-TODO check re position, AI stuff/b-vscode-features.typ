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
    subtitle: [VS Code Features],
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

= VS Code Interface Overview

Visual Studio Code is a lightweight but powerful source code editor.

#pause

*Key areas of the VS Code interface:*

#table(
  columns: (auto, 1fr),
  inset: 9pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Area*], [*Purpose*],
  [Activity Bar (left)], [Switch between Explorer, Search, Git, Extensions, Debug],
  [Side Bar], [File tree, search results, source control],
  [Editor Area], [Open files — supports split views],
  [Panel (bottom)], [Terminal, Output, Problems, Debug Console],
  [Status Bar], [Python interpreter, line/column, Git branch],
)

#pause

*Opening a folder:* `File > Open Folder` — always work in a folder, not a single file.

= Essential Extensions for Python

Install these from the Extensions sidebar (`Ctrl+Shift+X` / `Cmd+Shift+X`):

#pause

*Must-have:*
- *Python* (Microsoft) — language support, IntelliSense, linting, debugging
- *Pylance* — fast type checking and code completion

#pause

*Recommended:*
- *autopep8* or *Black Formatter* — auto-format your code
- *GitLens* — enhanced Git integration
- *indent-rainbow* — colour-codes indentation levels
- *Error Lens* — shows errors inline in the editor
- *Python Docstring Generator* — auto-generates docstring templates

#pause

After installing Python extension: select your interpreter from the status bar or `Ctrl+Shift+P > Python: Select Interpreter`.

= Keyboard Shortcuts

Knowing shortcuts makes you dramatically faster.

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Mac*], [*Windows/Linux*], [*Action*],
  [`Cmd+P`], [`Ctrl+P`], [Quick Open file],
  [`Cmd+Shift+P`], [`Ctrl+Shift+P`], [Command Palette],
  [`Cmd+/`], [`Ctrl+/`], [Toggle line comment],
  [`Alt+Up/Down`], [`Alt+Up/Down`], [Move line up/down],
  [`Opt+Click`], [`Alt+Click`], [Add cursor (multi-cursor)],
  [`Cmd+D`], [`Ctrl+D`], [Select next occurrence],
  [`Cmd+Shift+K`], [`Ctrl+Shift+K`], [Delete line],
  [`F5`], [`F5`], [Run / Debug],
  [`Ctrl+backtick`], [`Ctrl+backtick`], [Open terminal],
)

= IntelliSense

*IntelliSense* provides intelligent code completion as you type.

```python
# Start typing and VS Code suggests completions:
name = "hello"
name.  # → shows: upper, lower, strip, split, replace...

import math
math.  # → shows: pi, e, sqrt, floor, ceil...
```

#pause

*Features:*
- *Auto-complete* — press `Tab` or `Enter` to accept
- *Parameter hints* — shows function signatures as you type
- *Hover info* — hover over any name to see its type and docstring
- *Go to definition* — `F12` to jump to where something is defined
- *Find all references* — `Shift+F12`

#pause

*Tip:* `Ctrl+Space` triggers suggestions manually if they don't appear automatically.

= The Integrated Terminal

VS Code has a built-in terminal — no need to switch to a separate terminal app.

```bash
# Open terminal: Ctrl+` (backtick)

# Run your Python file
python3 myfile.py

# Install packages
pip install requests

# Check Python version
python3 --version
```

#pause

*Multiple terminals:* click `+` in the terminal panel to open additional terminals.

*Terminal types:* VS Code uses your system shell (zsh on Mac, PowerShell/cmd on Windows). You can change the default in settings.

= Virtual Environments

A *virtual environment* isolates your project's packages from the system Python.

```bash
# Create a virtual environment
python3 -m venv .venv

# Activate it (Mac/Linux)
source .venv/bin/activate

# Activate it (Windows)
.venv\Scripts\activate

# Install packages (only in this environment)
pip install requests

# Deactivate when done
deactivate
```

#pause

*VS Code tip:* when you create a `.venv` folder in your workspace, VS Code usually detects it automatically and selects it as the Python interpreter. Check the status bar — it should show `.venv`.

#pause

*Why use virtual environments?*
- Avoid version conflicts between projects
- Keep your system Python clean
- Makes projects reproducible (use `pip freeze > requirements.txt`)

= Multi-Cursor Editing

Multi-cursor lets you edit multiple places simultaneously.

*Add cursors manually:*
- `Alt+Click` to add a cursor at each click location

*Select all occurrences:*
- `Ctrl+D` / `Cmd+D` — select next occurrence of current word
- `Ctrl+Shift+L` / `Cmd+Shift+L` — select all occurrences

```python
# Example: rename a variable in many places
# Click on 'old_name', press Ctrl+Shift+L,
# then type 'new_name' — all instances update at once
old_name = 10
print(old_name)
result = old_name * 2
```

#pause

*Column selection:* `Shift+Alt+drag` to select a rectangular block of text across multiple lines — useful for aligning columns.

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