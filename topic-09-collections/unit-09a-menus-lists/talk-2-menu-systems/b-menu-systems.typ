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
    subtitle: [Menu-Driven Systems],
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

= What is a Menu-Driven System?

== User-facing control loop

A menu-driven system:
- Presents a numbered list of options
- Reads the user's choice
- Executes the corresponding action
- Repeats until the user quits

#v(.5em)
This is the *interaction model* for most CLI applications — your Shop app, a student grade system, a contact book, etc.

= The Basic Menu Loop

```python
def show_menu():
    print("\n=== Main Menu ===")
    print("1. Add item")
    print("2. List items")
    print("3. Remove item")
    print("0. Exit")

def main():
    running = True
    while running:
        show_menu()
        choice = input("Enter choice: ").strip()
        if choice == "1":
            add_item()
        elif choice == "2":
            list_items()
        elif choice == "3":
            remove_item()
        elif choice == "0":
            running = False
        else:
            print("Invalid choice — try again.")
```

= The `match` Pattern (Python 3.10+)

== Cleaner than long if/elif chains

```python
def main():
    while True:
        show_menu()
        choice = input("Enter choice: ").strip()
        match choice:
            case "1":
                add_item()
            case "2":
                list_items()
            case "3":
                remove_item()
            case "0":
                print("Goodbye!")
                break
            case _:
                print("Invalid choice — try again.")
```

`case _:` is the "default" — it matches anything not caught above.

= Getting Valid Input

== Defensive input reading

```python
def get_int_input(prompt: str, min_val: int, max_val: int) -> int:
    while True:
        try:
            value = int(input(prompt))
            if min_val <= value <= max_val:
                return value
            print(f"Please enter a number between {min_val} and {max_val}")
        except ValueError:
            print("Invalid input — please enter a whole number")

# Usage
choice = get_int_input("Choose (0-4): ", 0, 4)
```

= Getting Float Input

```python
def get_float_input(prompt: str, min_val: float = 0.0) -> float:
    while True:
        try:
            value = float(input(prompt))
            if value > min_val:
                return value
            print(f"Value must be greater than {min_val}")
        except ValueError:
            print("Invalid input — please enter a number")

# Usage in add product:
price = get_float_input("Enter price (>0): ")
```

= Menu-Driven System Pattern Summary

#align(center)[
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Component*], [*Responsibility*],
  [`show_menu()`], [Print the numbered options],
  [`get_int_input()`], [Safe validated integer input],
  [`while True` / `running`], [Keep looping until user quits],
  [`match` / `if-elif`], [Dispatch to the right function],
  [Action functions], [add, list, find, remove, update],
)
]

= Full Main Loop Example

```python
from shop import Shop

def main():
    shop = Shop("My Shop")
    running = True
    while running:
        show_menu()
        choice = input("Choice: ").strip()
        match choice:
            case "1": add_product_menu(shop)
            case "2": shop.display_all()
            case "3": find_product_menu(shop)
            case "4": remove_product_menu(shop)
            case "0":
                print("Goodbye!")
                running = False
            case _:
                print("Unknown option.")

if __name__ == "__main__":
    main()
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
