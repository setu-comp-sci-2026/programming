#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Revision — Python Properties and Encapsulation], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [Revision: Properties — What We Will Revisit])[
- Why traditional getter and setter methods can feel verbose.
- `@property` getters and `@name.setter` validation.
- Computed properties: area, perimeter and `is_square`.
- Applying properties to `BankAccount`.
- The full picture: setter, deleter and computed conversion.

*Based on the previous Properties lecture — not new OO CRUD material.*
]

#slide(title: [Recall: Getters and Setters])[
Traditional access uses methods:
```python
p = Person("Alice", 25)
print(p.get_name())
p.set_age(26)
```
With properties, callers use attribute-style syntax:
```python
print(p.name)
p.age = 26
```
*Question:* Why might the second style be easier to read?
]

#slide(title: [A Property Looks Like an Attribute])[
- `@property` makes a method available through attribute-style access.
- `p.age` calls the getter — *no parentheses*.
- Without a setter, `p.age = 26` raises `AttributeError`.
- A property can be read-only, writable, or computed.

*Predict:* Is `p.age()` correct if `age` is a property?
]

#slide(title: [Person: Property Getters])[
```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age = age

    @property
    def name(self):
        return self._name

    @property
    def age(self):
        return self._age
```
- `_name` and `_age` hold the underlying values.
- The underscore signals *internal use by convention*.
]

#slide(title: [Check Your Understanding: Read-only])[
```python
p = Person("Alice", 25)
print(p.name)
print(p.age)
p.name = "Bob"
```
- What are the first two outputs?
- What happens on the final line?
- Why does the class need a setter to allow assignment?

*Answer:* `Alice`, `25`, then `AttributeError` (no setter).
]

#slide(title: [Adding a Setter])[
```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age = None
        self.age = age  # invokes the setter

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self, value):
        if not isinstance(value, int):
            raise ValueError("Age must be an integer")
        if value < 0 or value > 150:
            raise ValueError("Age must be 0-150")
        self._age = value
```
]

#slide(title: [Trace: What Happens When We Assign?])[
```python
p = Person("Alice", 25)
print(p.age)   # 25
p.age = 26     # calls the setter
print(p.age)   # 26
p.age = -5     # raises ValueError
```
- The setter runs *automatically* on `p.age = ...`.
- Invalid data is rejected *before* updating `_age`.
- What value remains stored after the failed assignment?
]

#slide(title: [Handling Validation Errors])[
```python
try:
    p.age = -5
except ValueError as e:
    print(f"Error: {e}")
```
- The class *raises* the exception.
- Calling code *catches* it.
- The setter keeps the object's data valid.

*Ask:* Why is `print("Invalid age")` alone not enough?
]

#slide(title: [Computed Properties])[
A property does not have to store a separate value.
```python
class Rectangle:
    def __init__(self, width, height):
        self._width = width
        self._height = height

    @property
    def area(self):
        return self._width * self._height
```
- `area` is calculated when it is accessed.
- No separate `_area` attribute is required.
]

#slide(title: [Rectangle: Three Computed Results])[
```python
@property
def area(self):
    return self._width * self._height

@property
def perimeter(self):
    return 2 * (self._width + self._height)

@property
def is_square(self):
    return self._width == self._height
```
*Assume these methods are inside `Rectangle`.*
]

#slide(title: [Prediction: Rectangle])[
```python
r = Rectangle(4, 6)
print(r.area)
print(r.perimeter)
print(r.is_square)
```
- Predict the three outputs before running.
- What changes for `Rectangle(5, 5)`?

*Answers:* `24`, `20`, `False`; for 5 × 5: `25`, `20`, `True`.
]

#slide(title: [BankAccount: Bringing It Together])[
```python
class BankAccount:
    def __init__(self, account_no, name,
                 initial_balance=0):
        self._account_no = account_no
        self._name = name
        self._balance = 0
        self.balance = initial_balance  # setter

    @property
    def account_no(self):
        return self._account_no

    @property
    def name(self):
        return self._name
```
- `account_no` has *no setter* — read-only.
- The opening balance is checked via its setter.
]

#slide(title: [BankAccount: Name and Balance])[
```python
@name.setter
def name(self, value):
    if not value.strip():
        raise ValueError("Name cannot be blank")
    self._name = value.strip()

@property
def balance(self):
    return self._balance

@balance.setter
def balance(self, value):
    if value < 0:
        raise ValueError("Balance cannot be negative")
    self._balance = value
```
*These methods belong inside the BankAccount class.*
]

#slide(title: [BankAccount: What Is Allowed?])[
```python
acc = BankAccount("ACC001", "Alice Murphy", 1000)
print(acc.account_no)
print(acc.name)
print(acc.balance)
acc.name = "Alice Smith"
```
- Reading properties looks like reading ordinary attributes.
- Updating `name` automatically calls its setter.
- What happens if the new name is just spaces?
]

#slide(title: [BankAccount: What Is Rejected?])[
```python
try:
    acc.balance = -500
except ValueError as e:
    print(f"Error: {e}")

try:
    acc.account_no = "NEW"
except AttributeError as e:
    print(f"Error: {e}")
```
- Negative balance: `ValueError` from setter.
- Account number assignment: `AttributeError` (no setter).
]

#slide(title: [The Full Picture: Getter, Setter, Deleter])[
```python
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius

    @property
    def celsius(self):
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("Below absolute zero")
        self._celsius = value
```
- The setter validates temperatures before storing them.
]

#slide(title: [Deleter and Computed Fahrenheit])[
```python
@celsius.deleter
def celsius(self):
    print("Deleting temperature...")
    del self._celsius

@property
def fahrenheit(self):
    return self._celsius * 9 / 5 + 32
```
- `del t.celsius` calls the deleter.
- `t.fahrenheit` calculates a value without storing it.
- These methods are inside the `Temperature` class.
]

#slide(title: [Trace the Temperature Example])[
```python
t = Temperature(100)
print(t.celsius)       # 100
print(t.fahrenheit)    # 212.0
t.celsius = 0
print(t.fahrenheit)    # 32.0
del t.celsius          # invokes deleter
```
- What would happen if we tried to read `t.celsius` after deletion?
- What would happen if we assigned `t.celsius = -300`?
]

#slide(title: [Quick Revision Quiz])[
1. Why do we write `p.age` instead of `p.age()`?
2. What does `@age.setter` do?
3. Why might a property have *no setter*?
4. What is the difference between `_balance` and `balance`?
5. Which exception does a negative balance raise?
6. How does a computed property differ from stored data?
]

#slide(title: [Revision Recap — Ready for OO CRUD])[
- A `BankAccount` is responsible for its *own* valid state.
- Properties let code use clean attribute-style access with validation.
- `account_no` is read-only; `name` and `balance` have setters.
- Computed properties derive values on demand.

*Next:* Keep the existing `BankAccount` class. Add a separate `Bank` class to manage *many* account objects.
]

