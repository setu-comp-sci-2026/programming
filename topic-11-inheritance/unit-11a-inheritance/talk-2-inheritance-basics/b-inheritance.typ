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
    subtitle: [Inheritance Basics],
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

= What is Inheritance?

== Reusing and extending classes

Inheritance lets a *child class* (subclass) receive all the attributes and methods of a *parent class* (superclass), then add or change them.

#v(.5em)
Think of it as: "A PremiumMember *is-a* Person."

```
Person
├── FreeUser
└── PremiumMember
```

Benefits:
- Avoid repeating code in every subclass
- Model real-world hierarchies naturally
- Supports polymorphism

= Python Syntax

```python
class Person:                    # parent / superclass
    def __init__(self, name: str, email: str):
        self.__name = name
        self.__email = email

    def get_name(self):  return self.__name
    def get_email(self): return self.__email

    def __str__(self) -> str:
        return f"Person: {self.__name} <{self.__email}>"


class FreeUser(Person):          # child / subclass
    pass                         # inherits everything from Person
```

`class FreeUser(Person):` — the `(Person)` part declares the parent.

= Inherited Attributes and Methods

```python
class FreeUser(Person):
    pass

# FreeUser inherits __init__, get_name, get_email, __str__
user = FreeUser("Alice", "alice@example.com")
print(user.get_name())    # Alice
print(user.get_email())   # alice@example.com
print(user)               # Person: Alice <alice@example.com>
```

Even though `FreeUser` has no code of its own, it behaves like a `Person`.

= Adding Attributes in a Subclass

```python
class PremiumMember(Person):
    def __init__(self, name: str, email: str,
                 subscription: str):
        super().__init__(name, email)     # call parent __init__
        self.__subscription = subscription

    def get_subscription(self) -> str:
        return self.__subscription

    def __str__(self) -> str:
        return (f"PremiumMember: {self.get_name()} "
                f"[{self.__subscription}]")
```

`super().__init__(name, email)` calls the *parent* constructor to set up the inherited attributes.

= The Social Network Example

```
Person
 ├── name
 ├── email
 ├── get_name() / get_email()
 └── __str__()
       │
       ├── FreeUser(Person)
       │     └── max_posts: int
       │
       └── PremiumMember(Person)
             └── subscription: str (Gold/Platinum)
```

= Overriding Methods

```python
class FreeUser(Person):
    def __init__(self, name: str, email: str,
                 max_posts: int = 10):
        super().__init__(name, email)
        self.__max_posts = max_posts

    def __str__(self) -> str:
        return (f"FreeUser: {self.get_name()} "
                f"(max {self.__max_posts} posts/month)")

p = FreeUser("Bob", "bob@example.com", 5)
print(p)
# FreeUser: Bob (max 5 posts/month)
```

The child's `__str__` *overrides* the parent's — the child version is called instead.

= Using the Classes

```python
from person import Person
from free_user import FreeUser
from premium_member import PremiumMember

users = [
    FreeUser("Alice", "alice@example.com", 10),
    PremiumMember("Bob", "bob@example.com", "Gold"),
    FreeUser("Carol", "carol@example.com", 5),
]

for user in users:
    print(user)        # calls each class's own __str__
    print(user.get_email())   # inherited from Person
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

