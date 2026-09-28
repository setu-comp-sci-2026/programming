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
    subtitle: [Introduction to Iteration],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#set page(
  background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo]
)

#title-slide()

#set page(background: none)


// ---------------------------------------------------------
// SLIDE 1
// ---------------------------------------------------------

#slide[
  = Where Are We Now?

  Over the last few weeks, we have been building up our Python toolkit.

  #pause

  We can now:

  - store information using *variables*
  - work with different *data types*
  - make decisions using *selection*
  - organise our code using *functions*

  #pause

  #note[
    We can already write programs that take input, make decisions
    and produce useful results.
  ]
]


// ---------------------------------------------------------
// SLIDE 2
// ---------------------------------------------------------

#slide[
  = Variables – Remember These?

  Variables allow us to *store information* while our program is running.

  ```python
  name = "Charlie"
  age = 4
  weight = 28.5
  vaccinated = True
  ```

  #pause

  Different values can have different *data types*.

  - `str`
  - `int`
  - `float`
  - `bool`

  #pause

  And variables can change:

  ```python
  age = age + 1
  ```
]


// ---------------------------------------------------------
// SLIDE 3
// ---------------------------------------------------------

#slide[
  = Selection – Making Decisions

  We then learned how our programs can make decisions.

  ```python
  if age < 1:
      print("Puppy")
  elif age < 8:
      print("Adult dog")
  else:
      print("Senior dog")
  ```

  #pause

  Selection asks a question:

  #align(center)[
    *Is this condition True or False?*
  ]

  #pause

  The answer determines which code runs.
]


// ---------------------------------------------------------
// SLIDE 4
// ---------------------------------------------------------

#slide[
  = Functions – Organising Our Code

  Functions allow us to give a piece of code a job.

  ```python
  def calculate_cost(days, daily_price):
      cost = days*daily_price
      return cost
  ```

  #pause

  ```python
  total = calculate_cost(3, 25.0)
  ```

  #pause

  Functions help us:

  - organise our program
  - avoid unnecessary repetition
  - reuse code
  - break a larger problem into smaller problems
]


// ---------------------------------------------------------
// SLIDE 5
// ---------------------------------------------------------

#slide[
  = We Can Already Do Quite A Lot

  Imagine a simple Dog Day Care program.

  ```python
  name = input("Dog's name: ")
  age = int(input("Dog's age: "))

  if age < 1:
      print(name, "is a puppy")
  else:
      print(name, "is not a puppy")
  ```

  #pause

  This program:

  - gets input
  - stores values
  - makes a decision
  - displays a result

  #pause

  *But what happens if we want to do it again?*
]


// ---------------------------------------------------------
// SLIDE 6
// ---------------------------------------------------------

#slide[
  = A New Problem...

  Suppose we want our program to print:

  ```text
  Welcome!
  Welcome!
  Welcome!
  Welcome!
  Welcome!
  ```

  #pause

  We _could_ write:

  ```python
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  print("Welcome!")
  ```

  #pause

  But what if we wanted it *100 times?*
]


// ---------------------------------------------------------
// SLIDE 7
// ---------------------------------------------------------

#slide[
  = Or Imagine This...

  ```python
  password = input("Enter password: ")

  if password == "python":
      print("Access granted")
  else:
      print("Incorrect password")
  ```

  #pause

  What happens if the password is wrong?

  #pause

  The program ends.

  #pause

  But what if we want to say:

  #note[
    Keep asking until the user enters the correct password.
  ]

  We need a way of *repeating code*.
]


// ---------------------------------------------------------
// SLIDE 8
// ---------------------------------------------------------

#slide[
  = Iteration

  *Iteration* means repeating a set of instructions.

  #pause

  We often call this a *loop*.

  #pause

  Instead of writing the same code again and again...

  ```python
  print("Hello")
  print("Hello")
  print("Hello")
  ```

  ...we can tell Python to repeat it for us.

  #pause

  #note[
    Iteration is the third major building block of programming.
  ]
]


// ---------------------------------------------------------
// SLIDE 9
// ---------------------------------------------------------

#slide[
  = Three Fundamental Ideas

  #align(center)[
    #text(size: 1.4em, weight: "bold")[
      Sequence → Selection → Iteration
    ]
  ]

  #pause

  *Sequence*

  Do instructions in order.

  #pause

  *Selection*

  Decide which instructions to perform.

  #pause

  *Iteration*

  Repeat instructions.

  #pause

  These three ideas appear in almost every program we write.
]


// ---------------------------------------------------------
// SLIDE 10
// ---------------------------------------------------------

#slide[
  = Think About Everyday Life

  We use repetition all the time.

  #pause

  *Brushing your teeth*

  Repeat brushing movements until enough time has passed.

  #pause

  *Washing dishes*

  While there are dirty dishes, wash another dish.

  #pause

  *Taking attendance*

  For each student, record whether they are present.

  #pause

  Programming works in much the same way.
]


