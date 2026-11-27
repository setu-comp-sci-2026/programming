#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Final Week — Libraries, Pip and Sets], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [Today: Build on the Work of Others])[
- Python has a rich ecosystem of reusable code.
- We will learn where libraries come from and how to install and import them.
- We will use NumPy to process data and Matplotlib to visualise it.
- We will finish with sets and choosing the right collection.
]

#slide(title: [Analogy: A Programmer’s Toolbox])[
Imagine building a garden shed.
- You could make your own hammer, saw and screwdriver.
- Or you could use reliable tools already designed for the job.
- You still need to understand which tool to choose and how to use it.

Libraries provide reusable tools. We focus on solving our own problem.
]

#slide(title: [Module, Package and Library])[
- Module: an importable unit of Python code, often a `.py` file.
- Package: a way of organising related modules under a common name.
- Library: a collection of reusable functionality; may contain modules and packages.
- Distribution: installable project published to a package index.

We already created modules: `bank_account.py`, `bank.py` and `rule.py`.
]

#slide(title: [Three Sources of Reusable Code])[
#table(columns: (1fr, 1.5fr, 1.2fr), inset: 6pt,
 [*Source*], [*Example*], [*Install?*],
 [Our own modules], [`bank_account`], [No, local file],
 [Standard library], [`json`, `math`, `pathlib`], [Included with Python],
 [Third-party], [`numpy`, `matplotlib`, `pytest`], [Usually via pip],
)
Not everything that can be imported needs to be installed.
]

#slide(title: [Where Do We Find Libraries?])[
- Python standard library: #link("https://docs.python.org/3/library/")[docs.python.org/3/library/]
- Python Package Index (PyPI): #link("https://pypi.org/")[pypi.org]
- Official project documentation and examples.
- Check supported Python versions, maintenance, licence and installation instructions.
- Verify the package name carefully before installing; avoid unknown lookalikes.
]

#slide(title: [What Is Pip?])[
pip is a package installer for Python.
#align(center)[PyPI → pip → Python environment → import in your program]
- Downloads and installs distributions and their dependencies.
- Installation normally happens once per environment.
- Importing makes functionality available to a running program.
- pip commands belong in the terminal, not in Python source.
]

#slide(title: [Choose the Right Environment])[
A virtual environment keeps a project's installed packages separate.
```sh
python -m venv .venv
```
- In VS Code: Python: Select Interpreter → choose `.venv`.
- Open a new terminal; verify the environment is activated.
- Windows PowerShell: `.venv\Scripts\Activate.ps1` (if permitted).
- macOS/Linux: `source .venv/bin/activate`.
- Use `python3` where appropriate when creating the environment.
]

#slide(title: [Install and Inspect Packages])[
```sh
python -m pip install numpy matplotlib
python -m pip show numpy
python -m pip list
```
Using `python -m pip` links pip to the interpreter you invoked. If activation is unavailable, use the virtual environment Python executable directly.
]

#slide(title: [Different Ways to Import])[
```python
import math
print(math.sqrt(25))

from math import sqrt
print(sqrt(25))

import numpy as np
```
- An alias is a shorter name for a module.
- Prefer explicit imports rather than `from module import *`.
]

#slide(title: [Troubleshooting Imports])[
`ModuleNotFoundError: No module named 'numpy'`
- Is NumPy installed in the selected Python environment?
- Check `python -m pip show numpy` in the terminal.
- Check the interpreter with `python -c "import sys; print(sys.executable)"`.
- Avoid naming your own files `numpy.py`, `math.py` or `pytest.py`.
- Check spelling and the traceback before reinstalling anything.
]

#slide(title: [Sharing Dependencies])[
```sh
python -m pip freeze > requirements.txt
python -m pip install -r requirements.txt
```
- A requirements file helps someone recreate your environment.
- `pip freeze` records installed versions, including dependencies.
- Use a clean project environment to avoid unrelated packages.
- Do not submit the entire virtual environment.
]

#slide(title: [Introducing NumPy])[
NumPy provides arrays and numerical operations.
- Useful in science, engineering, data analysis and AI.
- An array is not the same as a Python list.
- Numerical arrays support element-by-element arithmetic.
- Official documentation: #link("https://numpy.org/doc/")[numpy.org/doc/].
]

#slide(title: [Lists versus NumPy Arrays])[
```python
import numpy as np

values = [10, 20, 30]
print(values * 2)
# [10, 20, 30, 10, 20, 30]

array = np.array(values)
print(array * 2)
# [20 40 60]
```
Same operator, different behaviour. Understand the type you are using.
]

#slide(title: [Analyse Some Bank Data])[
```python
import numpy as np

balances = np.array([100, 250, 150, 400, 100])
print(np.sum(balances))   # 1000
print(np.mean(balances))  # 200.0
print(np.max(balances))   # 400
print(np.min(balances))   # 100
```
NumPy performs numerical calculations; it does not replace our BankAccount class.
]

#slide(title: [Connecting to Our Bank])[
```python
balances = np.array([account.balance
                     for account in bank.accounts])
if len(balances) > 0:
    print(np.mean(balances))
```
- Extract public balance properties from existing objects.
- The list comprehension collects values; NumPy converts them to an array.
- Check for empty data before calculating a mean.
- We can add analysis without rewriting our existing classes.
]

#slide(title: [Introducing Matplotlib])[
Matplotlib is a separate library for creating charts.
- NumPy helps us calculate and organise numerical data.
- Matplotlib helps us communicate the results visually.
- We will create a simple bar chart of example account balances.
- Documentation: #link("https://matplotlib.org/stable/")[matplotlib.org/stable/].
]

