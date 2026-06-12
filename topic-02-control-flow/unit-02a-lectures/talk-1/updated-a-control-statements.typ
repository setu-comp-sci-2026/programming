#import "@preview/touying:0.7.3": *

#import themes.stargazer: *
#import "@preview/cetz:0.5.0": canvas, draw

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#let note(body) = block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
  body
)

#let output-box(body) = block(
  fill: luma(245),
  stroke: (paint: luma(180), thickness: 1pt),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#let error-box(body) = block(
  fill: red.lighten(90%),
  stroke: (paint: red.lighten(50%), thickness: 1pt),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Conditional Statements],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo
  ),
  // config-common(handout:true),  for handout version of the slides(no animations, etc.)
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(
  background: place(left + top, dx: 8.5em, dy: 1em,)[
#opaque-logo]
   )


#title-slide()
#set page(background: none)
#outline-slide()

= Flow of Control in a Program
Each program you write will typically have:
#pause
#table(
  columns: (auto, auto),
  inset: 12pt,
  align: horizon,
  fill: (col, row) => if col == 0 { rgb("#a9a9b4") } else { white },
  [*Sequence*], [Things that will be done in a particular order],
  [*Selection*], [Things that will be done conditionally],
  [*Iteration*], [Things that will be done repetitively],
)

#slide[
For this slide deck, we will be covering the first two types of control flow: sequence and selection. We will cover iteration in a later slide deck.

#pause
#table(
  columns: (auto, auto),
  inset: 12pt,
  align: horizon,
  fill: (col, row) => if row == 0 { rgb("#ffcccc") } else if col == 0 { rgb("#a9a9b4") } else { white },
  [*Sequence*], [Things that will be done in a particular order],
  [*Selection*], [Things that will be done conditionally],
  [*Iteration*], [Things that will be done repetitively],
)
#pause
Sequence is the default flow of control in a program. It simply means that the statements in a program will be executed in the order they are written.
]
#slide[

#table(
  columns: (auto, auto),
  inset: 12pt,
  align: horizon,
  fill: (col, row) => if row == 1 { rgb("#ffcccc") } else if col == 0 { rgb("#a9a9b4") } else { white },
  [*Sequence*], [Things that will be done in a particular order],
  [*Selection*], [Things that will be done conditionally],
  [*Iteration*], [Things that will be done repetitively],
)
#pause
- For the rest of this slide deck, we will be covering selection statements.
- Selection statements allow us to execute certain statements only if a certain condition is true.
- The most common selection statement is the if statement.
]

= Boolean Conditions
== Data types - Boolean

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-14.png", width: 9cm)]
    ]][
  - Remember our discussion of data types? We will be using the  data type called *Boolean* in selection statements.
- A #text(fill:red)[Boolean] is a data type that can only have two values: True or False.
#pause
- Booleans are often used in programming to represent the truth value of a condition or to control the flow of a program based on certain conditions.
]

== Boolean Conditions

#slide[
- A Boolean condition is an expression that evaluates to either #text(fill:red)[True] or #text(fill:red)[False] e.g.
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
```python
  x < 50
  number > 0
```
   ]]
#pause
- A conditional statement evaluates a Boolean condition and its result will determine which section of the code is executed.
]
= Relational Operators
  #slide[
    #table(
  columns: (auto, 1fr, 2fr),
  align: (center, center, center),
  stroke: gray,

  // Header row
  table.cell(fill: blue.lighten(80%))[*Operator*],
  table.cell(fill: blue.lighten(80%))[*Syntax*],
  table.cell(fill: blue.lighten(80%))[*Returns #text(fill: red)[true] if...*],

  // Rows
  text(size: 1.4em, weight: "bold")[>],
  `x > y`,
  [x is *greater* than y],

  text(size: 1.4em, weight: "bold")[>=],
  `x >= y`,
  [x is *greater than or equal* to y],

  text(size: 1.4em, weight: "bold")[<],
  `x < y`,
  [x is *less* than y],

  text(size: 1.4em, weight: "bold")[<=],
  `x <= y`,
  [x is *less than or equal* to y],

  text(size: 1.4em, fill: red, weight: "bold")[==],
  text(fill: red)[`x == y`],
  [x and y are *equal*],

  text(size: 1.4em, weight: "bold")[!=],
  `x != y`,
  [x and y are *not equal*],
)
#pause
 #text(size: 1.4em, fill:red, weight: "bold")[\= is an assignment operator and doesn't test for equality.
\== is used to test for equality.]

  ]

= Conditional Statement - if statement
== if statement syntax

