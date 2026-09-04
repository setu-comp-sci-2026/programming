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
    subtitle: [Sets and Frozensets],
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

= What is a Set?

== Unordered collection of unique values

```python
fruits = {"apple", "banana", "cherry", "apple"}
print(fruits)   # {'apple', 'banana', 'cherry'}  ← apple deduped
print(len(fruits))   # 3
```

Key properties:
- *No duplicates* — each value appears at most once
- *Unordered* — no index, no guaranteed order
- *Mutable* — can add/remove elements
- *Elements must be hashable* (strings, ints, tuples — but not lists)

= Creating Sets

```python
# Literal syntax (note: {} alone creates empty dict!)
s = {1, 2, 3}

# From a list (deduplication!)
numbers = [1, 2, 2, 3, 3, 3, 4]
unique = set(numbers)
print(unique)   # {1, 2, 3, 4}

# Empty set
empty = set()   # NOT {} (that's a dict)

# From a string (unique characters)
chars = set("hello world")
print(chars)    # {'h', 'e', 'l', 'o', ' ', 'w', 'r', 'd'}
```

= Modifying Sets

```python
s = {1, 2, 3}

s.add(4)          # {1, 2, 3, 4}
s.add(2)          # {1, 2, 3, 4}  — no duplicate
s.remove(2)       # {1, 3, 4}   — KeyError if missing
s.discard(99)     # {1, 3, 4}   — safe, no error if missing

# Membership test — O(1)!
print(3 in s)     # True
print(99 in s)    # False
```

= Set Operations

== Union, Intersection, Difference

```python
A = {1, 2, 3, 4, 5}
B = {3, 4, 5, 6, 7}

# Union — all elements from both
print(A | B)         # {1, 2, 3, 4, 5, 6, 7}
print(A.union(B))    # same

# Intersection — only in both
print(A & B)                  # {3, 4, 5}
print(A.intersection(B))      # same

# Difference — in A but not B
print(A - B)                  # {1, 2}
print(A.difference(B))        # same

# Symmetric difference — in one but not both
print(A ^ B)                  # {1, 2, 6, 7}
```

= Practical Examples

```python
# Find common students in two courses
python_students = {"Alice", "Bob", "Carol", "Dave"}
java_students   = {"Bob", "Eve", "Alice", "Frank"}

both  = python_students & java_students     # {'Alice', 'Bob'}
only_python = python_students - java_students  # {'Carol', 'Dave'}
all_students = python_students | java_students

print(f"In both courses: {both}")
print(f"Python only: {only_python}")
print(f"Total unique students: {len(all_students)}")

# Deduplication
product_ids = [101, 102, 101, 103, 102, 104]
unique_ids = set(product_ids)
print(unique_ids)   # {101, 102, 103, 104}
```

= `frozenset`

== Immutable set — can be used as a dict key

```python
fs = frozenset([1, 2, 3])
print(fs)          # frozenset({1, 2, 3})

# frozenset can be a dict key (regular set cannot)
permissions = {
    frozenset(["read"]): "Reader",
    frozenset(["read", "write"]): "Editor",
    frozenset(["read", "write", "admin"]): "Admin",
}

user_perms = frozenset(["read", "write"])
role = permissions.get(user_perms, "Unknown")
print(role)   # Editor
```

= When to Use Sets

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  inset: 8pt,
  [*Use set when...*], [*Don't use set when...*],
  [Deduplication needed], [Order matters],
  [Fast membership testing], [Indexing needed],
  [Set operations (union, etc.)], [Duplicate values matter],
  [Unique items only], [Items are unhashable (lists)],
)
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
