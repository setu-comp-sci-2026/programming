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
    subtitle: [Encapsulation],
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

= What is Encapsulation?

*Encapsulation* means bundling data and the methods that operate on it together, while *hiding* the internal details from outside code.

#pause

*Why encapsulate?*
- Protects data from accidental modification
- Allows the class to enforce *invariants* (rules that must always hold true)
- Lets you change internal implementation without breaking external code
- Makes code easier to reason about

#pause

*Without encapsulation:*

```python
acc = BankAccount("Alice", 1000)
acc.balance = -99999    # Direct modification — bypasses all validation!
```

We need a way to *control* how attributes are accessed and modified.

= Python's Convention — The Single Underscore

Python does not have true private variables (unlike Java/C++). Instead, it uses *naming conventions*.

```python
class BankAccount:
    def __init__(self, name, balance=0):
        self.name     = name     # public — intended for external use
        self._balance = balance  # "protected" — internal, use with caution
```

#pause

A single leading underscore `_` means: *"this is an implementation detail — don't access it directly from outside the class."*

It is a *convention*, not enforced by Python. Other programmers will respect it; Python itself won't stop you.

#pause

```python
acc = BankAccount("Alice", 1000)
print(acc._balance)      # Python allows it, but it's bad form
acc._balance = -999      # This breaks the class's invariants!
```

= Double Underscore — Name Mangling

A double leading underscore `__` triggers *name mangling* — Python renames the attribute to `_ClassName__attribute`.

```python
class BankAccount:
    def __init__(self, name, balance=0):
        self.__balance = balance    # name-mangled

    def get_balance(self):
        return self.__balance

acc = BankAccount("Alice", 1000)
print(acc.get_balance())    # 1000

# Direct access fails
# print(acc.__balance)      # AttributeError!

# But name mangling just renames it (not truly hidden)
print(acc._BankAccount__balance)   # 1000  — still accessible if you know the name
```

#pause

*When to use `__` (double underscore):* when you want to prevent accidental access or name collisions in subclasses. In practice, `_` (single underscore) is more common.

= Getters and Setters

Provide *controlled access* to private attributes via methods.

```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age  = age

    def get_name(self):
        """Getter — read the name."""
        return self._name

    def set_name(self, name):
        """Setter — validate and set the name."""
        if not name.strip():
            raise ValueError("Name cannot be blank")
        self._name = name.strip().title()

    def get_age(self):
        return self._age

    def set_age(self, age):
        if not isinstance(age, int) or age < 0 or age > 150:
            raise ValueError(f"Invalid age: {age}")
        self._age = age

p = Person("alice", 25)
print(p.get_name())     # Alice  (title-cased in setter)
p.set_age(26)
```

= Public vs Private — Design Guidelines

#table(
  columns: (auto, auto, 1fr),
  inset: 9pt,
  fill: (col, row) => if col == 0 { rgb("#99f6e4") } else { white },
  [*Convention*], [*Symbol*], [*Meaning*],
  [Public], [(none)], [Part of the class's public interface — safe to use],
  [Protected], [`_name`], [Internal implementation detail — avoid direct access],
  [Name-mangled], [`__name`], [Strong hint not to access; prevents subclass collisions],
)

#pause

*Good design principle:* minimise the public interface. Only expose what the user of the class *needs* to use. Everything else should be private.

```python
class Stack:
    def __init__(self):
        self._items = []        # private — don't expose directly

    def push(self, item):       # public
        self._items.append(item)

    def pop(self):              # public
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._items.pop()

    def peek(self):             # public
        return self._items[-1]

    def is_empty(self):         # public
        return len(self._items) == 0

    def size(self):             # public
        return len(self._items)
```

= Encapsulation in Practice — Temperature

```python
class Temperature:
    """A temperature that can be read in Celsius or Fahrenheit."""

    def __init__(self, celsius):
        self._celsius = None    # initialise first
        self.set_celsius(celsius)

    def set_celsius(self, value):
        if value < -273.15:
            raise ValueError(f"Temperature {value}C below absolute zero")
        self._celsius = value

    def get_celsius(self):
        return self._celsius

    def get_fahrenheit(self):
        return self._celsius * 9/5 + 32

    def set_fahrenheit(self, value):
        self.set_celsius((value - 32) * 5/9)

    def __str__(self):
        return f"{self._celsius:.1f}C ({self.get_fahrenheit():.1f}F)"

t = Temperature(100)
print(t)                        # 100.0C (212.0F)
t.set_fahrenheit(32)
print(t)                        # 0.0C (32.0F)
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