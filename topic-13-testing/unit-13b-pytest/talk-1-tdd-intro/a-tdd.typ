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
    subtitle: [Test-Driven Development],
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

= What is TDD?

== Test-Driven Development

TDD is a development practice where you write *tests before code*:

1. *Red* — Write a failing test (it fails because the code doesn't exist yet)
2. *Green* — Write the *minimum* code to make the test pass
3. *Refactor* — Clean up the code while keeping tests green

#v(.5em)
Benefits:
- Forces you to think about the interface before implementation
- Every line of code is covered by at least one test
- Bugs are caught immediately
- Tests serve as living documentation

= Unit Testing vs Integration Testing

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Unit Test*], [*Integration Test*],
  [Tests one class/function in isolation], [Tests how components work together],
  [Fast — milliseconds], [Slower — may involve files/DB/network],
  [Many, covering each method], [Fewer, covering key workflows],
  [Easy to locate failures], [Harder to pinpoint failures],
)

We will focus on *unit tests* using pytest.

= What Makes a Good Test?

- *Fast* — should run in milliseconds
- *Isolated* — doesn't depend on other tests or external state
- *Repeatable* — same result every run
- *Self-checking* — uses `assert`, not manual inspection
- *Named clearly* — `test_deposit_increases_balance()`

#v(.5em)
A test has three parts (Arrange-Act-Assert / AAA):
```
Arrange: set up the object/data
Act:     call the method
Assert:  check the result
```

= The BankAccount Class

```python
class BankAccount:
    def __init__(self, owner: str, balance: float = 0.0):
        self.__owner = owner
        self.__balance = balance

    def deposit(self, amount: float):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self.__balance += amount

    def withdraw(self, amount: float):
        if amount <= 0:
            raise ValueError("Withdrawal must be positive")
        if amount > self.__balance:
            raise ValueError("Insufficient funds")
        self.__balance -= amount

    def get_balance(self) -> float:
        return self.__balance
```

= Red-Green-Refactor Cycle

*Red:* Write a failing test
```python
def test_deposit_increases_balance():
    account = BankAccount("Alice", 100.0)
    account.deposit(50.0)
    assert account.get_balance() == 150.0
```
Run it → FAIL (BankAccount doesn't exist yet)

*Green:* Implement `BankAccount.deposit()` → test passes

*Refactor:* Improve the code (rename variables, extract helpers) → tests still green

= Unit vs Integration Test Example

```python
# Unit test — tests BankAccount in isolation
def test_withdraw_reduces_balance():
    account = BankAccount("Bob", 200.0)
    account.withdraw(75.0)
    assert account.get_balance() == 125.0

# Integration test — tests Shop save+load together
def test_shop_persists_to_json(tmp_path):
    shop = Shop("Test")
    shop.add_product(Product("Apple", 1.99, 101))
    shop.save_to_json(str(tmp_path / "shop.json"))

    shop2 = Shop("Loaded")
    shop2.load_from_json(str(tmp_path / "shop.json"))
    assert len(shop2.get_all_products()) == 1
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