#slide[
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align: horizon,
    // Left cell: the code display
    stack(
      spacing: 1em,
      // Line 1: if [box] :
      stack(dir: ltr, spacing: 0.3em,
        text(font: "Courier New", size: 1em, weight: "bold")[if ],
        rect(stroke: 1.5pt + black, inset: 4pt)[
          #text(font: "Courier New", size: 1em, weight: "bold", fill: red, style: "italic")[perform some #text(fill: red)[_boolean_] test]
        ],
        text(font: "Courier New", size: 1em, weight: "bold")[ :],
      ),
      // Line 2: indented body
      pad(left: 2em,
        text(font: "Courier New", size: 1em, weight: "bold", fill: green, style: "italic")[Do these statement(s) if the test is true]
      ),
    ),

    // Right cell: annotation
    grid.cell(align: bottom)[
    #text(fill: green, size: 1em)[← actions if\ condition is true]

])

#pause

#note[

  *NOTE:*
  #list(
    [Python relies on indentation to define scope in the code.],
    [Indentation is a whitespace at the beginning of the line.],
    [We saw this earlier when writing functions.],
  )
]]

#slide[
  Example of an if statement:
 #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    // Cell 1: code block
    rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #text(size: 0.7em)[```python
age = 25
if age >= 18:
    print("You are an adult.")
    print("You can vote.")
```
] ],
 uncover("2-")[
      #stack(
   spacing: 0.5em,
        [This will output:],

 rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/if-1.png", width: 9cm)]
 ],
      )
    ],
  )
]

#slide[
  Example of a sequence of  if statements:
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    // Cell 1: code block
    rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #text(size: 0.7em)[```python
age = 18
if age > 18:
    print("You are an adult.")
    print("And you are over eighteen")

if age == 18:
    print("Congratulations on reaching adulthood!")

if age < 18:
    print("You are a minor.")
```]
    ],
    // Cell 2: output
    uncover("2-")[
      #stack(
        spacing: 0.5em,
        [This will output:],
        rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
          #align(center)[#image("assets/if-2.png", width: 100%)]
        ],
      )
    ],
  )
]

== if-else statement syntax

#slide[
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align: horizon,
    stack(
      spacing: 1em,
      // if line
      stack(dir: ltr, spacing: 0.3em,
        text(font: "Courier New", size: 1em, weight: "bold")[if ],
        rect(stroke: 1.5pt + black, inset: 4pt)[
          #text(font: "Courier New", size: 1em, weight: "bold", fill: red, style: "italic")[perform some boolean test]
        ],
        text(font: "Courier New", size: 1em, weight: "bold")[ :],
      ),
      // true branch
      pad(left: 2em,
        text(font: "Courier New", size: 1em, weight: "bold", fill: green, style: "italic")[Do these statement(s) if the test is true]
      ),
      // else line
      text(font: "Courier New", size: 1em, weight: "bold")[else:],
      // false branch
      pad(left: 2em,
        text(font: "Courier New", size: 1em, weight: "bold", fill: blue, style: "italic")[Do these statement(s) if the test is false]
      ),
    ),
    grid.cell(align: horizon)[
      #stack(spacing: 2em,
        text(fill: green, size: 1em)[← actions if condition is *true*],
        text(fill: blue, size: 1em)[← actions if condition is *false*],
      )
    ]
  )

#pause
#note[
  The `else` clause has *no condition* — it runs whenever the `if` condition is false. Only one branch (either `if` or `else`) will execute.
]
]

#slide[
  Returning to the age example — we had two separate `if` statements:
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #text(size: 0.75em)[```python
# Two separate if statements
age = 20
if age >= 18:
    print("You are an adult.")
if age < 18:
    print("You are a minor.")
```]
    ],
    uncover("2-")[
      rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
# Simplified with if-else
age = 20
if age >= 18:
    print("You are an adult.")
else:
    print("You are a minor.")
```]
      ]
    ]
  )
  #pause
  #pause
  - The `if-else` version is cleaner — there are only two outcomes, so `else` handles the second case directly.
]

#slide[
  A fresh example with `if-else`:
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #text(size: 0.75em)[```python
temperature = 22

if temperature > 25:
    print("It is warm outside.")
    print("Wear light clothing.")
else:
    print("It is cool outside.")
    print("Bring a jacket.")
