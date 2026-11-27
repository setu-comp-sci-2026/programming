#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Final Week — Testing and Pytest], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [Today: Can We Trust Our Code?])[
- A program runs without crashing. Does that mean it is correct?
- We have built classes, menus, rules and persistent storage.
- Today we learn how to gather evidence that our code behaves as intended.
- Testing is part of development, not just something we do at the end.
]

#slide(title: [Starter Poll: Is This Bank Working?])[
```python
account = BankAccount("A001", "Alice", 100)
account.withdraw(150)
```
What should happen?
- A: Balance becomes negative.
- B: Withdrawal is rejected and balance stays at 100.
- C: Account is deleted.

*The specification tells us what correct means.*
]

#slide(title: [What Is Software Testing?])[
Testing is the process of checking software behaviour against expected behaviour.
#block(fill: rgb("#eaf2ff"), inset: 12pt, radius: 6pt)[
  #align(center)[Input → Execute code → Actual result → Compare with expected result]
]
- A test passes when its checks succeed.
- A failed test provides evidence of a problem with the code, test or assumptions.
- Passing tests do not prove that there are no bugs.
]

#slide(title: [Why Do We Test?])[
- Find defects before users encounter them.
- Check requirements and business rules.
- Build confidence when refactoring or adding features.
- Prevent old bugs from returning (regression testing).
- Document what we expect our code to do.

*Would you trust an AI-generated change to your bank without testing it?*
]

#slide(title: [Where Testing Fits])[
#align(center)[Requirements → Design → Code → Test → Review → Improve]
- Decide expected behaviour before writing a test.
- Run tests throughout development, not just before release.
- When a defect is found, investigate, fix and retest.
- Keep useful tests so that future changes can be checked again.
]

#slide(title: [Testing and Debugging Are Different])[
#grid(columns: (1fr, 1fr), gutter: 15pt,
  block(fill: rgb("#eaf2ff"), inset: 12pt)[*Testing*

Does the code behave as expected?

Example: withdrawal test fails.],
  block(fill: rgb("#e6f7ef"), inset: 12pt)[*Debugging*

Why does the code behave incorrectly?

Example: inspect the balance and withdrawal condition.],
)
Use the debugger we covered earlier to investigate a failing test.
]

#slide(title: [Different Levels of Testing])[
#table(columns: (1fr, 2fr), inset: 7pt,
  [*Level*], [*Example*],
  [Unit], [Test one BankAccount method in isolation.],
  [Integration], [Check Bank and JSON storage work together.],
  [System], [Run the complete menu-driven application.],
  [Acceptance], [Check the system meets the user's requirements.],
)
Today our main focus is automated unit testing.
]

#slide(title: [Manual and Automated Testing])[
- Manual: enter values in the menu and inspect the output.
- Automated: write code that executes and checks another piece of code.
- Manual testing is useful for exploring usability and unexpected interactions.
- Automated tests are repeatable and fast to rerun.
- Both approaches are useful; neither replaces the other.
]

#slide(title: [Design a Test Before Coding])[
#table(columns: (1.3fr, 1fr, 1.5fr), inset: 6pt,
 [*Scenario*], [*Input*], [*Expected*],
 [Normal withdrawal], [40 from 100], [Balance 60],
 [Boundary], [100 from 100], [Balance 0],
 [Too much], [101 from 100], [ValueError],
 [Invalid amount], [0 or -1], [ValueError],
)
For rejected withdrawals, also check that the balance remains unchanged.
]

#slide(title: [Activity: Design Tests for a Rule])[
A rule requires power to be on AND the display to be off.
#table(columns: (1fr, 1fr, 1fr), [*Power*], [*Display*], [*Expected match?*], [yes], [no], [?], [yes], [yes], [?], [no], [no], [?], [missing], [no], [?])
Use the chat to suggest expected results. Why test a missing answer?
]

#slide(title: [Activity Answers])[
#table(columns: (1fr, 1fr, 1fr), [*Power*], [*Display*], [*Expected*], [yes], [no], [True], [yes], [yes], [False], [no], [no], [False], [missing], [no], [False])
- All required conditions must match.
- A missing key returns None with `answers.get(key)`.
- A rule with no conditions matches automatically in our current implementation; decide whether that is intended.
]

#slide(title: [Our Testing Toolkit])[
- `assert`: a Python statement for checking a condition.
- `unittest`: testing framework included with Python.
- `pytest`: third-party framework with simple test functions and useful failure reports.
- VS Code Testing view: discover and run tests using the Python extension.

We will use pytest today. Documentation: #link("https://docs.pytest.org/")[docs.pytest.org].
]

#slide(title: [Install Pytest])[
```sh
python -m pip install pytest
python -m pytest --version
```
- Run commands in the terminal, not inside a Python file.
- On macOS/Linux use `python3` if that is your interpreter command.
- Select the correct interpreter in VS Code.
- Next lecture: a deeper look at pip and libraries.
]

