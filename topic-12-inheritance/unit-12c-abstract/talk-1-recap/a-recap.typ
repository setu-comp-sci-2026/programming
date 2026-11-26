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
    subtitle: [Inheritance and Polymorphism Recap],
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

// Baseline-aligned bullet markers (theme default hangs below the text)
#set list(
  marker: (
    text(fill: rgb("#3572A5"))[•],
    text(fill: rgb("#3572A5"))[‣],
    text(fill: rgb("#3572A5"))[–],
  ),
  indent: 0.6em,
  body-indent: 0.6em,
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= Recap — Inheritance

```python
class BankAccount:
    def __init__(self, account_no, owner, balance=0):
        self._account_no = account_no
        self._owner = owner
        self._balance = balance
    def get_owner(self): return self._owner

class SavingsAccount(BankAccount):
    def __init__(self, account_no, owner, balance=0, rate=0.02):
        super().__init__(account_no, owner, balance)
        self._rate = rate
    def __str__(self):
        return f"SavingsAccount: {self.get_owner()} @ {self._rate:.1%}"
```

Key points:
- `class Child(Parent):` — declares inheritance
- `super().__init__()` — initialises parent attributes
- Child inherits all parent methods

= Recap — Polymorphism

```python
accounts = [SavingsAccount("S001", "Alice", 1000, 0.03),
            CurrentAccount("C001", "Bob", -200)]

for acc in accounts:
    print(acc)                # different __str__ per type
    acc.monthly_update()      # interest vs overdraft fee
    print(acc.get_owner())    # inherited from BankAccount
```

Polymorphism = same call, different behaviour per object type.

= The Problem — Optional Method

What if a parent class defines `area()` but forgets to implement it?

```python
class Shape:
    def area(self) -> float:
        return 0.0    # silently wrong for all subclasses!

class Circle(Shape):
    def __init__(self, r): self.__r = r
    # Forgot to override area() — returns 0.0 silently!

c = Circle(5)
print(c.area())   # 0.0 — wrong! But no error.
```

We need a way to *force* subclasses to implement certain methods.

= Solution — Abstract Classes

```python
from abc import ABC, abstractmethod

class Shape(ABC):           # ABC = Abstract Base Class
    @abstractmethod
    def area(self) -> float:
        pass                # no implementation here

class Circle(Shape):
    def __init__(self, r): self.__r = r
    def area(self):
        import math
        return math.pi * self.__r ** 2

# Cannot instantiate Shape directly:
# s = Shape()   → TypeError!

c = Circle(5)              # fine — implements area()
print(c.area())            # 78.54
```

= Why Abstract Classes?

- *Enforce contracts* — any subclass MUST implement all `@abstractmethod` methods
- *Cannot instantiate* the abstract class directly
- *Document intent* — abstract methods serve as an interface specification
- Catch missing implementations at *object creation time*, not later

#slide(title: none, header: none, footer: none, align: center + horizon)[
  #text(size: 2em, weight: "bold")[Thanks for Watching - Any questions?]
]