```]
    ],
    uncover("2-")[
      #stack(
        spacing: 0.5em,
        [This will output:],
        output-box[
          #text(font: "Courier New", size: 0.8em)[
            It is cool outside. \ Bring a jacket.
          ]
        ]
      )
    ]
  )
]

== if-elif-else statement syntax

#slide[
  #stack(
    spacing: 0.8em,
    // if line
    stack(dir: ltr, spacing: 0.3em,
      text(font: "Courier New", size: 0.9em, weight: "bold")[if ],
      rect(stroke: 1.5pt + black, inset: 4pt)[
        #text(font: "Courier New", size: 0.9em, weight: "bold", fill: red, style: "italic")[condition1]
      ],
      text(font: "Courier New", size: 0.9em, weight: "bold")[:],
    ),
    pad(left: 2em,
      text(font: "Courier New", size: 0.9em, fill: green, style: "italic")[statements if condition1 is true]
    ),
    // elif line
    stack(dir: ltr, spacing: 0.3em,
      text(font: "Courier New", size: 0.9em, weight: "bold")[elif ],
      rect(stroke: 1.5pt + black, inset: 4pt)[
        #text(font: "Courier New", size: 0.9em, weight: "bold", fill: red, style: "italic")[condition2]
      ],
      text(font: "Courier New", size: 0.9em, weight: "bold")[:],
    ),
    pad(left: 2em,
      text(font: "Courier New", size: 0.9em, fill: blue, style: "italic")[statements if condition1 false AND condition2 true]
    ),
    // else line
    text(font: "Courier New", size: 0.9em, weight: "bold")[else:],
    pad(left: 2em,
      text(font: "Courier New", size: 0.9em, fill: rgb("#b06000"), style: "italic")[statements if both conditions are false]
    ),
  )
  #pause
  #note[
    You can have as many `elif` clauses as you need. Only the *first* matching branch executes — the rest are skipped.
  ]
]

#slide[
  Example using `if-elif-else`:
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #text(size: 0.75em)[```python
score = 65

if score >= 80:
    print("Grade: Distinction")
elif score >= 60:
    print("Grade: Merit")
elif score >= 40:
    print("Grade: Pass")
else:
    print("Grade: Fail")
```]
    ],
    uncover("2-")[
      #stack(
        spacing: 0.5em,
        [With `score = 65`, this outputs:],
        output-box[
          #text(font: "Courier New", size: 0.8em)[Grade: Merit]
        ],
        [Try changing `score` and observe which branch runs:],
        output-box[
          #text(size: 0.75em)[
            - score = 90 → *Distinction* \
            - score = 70 → *Merit* \
            - score = 45 → *Pass* \
            - score = 30 → *Fail*
          ]
        ]
      )
    ]
  )
]

= Logical Operators

#slide[
- Logical operators operate on Boolean values and produce a new Boolean value as a result.
#pause
- The three logical operators in Python are:

#align(center)[
  #table(
    columns: (auto, 2fr, 2fr),
    inset: 10pt,
    align: (center, left, left),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(240) } else { white },
    [*Operator*], [*Meaning*], [*Example*],
    [`and`], [True if *both* conditions are true], [`age >= 18 and score > 50`],
    [`or`],  [True if *at least one* condition is true], [`day == "Sat" or day == "Sun"`],
    [`not`], [Reverses the Boolean value], [`not is_raining`],
  )
]
]

== and operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`a  and  b`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 2 and row == 1 { rgb("#d4edda") }
          else if col == 2 { rgb("#f8d7da") }
          else { white },
        [*a*], [*b*], [*a and b*],
        [True],  [True],  [*True*],
        [False], [True],  [*False*],
        [True],  [False], [*False*],
        [False], [False], [*False*],
      )
    ],
    [
      #pause
      - Evaluates to *true* only if *both* a and b are true.
      - It is false in all other cases.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if age >= 18 and income >= 30000:
    print("Eligible for loan")
else:
    print("Not eligible")
```]
      ]
    ]
  )
]

== or operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`a  or  b`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 2 and row == 1 { rgb("#f8d7da") }
          else if col == 2 { rgb("#d4edda") }
          else { white },
        [*a*], [*b*], [*a or b*],
        [False], [False], [*False*],
        [False], [True],  [*True*],
        [True],  [False], [*True*],
        [True],  [True],  [*True*],
      )
    ],
    [
      #pause
      - Evaluates to *true* if either a, b, or both are true.
      - It is false only when *both* are false.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
day = "Saturday"

if day == "Saturday" or day == "Sunday":
    print("It is the weekend!")
else:
    print("It is a weekday.")
```]
      ]
    ]
  )
]

== not operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`not a`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 1 and row == 1 { rgb("#d4edda") }
          else if col == 1 { rgb("#f8d7da") }
          else { white },
        [*a*], [*not a*],
        [False], [*True*],
        [True],  [*False*],
      )
    ],
    [
      #pause
      - Reverses (negates) the Boolean value.
      - True becomes False, and False becomes True.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
is_raining = False

if not is_raining:
    print("Leave your umbrella at home.")
else:
    print("Don't forget your umbrella!")
```]
      ]
    ]
  )
]

== Logical Operators — Quiz

