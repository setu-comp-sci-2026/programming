#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *
#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Introduction to Loops],
    subtitle: [Understanding Iteration using Flowcharts],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set text(size: 22pt)

#let teal = rgb("#20B2AA")
#let blue = rgb("#287bd3")
#let red = rgb("#E63946")
#let pale = rgb("#eef9f8")

#let process(body) = rect(fill: teal, radius: 6pt, inset: .65em, width: 55%)[#align(center)[#text(fill: white, weight: "bold", size: 17pt)[#body]]]
#let smallprocess(body) = rect(fill: teal, radius: 6pt, inset: .55em, width: 90%)[#align(center)[#text(fill: white, weight: "bold", size: 15pt)[#body]]]
#let decision(body) = rect(fill: blue, radius: 6pt, inset: .65em, width: 48%)[#align(center)[#text(fill: white, weight: "bold", size: 17pt)[#body]]]
#let stopbox(body) = rect(fill: red, radius: 6pt, inset: .65em, width: 45%)[#align(center)[#text(fill: white, weight: "bold", size: 17pt)[#body]]]
#let arrow = align(center)[#text(size: 30pt)[↓]]
#let split-arrows = grid(columns: (1fr, 1fr), align: center, [#text(size: 30pt)[↙ Yes]], [#text(size: 30pt)[No ↘]])

#title-slide()
#outline-slide()

= Why do we need loops?
== What if we needed to repeat this?

#grid(columns: (1.1fr, .9fr), gutter: 1em)[
[
Without loops, repeated tasks quickly become messy:

```python
print("Welcome")
print("Welcome")
print("Welcome")
print("Welcome")
```

A loop lets us write the repeated instruction once.
],
#rect(fill: pale, inset: 1em, radius: 8pt)[
*Key idea*

Computers are very good at repetition.
]
]

== Everyday repetition

- Checking each student's mark
- Taking orders until the queue is empty
- Asking for a password until it is correct
- Displaying a menu until the user chooses Exit
- Reading temperatures from a sensor

#v(1em)
#rect(fill: blue, inset: 1em, radius: 8pt)[#text(fill: white, weight: "bold")[Loops are used when a set of instructions must be repeated.]]

== What is iteration?

#rect(fill: teal, inset: 1.2em, radius: 8pt)[
#set text(fill: white, size: 30pt, weight: "bold")
Iteration means repeating a set of instructions until a condition is met.
]

#v(1em)
Examples:
- Continue asking until the input is valid.
- Continue counting until the target is reached.
- Continue processing until there is no more data.

= Selection versus Iteration
== Selection asks once
#align(center)[
  #image("assets/selection.png", height: 80%)
]


== Iteration asks repeatedly
#align(center)[
  #image("assets/loop.png", height: 80%)
]
== The key difference

#grid(columns: (1fr, 1fr), gutter: 1em)[
#rect(fill: pale, inset: 1em, radius: 8pt)[
*Selection*

- Condition checked once
- One path is chosen
- Program continues
]
#rect(fill: pale, inset: 1em, radius: 8pt)[
*Iteration*

- Condition checked repeatedly
- Instructions may run many times
- Stops when condition becomes false
]
]

= Anatomy of a loop
== Every loop needs four things

#align(center)[
  #image("assets/everyloop.png", height: 80%)
]

== Counting to five: flowchart

#align(center)[
  #image("assets/count5loop.png", height: 80%)
]

== Trace the loop

#table(
  columns: (1fr, 1fr, 1fr),
  inset: .6em,
  align: center,
  [*count*], [*Condition*], [*Output*],
  [1], [`1 <= 5` is True], [1],
  [2], [`2 <= 5` is True], [2],
  [3], [`3 <= 5` is True], [3],
  [4], [`4 <= 5` is True], [4],
  [5], [`5 <= 5` is True], [5],
  [6], [`6 <= 5` is False], [Stop],
)

== Why does the loop stop?

The loop stops because the value changes.

#rect(fill: pale, inset: 1em, radius: 8pt)[
`count` eventually becomes 6.

The condition `count <= 5` becomes false.
]

#v(1em)
*Important:* a loop normally needs something inside it that moves it closer to stopping.

= Infinite loops
== What if we forget the update?

#align(center)[
  #image("assets/infinite.png", height: 80%)
]
== Infinite loop in code

```python
count = 1

while count <= 5:
    print(count)
```

#v(1em)
Problem: `count += 1` is missing.

= Useful loop patterns
== Validation loop
#align(center)[
  #text(size: 24pt, weight: "bold")[
    Use a loop when the user must enter valid data.
  ]

  #v(0.5em)

  #image("assets/mark.png", height: 80%)
]

== Sentinel loop

#align(center)[
  #image("assets/sentinel.png", height: 80%)
]

== Menu loop

#align(center)[
  #image("assets/menuchoice.png", height: 80%)
]

= Activities
== Activity: find the four parts

For each flowchart, identify:

1. Starting value
2. Condition
3. Repeated action
4. Update or stopping action

#v(1em)
#rect(fill: teal, inset: 1em, radius: 8pt)[#text(fill: white, weight: "bold")[This prepares you to write the Python version in the next lecture.]]

== Predict the output

Flowchart summary:

- Set `count = 1`
- While `count <= 3`
- Print `"SETU"`
- Add 1 to `count`

#v(1em)
*Question:* what is printed?

== Summary

- Iteration means repetition.
- Flowcharts help us plan loops before writing code.
- Selection asks once; iteration asks repeatedly.
- Every loop needs a condition and a way to stop.
- Missing updates can cause infinite loops.

#v(1em)
*Next:* implementing these ideas in Python using `while` loops.