// ---------------------------------------------------------
// SLIDE 11
// ---------------------------------------------------------

#slide[
  = Two Types of Loop

  In Python, we will look at two main ways of repeating code.

  #pause

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,

    [
      *`while` loop*

      Repeat while a condition is `True`.

      ```python
      while condition:
          repeat this
      ```
    ],

    [
      *`for` loop*

      Repeat for a collection or sequence of values.

      ```python
      for value in sequence:
          repeat this
      ```
    ]
  )
]


// ---------------------------------------------------------
// SLIDE 12
// ---------------------------------------------------------

#slide[
  = Which Loop?

  Don't worry about choosing between them yet.

  #pause

  A useful starting point is:

  #note[
    *while* → repeat while something is true

    *for* → repeat for a set of values
  ]

  #pause

  This week:

  - *Day 1:* `while` loops
  - *Day 2:* `for` loops
]


// ---------------------------------------------------------
// SLIDE 13
// ---------------------------------------------------------

#slide[
  = Our First `while` Loop

  ```python
  count = 1

  while count <= 5:
      print(count)
      count = count + 1
  ```

  #pause

  What do you think this program will display?

  #pause

  ```text
  1
  2
  3
  4
  5
  ```
]


// ---------------------------------------------------------
// SLIDE 14
// ---------------------------------------------------------

#slide[
  = Look Closely...

  ```python
  count = 1

  while count <= 5:
      print(count)
      count = count + 1
  ```

  We already understand nearly everything here!

  #pause

  ```python
  count = 1
  ```

  *Variable*

  #pause

  ```python
  count <= 5
  ```

  *Boolean condition*

  #pause

  ```python
  count = count + 1
  ```

  *Updating a variable*
]


// ---------------------------------------------------------
// SLIDE 15
// ---------------------------------------------------------

#slide[
  = The New Bit

  The only really new idea is:

  ```python
  while count <= 5:
  ```

  #pause

  Python checks the condition.

  If it is `True`:

  - run the indented code
  - go back
  - check the condition again

  #pause

  If it is `False`:

  - leave the loop
  - continue with the rest of the program
]


// ---------------------------------------------------------
// SLIDE 16
// ---------------------------------------------------------

#slide[
  = Trace It

  ```python
  count = 1

  while count <= 5:
      print(count)
      count = count + 1
  ```

  #pause

  #table(
    columns: (1fr, 1fr, 1fr),
    [*count*], [*count <= 5*], [*output*],
    [1], [`True`], [1],
    [2], [`True`], [2],
    [3], [`True`], [3],
    [4], [`True`], [4],
    [5], [`True`], [5],
    [6], [`False`], [Stop],
  )
]


// ---------------------------------------------------------
// SLIDE 17
// ---------------------------------------------------------

#slide[
  = What Could Possibly Go Wrong?

  Look carefully at this:

  ```python
  count = 1

  while count <= 5:
      print(count)
  ```

  #pause

  What will happen?

  #pause

  `count` starts at `1`.

  `count <= 5` is `True`.

  But...

  #pause

  *count never changes!*
]


// ---------------------------------------------------------
// SLIDE 18
// ---------------------------------------------------------

#slide[
  = Infinite Loops

  The previous program will keep printing:

  ```text
  1
  1
  1
  1
  1
  ...
  ```

  #pause

  This is called an *infinite loop*.

  #pause

  #note[
    When using a `while` loop, always ask:

    *What will eventually make my condition False?*
  ]
]


// ---------------------------------------------------------
// SLIDE 19
// ---------------------------------------------------------

#slide[
  = Bringing Our Skills Together

  Iteration doesn't replace anything we have learned.

  It works *with* it.

  #pause

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

  #pause

  Can you spot:

  - a variable?
  - selection?
  - a function?
  - a parameter?
  - a return value?
  - iteration?
]


// ---------------------------------------------------------
// SLIDE 20
// ---------------------------------------------------------

#slide[
  = Our Programming Toolkit

  We now have four very powerful tools.

  #pause

  #table(
    columns: (1fr, 2fr),
    [*Concept*], [*What does it let us do?*],
    [Variables], [Remember information],
    [Selection], [Make decisions],
    [Functions], [Organise and reuse code],
    [Iteration], [Repeat code],
  )

  #pause

  #note[
    The real power comes from combining them.
  ]
]


// ---------------------------------------------------------
// SLIDE 21
// ---------------------------------------------------------

#slide[
  = Today's Focus

  Today we are going to learn how to use `while` loops to:

  - repeat code while a condition is true
  - use a counter
  - update variables inside a loop
  - repeat user input
  - use selection inside a loop
  - avoid infinite loops
  - trace a loop by hand

  #pause

  By the end, you should be able to look at a `while` loop and
  explain *exactly why it stops*.
]

