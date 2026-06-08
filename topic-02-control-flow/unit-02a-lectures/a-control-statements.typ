#import "@preview/touying:0.7.3": *


#import themes.stargazer: *
#import "@preview/cetz:0.5.0": canvas, draw

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

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
= Conditional Statement - if statement
== if statement syntax

#slide[




  #v(.1em)
  #text(font: "Courier New", size: 1.4em, weight: "bold")[if ] 
  #rect(stroke: 1.5pt + black, inset: 6pt)[
    #text(font: "Courier New", size: 1.4em, weight: "bold", fill: red, style: "italic")[perform some #text(fill: red)[_boolean_] test : ]
  ]
  #text(font: "Courier New", size: 1.4em, weight: "bold")[:]

  #v(0.5em)
  #pad(left: 2em)[
    #text(font: "Courier New", size: 1.4em, weight: "bold", fill: green, style: "italic")[Do these statement(s) if the test is true]
  ]
  #pause
    #place(top + center, dy: 2em)[
    #text(fill: rgb("#8B4513"))[_boolean_ condition to be tested]
  ]

  #place(top + center, dy: 3.5em)[
    #canvas({
      draw.line((-2, 0), (-6, -2), mark: (end: ">", size: 0.5em ))
    })
  ]

   #pause
    #place(top + left, dy: 1em)[
    #text(fill: rgb("#8B4513"))['if' keyword]
    ]

  #place(top + left, dy: 2em)[
    #canvas({
      draw.line((4,3), (4, 1.8), mark: (end: ">", size: 2em ))
    })
  ]
    ]


