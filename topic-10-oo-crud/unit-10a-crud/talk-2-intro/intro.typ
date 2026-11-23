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
- We have learned how a `BankAccount` can protect its own data with properties.
- Today we will use that existing class — *not rebuild its getters and setters*.
- New challenge: how does one `Bank` manage *many* account objects?
]
#slide(title: [The Problem: One Account Is Not a Bank])[
```python
alice = BankAccount("A001", "Alice", 500)
bob = BankAccount("A002", "Bob", 1200)
# These use the BankAccount class from last week.
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

#slide(title: [Reusing the BankAccount Class])[
- From the properties lecture, `BankAccount` already provides:
  - `account_no` — a read-only property.
  - `name` — a property with a validating setter.
  - `balance` — a property with a validating setter.
- Our new `Bank` class will manage a *list of BankAccount objects*.
- We use `account.account_no` and `account.name` normally: the properties work behind the scenes.
]
#slide(title: [Planning a New Class with `pass`])[
- `pass` is a placeholder: Python does nothing when it executes it.
- It lets us outline the *new Bank class* before writing its methods.
```python
class Bank:
    def add_account(self, account):
        pass  # To implement

    def find_account(self, account_no):
        pass  # To implement
```
- An unfinished method that reaches the end returns `None` automatically.
]
#slide(title: [CRUD: We Already Know These Operations])[
- Create: add a new account.
- Read: list accounts or find one by number.
- Update: change an account holder or deposit money.
- Delete: remove an account from the collection.
]

#slide(title: [From a Real Bank to Python Classes])[
  #align(center)[
    #image("assets/bank.png", height: 95%, width: 95%)
  ]
]


#slide(title: [The Account Interface We Already Have])[
```python
account = BankAccount("A001", "Alice", 500)
print(account.account_no)  # Read-only property
print(account.name)        # Property getter
account.name = "Alice Smith"  # Validated setter
print(account.balance)     # Property getter
```
- This is the interface from the properties lesson.
- Today we focus on how `Bank` *finds and manages* these objects.
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

  alice.balance = 600  # validated by the property setter

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

#slide(title: [Update: Use the Account's Property Setter])[
```python
account = bank.find_account("A001")
if account is not None:
    account.balance = account.balance + 50
# Bank finds the correct account.
# BankAccount's balance setter validates the new value.
```
- We are *using* the properties covered in the revision, not implementing them again.
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
- Validating a negative balance? → `BankAccount` property setter.
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
