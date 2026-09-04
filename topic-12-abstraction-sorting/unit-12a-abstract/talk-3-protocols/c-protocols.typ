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
    subtitle: [Protocols and Structural Typing],
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

= Two Kinds of Typing

== Nominal vs Structural

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Nominal typing (ABC)*], [*Structural typing (Protocol)*],
  [Must explicitly inherit from ABC], [No inheritance needed],
  [`isinstance()` checks class hierarchy], [`isinstance()` checks structure (if `@runtime_checkable`)],
  [Formal, rigid], [Flexible, duck-typing friendly],
)

= Defining a Protocol

```python
from typing import Protocol

class Drawable(Protocol):
    def draw(self) -> str:
        ...   # body is "..." — not implemented

class Circle:
    def draw(self) -> str:
        return "Drawing circle ○"

class Square:
    def draw(self) -> str:
        return "Drawing square □"

# Neither inherits from Drawable!
def render(item: Drawable) -> None:
    print(item.draw())

render(Circle())   # works ✓
render(Square())   # works ✓
```

= Protocol vs ABC

```python
# ABC approach — must inherit
from abc import ABC, abstractmethod

class Drawable(ABC):
    @abstractmethod
    def draw(self): pass

class Circle(Drawable):   # must say "(Drawable)"
    def draw(self): return "○"


# Protocol approach — no inheritance needed
from typing import Protocol

class Drawable(Protocol):
    def draw(self) -> str: ...

class Circle:             # no mention of Drawable
    def draw(self): return "○"
```

Both work for type checking — Protocols are more flexible.

= `@runtime_checkable`

```python
from typing import Protocol, runtime_checkable

@runtime_checkable
class Drawable(Protocol):
    def draw(self) -> str: ...

class Circle:
    def draw(self) -> str: return "○"

class Triangle:
    pass   # no draw()

c = Circle()
t = Triangle()

isinstance(c, Drawable)   # True  ← has draw()
isinstance(t, Drawable)   # False ← missing draw()
```

Without `@runtime_checkable`, `isinstance` raises `TypeError`.

= Practical Protocol Example

```python
from typing import Protocol

class Serialisable(Protocol):
    def to_dict(self) -> dict: ...
    def from_dict(cls, d: dict) -> "Serialisable": ...

# Any class with these methods is automatically Serialisable
# — Product already qualifies if it has to_dict() and from_dict()!

def save_all(items: list[Serialisable], filename: str):
    import json
    data = [item.to_dict() for item in items]
    with open(filename, "w") as f:
        json.dump(data, f, indent=2)
```

= When to Use ABC vs Protocol

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Use ABC when...*], [*Use Protocol when...*],
  [You control all the classes], [You don't control all classes],
  [You want to prevent instantiation], [You want flexible matching],
  [You have shared concrete methods], [Only an interface matters],
  [Hierarchy is important], [Behaviour is what matters],
)

= Summary

- *ABC* — formal contract, explicit inheritance, cannot instantiate
- *Protocol* — structural contract, no inheritance needed, duck-typing style
- *`@abstractmethod`* — forces subclass to implement
- *`@runtime_checkable`* — allows `isinstance()` with Protocol

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

