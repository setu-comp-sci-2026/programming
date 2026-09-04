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
    subtitle: [Abstract Classes],
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

= The `abc` Module

```python
from abc import ABC, abstractmethod
```

- `ABC` — Abstract Base Class. Inherit from it to make a class abstract.
- `@abstractmethod` — decorator that marks a method as *must-override*

A class with *any* `@abstractmethod` cannot be instantiated.

= Abstract Shape Class

```python
from abc import ABC, abstractmethod
import math

class Shape(ABC):

    @abstractmethod
    def area(self) -> float:
        """Return the area of this shape."""
        pass

    @abstractmethod
    def perimeter(self) -> float:
        """Return the perimeter of this shape."""
        pass

    def describe(self) -> str:
        return (f"{type(self).__name__}: "
                f"area={self.area():.2f}, "
                f"perimeter={self.perimeter():.2f}")
```

= Concrete Subclasses

```python
class Circle(Shape):
    def __init__(self, radius: float):
        self.__r = radius

    def area(self) -> float:
        return math.pi * self.__r ** 2

    def perimeter(self) -> float:
        return 2 * math.pi * self.__r

class Rectangle(Shape):
    def __init__(self, w: float, h: float):
        self.__w = w
        self.__h = h

    def area(self) -> float:
        return self.__w * self.__h

    def perimeter(self) -> float:
        return 2 * (self.__w + self.__h)
```

= Cannot Instantiate Abstract Class

```python
# s = Shape()   ← TypeError!
# TypeError: Can't instantiate abstract class Shape
# with abstract methods area, perimeter

c = Circle(5)       # fine — implements both abstract methods
r = Rectangle(4, 6) # fine
```

If a subclass *forgets* to implement an abstract method:

```python
class BadShape(Shape):
    def area(self):   # only implements one
        return 0.0
    # forgot perimeter() !

b = BadShape()
# TypeError: Can't instantiate abstract class BadShape
# with abstract method perimeter
```

= Concrete Method in Abstract Class

Abstract classes *can* have concrete methods:

```python
class Shape(ABC):
    @abstractmethod
    def area(self) -> float: pass

    @abstractmethod
    def perimeter(self) -> float: pass

    # Concrete — available to ALL subclasses
    def describe(self) -> str:
        return (f"{type(self).__name__}: "
                f"area={self.area():.2f}")

    def is_larger_than(self, other: "Shape") -> bool:
        return self.area() > other.area()
```

= Using Abstract Classes Polymorphically

```python
shapes: list[Shape] = [
    Circle(5),
    Rectangle(4, 6),
    Circle(3),
    Rectangle(10, 2),
]

# All are Shapes — can call area() and perimeter() safely
for shape in shapes:
    print(shape.describe())

total = sum(s.area() for s in shapes)
print(f"\nTotal area: {total:.2f}")

largest = max(shapes, key=lambda s: s.area())
print(f"Largest: {largest.describe()}")
```

= Abstract Classes vs Regular Classes

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Abstract Class*], [*Regular Class*],
  [Cannot be instantiated], [Can be instantiated],
  [Forces subclasses to implement methods], [No enforcement],
  [Defines an interface/contract], [Defines concrete behaviour],
  [Inherits from `ABC`], [Inherits from `object`],
  [Has `@abstractmethod` methods], [All methods have implementations],
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
