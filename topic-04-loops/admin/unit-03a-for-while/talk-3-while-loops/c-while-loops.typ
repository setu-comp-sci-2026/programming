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
    subtitle: [While Loops],
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

= What is a While Loop?

A *while loop* repeats a block of code *as long as* a condition remains `True`.

#pause

Use a while loop when:
- You don't know in advance how many times to repeat
- You want to keep asking for input until valid
- You want to retry something until it succeeds

#pause

#table(
  columns: (1fr, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#e9d5ff") } else { white },
  [*while loop*], [*for loop*],
  [Condition-driven], [Collection/range-driven],
  [Unknown iterations], [Known iterations],
  [Risk of infinite loop], [Always terminates (usually)],
)

= While Loop Syntax

```python
while condition:
    # body — executed while condition is True
    # must eventually make condition False!
```

#pause

*Simple example — countdown:*

```python
count = 5

while count > 0:
    print(count)
    count -= 1      # IMPORTANT: update the variable!

print("Blast off!")
```

Output:
```
5
4
3
2
1
Blast off!
```

= Example — Countdown Timer

Let's trace through the execution step by step:

```python
count = 3

while count > 0:        # check: is 3 > 0? Yes → enter loop
    print(count)        # prints 3
    count -= 1          # count is now 2

                        # check: is 2 > 0? Yes → enter loop
                        # prints 2, count becomes 1

                        # check: is 1 > 0? Yes → enter loop
                        # prints 1, count becomes 0

                        # check: is 0 > 0? No → exit loop
print("Done!")
```

#pause

*Key rule:* the loop body must always eventually make the condition `False` — otherwise you get an *infinite loop*.

= Infinite Loops

An *infinite loop* runs forever because the condition never becomes `False`.

```python
# DANGER — infinite loop!
x = 1
while x > 0:
    print(x)
    x += 1      # x keeps growing, never reaches 0
```

#pause

*How to stop an infinite loop:* press `Ctrl+C` in the terminal.

#pause

*Intentional* infinite loops use `break` to exit:

```python
while True:             # deliberately infinite
    user_input = input("Enter 'quit' to stop: ")
    if user_input == "quit":
        break           # exit the loop
    print(f"You said: {user_input}")

print("Goodbye!")
```

= Break and Continue

*`break`* — immediately exits the loop:

```python
number = 1
while number <= 100:
    if number % 7 == 0:
        print(f"First multiple of 7: {number}")
        break           # stop as soon as we find it
    number += 1
```

#pause

*`continue`* — skips the rest of this iteration, goes back to the condition check:

```python
number = 0
while number < 10:
    number += 1
    if number % 2 == 0:
        continue        # skip even numbers
    print(number)       # prints 1, 3, 5, 7, 9
```

= The Do-While Pattern in Python

Python has no `do...while` statement, but we can simulate it:

```python
# do...while equivalent — always runs at least once
while True:
    age = int(input("Enter your age: "))
    if age >= 0:
        break
    print("Age cannot be negative. Try again.")

print(f"Your age is {age}")
```

#pause

*Input validation pattern* — very common in real programs:

```python
while True:
    choice = input("Enter Y or N: ").upper()
    if choice in ["Y", "N"]:
        break
    print("Invalid choice. Please enter Y or N.")

if choice == "Y":
    print("You said yes!")
else:
    print("You said no!")
```

= Accumulation with While Loops

```python
# Sum numbers entered by user until they type 0
total = 0
count = 0

print("Enter numbers to sum (0 to finish):")

while True:
    num = float(input("Number: "))
    if num == 0:
        break
    total += num
    count += 1

if count > 0:
    average = total / count
    print(f"Sum: {total}")
    print(f"Count: {count}")
    print(f"Average: {average:.2f}")
else:
    print("No numbers entered.")
```

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