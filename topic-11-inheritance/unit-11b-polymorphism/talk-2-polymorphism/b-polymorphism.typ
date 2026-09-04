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
    subtitle: [Polymorphism],
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

= What is Polymorphism?

== Many forms, one interface

*Poly* = many, *morph* = form.

Polymorphism lets objects of *different types* respond to the *same method call* in their own way.

```python
for user in users:
    print(user)     # calls __str__ — different output per type
```

- `FreeUser.__str__` produces: `"FreeUser: Alice (max 10 posts)"`
- `PremiumMember.__str__` produces: `"PremiumMember: Bob [Gold]"`

Same call (`print`), different behaviour — that is polymorphism.

= Method Overriding

== The mechanism behind polymorphism

```python
class Shape:
    def area(self) -> float:
        return 0.0
    def describe(self) -> str:
        return f"I am a shape with area {self.area():.2f}"

class Circle(Shape):
    def __init__(self, radius: float):
        self.__radius = radius
    def area(self) -> float:
        import math
        return math.pi * self.__radius ** 2

class Rectangle(Shape):
    def __init__(self, w: float, h: float):
        self.__w = w; self.__h = h
    def area(self) -> float:
        return self.__w * self.__h
```

= Polymorphic Behaviour

```python
shapes = [
    Circle(5),
    Rectangle(4, 6),
    Circle(3),
    Rectangle(2, 8),
]

# All are Shapes — each calls its own area()
for shape in shapes:
    print(shape.describe())

# Output:
# I am a shape with area 78.54
# I am a shape with area 24.00
# I am a shape with area 28.27
# I am a shape with area 16.00

total = sum(s.area() for s in shapes)
print(f"Total area: {total:.2f}")
```

= Duck Typing

== Python's informal polymorphism

*"If it walks like a duck and quacks like a duck, it's a duck."*

In Python, you don't need formal inheritance for polymorphism — you just need the right method:

```python
class Dog:
    def speak(self): return "Woof!"

class Cat:
    def speak(self): return "Meow!"

class Robot:
    def speak(self): return "Beep boop."

animals = [Dog(), Cat(), Robot()]   # No common parent!
for a in animals:
    print(a.speak())   # works because all have speak()
```

= Duck Typing in Practice

```python
def total_area(shapes: list) -> float:
    """Works for any object with an area() method."""
    return sum(s.area() for s in shapes)

# All of these work — no formal parent class needed
class Triangle:
    def __init__(self, base, height):
        self.__b = base; self.__h = height
    def area(self) -> float:
        return 0.5 * self.__b * self.__h

shapes = [Circle(5), Rectangle(4, 6), Triangle(3, 8)]
print(f"Total: {total_area(shapes):.2f}")
```

= Polymorphism Summary

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Concept*], [*Description*],
  [Polymorphism], [Same call, different behaviour per type],
  [Method overriding], [Child class redefines a parent method],
  [Duck typing], [Any object with the right method works],
  [`isinstance()`], [Check if an object is a specific type],
)
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
