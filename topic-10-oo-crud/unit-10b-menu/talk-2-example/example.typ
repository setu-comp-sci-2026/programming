#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [Python Programming Fundamentals], subtitle: [Wednesday — PC Troubleshooter], author: [Programming Fundamentals Team], institution: [SETU]),
)
#show raw.where(block: true): it => block(fill: rgb("#eaf2ff"), stroke: (paint: rgb("#3572A5"), thickness: 1pt), radius: 5pt, inset: 8pt, width: 100%, it)
#title-slide()
#outline-slide()

#slide(title: [Our Continuing PC Troubleshooter])[
- We already built a rule-based expert system — *not machine learning*.
- Questions gather yes/no evidence.
- Rules match answers and choose advice.
- `knowledge.json` stores questions and rules; `history.json` stores consultations.
- Today: consider how *classes, a menu and persistence* can organise the same system.
]

#slide(title: [Remember the Existing Program])[
```text
PC_Troubleshooter/
    troubleshooter.py
    knowledge.json
    data/
        history.json
```
- Earlier work used functions such as `load_knowledge()`, `ask_questions()`, `matches()`, `recommend()` and `save_history()`.
- We are *refactoring an existing program*, not changing the troubleshooting problem.
]

#slide(title: [Our Knowledge Base Is Data])[
```json
{
  "questions": [
    {"key": "power_on", "text": "Does the computer turn on?"},
    {"key": "display_on", "text": "Is there an image on the screen?"}
  ],
  "rules": [
    {"when": {"power_on": "no"},
     "advice": "Check the power cable and socket."}
  ]
}
```
- The full existing file has additional rules.
- Changing advice in JSON need not change Python decision logic.
]

#slide(title: [The Expert-System Flow])[
#align(center)[
    #image("assets/knowledge.png", width: 95%)
  ]
- Which steps are about *knowledge*, *logic*, *interaction*, and *storage*?
]

#slide(title: [What Changes with Object-Oriented Design?])[
*Before (procedural):* functions accept dictionaries and lists.

*Possible OO design:*
#align(center)[
    #image("assets/possOO.png", width: 65%)
  ]
*Same behaviour; clearer responsibilities.*
]

#slide(title: [A Question Object])[
```python
class Question:
    def __init__(self, key, text):
        self.key = key
        self.text = text

    def __str__(self):
        return self.text

q = Question("power_on", "Does the computer turn on?")
print(q)
```
- Compare this object with the original question dictionary.
- What is the public interface?
]

#slide(title: [A Rule Object])[
```python
class Rule:
    def __init__(self, conditions, advice):
        self.conditions = conditions
        self.advice = advice

    def matches(self, answers):
        for key, expected in self.conditions.items():
            if answers.get(key) != expected:
                return False
        return True
```
- This is the same matching logic we used in our procedural version.
- One rule may check *more than one answer*.
]

#slide(title: [The Troubleshooter Manages Objects])[
```python
class Troubleshooter:
    def __init__(self):
        self.questions = []  # Question objects
        self.rules = []      # Rule objects

    def recommend(self, answers):
        for rule in self.rules:
            if rule.matches(answers):
                return rule.advice
        return "No matching rule. Ask for further help."
```
- Like `Bank`, this class manages a collection.
- Like `BankAccount`, each `Rule` knows how to perform its own task.
]

#slide(title: [From JSON to Objects])[
```python
import json

with open("knowledge.json", "r", encoding="utf-8") as file:
    knowledge = json.load(file)

system = Troubleshooter()
for item in knowledge["questions"]:
    system.questions.append(Question(item["key"], item["text"]))
for item in knowledge["rules"]:
    system.rules.append(Rule(item["when"], item["advice"]))
```
- The JSON stays simple; Python rebuilds objects from the dictionaries.
- In our actual program, use a script-relative path as before.
]

#slide(title: [A Menu for the Troubleshooter])[
```text
=== PC TROUBLESHOOTER ===
1. Start a consultation
2. View consultation history
3. List knowledge-base questions
0. Exit
```
- A menu lets us run several consultations without restarting.
- The menu should call methods/functions rather than contain all the rule logic.
]

#slide(title: [Menu Skeleton])[
```python
def main():
    system = load_system()
    while True:
        show_menu()
        choice = input("Choose: ").strip()
        if choice == "1":
            run_consultation(system)
        elif choice == "2":
            view_history()
        elif choice == "0":
            break
        else:
            print("Invalid choice")
```
- `load_system()` is a proposed helper that converts JSON into objects.
]

#slide(title: [We Already Save Consultation History])[
```json
[
  {
    "time": "2026-11-23T15:30:00",
    "answers": {"power_on": "no", "display_on": "no"},
    "advice": "Check the power cable and socket."
  }
]
```
- History is a *list of records*, not a list of `Rule` objects.
- Every consultation records *when*, *answers*, and *advice*.
]

#slide(title: [Why Load Before Appending History?])[
```python
history = []
try:
    with open(HISTORY_FILE, "r", encoding="utf-8") as file:
        history = json.load(file)
except FileNotFoundError:
    pass  # First consultation: no file yet

history.append(record)
with open(HISTORY_FILE, "w", encoding="utf-8") as file:
    json.dump(history, file, indent=4)
```
- Load the old list → append the new record → save the full list.
- The `data` folder must exist. Corrupt JSON should not be silently erased.
]

#slide(title: [Knowledge, History and Logs: Three Jobs])[
#grid(columns: (1fr, 1fr, 1fr), gutter: 10pt)[
#block(fill: rgb("#e9f2ff"), inset: 12pt)[*knowledge.json*  Questions and rules  What the system *knows*]
#block(fill: rgb("#e6f7ef"), inset: 12pt)[*history.json*  Completed consultations  What the system *recommended*]
#block(fill: rgb("#fff1e6"), inset: 12pt)[*troubleshooter.log*  Diagnostic events  What the system *did*]
]
- A log is optional and is not a substitute for the other two files.
]

#slide(title: [Example Troubleshooter Log])[
```text
2026-11-23 15:30:00 INFO Consultation started
2026-11-23 15:30:18 INFO Rule matched: power_on=no
2026-11-23 15:30:18 INFO Consultation saved
2026-11-23 15:31:05 WARNING Invalid answer: maybe
2026-11-23 15:31:09 INFO Answer accepted: yes
```
- Use append mode (`"a"`) for a simple text log.
- Log helpful diagnostic events, not unnecessary personal information.
]

#slide(title: [Predict: What If We Change a Rule?])[
1. A user runs a consultation and receives advice.
2. We edit the advice in `knowledge.json`.
3. We restart the program and run the same answers.

*Which advice will be shown?* The new advice loaded from JSON.

*What happens to the old consultation in `history.json`?* It remains as a record of what was recommended at that time.
]

#slide(title: [One Important Design Decision])[
- We *could* create a class for every concept, but we do not have to.
- A good OO design should simplify the program, not multiply classes for no reason.
- The original procedural functions are still useful.
- Start by moving related data and behaviour together.

*Question:* Is `Rule.matches()` a sensible responsibility for a `Rule` object? Why?
]

#slide(title: [Preparing for the Lab])[
- Identify which existing functions can stay as helpers.
- Decide what `Question`, `Rule` and `Troubleshooter` should manage.
- Keep the existing `knowledge.json` format and rule behaviour.
- Add a menu without mixing input code into matching logic.
- Preserve consultation history across runs.


]
