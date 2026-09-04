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
    subtitle: [is-a vs has-a Relationships],
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

= is-a vs has-a

== Two fundamental object relationships

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Relationship*], [*Meaning*], [*Implementation*],
  [is-a], [Child *is a type of* parent], [Inheritance],
  [has-a], [Class *contains* another class], [Composition],
)

#v(1em)
Examples:
- A `PremiumMember` *is-a* `Person` → Inheritance
- A `Shop` *has-a* list of `Products` → Composition
- A `Car` *has-a* `Engine` → Composition (not inheritance!)

= `isinstance()` and `issubclass()`

```python
alice = PremiumMember("Alice", "alice@example.com", "Gold")

isinstance(alice, PremiumMember)  # True
isinstance(alice, Person)         # True  ← also a Person!
isinstance(alice, FreeUser)       # False

issubclass(PremiumMember, Person)    # True
issubclass(FreeUser, Person)         # True
issubclass(Person, PremiumMember)    # False (wrong direction)
```

`isinstance` is very useful for type checking in functions:
```python
def process(user):
    if isinstance(user, PremiumMember):
        grant_premium_access()
```

= Composition Example

```python
class Engine:
    def __init__(self, horsepower: int):
        self.__hp = horsepower
    def start(self): return "Vroom!"

class Car:
    def __init__(self, make: str, hp: int):
        self.__make = make
        self.__engine = Engine(hp)   # has-a Engine

    def drive(self):
        return self.__engine.start()
```

`Car` does NOT inherit from `Engine`. It *contains* an `Engine`. This is composition.

= When to Use Inheritance

Use inheritance when:
- The is-a relationship is genuine and stable
- The child class really is a more specific version of the parent
- You want the child to be usable anywhere the parent is used

Avoid inheritance when:
- The relationship is really has-a
- You're inheriting just to reuse methods (use composition instead)
- The hierarchy would become deep and confusing

#v(.5em)
*"Favour composition over inheritance"* — classic OOP advice

= Practical Examples

```python
# Good use of inheritance
class Animal: pass
class Dog(Animal): pass     # Dog is-a Animal ✓
class Cat(Animal): pass     # Cat is-a Animal ✓

# Bad use of inheritance
class Car: pass
class Engine(Car): pass     # Engine is NOT a Car ✗
# Better:
class Car:
    def __init__(self):
        self.__engine = Engine()  # has-a Engine ✓
```

= Using `isinstance` for Safe Processing

```python
def print_user_info(user: Person):
    print(f"Name: {user.get_name()}")
    print(f"Email: {user.get_email()}")

    if isinstance(user, PremiumMember):
        print(f"Plan: {user.get_subscription()}")
    elif isinstance(user, FreeUser):
        print(f"Post limit: {user.get_max_posts()}")

# Works for any subclass of Person
for user in all_users:
    print_user_info(user)
    print("---")
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
