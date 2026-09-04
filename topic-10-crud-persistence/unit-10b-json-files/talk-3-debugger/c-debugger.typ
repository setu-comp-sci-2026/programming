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
    subtitle: [VS Code Debugger],
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

= Why Use a Debugger?

== Beyond `print()` debugging

`print()` is useful, but limited:
- You have to guess where to put them
- Output clutters the terminal
- Hard to inspect complex objects

The debugger lets you:
- *Pause* execution at any line
- *Inspect* variable values interactively
- *Step through* code line by line
- *Evaluate* expressions on the fly

= Setting Breakpoints

== Click in the gutter

To set a breakpoint in VS Code:
1. Open your Python file
2. Click in the *left gutter* (grey area) next to a line number
3. A *red dot* appears — this is your breakpoint
4. Press *F5* (or Run → Start Debugging)

Execution will *pause* at the breakpoint, and VS Code enters debug mode.

= The Debug Panel

== What you see when paused

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Panel*], [*Shows*],
  [Variables], [All variables in current scope + their values],
  [Watch], [Expressions you add to monitor],
  [Call Stack], [Which functions are currently active],
  [Breakpoints], [List of all set breakpoints],
)

The *highlighted line* is the next line that will execute.

= Step Controls

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 7pt,
  [*Button*], [*Key*], [*Action*],
  [▶ Continue], [F5], [Run until next breakpoint],
  [⤵ Step Over], [F10], [Run current line, stay in this function],
  [⬇ Step Into], [F11], [Jump *into* a function call],
  [⬆ Step Out], [Shift+F11], [Run to end of current function],
  [⏹ Stop], [Shift+F5], [End debugging session],
)

#v(.5em)
*Step Over* is the most-used — walk through your code one line at a time.

= Watch Expressions

== Monitor specific values

In the *Watch* panel, click `+` and type any Python expression:
- `shop.get_all_products()`
- `len(products)`
- `p.get_price() > 2.0`
- `product.get_name().upper()`

The expression is re-evaluated *at every pause*, so you can see how values change.

= Debug Console

== Interactive Python at a breakpoint

The *Debug Console* (bottom panel) lets you type Python while paused:

```python
> shop.get_all_products()
[<product.Product object at 0x...>, ...]

> len(shop.get_all_products())
3

> shop.find_by_name("Apple")
Product [101]: Apple — €1.99
```

This is extremely useful for testing assumptions about object state.

= Debugging a CRUD Bug

Example: `find_by_name()` always returns `None`.

1. Set a breakpoint inside `find_by_name()`
2. Run the debugger and call the method
3. *Step Over* each line and watch the Variables panel
4. Inspect `p.get_name()` and `name` in the Debug Console:

```python
> p.get_name()
'Apple '        # ← trailing space!
> name
'Apple'
```

Fix: add `.strip()` to `get_name()` or when comparing.

= `launch.json` — Debug Configuration

VS Code creates `.vscode/launch.json` automatically. The default Python config:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal"
        }
    ]
}
```

This runs whichever file is currently open. You can add more configurations for specific entry points.
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