#slide[
  Given these variables:

  #align(center)[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 8pt)[
      #text(font: "Courier New", size: 1em)[
        a = 5 #h(2em) b = 10 #h(2em) c = 7
      ]
    ]
  ]

  #v(1em)
  What is the result of each Boolean expression?

  #table(
    columns: (auto, 2fr),
    inset: 10pt,
    align: (center, left),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(245) } else { white },
    [*Q*], [*Expression*],
    [Q1], [`(a > b) and (a < c)`],
    [Q2], [`(a < b) or (c < a)`],
    [Q3], [`not(b < a) and (c > b)`],
  )
]

#slide[
  Answers:

  #align(center)[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 8pt)[
      #text(font: "Courier New", size: 1em)[
        a = 5 #h(2em) b = 10 #h(2em) c = 7
      ]
    ]
  ]

  #v(0.5em)
  #table(
    columns: (auto, 2fr, auto),
    inset: 8pt,
    align: (center, left, center),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(245) } else { white },
    [*Q*], [*Evaluation*], [*Result*],
    [Q1],
    [`(5 > 10)` is *False*. `(5 < 7)` is *True*. So `False and True` evaluates to *False*.],
    [#text(fill: red, weight: "bold")[False]],

    [Q2],
    [`(5 < 10)` is *True*. With `or`, one true operand is enough — overall answer is *True*.],
    [#text(fill: green, weight: "bold")[True]],

    [Q3],
    [`not(10 < 5)` = `not(False)` = *True*. `(7 > 10)` is *False*. So `True and False` evaluates to *False*.],
    [#text(fill: red, weight: "bold")[False]],
  )
]

= Syntax Errors

#slide[
  As you write conditional statements, you will encounter Syntax Errors.  Here are some common ones to watch out for.

  #pause
  #note[
    *Learning tip:* Deliberately introduce these errors in VS Code, read the error message, and fix them. The more errors you encounter and fix, the faster you will recognise them in your own code.
  ]
]

== Splitting a long Boolean condition

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Problem* — splitting a long condition across lines:
      #v(0.5em)
      #error-box[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if age >= 18 and
   income >= 30000:
    print("Eligible")
```]
      ]
      #v(0.5em)
      #text(fill: red, size: 0.8em)[`SyntaxError: invalid syntax`]
    ],
    uncover("2-")[
      *Fix* — wrap the full condition in parentheses:
      #v(0.5em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if (age >= 18 and
    income >= 30000):
    print("Eligible")
```]
      ]
      #v(0.5em)
      #text(fill: green, size: 0.8em)[Parentheses allow the condition to span multiple lines. ✓]
    ]
  )
]

== Missing indentation

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Problem* — body of `if` not indented:
      #v(0.5em)
      #error-box[
        #text(size: 0.75em)[```python
age = 25
if age >= 18:
print("You are an adult.")
print("You can vote.")
```]
      ]
      #v(0.5em)
      #text(fill: red, size: 0.8em)[`IndentationError: expected an indented block`]
    ],
    uncover("2-")[
      *Fix* — indent the body consistently:
      #v(0.5em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
age = 25
if age >= 18:
    print("You are an adult.")
    print("You can vote.")
```]
      ]
      #v(0.5em)
      #text(fill: green, size: 0.8em)[Python uses indentation to define code blocks. ✓]
    ]
  )
]

== else with a condition

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Problem* — adding a condition to `else`:
      #v(0.5em)
      #error-box[
        #text(size: 0.75em)[```python
score = 65
if score >= 60:
    print("Pass")
else score < 60:
    print("Fail")
```]
      ]
      #v(0.5em)
      #text(fill: red, size: 0.8em)[`SyntaxError: invalid syntax`]
    ],
    uncover("2-")[
      *Fix* — use `elif` when you need a condition, or remove it from `else`:
      #v(0.5em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
score = 65
if score >= 60:
    print("Pass")
elif score < 60:    # elif has a condition
    print("Fail")

# OR simply:
if score >= 60:
    print("Pass")
else:               # else has no condition
    print("Fail")
```]
      ]
    ]
  )
]

== elif without a matching if

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Problem* — `elif` indented inside the `if` body:
      #v(0.5em)
      #error-box[
        #text(size: 0.75em)[```python
score = 65
if score >= 80:
    print("Distinction")
    elif score >= 60:
        print("Merit")
```]
      ]
      #v(0.5em)
      #text(fill: red, size: 0.8em)[`SyntaxError: invalid syntax`]
      #v(0.3em)
      #text(size: 0.8em)[`elif` must be at the *same* indentation level as its `if`.]
    ],
    uncover("2-")[
      *Fix* — align `elif` with `if`:
      #v(0.5em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
score = 65
if score >= 80:
    print("Distinction")
elif score >= 60:
    print("Merit")
elif score >= 40:
    print("Pass")
else:
    print("Fail")
```]
      ]
      #v(0.5em)
      #text(fill: green, size: 0.8em)[`if`, `elif`, and `else` must all share the same indentation level. ✓]
    ]
  )
]

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
