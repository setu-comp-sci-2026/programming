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
 #text(size: 1.4em, fill:red, weight: "bold")[\= is an assignment operator and doesn’t test for equality. 
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

==if-else statement syntax

