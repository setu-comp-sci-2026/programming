#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
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
    subtitle: [Iteration – Quick Revision],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#set page(
  background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo]
)
#title-slide()
#set page(background: none)

#slide[
  == Before We Start `for` Loops...

  Last time we introduced *iteration* and worked with `while` loops.

  Before moving on, let's remind ourselves of the main ideas.

  #note[
    The important thing is not remembering code off by heart — it is understanding *how the loop works*.
  ]
]

#slide[
  == What Is Iteration?

  *Iteration* means repeating a set of instructions.

  We often call this a *loop*.

  ```python
  number = 1

  while number <= 5:
      print(number)
      number += 1
  ```

  #pause

  *Question:* Why is this better than writing five `print()` statements?
]

#slide[
  == Sequence, Selection and Iteration

  We now have three fundamental ways of controlling a program.

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      *Sequence*

      Do instructions in order.
    ],
    [
      *Selection*

      Choose what happens.
    ],
    [
      *Iteration*

      Repeat instructions.
    ],
  )

  #pause

  ```python
  if age >= 18:
      print("Adult")
  ```

  Which one is this?
]

#slide[
  == How Does a `while` Loop Work?

  A `while` loop repeats *while its condition is `True`*.

  ```python
  count = 1

  while count <= 5:
      print(count)
      count += 1
  ```

  There are four important parts:

  1. *Initialise* — `count = 1`
  2. *Test* — `count <= 5`
  4. *Repeat* — `print(count)`
  3. *Update* — `count += 1`
]

#slide[
  == Predict Before You Run

  What will this code display?

  ```python
  number = 2

  while number <= 10:
      print(number)
      number += 2
  ```

  #pause

  ```text
  2
  4
  6
  8
  10
  ```

  #note[
    Get into the habit of predicting what code will do *before* running it.
  ]
]

#slide[
  == Trace the Loop

  ```python
  x = 3

  while x <= 9:
      print(x)
      x += 3
  ```

  #table(
    columns: (1fr, 2fr, 1fr),
    [*x*], [*`x <= 9`*], [*Output*],
    [3], [True], [3],
    [6], [True], [6],
    [9], [True], [9],
    [12], [False], [-],
  )

  #note[
    Tracing helps us see how the value changes on every iteration.
  ]
]

#slide[
  == What Could Go Wrong?

  Look carefully at this code:

  ```python
  count = 1

  while count <= 5:
      print(count)
  ```

  #pause

  What is missing?

  #pause

  `count` never changes.

  The condition remains `True`, so the loop never ends.

  #align(center)[*This is an infinite loop.*]
]

#slide[
  == `while` Is Condition-Controlled

  A `while` loop is useful when repetition depends on a *condition*.

  ```python
  password = input("Password: ")

  while password != "python":
      print("Incorrect")
      password = input("Password: ")

  print("Access granted")
  ```

  We don't necessarily know beforehand how many attempts the user will need.

  #note[
    Keep going *while* something is true.
  ]
]

#slide[
  == Loops Can Use Selection

  A loop can contain an `if` statement.

  ```python
  number = 1

  while number <= 10:
      if number % 2 == 0:
          print(number, "is even")

      number += 1
  ```

  #pause

  The loop decides *how many times* we repeat.

  The `if` decides *what happens during each repetition*.
]

#slide[
  == Validation

  If we want to ensure a user enters a whole positive number

  ```python
    age_input = input("Enter your age: ")

    while not age_input.isdigit():
        print("Please enter a whole number.")
        age_input = input("Enter your age: ")

    age = int(age_input)

    print("Your age is", age)
  ```

]

#slide[
  == Bringing Everything Together

  ```python
  def count_up(limit):
      number = 1

      while number <= limit:
          if number % 2 == 0:
              print(number, "is even")
          else:
              print(number, "is odd")

          number += 1

  count_up(5)
  ```

  This uses:

  - a *function*
  - a *parameter*
  - a *variable*
  - *selection*
  - *iteration*

  #note[
    New programming concepts don't replace the old ones — we combine them.
  ]
]

#slide[
  == So Why Do We Need Another Loop?

  Suppose we want to do something for the numbers 1 to 5.

  We can write:

  ```python
  number = 1

  while number <= 5:
      print(number)
      number += 1
  ```

  It works — but we had to manage `number` ourselves.

  #pause

  What if Python could take care of moving through the values for us?

  #align(center)[
    #text(size: 1.35em, weight: "bold")[That's where the `for` loop comes in.]
  ]
]
