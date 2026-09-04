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
    subtitle: [Recursion],
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

= What is Recursion?

*Recursion* is when a function calls *itself* to solve a smaller version of the same problem.

#pause

Think of it like Russian dolls — each doll contains a smaller version of itself, until you reach the smallest one.

#pause

Every recursive function must have:
1. A *base case* — the simplest case that can be solved directly (no recursion)
2. A *recursive case* — breaks the problem down and calls itself with a smaller input

#pause

*Without a base case*, a recursive function calls itself forever → `RecursionError: maximum recursion depth exceeded`

= The Factorial Example

Factorial: `n! = n × (n-1) × (n-2) × ... × 1`

- `5! = 5 × 4 × 3 × 2 × 1 = 120`
- `1! = 1`
- `0! = 1`  (by definition)

#pause

*Iterative version:*

```python
def factorial_iterative(n):
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
```

*Recursive version:*

```python
def factorial(n):
    if n <= 1:          # base case
        return 1
    return n * factorial(n - 1)   # recursive case

print(factorial(5))   # 120
print(factorial(0))   # 1
```

= Tracing the Call Stack

`factorial(4)` step by step:

```
factorial(4)
    → 4 * factorial(3)
           → 3 * factorial(2)
                  → 2 * factorial(1)
                             → 1  (base case!)
                  ← 2 * 1 = 2
           ← 3 * 2 = 6
    ← 4 * 6 = 24
= 24
```

#pause

Each call to `factorial` creates a new *stack frame* in memory. The calls pile up until the base case is reached, then they *unwind* — each returning its value back up the chain.

Python's default recursion limit is 1000 frames. For very deep recursion, use iteration instead.

= Fibonacci Sequence

Fibonacci: `F(n) = F(n-1) + F(n-2)`, with `F(0)=0`, `F(1)=1`

`0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...`

```python
def fibonacci(n):
    """Return the nth Fibonacci number (0-indexed)."""
    if n <= 0:
        return 0                    # base case 1
    if n == 1:
        return 1                    # base case 2
    return fibonacci(n - 1) + fibonacci(n - 2)  # recursive case

for i in range(10):
    print(f"F({i}) = {fibonacci(i)}")
```

#pause

*Warning:* naive recursive Fibonacci is slow — `fibonacci(40)` makes millions of calls. Use memoisation or iteration for large values.

= Sum of a List Recursively

```python
def recursive_sum(numbers):
    """Return the sum of all numbers in the list."""
    if len(numbers) == 0:       # base case — empty list
        return 0
    return numbers[0] + recursive_sum(numbers[1:])  # first + rest

print(recursive_sum([1, 2, 3, 4, 5]))   # 15
print(recursive_sum([]))                 # 0
```

#pause

Tracing `recursive_sum([1, 2, 3])`:
```
recursive_sum([1, 2, 3])
    → 1 + recursive_sum([2, 3])
               → 2 + recursive_sum([3])
                          → 3 + recursive_sum([])
                                     → 0
                          ← 3 + 0 = 3
               ← 2 + 3 = 5
    ← 1 + 5 = 6
= 6
```

= When to Use Recursion

*Good candidates for recursion:*
- Problems naturally defined recursively (trees, nested structures)
- Divide-and-conquer algorithms (merge sort, binary search)
- Directory/file traversal
- Mathematical sequences with recursive definitions

#pause

*Usually better as iteration:*
- Simple counting loops
- Accumulation (sum, product)
- Linear sequences where depth could be large

#pause

```python
# Power function — elegant recursively
def power(base, exp):
    if exp == 0:
        return 1
    if exp % 2 == 0:
        half = power(base, exp // 2)
        return half * half          # efficient: avoids re-computing
    return base * power(base, exp - 1)

print(power(2, 10))   # 1024
```

= Recursion vs Iteration Comparison

```python
# Iterative sum
def sum_iter(n):
    total = 0
    for i in range(1, n + 1):
        total += i
    return total

# Recursive sum
def sum_rec(n):
    if n <= 0:
        return 0
    return n + sum_rec(n - 1)

# Both give the same result
print(sum_iter(100))   # 5050
print(sum_rec(100))    # 5050

# Mathematical shortcut — also correct
print(100 * 101 // 2)  # 5050
```

For this particular problem, the iterative version is preferred — it handles large `n` without hitting the recursion limit.

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