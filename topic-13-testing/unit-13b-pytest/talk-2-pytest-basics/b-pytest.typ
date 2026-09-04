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
    subtitle: [pytest Basics],
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

= Installing pytest

```bash
pip install pytest
```

Or inside a virtual environment:
```bash
python -m pip install pytest

# Verify installation
pytest --version
```

In VS Code: open the Command Palette, search "Python: Configure Tests", select pytest, choose your test folder.

= Naming Conventions

pytest uses *discovery* — it automatically finds tests if you follow the conventions:

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Convention*], [*Example*],
  [Test files start with `test_`], [`test_product.py`],
  [Test functions start with `test_`], [`test_valid_price()`],
  [Test classes start with `Test`], [`TestProduct`],
)

Typical folder structure:
```
lab13/
├── product.py
├── bank_account.py
└── tests/
    ├── test_product.py
    └── test_bank_account.py
```

= The `assert` Statement

```python
# assert checks that a condition is True
# If False, the test FAILS with an AssertionError

assert 1 + 1 == 2             # passes
assert "hello".upper() == "HELLO"  # passes

assert [1, 2, 3][1] == 2      # passes
assert isinstance(42, int)    # passes

# Failing assert — with optional message
value = compute_something()
assert value > 0, f"Expected positive, got {value}"
```

= Writing Your First Tests

```python
# tests/test_product.py
from product import Product

def test_product_name():
    p = Product("Apple", 1.99, 101)
    assert p.get_name() == "Apple"

def test_product_price():
    p = Product("Apple", 1.99, 101)
    assert p.get_price() == 1.99

def test_product_id():
    p = Product("Apple", 1.99, 101)
    assert p.get_product_id() == 101

def test_product_str():
    p = Product("Apple", 1.99, 101)
    assert str(p) == "Product [101]: Apple — €1.99"
```

= Running pytest

From the terminal (in your project folder):

```bash
# Run all tests
pytest

# Run a specific file
pytest tests/test_product.py

# Verbose output (shows each test name)
pytest -v

# Short traceback
pytest --tb=short
```

= Reading pytest Output

```
========== test session starts ==========
collected 4 items

tests/test_product.py::test_product_name PASSED   [25%]
tests/test_product.py::test_product_price PASSED  [50%]
tests/test_product.py::test_product_id PASSED     [75%]
tests/test_product.py::test_product_str FAILED    [100%]

=========== FAILURES ============
test_product_str - AssertionError:
  assert 'Product [101]: Apple — €1.99' ==
         'Product [101]: Apple - €1.99'
         ← em dash vs hyphen!
```

= Testing Validation

```python
import pytest
from product import Product

def test_invalid_price_raises_value_error():
    with pytest.raises(ValueError):
        Product("Apple", -1.0, 101)

def test_zero_price_raises_value_error():
    with pytest.raises(ValueError):
        Product("Apple", 0.0, 101)

def test_empty_name_raises_value_error():
    with pytest.raises(ValueError):
        Product("", 1.99, 101)

def test_whitespace_name_raises_value_error():
    with pytest.raises(ValueError):
        Product("   ", 1.99, 101)
```

= Testing the BankAccount

```python
from bank_account import BankAccount

def test_initial_balance():
    account = BankAccount("Alice", 100.0)
    assert account.get_balance() == 100.0

def test_deposit():
    account = BankAccount("Alice", 100.0)
    account.deposit(50.0)
    assert account.get_balance() == 150.0

def test_withdraw():
    account = BankAccount("Alice", 100.0)
    account.withdraw(30.0)
    assert account.get_balance() == 70.0

def test_overdraft_raises():
    account = BankAccount("Alice", 50.0)
    with pytest.raises(ValueError):
        account.withdraw(100.0)
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

