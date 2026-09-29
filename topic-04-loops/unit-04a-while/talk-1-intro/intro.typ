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
    subtitle: [Introduction to Iteration],
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
  == Where Are We Now?

  Over the last few weeks, we have been building our Python toolkit.

  We can now:

  - store information using *variables*
  - work with different *data types*
  - make decisions using *selection*
  - organise our code using *functions*

  #note[
    We can already write programs that take input, make decisions and produce useful results.
  ]
]

#slide[
  == Variables and Data Types

  Variables allow us to store information while our program is running.

  ```python
  name = "Charlie"
  age = 4
  weight = 28.5
  vaccinated = True
  ```

  We have used different data types:

  - `str`
  - `int`
  - `float`
  - `bool`

  And variables can change:

  ```python
  age = age + 1
  ```
]

#slide[
  == Selection – Making Decisions

  We learned how our programs can make decisions.

  ```python
  if age < 1:
      print("Puppy")
  elif age < 8:
      print("Adult dog")
  else:
      print("Senior dog")
  ```

  Selection asks a question:

  #align(center)[*Is this condition True or False?*]

  The answer determines which code runs.
]

#slide[
  == Functions – Organising Our Code

  Functions allow us to give a piece of code a job.

  ```python
  def calculate_cost(days, daily_price):
      cost = days * daily_price
      return cost
  ```

  ```python
  total = calculate_cost(3, 25.0)
  ```

  Functions help us organise and reuse code, and break a larger problem into smaller problems.
]

#slide[
  == We Can Already Do Quite a Lot

  ```python
  name = input("Dog's name: ")
  age = int(input("Dog's age: "))

  if age < 1:
      print(name, "is a puppy")
  else:
      print(name, "is not a puppy")
  ```

  This program:

  - gets input
  - stores values
  - makes a decision
  - displays a result

  #note[*But what happens if we want to do it again?*]
]

#slide[
  == A New Problem

  Suppose we want our program to print `Welcome!` five times.

  ```python
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  ```

  This works — but what if we wanted it *100 times?*

  What if we didn't know in advance how many times we needed to repeat something?
]

#slide[
  == Another Problem

  ```python
  password = input("Enter password: ")

  if password == "python":
      print("Access granted")
  else:
      print("Incorrect password")
  ```

  If the password is wrong, the program ends.

  #note[
    What if we want to keep asking until the user enters the correct password?
  ]

  We need a way of *repeating code*.
]

#slide[
  == Iteration

  *Iteration* means repeating a set of instructions.

  We often call this a *loop*.

  Instead of writing the same code again and again, we tell Python to repeat it for us.

  #note[
    Iteration is one of the fundamental building blocks of programming.
  ]
]

#slide[
  == Three Fundamental Ideas

  #align(center)[
    #text(size: 1.4em, weight: "bold")[Sequence → Selection → Iteration]
  ]

  *Sequence* — do instructions in order.

  *Selection* — decide which instructions to perform.

  *Iteration* — repeat instructions.

  These ideas appear again and again in the programs we write.
]

#slide[
  == Iteration in Everyday Life

  We use repetition all the time.

  *Brushing your teeth*

  Repeat brushing movements until enough time has passed.

  *Washing dishes*

  While there are dirty dishes, wash another dish.

  *Taking attendance*

  For each student, record whether they are present.

  Programming works in much the same way.
]

#slide[
  == Two Types of Loop

  In Python, we will look at two main ways of repeating code.

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      *`while` loop*

      Repeat while a condition is `True`.

      ```python
      while condition:
          # repeat this
      ```
    ],
    [
      *`for` loop*

      Repeat for a sequence of values.

      ```python
      for value in sequence:
          # repeat this
      ```
    ],
  )

  This session: *`while`*   |   Next session: *`for`*
]

#slide[
  == Our First `while` Loop

  ```python
  count = 1

  while count <= 5:
      print(count)
      count = count + 1
  ```

  What do you think this program will display?


]

#slide[
  == We Already Know Most of This

  ```python
  count = 1

  while count <= 5:
      print(count)
      count = count + 1
  ```

  `count = 1` → *variable*

  `count <= 5` → *Boolean condition*

  `count = count + 1` → *update a variable*

  #note[
    The new idea is that Python keeps checking the condition and repeating the indented code while it remains `True`.
  ]
]


#slide[
  == Bringing Our Skills Together

  ```python
  def check_age(age):
      if age >= 18:
          return "Adult"
      else:
          return "Under 18"

  again = "yes"

  while again == "yes":
      age = int(input("Enter age: "))
      print(check_age(age))
      again = input("Go again? yes/no: ")
  ```

  Can you spot the variables, selection, function, parameter, return value and iteration?
]

#slide[
  == Our Programming Toolkit

  #table(
    columns: (1fr, 2fr),
    [*Concept*], [*What does it let us do?*],
    [Variables], [Remember information],
    [Selection], [Make decisions],
    [Functions], [Organise and reuse code],
    [Iteration], [Repeat code],
  )

  #note[
    The real power comes from combining them.
  ]
]

#slide[
  == Today's Focus – `while`

  Today we are going to learn how to:

  - repeat code while a condition is `True`
  - use a counter
  - update variables inside a loop
  - repeat user input
  - combine selection and iteration
  - avoid infinite loops
  - trace a loop by hand

  #note[
    By the end, you should be able to look at a `while` loop and explain exactly why it repeats and why it stops.
  ]
]
