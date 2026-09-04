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
    subtitle: [BankAccount Class],
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

= Designing the BankAccount Class

Let's build a `BankAccount` class step by step.

*What state does a bank account have?*
- Account number
- Account holder name
- Current balance

#pause

*What can a bank account do?*
- Deposit money
- Withdraw money
- Get current balance
- Display account information

#pause

This is the process of *object-oriented design*: identify the *attributes* (state) and *methods* (behaviour) before writing any code.

= BankAccount — First Version

```python
class BankAccount:
    """A simple bank account."""

    def __init__(self, account_no, name, initial_balance=0):
        self.account_no = account_no
        self.name       = name
        self.balance    = initial_balance

    def deposit(self, amount):
        """Add amount to balance."""
        self.balance += amount

    def withdraw(self, amount):
        """Subtract amount from balance."""
        self.balance -= amount

    def get_balance(self):
        """Return current balance."""
        return self.balance

    def __str__(self):
        return f"Account {self.account_no} ({self.name}): €{self.balance:.2f}"
```

= Creating and Using Instances

```python
# Create two separate accounts
alice_account = BankAccount("ACC001", "Alice Murphy", 500)
bob_account   = BankAccount("ACC002", "Bob Kelly")

# Each object has its own independent state
print(alice_account)    # Account ACC001 (Alice Murphy): €500.00
print(bob_account)      # Account ACC002 (Bob Kelly): €0.00

# Make some transactions
alice_account.deposit(200)
alice_account.withdraw(75)
bob_account.deposit(1000)
bob_account.deposit(500)
bob_account.withdraw(200)

print(alice_account)    # Account ACC001 (Alice Murphy): €625.00
print(bob_account)      # Account ACC002 (Bob Kelly): €1300.00

# Access balance directly
print(f"Alice's balance: €{alice_account.get_balance():.2f}")
```

= Problems with the First Version

The current version has no validation:

```python
acc = BankAccount("ACC003", "Carol", 100)

# These should all be rejected!
acc.withdraw(500)          # overdraft — balance becomes negative
acc.deposit(-50)           # negative deposit?!
acc.withdraw(-10)          # negative withdrawal adds money!

print(acc)   # Account ACC003 (Carol): €-440.00
```

#pause

*We need to add validation:*
- Deposit amount must be positive
- Withdrawal amount must be positive
- Cannot withdraw more than the current balance

= BankAccount with Validation

```python
class BankAccount:
    def __init__(self, account_no, name, initial_balance=0):
        if initial_balance < 0:
            raise ValueError("Initial balance cannot be negative")
        self.account_no = account_no
        self.name       = name
        self.balance    = initial_balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError(f"Deposit amount must be positive, got {amount}")
        self.balance += amount
        print(f"Deposited €{amount:.2f}. New balance: €{self.balance:.2f}")

    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError(f"Withdrawal amount must be positive, got {amount}")
        if amount > self.balance:
            raise ValueError(f"Insufficient funds. Balance: €{self.balance:.2f}")
        self.balance -= amount
        print(f"Withdrew €{amount:.2f}. New balance: €{self.balance:.2f}")
```

= The \_\_str\_\_ Method

```python
    def __str__(self):
        return (f"BankAccount(\n"
                f"  Account No: {self.account_no}\n"
                f"  Holder:     {self.name}\n"
                f"  Balance:    €{self.balance:.2f}\n"
                f")")
```

#pause

*Using the validated BankAccount:*

```python
acc = BankAccount("ACC001", "Alice", 1000)

acc.deposit(500)          # OK
acc.withdraw(200)         # OK

try:
    acc.withdraw(2000)    # raises ValueError
except ValueError as e:
    print(f"Error: {e}")

try:
    acc.deposit(-50)      # raises ValueError
except ValueError as e:
    print(f"Error: {e}")

print(acc)
```

= Transaction History

Extending BankAccount with a transaction log:

```python
class BankAccount:
    def __init__(self, account_no, name, initial_balance=0):
        self.account_no  = account_no
        self.name        = name
        self.balance     = initial_balance
        self.transactions = []      # list to hold history

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self.balance += amount
        self.transactions.append(("Deposit", amount, self.balance))

    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError("Withdrawal must be positive")
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        self.transactions.append(("Withdrawal", amount, self.balance))

    def print_statement(self):
        print(f"Statement for {self.name} ({self.account_no})")
        print("-" * 45)
        for t_type, amount, balance in self.transactions:
            print(f"  {t_type:<12} €{amount:>8.2f}   Balance: €{balance:.2f}")
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