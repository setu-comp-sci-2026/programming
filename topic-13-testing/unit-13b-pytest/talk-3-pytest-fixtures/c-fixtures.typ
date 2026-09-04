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
    subtitle: [pytest Fixtures and Advanced Features],
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

= The Problem with Repeated Setup

```python
# Without fixtures — repetitive!
def test_deposit():
    account = BankAccount("Alice", 100.0)   # repeated
    account.deposit(50.0)
    assert account.get_balance() == 150.0

def test_withdraw():
    account = BankAccount("Alice", 100.0)   # repeated
    account.withdraw(30.0)
    assert account.get_balance() == 70.0

def test_balance():
    account = BankAccount("Alice", 100.0)   # repeated again
    assert account.get_balance() == 100.0
```

= `@pytest.fixture`

```python
import pytest
from bank_account import BankAccount

@pytest.fixture
def account():
    """Provides a fresh BankAccount for each test."""
    return BankAccount("Alice", 100.0)

# Use it as a parameter — pytest injects it automatically
def test_deposit(account):
    account.deposit(50.0)
    assert account.get_balance() == 150.0

def test_withdraw(account):
    account.withdraw(30.0)
    assert account.get_balance() == 70.0
```

Each test gets a *fresh* `account` — changes in one test don't affect others.

= Fixture Scope

```python
@pytest.fixture(scope="function")  # default — new per test
def account():
    return BankAccount("Alice", 100.0)

@pytest.fixture(scope="module")   # shared across all tests in file
def db_connection():
    conn = setup_db()
    yield conn           # "yield" fixtures support teardown
    conn.close()         # teardown — runs after all tests in module
```

`yield` fixtures are useful for setup/teardown:
```python
@pytest.fixture
def temp_shop(tmp_path):
    shop = Shop("Test")
    shop.add_product(Product("Apple", 1.99, 101))
    yield shop
    # teardown: nothing needed — tmp_path is cleaned automatically
```

= `conftest.py`

== Shared fixtures

Create `tests/conftest.py` — fixtures here are available to *all test files* in the folder:

```python
# tests/conftest.py
import pytest
from bank_account import BankAccount
from product import Product
from shop import Shop

@pytest.fixture
def account():
    return BankAccount("Alice", 100.0)

@pytest.fixture
def product():
    return Product("Apple", 1.99, 101)

@pytest.fixture
def populated_shop():
    shop = Shop("Test Shop")
    shop.add_product(Product("Apple",  1.99, 101))
    shop.add_product(Product("Bread",  2.50, 102))
    shop.add_product(Product("Milk",   1.20, 103))
    return shop
```

= `@pytest.mark.parametrize`

== Test multiple inputs with one function

```python
import pytest
from product import Product

@pytest.mark.parametrize("name, price, pid", [
    ("Apple",  1.99, 101),
    ("Bread",  2.50, 102),
    ("Milk",   1.20, 103),
])
def test_product_creation(name, price, pid):
    p = Product(name, price, pid)
    assert p.get_name()         == name
    assert p.get_price()        == price
    assert p.get_product_id()   == pid
```

This runs 3 tests automatically — one per row.

= Testing Exceptions with `pytest.raises`

```python
import pytest
from product import Product

def test_negative_price_raises():
    with pytest.raises(ValueError):
        Product("Apple", -1.0, 101)

def test_zero_price_raises():
    with pytest.raises(ValueError):
        Product("Apple", 0.0, 101)

# Check the error message
def test_negative_price_message():
    with pytest.raises(ValueError, match="greater than 0"):
        Product("Apple", -1.0, 101)
```

= Code Coverage Overview

```bash
# Install
pip install pytest-cov

# Run with coverage
pytest --cov=. --cov-report=term-missing
```

Output:
```
Name            Stmts   Miss  Cover   Missing
---------------------------------------------
product.py         28      2    93%   45, 52
bank_account.py    18      0   100%
---------------------------------------------
TOTAL              46      2    96%
```

- Aim for > 80% coverage
- Lines 45 and 52 are not tested — write tests for them!
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
