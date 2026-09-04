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
    subtitle: [Debugging in VS Code],
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

= What is a Bug?

A *bug* is any error that causes a program to behave incorrectly or crash.

*The word "bug" dates to 1947* when a real moth was found causing a relay failure in a Harvard computer. Grace Hopper's team taped it in the logbook.

#pause

*Three types of errors in Python:*

#table(
  columns: (auto, 1fr, 1fr),
  inset: 9pt,
  fill: (col, row) => if col == 0 { rgb("#fecaca") } else { white },
  [*Type*], [*When detected*], [*Example*],
  [Syntax Error], [Before running (parse time)], [`if x > 0` missing `:`],
  [Runtime Error], [While running], [`int("hello")` → ValueError],
  [Logic Error], [Wrong result (no crash)], [Using `+` instead of `*`],
)

= Syntax Errors

Python cannot run the program at all — the code is grammatically wrong.

```python
# SyntaxError examples
def greet(name)        # Missing colon
    print("Hello")

for i in range(10)     # Missing colon
    print(i)

x = (1 + 2             # Unclosed parenthesis

if x > 0:
    print("positive")
 print("done")          # IndentationError (wrong indent)
```

#pause

VS Code *underlines* syntax errors in red even before you run the code. Hover over the red underline to see the error message.

= Runtime Errors

The code is syntactically correct but something goes wrong *while running*.

```python
# ZeroDivisionError
result = 10 / 0

# ValueError
age = int("hello")

# IndexError
fruits = ["apple", "banana"]
print(fruits[5])

# NameError
print(undefined_variable)

# TypeError
total = "10" + 5    # can't add str and int
```

#pause

Python prints a *traceback* showing exactly where the error occurred and the call stack.

Always read the *last line* of the traceback first — it tells you the error type and message.

= Logic Errors

The hardest to find — the program runs without crashing but gives wrong results.

```python
# Logic error — wrong formula
def celsius_to_fahrenheit(c):
    return c * 9 / 5 - 32   # Should be + 32, not - 32

print(celsius_to_fahrenheit(0))    # -32 instead of 32

# Logic error — off-by-one
def count_items(n):
    total = 0
    for i in range(n):       # Should be range(1, n+1)
        total += i
    return total

print(count_items(5))   # 10 instead of 15
```

#pause

The debugger is essential for tracking down logic errors.

= Using the VS Code Debugger

*Setting a breakpoint:*
1. Click in the *gutter* (left of the line number) — a red dot appears
2. Press `F5` to start debugging
3. The program pauses at each breakpoint

#pause

*Debug toolbar buttons:*

#table(
  columns: (auto, 1fr),
  inset: 9pt,
  fill: (col, row) => if col == 0 { rgb("#bbf7d0") } else { white },
  [*Button / Key*], [*Action*],
  [`F5` Continue], [Run until next breakpoint],
  [`F10` Step Over], [Execute current line, stay at same level],
  [`F11` Step Into], [Step into a function call],
  [`Shift+F11` Step Out], [Finish current function, return to caller],
  [`F9` Toggle Breakpoint], [Set or remove breakpoint on current line],
)

= The Debug Panels

When paused at a breakpoint, VS Code shows:

*Variables panel* — all current variable values (local and global)

*Watch panel* — monitor specific expressions (e.g., `len(my_list)`, `total / count`)

*Call Stack panel* — shows which functions are currently active and in what order

*Debug Console* — type any Python expression to evaluate it in the current context

#pause

```python
# Example to debug — broken average calculator
def calculate_average(numbers):
    total = 0
    for num in numbers:
        total = total + num    # Set breakpoint here
    average = total / len(numbers)
    return average

data = [10, 20, 30, 40, 50]
result = calculate_average(data)
print(f"Average: {result}")
```

= Practical Debugging Walkthrough

*Step-by-step debugging a broken function:*

```python
def find_second_largest(numbers):
    """Return the second largest number."""
    sorted_nums = sorted(numbers)     # Step 1: sort ascending
    return sorted_nums[-2]            # Step 2: return second from end

numbers = [3, 1, 4, 1, 5, 9, 2, 6]
print(find_second_largest(numbers))  # Should be 6
```

#pause

*Debugging strategy:*
1. Set a breakpoint inside `find_second_largest`
2. Step through — inspect `sorted_nums` in Variables panel
3. Verify `sorted_nums[-2]` is what you expect
4. Check: does this handle duplicates correctly? What if the list has fewer than 2 items?

#pause

*Always test edge cases:* empty list, single item, all same values, already sorted.

= Print Debugging vs Visual Debugger

*Print debugging* (quick but messy):

```python
def process(data):
    print(f"DEBUG: data = {data}")       # temporary debug prints
    result = []
    for item in data:
        print(f"DEBUG: processing {item}")
        result.append(item * 2)
    print(f"DEBUG: result = {result}")
    return result
```

#pause

*Visual debugger is better because:*
- No need to modify your code
- Can inspect *all* variables at once
- Can evaluate expressions interactively
- Call stack shows the full execution path
- No risk of forgetting to remove debug prints before submitting

#pause

*Rule of thumb:* use print debugging for quick 30-second checks; use the visual debugger when the bug is non-obvious.

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