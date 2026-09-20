#import "@preview/touying:0.7.3": *
#import themes.stargazer: *

#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Python Programming Fundamentals],
    subtitle: [Naming as Design — Functions and Variables],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)

#import "../../../preamble.typ": *
#show: styles

// Do / Don't labels used throughout this deck
#let do-label = text(fill: rgb("#2A9D55"), weight: "bold")[✔ DO]
#let dont-label = text(fill: rgb("#E63946"), weight: "bold")[✘ DON'T]

#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= Today

By the end of this session you should be able to:

- Explain why a function's *name* is a *design* decision.
- Recognise names that signal a function is doing *too much*.
- Choose names that match what a function *returns* or *does*.
- Spot names that *hide side effects*.
- Name variables consistently and follow Python conventions (PEP 8).

#pause

#note[
  *The golden rule:* if you can't give a function a clear, simple name, the problem is usually the *design*, not your vocabulary.
]

= One Function, One Job

#do-label a single verb phrase describing *one* action. \
#dont-label use names that contain *and*, *or*, *then*, *also*.

#pause

```python
# The name confesses: this function does two jobs
def validate_and_save_student(student): ...
```

#pause

```python
# Split it - and each name becomes simple
def validate_student(student): ...
def save_student(student): ...
```

#pause

#note[
  *The "and" test:* describe the function in one sentence. If you need the word *and*, split it.
]

= Vague Names Hide Vague Purpose

#dont-label use filler words: `process`, `handle`, `manage`, `do_stuff`, `data`, `info`, `helper`. \
#do-label say *exactly* what happens.

#pause

```python
def process(data): ...          # process how? into what?
def handle_input(x): ...        # handle means... anything
```

#pause

```python
def remove_duplicate_emails(emails): ...
def read_menu_choice(): ...
```

#pause

If the only name you can think of is `process`, you probably don't yet know what the function is *for*.

= Name the What, Not the How

#do-label name the *intent* (the problem). \
#dont-label leak the *implementation* (the algorithm).

#pause

```python
def bubble_sort_scores(scores): ...      # exposes the algorithm
def multiply_by_point_nine(price): ...   # exposes the arithmetic
```

#pause

```python
def rank_scores(scores): ...
def apply_student_discount(price): ...
```

#pause

If you change *how* it works, the name should *not* have to change.

#note[
  *Sometimes* for clarity you may want to include the algorithm in the name, e.g. `rank_scores_quick_sort()`, especially in assessments so that we can check that you are using the right algorithm. But in general, the name should describe *what* it does, not *how* it does it.
]

= Names Must Tell the Truth

#do-label keep *queries* (return an answer) separate from *commands* (change something). \
#dont-label let an innocent-sounding name secretly change state.

#pause

```python
def get_balance(account):
    account.balance -= MONTHLY_FEE     # surprise!
    return account.balance
```

#pause

```python
def charge_monthly_fee(account): ...   # command - changes state
def get_balance(account): ...          # query - safe to call twice
```

#pause

#note[
  A function called `get_...` or `calculate_...` should be safe to call *twice*.
]

= Grammar Matches the Return

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  fill: (col, row) => if row == 0 { rgb("#bfdbfe") } else { white },
  [*Kind of function*], [*Pattern*], [*Example*],
  [Performs an action], [verb phrase], [`send_reminder()`, `print_report()`],
  [Returns `True`/`False`], [`is_`, `has_`, `can_`], [`is_valid_email()`, `has_passed()`],
  [Computes a value], [noun or `calculate_`], [`average(marks)`, `calculate_grade()`],
  [Converts], [`to_` / `from_`], [`to_celsius()`, `from_csv()`],
  [May find nothing], [`find_` (may return `None`)], [`find_student(student_id)`],
)

#pagebreak()

Good boolean names make `if` statements read like English:

```python
if is_eligible(student):        # reads naturally
    ...

if check_eligibility(student):  # returns a bool? prints? raises?
    ...
```

= Flag Parameters Mean Two Functions

#dont-label pass `True`/`False` to switch behaviour. \
#do-label give each behaviour its *own* name.

#pause

```python
print_report(students, True)     # True means... what?
```

#pause

```python
print_summary(students)
print_full_report(students)
```

#pause

The call site now explains itself - no need to look up the definition.

= Long Names Are a Warning

```python
def read_file_parse_rows_and_compute_class_average(path): ...
```

#pause

The name is *honest* - and that's the useful part: it shows there are *three* functions waiting to get out.

#pause

```python
rows = read_rows(path)
marks = parse_marks(rows)
class_average = average(marks)
```

= Be Consistent

#dont-label mix synonyms for the same idea:

```python
get_student()    fetch_module()    retrieve_grade()
```

#pause

#do-label choose one word per concept, and use matched pairs:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  inset: 10pt,
  align: center,
  [`open` / `close`], [`add` / `remove`], [`start` / `stop`], [`load` / `save`],
)

= Naming Variables

- *Plural for collections, singular for items:* `for student in students:`
#pause
- *Don't put the type in the name:* `names`, not `name_list` or `str_names`
#pause
- *Length should match scope:* `i` is fine in a 3-line loop, not across a module
#pause
- *No cryptic abbreviations:* `total_amount`, not `ttl_amt`
#pause
- *Named constants, not magic numbers:* `PASS_MARK = 40`
#pause
- *Avoid negative booleans:* `is_empty`, not `is_not_empty` \
  (`if not is_not_empty:` is a small act of cruelty)

= Don't Shadow the Built-ins

```python
sum = 0
for mark in marks:
    sum += mark

average = sum(marks) / len(marks)   # TypeError!
```

#pause

`sum` is now an `int`, so `sum(marks)` fails: *'int' object is not callable*.
Avoid `list`, `sum`, `max`, `min`, `id`, `input`, `str` as variable names.

```python
total = 0
for mark in marks:
    total += mark
```

= Python Conventions (PEP 8)

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  fill: (col, row) => if row == 0 { rgb("#bfdbfe") } else { white },
  [*What*], [*Style*], [*Example*],
  [Functions and variables], [`snake_case`], [`calculate_grade`, `total_marks`],
  [Constants], [`UPPER_CASE`], [`PASS_MARK`, `MAX_ATTEMPTS`],
  [Classes], [`PascalCase`], [`Student`, `ShoppingCart`],
  [Internal helpers], [leading `_`], [`_format_row`],
)

#pause

#note[
  *Coming from Java?* `camelCase` works in Python - but PEP 8 will quietly disapprove.
]

= Exercise: Rename to Redesign

*(1)* Rename it · *(2)* split it if the name needs "and" · *(3)* check for hidden side effects.

```python
def do_it(x): ...
def get_and_update_total(order): ...
def handle(scores, flag): ...
def check(s): ...
def calc_avg_and_print(marks): ...
def get_next_ticket():              # hint: look inside
    global ticket_count
    ticket_count += 1
    return ticket_count
```

= Recap

A good name is *evidence* of good design (and renaming often turns into *refactoring*):

- *One job* → one simple verb phrase, no "and".
- *Clear purpose* → no `process`, `handle`, `data`.
- *Intent, not implementation* → `rank_scores`, not `bubble_sort_scores`.
- *Honest* → `get_` never changes state.
- *Grammar fits the return* → `is_`, `to_`, `find_`, verb phrases.
- *No flag parameters* → two functions, two names.
- *Consistent vocabulary* and *PEP 8*.

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
