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
    subtitle: [List Methods],
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

= Adding Items

```python
numbers = [1, 2, 3]

# append(item) — add one item to the END
numbers.append(4)
print(numbers)   # [1, 2, 3, 4]

# extend(iterable) — add all items from another iterable
numbers.extend([5, 6, 7])
print(numbers)   # [1, 2, 3, 4, 5, 6, 7]

# insert(index, item) — insert at a specific position
numbers.insert(0, 0)     # insert 0 at position 0
print(numbers)   # [0, 1, 2, 3, 4, 5, 6, 7]

numbers.insert(4, 99)    # insert 99 at position 4
print(numbers)   # [0, 1, 2, 3, 99, 4, 5, 6, 7]
```

= Removing Items

```python
fruits = ["apple", "banana", "cherry", "banana", "date"]

# remove(value) — removes FIRST occurrence of value
fruits.remove("banana")
print(fruits)   # ['apple', 'cherry', 'banana', 'date']

# pop(index) — removes AND returns item at index
last = fruits.pop()       # no index = last item
print(last)     # date
print(fruits)   # ['apple', 'cherry', 'banana']

second = fruits.pop(1)    # remove at index 1
print(second)   # cherry

# clear() — removes ALL items
numbers = [1, 2, 3, 4, 5]
numbers.clear()
print(numbers)  # []
```

= Sorting and Reversing

```python
numbers = [5, 2, 8, 1, 9, 3]

# sort() — sorts IN PLACE (modifies the list)
numbers.sort()
print(numbers)              # [1, 2, 3, 5, 8, 9]

numbers.sort(reverse=True)  # descending
print(numbers)              # [9, 8, 5, 3, 2, 1]

# reverse() — reverses IN PLACE
numbers.reverse()
print(numbers)              # [1, 2, 3, 5, 8, 9]
```

#pause

```python
# sorted() — returns a NEW sorted list (original unchanged)
words = ["banana", "apple", "cherry", "date"]
sorted_words = sorted(words)
print(words)         # ['banana', 'apple', 'cherry', 'date']
print(sorted_words)  # ['apple', 'banana', 'cherry', 'date']

# Sort by string length
by_length = sorted(words, key=len)
print(by_length)     # ['date', 'apple', 'banana', 'cherry']
```

= Searching

```python
fruits = ["apple", "banana", "cherry", "banana", "apple"]

# count(value) — how many times value appears
print(fruits.count("banana"))   # 2
print(fruits.count("grape"))    # 0

# index(value) — position of FIRST occurrence
print(fruits.index("cherry"))   # 2
print(fruits.index("banana"))   # 1  (first banana)

# Searching safely
def find_item(lst, value):
    if value in lst:
        return lst.index(value)
    return -1

print(find_item(fruits, "apple"))   # 0
print(find_item(fruits, "grape"))   # -1
```

= Copying Lists

```python
original = [1, 2, 3, 4, 5]

# WRONG — this creates an alias, not a copy!
alias = original
alias.append(99)
print(original)  # [1, 2, 3, 4, 5, 99]  — original changed!

# Correct ways to copy
copy1 = original.copy()     # method
copy2 = original[:]         # slice
copy3 = list(original)      # constructor

copy1.append(100)
print(original)  # unchanged
print(copy1)     # [1, 2, 3, 4, 5, 99, 100]
```

= All List Methods Summary

#table(
  columns: (auto, 1fr),
  inset: 8pt,
  fill: (col, row) => if col == 0 { rgb("#fed7aa") } else { white },
  [*Method*], [*Description*],
  [`append(x)`], [Add x to end],
  [`extend(it)`], [Add all items from iterable],
  [`insert(i, x)`], [Insert x at position i],
  [`remove(x)`], [Remove first occurrence of x],
  [`pop(i)`], [Remove and return item at i (default: last)],
  [`clear()`], [Remove all items],
  [`sort()`], [Sort in place],
  [`reverse()`], [Reverse in place],
  [`index(x)`], [Return index of first x],
  [`count(x)`], [Count occurrences of x],
  [`copy()`], [Return a shallow copy],
)

= Practical Example — To-Do List

```python
def show_todos(todos):
    if not todos:
        print("No tasks!")
        return
    for i, task in enumerate(todos, start=1):
        print(f"  {i}. {task}")

todos = []

while True:
    print("\n1. Add task  2. Remove task  3. Show tasks  4. Quit")
    choice = input("Choice: ")

    if choice == "1":
        task = input("Task: ").strip()
        todos.append(task)
    elif choice == "2":
        show_todos(todos)
        idx = int(input("Remove task number: ")) - 1
        if 0 <= idx < len(todos):
            removed = todos.pop(idx)
            print(f"Removed: {removed}")
    elif choice == "3":
        show_todos(todos)
    elif choice == "4":
        break
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
