#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Wednesday — OO CRUD], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [From Monday to Wednesday])[
- Monday: `BankAccount` represents one account; `Bank` manages a list of objects.
- We used CRUD: add, find, update, delete.
- Today: *give the user a menu* and *keep the data after Python stops*.
]

#slide(title: [Starter Question: Where Do Our Accounts Go?])[
```python
bank = Bank()
bank.add_account(BankAccount("A001", "Alice", 500))
```
- What happens if we close the terminal and run the program again?
- The list and its objects existed in *memory* during that run.
- A new `Bank()` starts with an empty list unless we load saved data.
]

#slide(title: [Desk vs Filing Cabinet])[
#grid(columns: (1fr, 1fr), gutter: 18pt)[
  #block(fill: rgb("#e9f2ff"), inset: 14pt, radius: 8pt)[
    #align(center)[#text(size: 24pt)[🖥️]]
    *Working memory (RAM)*
    - Accounts available while the program runs
    - Fast to read and update
    - Not automatically kept after exit
  ]
  #block(fill: rgb("#e6f7ef"), inset: 14pt, radius: 8pt)[
    #align(center)[#text(size: 24pt)[🗂️]]
    *Saved file (disk)*
    - Account details remain between runs
    - Load them when starting
    - Save changes when needed
  ]
]
#align(center)[*Persistence = keeping data beyond one run of the program.*]
]

#slide(title: [The Persistence Cycle])[
#align(center)[
    #image("assets/save.png", width: 95%)
  ]
- We have already used *load → change → save* with lists and dictionaries.
- The new step: convert between *objects* and *JSON-compatible dictionaries*.
]
#slide(title: [Revision: Our Bank and BankAccount Classes])[
  #grid(
    columns: (1fr, 1.3fr),
    gutter: 10pt,
    [
      *BankAccount — one account*

      #set text(size: 15pt)
      ```python
      class BankAccount:
          def __init__(self, account_no,
                       name, balance=0):
              self._account_no = account_no
              self.name = name
              self.balance = balance

          @property
          def balance(self):
              return self._balance

          @balance.setter
          def balance(self, value):
              if value < 0:
                  raise ValueError("Invalid balance")
              self._balance = value
      ```
    ],
    [
      *Bank — manages a collection of accounts*

      #set text(size: 15pt)
      ```python
      class Bank:
          def __init__(self):
              self.accounts = []

          def find_account(self, account_no):
              for account in self.accounts:
                  if account.account_no == account_no:
                      return account
              return None

          def add_account(self, account):
              if self.find_account(account.account_no):
                  return False
              self.accounts.append(account)
              return True
      ```
    ]
  )

 
]
#slide(title: [A Menu Gives the User Choices])[
```text
=== BANK MENU ===
1. List accounts
2. Find an account
3. Add an account
4. Rename an account
5. Delete an account
6. Save accounts
0. Exit
```
- The menu is the *user interface*; it should call methods on `Bank`.
- It should not manipulate `bank.accounts` directly when a Bank method exists.
]

#slide(title: [Menu Pattern: Repeat Until Exit])[
```python
def main():
    bank = Bank()
    running = True
    while running:
        show_menu()
        choice = input("Choose: ").strip()
        if choice == "1":
            bank.list_accounts()
        elif choice == "0":
            running = False
        else:
            print("Invalid choice")
```
]

#slide(title: [The Menu Delegates Work])[
```python
elif choice == "3":
    number = input("Account number: ").strip()
    name = input("Name: ").strip()
    balance = float(input("Opening balance: "))
    try:
        account = BankAccount(number, name, balance)
        if bank.add_account(account):
            print("Account added")
        else:
            print("Duplicate account number")
    except ValueError as error:
        print("Invalid account:", error)
```
]

#slide(title: [Separation of Responsibilities])[
- `BankAccount` — validates and manages *one account*.
- `Bank` — searches and manages the *collection*.
- `main()` / menu — asks questions, displays results, handles user choices.
- `storage.py` — reads and writes files.

*Why?* Each part has a clear job; changes to a menu should not require rewriting account validation.
]

#slide(title: [Why Can’t We Just Dump the Objects?])[
```python
import json
bank = Bank()
bank.add_account(BankAccount("A001", "Alice", 500))
# This will fail: JSON does not know BankAccount objects
# json.dump(bank.accounts, file)
```
- JSON supports simple data such as dictionaries, lists, strings and numbers.
- We must first *convert each object into a dictionary*.
]