#slide(title: [A First Assertion])[
```python
def add(a, b):
    return a + b

assert add(2, 3) == 5
```
- If the expression is true, execution continues.
- If false, Python raises AssertionError.
- Assertions are for checking expectations, not validating user input in production code.
]

#slide(title: [Our First Pytest Test])[
```python
from bank_account import BankAccount

def test_deposit():
    account = BankAccount("A001", "Alice", 100)
    account.deposit(50)
    assert account.balance == 150
```
Save in `test_bank_account.py`. No test class is required.
]

#slide(title: [Arrange, Act, Assert])[
```python
def test_deposit():
    # Arrange: prepare the object
    account = BankAccount("A001", "Alice", 100)
    # Act: perform the operation
    account.deposit(50)
    # Assert: check the outcome
    assert account.balance == 150
```
Each test should have a clear purpose and independent starting state.
]

#slide(title: [Run and Discover Tests])[
```sh
python -m pytest -v
python -m pytest test_bank_account.py -v
```
- Run from the project folder.
- Name files `test_*.py` and functions `test_*`.
- Pytest discovers tests and reports pass/fail results.
- VS Code: Python: Configure Tests → pytest → project folder.
]

#slide(title: [Read a Failure Report])[
#text(size: 15pt)[Illustrative output after deliberately breaking deposit:]
```text
FAILED test_bank_account.py::test_deposit
    assert account.balance == 150
E   assert 100 == 150
```
- Expected: 150; actual: 100.
- Read the failing assertion and traceback.
- Investigate the implementation, then restore it and rerun.
- Do not change the expected result simply to make the test pass.
]

#slide(title: [Test a Boundary])[
```python
def test_withdraw_entire_balance():
    account = BankAccount("A001", "Alice", 100)
    account.withdraw(100)
    assert account.balance == 0
```
Why is withdrawing exactly the available balance a useful boundary case?
]

#slide(title: [Testing Exceptions])[
```python
import pytest

def test_overdraw():
    account = BankAccount("A001", "Alice", 100)
    with pytest.raises(ValueError):
        account.withdraw(101)
    assert account.balance == 100
```
The test fails if the expected exception is not raised. Also check that rejected operations do not alter state.
]

#slide(title: [Testing Properties])[
```python
def test_blank_name():
    account = BankAccount("A001", "Alice", 100)
    with pytest.raises(ValueError):
        account.name = "   "
    assert account.name == "Alice"
```
Test the public property rather than `_name`. The implementation may change later.
]

#slide(title: [Testing Our Bank Collection])[
```python
from bank import Bank

def test_duplicate_account():
    bank = Bank()
    account = BankAccount("A001", "Alice", 100)
    assert bank.add_account(account) is True
    assert bank.add_account(account) is False
    assert len(bank.accounts) == 1
```
Test the return value AND the resulting collection.
]

#slide(title: [Testing Our Expert System])[
```python
from rule import Rule

def test_rule_matches():
    rule = Rule({"power_on": "yes",
                 "display_on": "no"}, "Check monitor")
    answers = {"power_on": "yes", "display_on": "no"}
    assert rule.matches(answers) is True
```
No menu, input or JSON file is needed to test this logic.
]

#slide(title: [A Negative Rule Test])[
```python
def test_rule_missing_answer():
    rule = Rule({"power_on": "yes",
                 "display_on": "no"}, "Check monitor")
    assert rule.matches({"power_on": "yes"}) is False
```
What would happen if `matches()` returned True inside its loop?
]

#slide(title: [Testing the Recommendation Engine])[
```python
from troubleshooter import Troubleshooter

def test_recommendation():
    system = Troubleshooter()
    system.rules.append(Rule({"power_on": "no"},
                             "Check cable"))
    assert system.recommend({"power_on": "no"}) == "Check cable"
```
Also test no matching rule and overlapping rules (first match wins).
]

#slide(title: [Live Coding Challenge])[
- Write a test for a negative deposit.
- Write a test for finding a missing account.
- Write a test for a rule with one incorrect answer.
- Run the tests; deliberately introduce one bug and rerun.
- Restore the code and confirm the tests pass.

Use the chat to explain what each test proves.
]

#slide(title: [Assignment 2: What Should I Test?])[
- Matching rules: all conditions match, one fails, missing answer.
- Recommendation: first match, no match, overlapping rules.
- CRUD: duplicates, missing keys, invalid updates.
- Persistence: save/load round trip and missing or damaged files (use temporary test files, not real data).
- Menu: manually test invalid choices and complete consultations.

Choose tests that reflect your own requirements.
]

#slide(title: [Takeaway: Own Your Solution])[
- Tests help you evaluate suggested changes, including AI-generated code.
- A passing test suite is evidence, not a guarantee.
- Keep tests small, meaningful and repeatable.
- Understand why each test exists and what it checks.

*Working code is a starting point. Tested, understood code is a stronger solution.*
]
