#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#let note(body) = block(fill: rgb("#eaf4ef"), stroke: (paint: rgb("#77a98d"), thickness: 1pt), radius: 7pt, inset: 12pt, width: 100%, body)
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(color: rgb("#c6f1c7"), title: [Programming Fundamentals], subtitle: [Week 7 — Wednesday: PC Troubleshooter and JSON], author: [Programming Fundamentals Team], institution: [SETU], date: datetime.today()),
)
#set text(size: 20pt)
#title-slide()

#slide(title: [From Files to a Knowledge Base])[
*Learning goals:* load structured data; represent troubleshooting knowledge in JSON; separate rules from code; save a session history; test missing-file cases.


]

#slide(title: [Monday Recap: What Survives?])[
*Predict:*

```python
with open("settings.json", "w") as file:
    json.dump({"theme": "dark"}, file)
```

After Python closes, where is the theme stored?

#pause
In `settings.json`, not in a Python variable.
]

#slide(title: [Our Ongoing Example: PC Troubleshooter])[
Previously we asked questions and used selection to suggest solutions.

*Today:* move some troubleshooting knowledge into a JSON file.

#note[The Python program decides *how* to process answers. The file supplies *what* questions and recommendations to use.]
]

#slide(title: [Why Store Rules in a File?])[
Suppose we want to add a new recommendation.

*Hard-coded approach:* edit the Python `if` statements.

*Data-driven approach:* add a record to the knowledge file.

*which approach is easier for a non-programmer to maintain?*
]

#slide(title: [Design the Knowledge First])[
We will begin with two yes/no questions:

1. Does the computer turn on? (`power_on`)
2. Is the display showing an image? (`display_on`)

Possible recommendations:
- Check the power connection
- Check the monitor and cable
- Try a restart or further checks
]

#slide(title: [Our Knowledge File: JSON])[
```json
{
  "questions": [
    {"key": "power_on", "text": "Does it turn on?"},
    {"key": "display_on", "text": "Is there an image?"}
  ]
}
```

A *key* lets our program recognise each answer. The *text* is what the user sees.
]

#slide(title: [Add Rules to the Same File])[
```json
"rules": [
  {"when": {"power_on": "no"},
   "advice": "Check the power cable and socket."},
  {"when": {"power_on": "yes", "display_on": "no"},
   "advice": "Check the monitor connection."}
]
```

The first matching rule supplies the advice.
]

#slide(title: [Pseudocode: Load the Knowledge])[
```text
OPEN the knowledge file
READ the JSON data
STORE the questions and rules
ASK the user each question
COMPARE answers with each rule
DISPLAY advice for the first matching rule
```

*Which steps belong in separate functions?*
]

#slide(title: [Step 1: Load the Knowledge])[
```python
import json

def load_knowledge(filename):
    with open(filename, "r", encoding="utf-8") as file:
        return json.load(file)

knowledge = load_knowledge("knowledge.json")
```

*What type of value does `load_knowledge()` return?*
]

#slide(title: [Step 2: Ask the Questions])[
```python
def ask_questions(questions):
    answers = {}
    for question in questions:
        key = question["key"]
        answer = input(question["text"] + " (yes/no): ")
        answers[key] = answer.strip().lower()
    return answers
```

We use a *dictionary* to connect question keys to answers.
]

#slide(title: [Step 3: Match a Rule])[
```python
def matches(rule, answers):
    for key, expected in rule["when"].items():
        if answers.get(key) != expected:
            return False
    return True
```

Every condition in the rule must match.

*Predict:* what happens when the first condition fails?
]

#slide(title: [Step 4: Choose Advice])[
```python
def recommend(rules, answers):
    for rule in rules:
        if matches(rule, answers):
            return rule["advice"]
    return "No matching rule. Ask for further help."
```

*Important:* rule order matters because we return the first match.
]

#slide(title: [Live Build: Put It Together])[
```python
knowledge = load_knowledge("knowledge.json")
answers = ask_questions(knowledge["questions"])
advice = recommend(knowledge["rules"], answers)
print("Recommendation:", advice)
```

*Try `no/no`, `yes/no`, and `yes/yes`.*
]

#slide(title: [Improve the Conversation])[
Our first version accepts anything, including `maybe`.

*Adapt the question function to repeat until the user enters `yes` or `no`.*

#note[Hint: use a `while` loop.]
]

#slide(title: [Save a Session History])[
```python
from datetime import datetime

record = {"time": datetime.now().isoformat(timespec="seconds"),
          "answers": answers, "advice": advice}
```

We can store multiple records in a JSON *list*.

*Why might a support technician want this history?*
]

#slide(title: [Save the Updated History])[
```python
history = []
try:
    with open("history.json", "r") as f:
        history = json.load(f)
except FileNotFoundError:
    pass
history.append(record)
with open("history.json", "w") as f:
    json.dump(history, f, indent=4)
```

We load old records *before* saving the new list.
]

#slide(title: [Challenge: Add a New Rule])[
*Add a third question and a new rule in `knowledge.json`.*

Suggested question: *Is the power cable connected?*

- Decide its `key`
- Write the new rule conditions
- Put the *more specific* rule before the general power rule
- Test which recommendation appears
]

#slide(title: [Testing and File Problems])[
*Try these tests:*

- The knowledge file is missing
- The JSON contains a missing comma
- No rule matches the answers
- The user types `YES` instead of `yes`

#note[These reveal why validation, sensible defaults and clear error messages matter.]
]

#slide(title: [Assignment 2 Connection])[
Your expert system can separate:

*Knowledge* — questions, rules, advice in JSON

*Program logic* — functions that load, ask, compare and explain

*Persistence* — saved records that remain after closing the program

Later we will explore how classes and objects can organise this further.
]

#slide(title: [Exit Ticket and Next Steps])[
Before you finish, explain in your own words:

1. Why is JSON useful for an expert system?
2. Why do we load before we save a history?
3. What is one limitation of the first-match rule approach?

]
