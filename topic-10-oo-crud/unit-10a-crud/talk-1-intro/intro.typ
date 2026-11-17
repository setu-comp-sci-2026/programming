#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Monday — Object-Oriented CRUD], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [Week 10: From Objects to OO CRUD])[
- Week 9: one `BankAccount` object had attributes and methods.
- Week 10: a bank manages *many* accounts.
- We will build a `Bank` class to manage a collection of `BankAccount` objects.
]

#slide(title: [Recall: What Did We Learn Last Week?])[
- Class = blueprint; object = instance.
- `__init__` sets up each object; `self` refers to the current object.
- Instance methods perform actions; validation protects object state.
- `__str__` gives a readable description of an object.
]

#slide(title: [The Problem: One Account Is Not a Bank])[
```python
alice = BankAccount("A001", "Alice", 500)
bob = BankAccount("A002", "Bob", 1200)
# What if we have 500 accounts?
# How do we find, update, or remove one?
```
]

#slide(title: [Excel Analogy: From One Row to a Worksheet])[
- One row = one `BankAccount` object.
- The whole worksheet = a collection managed by the `Bank`.
- A macro that finds a row = a `Bank` search method.
- Each account still controls its own balance through `deposit()` and `withdraw()`.
]

#slide(title: [Two Classes, Two Responsibilities])[
- `BankAccount`: details and rules for *one* account.
- `Bank`: stores and manages *all* accounts.
- Avoid placing the menu, file handling, and every responsibility inside `BankAccount`.
]

#slide(title: [Our Class Relationship])[
```python
class BankAccount:
    # One account: account_no, name, balance
    # deposit(), withdraw(), __str__()
    pass

class Bank:
    # Many accounts: list[BankAccount]
    # add(), find(), update(), delete(), list_all()
    pass
```
]
#slide(title: [What Does `pass` Mean in a Class?])[
- `pass` is a *placeholder statement*: it tells Python to do nothing.
- Python requires an indented body after `class` and `def`.
- We can plan our classes and methods before implementing them.

```python
class Bank:
    def add_account(self, account):
        pass  # TODO: implement Create

    def find_account(self, account_no):
        pass  # TODO: implement Read

bank = Bank()             # Valid object
bank.add_account("A001") # Does nothing yet
```

*Remember:* `pass` does not return a value, exit a loop, or implement CRUD. An unfinished method returns `None` by default.
]
#slide(title: [CRUD: We Already Know These Operations])[
- Create: add a new account.
- Read: list accounts or find one by number.
- Update: change an account holder or deposit money.
- Delete: remove an account from the collection.
]

#slide(title: [Start with the Account Class])[
```python
class BankAccount:
    def __init__(self, account_no, name, balance=0):
        if balance < 0:
            raise ValueError("Balance cannot be negative")
        self.account_no = account_no
        self.name = name
        self.balance = balance

    def __str__(self):
        return f"{self.account_no}: {self.name} - €{self.balance:.2f}"
```
]
#slide(title: [The `raise` Keyword — Rejecting Invalid Data])[
  *What does `raise` do?*

  - `raise` deliberately triggers an *exception* when something is wrong.
  - It stops normal execution of the current method.
  - It allows the calling code to handle the problem using `try` / `except`.

  #v(8pt)

  *Example: Protecting a BankAccount*

  ```python
  class BankAccount:
      def __init__(self, holder, initial_balance):
          if initial_balance < 0:
              raise ValueError("Balance cannot be negative")

          self.holder = holder
          self.balance = initial_balance
          ```
]
#slide(title: [OO Principle — Protect Your Object's Data])[
  *An object should protect the validity of its own data.*

  Imagine a bank account. We should never allow:
  - A negative opening balance.
  - A deposit of zero or a negative amount.
  - A withdrawal greater than the available balance.

  #v(8pt)

  *The BankAccount class enforces these rules:*

  ```python
  class BankAccount:
      def __init__(self, holder, balance):
          if balance < 0:
              raise ValueError("Invalid opening balance")
          self.holder = holder
          self.balance = balance

      def deposit(self, amount):
          if amount <= 0:
              raise ValueError("Deposit must be positive")
          self.balance += amount
  ```

  #v(8pt)

  #block(fill: rgb("#EAF3FA"), inset: 10pt, radius: 5pt)[
    *Key idea:* Don't rely on the main program to
    check everything. Put validation rules in the
    class that owns the data.
  ]

  #v(5pt)
  #text(size: 12pt)[
    Note: `self.balance` can still be changed directly.
    A property can provide additional protection.
  ]
]

#slide(title: [A Limitation — Can We Really Protect Our Data?])[
  *Our BankAccount class validates deposits and withdrawals.*

  But what happens if another part of the program changes
  the balance directly?

  ```python
  account = BankAccount("Alice", 500)

  account.balance = -1000  # Python allows this!
  ```

  #v(8pt)

  *The problem:*
  - We have bypassed our validation methods.
  - Our object can now contain an invalid balance.

  #v(8pt)

  *Does Python have a solution?*

  Yes! Python provides `@property` and `@balance.setter`
  to control how attributes are accessed and changed.

  #v(8pt)

  #block(fill: rgb("#EAF3FA"), inset: 10pt, radius: 5pt)[
    *Key takeaway:* Our validation improves data integrity,
    but it does not prevent direct changes to attributes.

    Properties offer additional control — something to
    explore as you progress with object-oriented programming.
  ]
]