#slide(title: [Live Coding: A Bar Chart])[
```python
import numpy as np
import matplotlib.pyplot as plt

names = ["Alice", "Bob", "Cara", "Dan", "Eve"]
balances = np.array([100, 250, 150, 400, 100])
plt.bar(names, balances)
plt.axhline(np.mean(balances), linestyle="--")
plt.ylabel("Balance (EUR)")
plt.title("Example account balances")
plt.show()
```
]

#slide(title: [What Does the Chart Tell Us?])[
#align(center)[#image("balances.png", width: 73%)]
The dashed line is the mean balance. Which accounts are above it?
]

#slide(title: [Activity: Change the Data])[
- Add another account with a balance of 600 (add both name and balance).
- Predict the new mean before running the program.
- Change the chart title and add a label to the mean line.
- Save a chart with `plt.savefig("balances.png")` before `plt.show()`.

Answer: the new mean is approximately 266.67 EUR.
]

#slide(title: [A New Collection: Sets])[
A set is a collection of unique, hashable elements.
- No duplicate elements.
- No positional indexing or guaranteed iteration order.
- Mutable sets allow us to add and remove elements.
- Useful when membership and uniqueness matter more than position.

Analogy: a guest list where each person should appear only once.
]

#slide(title: [Creating Sets])[
```python
skills = {"Python", "Java", "Python"}
print(len(skills))  # 2

empty = set()      # empty set
not_a_set = {}     # empty dictionary

unique = set(["yes", "no", "yes"])
```
The repeated values are removed. Do not rely on the printed order.
]

#slide(title: [Adding, Removing and Checking])[
```python
skills = {"Python", "Java"}
skills.add("SQL")
skills.add("Python")  # no duplicate
skills.discard("C++") # no error if absent
print("SQL" in skills) # True
skills.remove("Java")
```
`remove()` raises KeyError if absent; `discard()` does not. Sets have no `append()` or indexing.
]

#slide(title: [What Can a Set Contain?])[
```python
valid = {"Python", 42, (1, 2)}
# invalid = {[1, 2], [3, 4]}
# TypeError: unhashable type: list
```
- Elements must be hashable: strings, numbers and tuples of hashable values are common examples.
- Lists, dictionaries and ordinary sets cannot be elements.
- Sets are useful for fast membership checks (typically constant time).
]

#slide(title: [Set Operations: Two Groups])[
#align(center)[#image("sets.png", width: 78%)]
A = students who know Python; B = students who know Java.
]

#slide(title: [Union and Intersection])[
```python
a = {"Alice", "Bob", "Cara"}
b = {"Bob", "Cara", "Dan"}

print(a | b)  # all four students
print(a & b)  # Bob and Cara

print(a.union(b))
print(a.intersection(b))
```
Union: either group or both. Intersection: both groups.
]

#slide(title: [Difference and Symmetric Difference])[
```python
a = {"Alice", "Bob", "Cara"}
b = {"Bob", "Cara", "Dan"}

print(a - b)  # Alice
print(b - a)  # Dan
print(a ^ b)  # Alice and Dan
```
Difference is directional. Symmetric difference means in exactly one group.
]

#slide(title: [Sets in Our Expert System])[
```python
required = {"power_on", "display_on"}
answers = {"power_on": "yes"}

missing = required - set(answers)
print(missing)  # {"display_on"}
print(required <= set(answers))  # False
```
A set can check whether all required keys are present. It cannot check whether their answer values match the rule.
]

#slide(title: [Find Duplicate Question Keys])[
```python
seen = set()
for question in questions:
    if question.key in seen:
        print("Duplicate:", question.key)
    seen.add(question.key)
```
- Assumes a list of Question objects from last week.
- A set helps validate uniqueness without changing the original list.
- Keep the list for question order.
]

#slide(title: [List, Dictionary or Set?])[
#text(size: 15pt)[#table(columns: (1.1fr, 1fr, 1fr, 1fr), inset: 5pt,
 [*Feature*], [*List*], [*Dict*], [*Set*],
 [Syntax], [`[]`], [`{key: value}`], [`{value}`],
 [Duplicates], [Allowed], [Unique keys], [No],
 [Access], [Index], [Key], [Membership],
 [Order], [Position], [Insertion], [Not guaranteed],
 [Use], [Sequence], [Lookup], [Uniqueness],
)]
All three are mutable. Dictionary values may be duplicated.
]

#slide(title: [Choose the Right Collection])[
Which collection would you choose?
- Questions in the order they should be asked.
- Answers associated with question keys.
- Unique question identifiers.
- Consultation history in chronological order.
- Account number mapped to a BankAccount object.

Discuss in the chat before revealing the answers.
]

#slide(title: [Activity Answers and JSON])[
- Ordered questions and consultation history: list.
- Answers and account lookup: dictionary.
- Unique identifiers: set.
- JSON supports arrays and objects, but not Python sets directly.
```python
import json
keys = {"power_on", "display_on"}
print(json.dumps(sorted(keys)))
```
Convert back with `set()` after loading if uniqueness is required.
]

#slide(title: [Final Module Takeaway])[
- Choose data structures based on the problem, not habit.
- Reuse libraries when they help, and understand their interfaces.
- Test your code and evaluate suggested changes.
- You now have the foundations to build, maintain and improve your own Python applications.

*The goal is not just to produce code. It is to become a programmer who understands and owns the solution.*
]
