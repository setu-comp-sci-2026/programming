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
    subtitle: [Strings and Slicing],
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

= Strings Are Sequences

A string is a sequence of characters.

```python
course = "Python"

print(course[0])
print(course[1])
print(course[-1])
```

#pause

Output:

```text
P
y
n
```

= Slicing Lists

Slicing extracts part of a list.

```python
numbers = [10, 20, 30, 40, 50, 60]

print(numbers[0:3]) #[10, 20, 30]
print(numbers[:3]) #[10, 20, 30]
print(numbers[3:]) #[40, 50, 60]
print(numbers[-2:])#[50, 60]
```

#pause

Remember: the stop position is not included.

= Slicing Strings

The same idea works with strings.

```python
word = "Programming"

print(word[:4]) #Prog
print(word[4:]) #ramming
print(word[-3:]) #ing
print(word[::-1]) #gnimmargorP
```

#pause

Useful for:

- extracting initials
- checking prefixes
- reversing text
- splitting codes or identifiers

= String Methods

```python
name = "  siobhan roche  "

print(name.strip()) #siobhan roche
print(name.upper()) #  SIOBHAN ROCHE 
print(name.title()) #  Siobhan Roche 
print(name.replace("roche", "Roche")) #  siobhan Roche  
```

#pause

String methods return a new string.

They do not change the original string in place.

= Splitting and Joining

```python
sentence = "Python is fun"
words = sentence.split()
print(words)
```

#pause

```python
words = ["Python", "is", "fun"]
sentence = " ".join(words)
print(sentence)
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