#slide(title: [Object → Dictionary → JSON])[
```python
account = bank.accounts[0]
record = {
    "account_no": account.account_no,
    "name": account.name,
    "balance": account.balance
}
```
```json
{"account_no": "A001", "name": "Alice", "balance": 500}
```
- Read public properties; do not rely on private implementation details.
]

#slide(title: [Convert All Accounts])[
```python
def accounts_to_dicts(bank):
    records = []
    for account in bank.accounts:
        records.append({
            "account_no": account.account_no,
            "name": account.name,
            "balance": account.balance
        })
    return records
```
]

#slide(title: [Save the Bank to a JSON File])[
```python
import json
from pathlib import Path

DATA_FILE = Path(__file__).resolve().parent / "data" / "accounts.json"

def save_bank(bank):
    DATA_FILE.parent.mkdir(parents=True, exist_ok=True)
    records = accounts_to_dicts(bank)
    with open(DATA_FILE, "w", encoding="utf-8") as file:
        json.dump(records, file, indent=4)
```
- `"w"` writes a *complete snapshot* of the current account list.
- We are not appending one JSON object to the end of the file.
]

#slide(title: [What Does accounts.json Look Like?])[
```json
[
  {
    "account_no": "A001",
    "name": "Alice",
    "balance": 600
  },
  {
    "account_no": "A002",
    "name": "Bob",
    "balance": 1200
  }
]
```
After we delete Bob and save, what should be in the file?
]
#slide(title: [Preparing Our Objects for Persistence])[
  JSON understands dictionaries and lists, but it does
  not automatically understand our BankAccount objects.

  We could add a method to our BankAccount class that
  returns a dictionary representation of the object.

  ```python
  def to_dict(self):
      return {
          "account_no": self.account_no,
          "name": self.name,
          "balance": self.balance
      }
  ```

  Then, we could now write:

  ```python
  record = account.to_dict()
  ```

    *The object knows how to represent its own data.
    The storage module knows how to save that data.*
  ]

#slide(title: [Load: JSON Dictionaries → BankAccount Objects])[
```python
def load_bank():
    bank = Bank()
    if not DATA_FILE.exists():
        return bank  # First run: start empty
    with open(DATA_FILE, "r", encoding="utf-8") as file:
        records = json.load(file)
    for record in records:
        account = BankAccount(
            record["account_no"],
            record["name"],
            record["balance"]
        )
        bank.add_account(account)
    return bank
```
- Constructors and property validation run again as objects are recreated.
- A damaged JSON file should raise an error, not silently erase records.
]

#slide(title: [Connect Load and Save to the Menu])[
```python
def main():
    bank = load_bank()   # Start with saved accounts
    running = True
    while running:
        show_menu()
        choice = input("Choose: ").strip()
        if choice == "6":
            save_bank(bank)
            print("Accounts saved")
        elif choice == "0":
            save_bank(bank)  # Save on normal exit
            running = False
        # Other choices call Bank methods
```
- Save after every change, on exit, or both? What if the program crashes?
]

#slide(title: [A Log File Is Different from a Data File])[
- `accounts.json`: *current state* — what accounts exist now?
- `bank.log`: *event history* — what actions happened and when?
- Logs help with debugging and understanding program behaviour.
- Avoid logging passwords or other sensitive information.

```text
2026-11-23 14:05:11 INFO Account A001 added
2026-11-23 14:06:03 INFO Account A001 renamed
2026-11-23 14:07:22 WARNING Duplicate account A001 rejected
2026-11-23 14:08:10 INFO Accounts saved to JSON
```
]

#slide(title: [Append a Simple Log Entry])[
```python
from datetime import datetime

def log_event(message):
    log_file = DATA_FILE.parent / "bank.log"
    log_file.parent.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now().isoformat(timespec="seconds")
    with open(log_file, "a", encoding="utf-8") as file:
        file.write(f"{stamp} {message}\n")
```
- `"a"` appends an event without replacing older entries.
- Compare with `"w"` for saving the latest JSON snapshot.
]


#slide(title: [Common Pitfalls])[
- Saving `BankAccount` objects directly with `json.dump()`.
- Creating a fresh empty `Bank()` on every menu iteration.
- Saving with `"w"` before loading existing accounts.
- Editing a dictionary from JSON but forgetting to rebuild objects.
- Treating a corrupt file as an empty file and overwriting it.
- Assuming a log is a replacement for the account data file.
]

#slide(title: [Today’s Takeaway])[
*We now have three layers:*

- *Objects*: `BankAccount` and `Bank` manage data and rules.
- *Menu*: user selects CRUD operations.
- *Persistence*: JSON saves and recreates account objects.

*Next:* apply the same separation of responsibilities to our ongoing PC Troubleshooter.
]
