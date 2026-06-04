#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Variables, Data Types, and Arithmetic Operators],
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

= Variables 

In Programming, variables:

- are created (defined) in your programs.
#pause
- are used to store data (value can change over time).
#pause
- have a data type.
#pause
- have a name.
#pause
- are a VERY important programming concept

== Variable Names
#slide[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-1.png", width: 9cm)]
]][
  #pause
  …should be short and meaningful.
  num is better than n.
]


#slide[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-2.png", width: 9cm)]
]][
  #pause
   can contain 
    - letters(uppercase and lowercase), 
    - digits(0-9), and 
    - underscores (\_). 
]

#slide[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-3.png", width: 9cm)]
]][
  #pause
  - must start with a letter or an underscore.
  - should use camelCase when combining multiple words.
 
]


#slide[
#v(1fr)
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-4.png", width: 9cm)]
]
#v(1fr)
 #text(size: 10pt)[
  *Note* : This uses the 'run from Python REPL' feature in Visual Studio Code, which allows you to execute Python code directly from the editor and see the output in the integrated terminal.
]][
  #pause 
 #set list(spacing: 2em)
  - are CASE sensitive. 

]

#slide[
#v(1fr)
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-5.png", width: 9cm)]
]
#v(1fr)
 #text(size: 10pt)[
  *Note* : Again, this uses the 'run from Python REPL' feature in Visual Studio Code, which allows you to execute Python code directly from the editor and see the output in the integrated terminal.
]][
  #pause
  #set list(spacing: 1.5em)
  #v(1fr)
  - are CASE sensitive. 
  - num and NUM are different variables.
  #v(1fr)
]

#slide[
#v(1fr)
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-6.png", width: 9cm)]
]
#v(1fr)
 #text(size: 10pt)[
  *Note* : This uses the 'right-click and run' feature in Visual Studio Code, which allows you to execute Python code directly from the editor and see the output in the integrated terminal.
]][
    #pause
  #set list(spacing: 1.5em)
  #v(1fr)
  - cannot be a keyword/reserved word
  #v(1fr)
]

#slide[
#v(1fr)
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-7.png", width: 9cm)]
]
#v(1fr)
 #text(size: 10pt)[
  *Note* : This uses the 'right-click and run' feature in Visual Studio Code, which allows you to execute Python code directly from the editor and see the output in the integrated terminal.
]][
  #pause
  #set list(spacing: 1.5em)
  #v(1fr)
  - cannot contain spaces or special characters (except underscores)
  #v(1fr)
]

#slide[
#v(1fr)
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
    #align(center)[#image("assets/python-8.png", width: 9cm)]
]
#v(1fr)
 #text(size: 10pt)[
  *Note* : This uses the 'right-click and run' feature in Visual Studio Code, which allows you to execute Python code directly from the editor and see the output in the integrated terminal.
]][
  #pause  
  #set list(spacing: 1.5em)
  #v(1fr)
  - must start with a letter or an underscore
  #v(1fr)
]

== Variable Assignment

- In Python, you create a variable by assigning a value to it using the assignment operator `=`. The syntax for variable assignment is:
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
```python
variable_name = value
```
 ]]
 #pause
For example, to create a variable named `num` and assign it the value `10`, you would write:
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
```python
num = 10
```]]
#pause
- A variable stores a single value, so any previous value is lost.
#pause
- Assignment statements work by taking the value of what appears on the right-hand side of the operator and copying that value into a variable on the left-hand side.

= Data Types

- A data type is a classification that specifies which type of value a variable can hold and what operations can be performed on it.

== Variables and Data Types
#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-9.png", width: 9cm)]
    ]][
  #pause
Each python variable has:
- name of variable 
#pause
- value of variable 
#pause
- type of variable
#pause
- address (in memory) of variable. 
]

== Data Types in Python

The data type defines the kinds of values (data) that can be stored in the variable e.g. 
#pad(left: 4em)[
  #set list(spacing: 1em)
- \- 456
- 2
- 45.7897
- I Love Programming
- S
- True
-  A, B, C, D, E, F, G
]
#pause
The data type determines the operations that may be performed on it.

#slide[

Python has 4 Primitive Data Types:
#pause
#pad(left: 4em)[
  #set list(spacing: 1em)
-  Integer
#pause
-  Float
#pause
-  String
#pause
-  Boolean
]
]
== Data Types: Integer (int)

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-10.png", width: 9cm)]
    ]][
  #pause
- An #text(fill:red)[Integer] is a whole number that can hold negative numbers, positive numbers and zero.
- the type of these variables is determined by the value assigned to them, i.e. a whole number -> #text(fill:red)[Integer]
]

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-11.png", width: 9cm)]
    ]][
  #pause
- We can check that  the variables are #text(fill:red)[Integer (int)] by asking python to check the type of the variable using the built-in `type()` function.
- we will cover later what each part of this code is doing; you can ignore it for the moment!
]

