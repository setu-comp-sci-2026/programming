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
    subtitle: [The super() Function],
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

= What is `super()`?

== A reference to the parent class

`super()` returns a proxy object that lets you call methods defined in the *parent class* from inside the *child class*.

#v(.5em)
Most commonly used in `__init__`:

```python
class Child(Parent):
    def __init__(self, parent_arg1, parent_arg2, child_arg):
        super().__init__(parent_arg1, parent_arg2)
        self.__child_attr = child_arg
```

Without `super().__init__()`, the parent's attributes are never set up!

= Calling Parent `__init__`

```python
class Person:
    def __init__(self, name: str, email: str):
        self.__name = name
        self.__email = email

class PremiumMember(Person):
    def __init__(self, name: str, email: str,
                 subscription: str):
        super().__init__(name, email)   # sets __name, __email
        self.__subscription = subscription

pm = PremiumMember("Alice", "alice@example.com", "Gold")
print(pm.get_name())   # Alice  ← set by Person.__init__
```

= Extending Parent Methods

== Adding to, not replacing

```python
class Person:
    def describe(self) -> str:
        return f"Name: {self.__name}, Email: {self.__email}"

class PremiumMember(Person):
    def describe(self) -> str:
        base = super().describe()   # get parent's text
        return f"{base}, Plan: {self.__subscription}"

pm = PremiumMember("Alice", "alice@example.com", "Gold")
print(pm.describe())
# Name: Alice, Email: alice@example.com, Plan: Gold
```

= When to Use `super()`

- *Always* call `super().__init__()` in a subclass `__init__` (unless the parent has no `__init__` worth calling)
- Use `super().method()` when you want to *extend* (not replace) a parent method
- Do *not* call `super()` if you want to *completely replace* the parent method

#v(.5em)
```python
# EXTENDING — calls parent first, then adds
def __str__(self):
    return super().__str__() + f" [Premium]"

# REPLACING — ignores parent completely
def __str__(self):
    return f"PremiumMember: {self.get_name()}"
```

= Multiple Levels of Inheritance

```python
class Person:
    def __init__(self, name): self.__name = name
    def greet(self): return f"Hi, I'm {self.__name}"

class User(Person):
    def __init__(self, name, username):
        super().__init__(name)
        self.__username = username

class AdminUser(User):
    def __init__(self, name, username, access_level):
        super().__init__(name, username)   # calls User.__init__
        self.__access_level = access_level
```

`super()` follows the *Method Resolution Order* (MRO) — Python's rule for which class to look in next.

= Method Resolution Order (MRO)

```python
class A: pass
class B(A): pass
class C(B): pass

print(C.__mro__)
# (<class 'C'>, <class 'B'>, <class 'A'>, <class 'object'>)
```

When you call a method on `C`, Python searches: `C` → `B` → `A` → `object`.

The first class in the MRO that defines the method wins.

`super()` moves to the *next* class in the MRO.

= Summary

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Use*], [*Code*],
  [Call parent `__init__`], [`super().__init__(args)`],
  [Extend a method], [`base = super().method()` then add to it],
  [Check MRO], [`MyClass.__mro__`],
  [Replace a method], [Just define it in child (no `super()`)],
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
