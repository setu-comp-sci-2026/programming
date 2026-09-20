// =====================================================================
//  Naming Checklist — one-page handout
//  Companion to e-naming.typ (Naming as Design). No packages needed.
// =====================================================================

#let py-blue = rgb("#3572A5")
#let head-fill = rgb("#bfdbfe")
#let do-col = rgb("#2A9D55")
#let dont-col = rgb("#E63946")

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 1.4cm, bottom: 1.4cm),
  footer: align(center, text(size: 8pt, fill: gray)[
    Python Programming Fundamentals · SETU · Naming as Design
  ]),
)
#set text(size: 10.5pt)
#show raw: set text(size: 9pt)

#let tick = box(
  width: 9pt, height: 9pt, baseline: 1pt,
  stroke: 0.8pt + py-blue, radius: 1.5pt,
)

#let section(title) = block(above: 1.1em, below: 0.5em,
  text(size: 9pt, weight: "bold", fill: py-blue, tracking: 0.08em, upper(title)))

#let checklist(..rows) = table(
  columns: (auto, 1fr, 5.4cm, 5cm),
  inset: (x: 6pt, y: 6.5pt),
  align: (center + horizon, left + horizon, left + horizon, left + horizon),
  stroke: (x, y) => (top: if y > 0 { 0.5pt + rgb("#dbe3ea") } else { none }),
  fill: (x, y) => if y == 0 { head-fill },
  table.header([], [*Rule*],
    text(fill: do-col)[*✔ Do*], text(fill: dont-col)[*✘ Don't*]),
  ..rows.pos().map(((rule, yes, no)) => (tick, rule, raw(yes), raw(no))).flatten(),
)

// ---------------------------------------------------------------- title
#block(width: 100%, fill: py-blue, inset: (x: 12pt, y: 10pt), radius: 4pt,
  text(fill: white)[
    #text(size: 17pt, weight: "bold")[Naming Checklist]
    #h(1fr)
    #text(size: 9.5pt)[Functions · Variables · Style]
  ])

#block(width: 100%, fill: rgb("#c6f1c7"),
  stroke: (left: 3pt + rgb("#4caf50")), inset: 9pt,
  [*The "and" test:* if you can't describe a function in one sentence without the word "and", split it. A function that is hard to name usually has a *design* problem, not a vocabulary problem.])

// ------------------------------------------------------------ functions
#section[Functions]
#checklist(
  ([One job — no "and" in the name], "validate_student()", "validate_and_save()"),
  ([Specific, not vague], "remove_duplicate_emails()", "process(data)"),
  ([Name the intent, not the algorithm], "rank_scores()", "bubble_sort_scores()"),
  ([Honest: `get_` never changes state], "charge_fee()", "get_balance() # deducts"),
  ([Booleans ask a question], "is_valid(), has_passed()", "check(s)"),
  ([Grammar fits the return value], "send_, to_, find_", "do_it()"),
  ([No `True`/`False` flag parameters], "print_summary()", "print_report(s, True)"),
  ([A long name means split it], "read_rows(), average()", "read_parse_and_average()"),
  ([One word per concept], "get_ everywhere", "get_/fetch_/retrieve_"),
)

// ------------------------------------------------------------ variables
#section[Variables]
#checklist(
  ([Plural for collections, singular for items], "for student in students", "student_list"),
  ([No cryptic abbreviations], "total_amount", "ttl_amt"),
  ([Named constants, not magic numbers], "PASS_MARK = 40", "if mark >= 40"),
  ([Positive booleans], "is_empty", "is_not_empty"),
  ([Don't shadow built-ins], "total", "sum, list, max, id"),
)

// ---------------------------------------------------------------- style
#section[Style (PEP 8)]
#checklist(
  ([`snake_case` for functions and variables], "calculate_grade", "calculateGrade"),
  ([`UPPER_CASE` constants, `PascalCase` classes], "MAX_TRIES, Student", "maxTries, student"),
  ([Leading `_` for internal helpers], "_format_row()", "helper2()"),
)

// ------------------------------------------------------------ quick key
#v(0.8em)
#grid(columns: (1fr, 1fr), column-gutter: 12pt,
  block(width: 100%, stroke: 0.8pt + py-blue, radius: 4pt, inset: 8pt)[
    *Grammar quick key* \
    #set text(size: 9pt)
    Action → verb phrase: `send_reminder()` \
    True/False → `is_`, `has_`, `can_` \
    Value → noun: `average(marks)` \
    Conversion → `to_celsius()` \
    Might find nothing → `find_student()` (may return `None`)
  ],
  block(width: 100%, stroke: 0.8pt + py-blue, radius: 4pt, inset: 8pt)[
    *Before you submit* \
    #set text(size: 9pt)
    Read each function name aloud. Does it say *exactly* what the function does — and nothing it hides? \
    Read each `if` aloud. Does it sound like English? \
    If renaming makes you want to split the function, *do it*.
  ],
)
