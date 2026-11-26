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
class BankAccount:
    def __init__(self, account_no: str, owner: str, balance: float = 0):
        self._account_no = account_no
        self._owner = owner
        self._balance = balance


class SavingsAccount(BankAccount):
    def __init__(self, account_no: str, owner: str,
                 balance: float = 0, interest_rate: float = 0.02):
        super().__init__(account_no, owner, balance)   # sets the 3 shared attributes
        self._interest_rate = interest_rate            # only the new one here

s = SavingsAccount("S001", "Alice", 1000, 0.03)
print(s.get_owner())   # Alice  ← set by BankAccount.__init__
```

= Extending Parent Methods

== Adding to, not replacing

```python
class BankAccount:
    def describe(self) -> str:
        return f"{self._account_no} ({self._owner}): €{self._balance:.2f}"


class SavingsAccount(BankAccount):
    def describe(self) -> str:
        base = super().describe()          # get parent's text
        return f"{base}, Interest: {self._interest_rate:.1%}"

s = SavingsAccount("S001", "Alice", 1000, 0.03)
print(s.describe())
# S001 (Alice): €1000.00, Interest: 3.0%
```

= When to Use `super()`

- *Always* call `super().__init__()` in a subclass `__init__` (unless the parent has no `__init__` worth calling)
- Use `super().method()` when you want to *extend* (not replace) a parent method
- Do *not* call `super()` if you want to *completely replace* the parent method

#v(.5em)
```python
# EXTENDING — calls parent first, then adds
def __str__(self):
    return super().__str__() + " [Savings]"

# REPLACING — ignores parent completely
def __str__(self):
    return f"SavingsAccount: {self.get_owner()}"
```

= Multiple Levels of Inheritance

A fixed-term account *is-a* savings account (with interest) that you can't withdraw from until the term ends:

```python
class BankAccount:
    def __init__(self, account_no, owner, balance=0): ...

class SavingsAccount(BankAccount):
    def __init__(self, account_no, owner, balance=0, interest_rate=0.02):
        super().__init__(account_no, owner, balance)             # → BankAccount
        self._interest_rate = interest_rate

class FixedTermAccount(SavingsAccount):
    def __init__(self, account_no, owner, balance, interest_rate, term_months):
        super().__init__(account_no, owner, balance, interest_rate)  # → SavingsAccount
        self._term_months = term_months
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
#pause

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