#slide(title: [From a Real Bank to Python Classes])[
  #align(center)[
    #image("assets/bank.png", width: 95%)
  ]
]


#slide(title: [The Bank Stores a List of Objects])[
```python
class Bank:
    def __init__(self):
        self.accounts = []

bank = Bank()
print(bank.accounts)  # []
```
]

#slide(title: [What Are We Actually Storing in the List?])[
  *Our list contains objects, not just account numbers or names.*

  ```python
  bank = Bank()

  alice = BankAccount("A001", "Alice", 500)
  bank.accounts.append(alice)

  alice.deposit(100)

  print(bank.accounts[0].balance)  # 600
  ```

  *Why is the balance now 600?*

  - `alice` refers to a BankAccount object.
  - The list stores a reference to that same object.
  - Changing the object through `alice` changes what
    we see when accessing it through the list.

  *Key idea:* Both references point to the same object.
]

#slide(title: [Read: Display Every Account])[
```python
def list_accounts(self):
    for account in self.accounts:
        print(account)  # Calls __str__()
```
]


#slide(title: [Searching for Objects — What If We Find Nothing?])[
  *Our search method has two possible outcomes:*

  - Account found: return the BankAccount object.
  - Account not found: return `None`.

  ```python
  account = bank.find_account("A999")

  if account is None:
      print("Account not found")
  else:
      print(account.name)
  ```

  *Important syntax:*
  - `None` represents the absence of a value.
  - `is None` checks whether no object was returned.
  - `is not None` checks whether an object was returned.

  *Remember:* Check before accessing an object's attributes.
]


#slide(title: [Read: Find One Account by ID])[
```python
def find_account(self, account_no):
    for account in self.accounts:
        if account.account_no == account_no:
            return account
    return None
```
]

#slide(title: [Why Return an Object Instead of a String?])[
- A found object can be displayed, updated, or deleted.
- Returning a string loses access to the object itself.
- `None` means no matching account was found.
]

#slide(title: [Why Return Instead of Print?])[
  *Printing displays information. Returning gives
  information back to the calling code.*

  ```python
  def find_account(self, account_no):
      for account in self.accounts:
          if account.account_no == account_no:
              return account
      return None
  ```

  We can then use the returned object:

  ```python
  account = bank.find_account("A001")

  if account is not None:
      account.deposit(50)
      print(account)
  ```

  *Key idea:* Returning an object lets another part
  of the program work with that object.
]

#slide(title: [Trace the Search])[
```python
bank.accounts = [
    BankAccount("A001", "Alice", 500),
    BankAccount("A002", "Bob", 1200)
]
found = bank.find_account("A002")
print(found.name if found is not None else "Not found")
```
]

#slide(title: [Create: Add a New Account])[
```python
def add_account(self, account):
    if self.find_account(account.account_no) is not None:
        return False
    self.accounts.append(account)
    return True
```
]

#slide(title: [Why Check for Duplicate Account Numbers?])[
- Account numbers are identifiers: they must be unique in our model.
- Without a check, search may find the wrong record.
- Validation can happen in the account constructor and the collection manager.
]

#slide(title: [Try It: Predict the Result])[
```python
bank = Bank()
a = BankAccount("A001", "Alice", 500)
print(bank.add_account(a))
print(bank.add_account(a))
print(len(bank.accounts))
```
]

#slide(title: [Update: Find, Then Change])[
```python
def rename_account(self, account_no, new_name):
    account = self.find_account(account_no)
    if account is None or new_name.strip() == "":
        return False
    account.name = new_name.strip()
    return True
```
]

#slide(title: [Update: Use the Object’s Own Methods])[
```python
account = bank.find_account("A001")
if account is not None:
    account.deposit(50)
# The Bank locates the account.
# The BankAccount controls its own balance.
```
]

#slide(title: [Delete: Find and Remove])[
```python
def delete_account(self, account_no):
    account = self.find_account(account_no)
    if account is None:
        return False
    self.accounts.remove(account)
    return True
```
]

#slide(title: [A Single Bank Class Manages CRUD])[
- Create → `add_account(account)`
- Read → `list_accounts()` / `find_account(number)`
- Update → `rename_account(number, name)`
- Delete → `delete_account(number)`
- One collection, one consistent way to locate accounts.
]

#slide(title: [Activities: What Should Happen?])[
- Try to add two accounts with the same number.
- Search for an account that does not exist.
- Rename an account to an empty string.
- Delete an account twice.
- Discuss expected return values and messages.
]


#slide(title: [Quick Check: Who Is Responsible?])[
- Validating a negative opening balance? → `BankAccount`.
- Finding account A003? → `Bank`.
- Displaying menu options? → main program.
- Writing JSON to disk? → persistence code (Wednesday).
]

#slide(title: [Monday Recap and Wednesday Preview])[
- One object is not the same as a collection of objects.
- A manager class can implement CRUD for many objects.
- Searching by a unique ID underpins update and delete.
- Wednesday: add a menu, save to JSON, reload, and test.
]
