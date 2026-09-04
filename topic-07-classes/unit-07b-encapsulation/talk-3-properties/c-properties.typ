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
    subtitle: [Properties — \@property],
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

= The Problem with Getters and Setters

Traditional getter/setter methods work, but they are verbose:

```python
p = Person("Alice", 25)
print(p.get_name())          # getter — verbose
p.set_age(26)                # setter — verbose
```

Python offers a more *Pythonic* solution: the `@property` decorator.

```python
# With @property, this is equivalent:
print(p.name)    # reads like a normal attribute
p.age = 26       # writes like a normal attribute
                 # but validation still runs!
```

#pause

`@property` lets you expose getter/setter logic using *attribute-style access*. The caller doesn't even know validation is happening.

= The \@property Decorator — Getter

```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age  = age

    @property
    def name(self):
        """The person's name (read-only in this version)."""
        return self._name

    @property
    def age(self):
        """The person's age."""
        return self._age

p = Person("Alice", 25)
print(p.name)    # Alice   (no parentheses — accessed like an attribute)
print(p.age)     # 25

# p.name = "Bob"   # AttributeError — no setter defined yet
```

= The \@x.setter Decorator

Define a setter by using `@property_name.setter`.

```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age  = None
        self.age   = age    # use the setter even in __init__

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self, value):
        """Validate and set age."""
        if not isinstance(value, int):
            raise ValueError("Age must be an integer")
        if value < 0 or value > 150:
            raise ValueError(f"Age must be 0-150, got {value}")
        self._age = value

p = Person("Alice", 25)
print(p.age)     # 25
p.age = 26       # calls the setter
print(p.age)     # 26

try:
    p.age = -5   # raises ValueError
except ValueError as e:
    print(f"Error: {e}")
```

= Computed Properties

A property can *compute* its value on the fly from other attributes.

```python
class Rectangle:
    def __init__(self, width, height):
        self._width  = width
        self._height = height

    @property
    def width(self): return self._width

    @property
    def height(self): return self._height

    @property
    def area(self):
        """Computed — no storage needed."""
        return self._width * self._height

    @property
    def perimeter(self):
        return 2 * (self._width + self._height)

    @property
    def is_square(self):
        return self._width == self._height

r = Rectangle(4, 6)
print(r.area)       # 24  — looks like an attribute, computed from w*h
print(r.perimeter)  # 20
print(r.is_square)  # False
```

= BankAccount with \@property

```python
class BankAccount:
    def __init__(self, account_no, name, initial_balance=0):
        self._account_no = account_no
        self._name       = name
        self._balance    = 0
        self.balance     = initial_balance   # use setter

    @property
    def account_no(self):
        return self._account_no    # read-only (no setter)

    @property
    def name(self):
        return self._name

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

= Using BankAccount with Properties

```python
acc = BankAccount("ACC001", "Alice Murphy", 1000)

# Attribute-style access — clean and readable
print(acc.balance)          # 1000
print(acc.name)             # Alice Murphy
print(acc.account_no)       # ACC001

# Set via property (validation runs automatically)
acc.name = "Alice Smith"
print(acc.name)             # Alice Smith

# These raise ValueError:
try:
    acc.balance = -500      # caught by setter
except ValueError as e:
    print(f"Error: {e}")

try:
    acc.account_no = "NEW"  # no setter — AttributeError
except AttributeError as e:
    print(f"Error: {e}")
```

= \@property — The Full Picture

Three decorators work together:

```python
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius

    @property
    def celsius(self):
        """Getter — read the temperature."""
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        """Setter — validate before storing."""
        if value < -273.15:
            raise ValueError("Below absolute zero")
        self._celsius = value

    @celsius.deleter
    def celsius(self):
        """Deleter — called when: del obj.celsius"""
        print("Deleting temperature...")
        del self._celsius

    @property
    def fahrenheit(self):
        """Computed read-only property."""
        return self._celsius * 9/5 + 32

t = Temperature(100)
print(t.celsius)        # 100
print(t.fahrenheit)     # 212.0
t.celsius = 0
print(t.fahrenheit)     # 32.0
del t.celsius           # calls deleter
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