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
    subtitle: [Inheritance Basics],
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

= What is Inheritance?

== Reusing and extending classes

Inheritance lets a *child class* (subclass) receive all the attributes and methods of a *parent class* (superclass), then add or change them.

#v(.5em)
Think of it as: "A SavingsAccount *is-a* BankAccount."

```
BankAccount
├── SavingsAccount
└── CurrentAccount
```

Benefits:
- Avoid repeating code in every subclass
- Model real-world hierarchies naturally
- Supports polymorphism

= Python Syntax

== The parent class

```python
class BankAccount:                     # parent / superclass
    def __init__(self, account_no: str, owner: str, balance: float = 0):
        self._account_no = account_no
        self._owner = owner
        self._balance = balance

    def get_owner(self) -> str:     return self._owner
    def get_balance(self) -> float: return self._balance

    def deposit(self, amount: float) -> None:
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self._balance += amount
```
#pagebreak()
```
    def __str__(self) -> str:
        return f"BankAccount {self._account_no} ({self._owner}): €{self._balance:.2f}"
```

An ordinary class — nothing special is needed to make it a parent.

== The child class

```python
class SavingsAccount(BankAccount):     # child / subclass
    pass                               # inherits everything from BankAccount
```

- `class SavingsAccount(BankAccount):` — the `(BankAccount)` part declares the parent
- `pass` — no new code yet: every attribute and method comes from `BankAccount`

= Why `_balance` and not `__balance`?

Subclasses will need to change the balance — e.g. an overdraft account. With a double underscore they *can't*:

```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance       # renamed to _BankAccount__balance

class CurrentAccount(BankAccount):
    def show(self):
        return self.__balance          # looks for _CurrentAccount__balance!

CurrentAccount(100).show()
# AttributeError: 'CurrentAccount' object has no attribute '_CurrentAccount__balance'
```

- `__name` — name-mangled: private to *this class only*
- `_name` — convention: "internal — for this class *and its subclasses*"

When you plan for subclasses, use a single underscore.

= Inherited Attributes and Methods

```python
class SavingsAccount(BankAccount):
    pass

# SavingsAccount inherits __init__, get_owner, get_balance, deposit, __str__
acc = SavingsAccount("S001", "Alice", 100)
acc.deposit(50)
print(acc.get_owner())     # Alice
print(acc.get_balance())   # 150
print(acc)                 # BankAccount S001 (Alice): €150.00
```

`SavingsAccount` has no code of its own, so it behaves exactly like a `BankAccount`.

= Adding Attributes in a Subclass

```python
class SavingsAccount(BankAccount):  # child / subclass
    def __init__(self, account_no: str, owner: str,
                 balance: float = 0, interest_rate: float = 0.02):
        super().__init__(account_no, owner, balance)   # call parent __init__
        self._interest_rate = interest_rate

    def get_interest_rate(self) -> float:
        return self._interest_rate

    def add_interest(self) -> None:
        self.deposit(self._balance * self._interest_rate)   # inherited deposit
        ```
#pagebreak()
```python
    def __str__(self) -> str:
        return (f"SavingsAccount {self._account_no} ({self._owner}): "
                f"€{self._balance:.2f} @ {self._interest_rate:.1%}")
```

`super().__init__(...)` calls the *parent* constructor to set up the inherited attributes — the child only adds what is new.

= The Bank Accounts Example

```
BankAccount
 ├── account_no, owner, balance
 ├── get_owner() / get_balance()
 ├── deposit() / withdraw()
 └── __str__()
       │
       ├── SavingsAccount(BankAccount)
       │     ├── interest_rate: float
       │     └── add_interest()
       │
       └── CurrentAccount(BankAccount)
             ├── overdraft_limit: float
             └── withdraw()  ← overridden: may go below 0
```
#pagebreak()

Each subclass stores *only* what is new 
-  `account_no`, `owner` and `balance` live in `BankAccount`.

= Overriding Methods

`BankAccount.withdraw()` refuses to go below €0. A current account can go overdrawn:

```python
class CurrentAccount(BankAccount):
    def __init__(self, account_no: str, owner: str,
                 balance: float = 0, overdraft_limit: float = 500):
        super().__init__(account_no, owner, balance)
        self._overdraft_limit = overdraft_limit

    def withdraw(self, amount: float) -> None:      # overrides parent
        if amount <= 0:
            raise ValueError("Withdrawal must be positive")
        if amount > self._balance + self._overdraft_limit:
            raise ValueError("Overdraft limit exceeded")
        self._balance -= amount                     # may go below 0
        ```

#pagebreak()
```python
c = CurrentAccount("C001", "Bob", 100)
c.withdraw(300)
print(c.get_balance())    # -200
```

The child's `withdraw` *overrides* the parent's — the child version is called instead.

= Using the Classes

```python
from savings_account import SavingsAccount
from current_account import CurrentAccount

accounts = [
    SavingsAccount("S001", "Alice", 1000, 0.03),
    CurrentAccount("C001", "Bob", 250),
    SavingsAccount("S002", "Carol", 40),
]

for acc in accounts:
    print(acc)                # calls each class's own __str__
    print(acc.get_owner())    # inherited from BankAccount```

#pagebreak()
```python
# What's printed?
#
# SavingsAccount S001 (Alice): €1000.00 @ 3.0%
# Alice
# CurrentAccount C001 (Bob): €250.00
# Bob
# SavingsAccount S002 (Carol): €40.00 @ 2.0%        
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