== Data Types: Float (float)

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-12.png", width: 9cm)]
    ]][
  #pause
- An #text(fill:red)[Float] is a floating decimal point number that can hold negative numbers, positive numbers and zero.
#pause
- We can check that  the variables are #text(fill:red)[Float (float)] by asking python to check the type of the variable using the built-in `type()` function.
#pause
- As an exercise, check what the output of this code is.
]

== Data Types: String (str)

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-13.png", width: 9cm)]
    ]][
  #pause
- A #text(fill:red)[String] is a sequence of characters that can hold text.
#pause
- They are created by enclosing characters in quotes (single or double).

]

== Data Types: Boolean (bool)

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-14.png", width: 9cm)]
    ]][
  #pause
- A #text(fill:red)[Boolean] is a data type that can only have two values: True or False.
#pause
- Booleans are often used in programming to represent the truth value of a condition or to control the flow of a program based on certain conditions.

]

== Change a Variable's Data Type
#slide[
  #grid(
    columns: (1fr, 2fr),
    column-gutter: .5em,
  [
- In Python, you can change the data type of a variable by assigning a new value of a different type to it. For example:
],
[
  #pause
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
```python
num = 10          # num is an integer   
print(type(num))  # Output: <class 'int'>
num = 3.14        # num is now a float
print(type(num))  # Output: <class 'float'>
num = "Hello"     # num is now a string
print(type(num))  # Output: <class 'str'>
```
   ]
  ]
  ]
)
]

== Assigning multiple values to multiple variables

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-15.png", width: 9cm)]
    ]][
  #pause
- Here we have defined three variables each with a starting value. We can change the value of each variable separately by assigning a new value to it.
#pause
- The variables can be of different data types, and we can check the type of each variable using the `type()` function.
#pause
- As an exercise, print out the type of each variable, then change the value of one of the variables (using a different data type) and check using the `type()` function.

]

#slide[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
      #align(center)[#image("assets/python-16.png", width: 9cm)]
    ]][
  #pause
- Here we have defined three variables each with a starting value of 1. 

]

= Arithmetic Operators

#slide[

- Arithmetic operators are symbols that perform mathematical operations on numbers.
#pause
- The basic arithmetic operators in Python are:

  #table(
    columns: (1fr, 2fr, 2fr),
    inset: 8pt,
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#c0392b") } else if calc.odd(row) { rgb("#d6dce4") } else { rgb("#e8edf2") },
    text(fill: white, weight: "bold")[Arithmetic Operator],
    text(fill: white, weight: "bold")[Explanation],
    text(fill: white, weight: "bold")[Example(s)],
    [*+*], [Addition], [6 + 2 \ diameter + 10],
    [*-*], [Subtraction], [6 -- 2 \ diameter -- 10],
    [*\**], [Multiplication], [6 \* 2 \ diameter \* 10],
    [*\/*], [Division], [6 / 2 \ diameter / 10],
  )

]

  == Modulo Operator
  - The modulo operator `%` returns the remainder of a division operation.
  #pause
  - For example, `7 % 3` would return `1` because when you divide 7 by 3, the quotient is 2 with a remainder of 1.
  #pause
  - The modulo operator is often used to determine if a number is even or odd, or to cycle through a sequence of values.


== Assignment with Arithmetic Operators
- In Python, you can use assignment operators to perform an arithmetic operation and assign the result back to the same variable. For example:
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 4pt)[
```python
num = 10
num = num + 5  # takes the current value of num (10), adds 5 to it, and assigns the result (15) back to num
print(num)  # Output: 15
num = num - 3  # takes the current value of num (15), subtracts 3 from it, and assigns the result (12) back to num
print(num)  # Output: 12
num = num * 2  # takes the current value of num (12), multiplies it by 2, and assigns the result (24) back to num
print(num)  # Output: 24
num = num / 4  # takes the current value of num (24), divides it by 4, and assigns the result (6.0) back to num
print(num)  # Output: 6.0
```]]

== Shortcuts for Assignment with Arithmetic Operators

- Python provides shortcuts for assignment with arithmetic operators, which allow you to perform the operation and assignment in a single step. For example:
#pause
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 4pt)[
```python
num = 10
num += 5  # equivalent to num = num + 5
print(num)  # Output: 15
num -= 3  # equivalent to num = num - 3
print(num)  # Output: 12
num *= 2  # equivalent to num = num * 2
print(num)  # Output: 24
num /= 4  # equivalent to num = num / 4
print(num)  # Output: 6.0
```]] 

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
