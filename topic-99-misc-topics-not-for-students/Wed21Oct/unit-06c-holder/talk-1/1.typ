#import "@preview/touying:0.7.3": *
#import themes.stargazer: *

#let note(body) = block(
  fill: rgb("#eaf4ef"),
  stroke: (paint: rgb("#77a98d"), thickness: 1pt),
  radius: 7pt,
  inset: 12pt,
  width: 100%,
  body,
)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Week 6A – Working with Data],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#title-slide()

#slide[
  == Where are we now?

We already know *lists*, *dictionaries*, *functions*, *selection* and *loops*.

Today we combine them to solve a bigger problem.

#note[Our focus is not new syntax. It's deciding how to organise and work with data.]
]

#slide[
  == A familiar collection

```python
students = [
    {"id": 1, "name": "Aoife", "mark": 72},
    {"id": 2, "name": "Ben", "mark": 48},
    {"id": 3, "name": "Cara", "mark": 65}
]
```

*Question:* What is the list? What is each dictionary?
]

#slide[
  == Reading the records

```python
for student in students:
    print(student["name"], student["mark"])
```

*Predict:* What appears on the screen?

*Discuss:* Why use a loop instead of three print statements?
]

#slide[
  == Selection while processing

```python
for student in students:
    if student["mark"] >= 40:
        print(student["name"], "Pass")
    else:
        print(student["name"], "Fail")
```

The loop visits each record; selection makes a decision about it.
]

#slide[
  == Counting and totals

```python
passes = 0
total = 0
for student in students:
    total += student["mark"]
    if student["mark"] >= 40:
        passes += 1
print("Passes:", passes)
print("Average:", total / len(students))
```

*Question:* What if the list is empty?
]

#slide[
  == Finding one record

```python
def find_student(students, student_id):
    for student in students:
        if student["id"] == student_id:
            return student
    return None
```

*Why is `return None` after the loop rather than inside it?*
]

#slide[
  == What is CRUD?

*Create* — add a record.

*Read* — display or find records.

*Update* — change a record.

*Delete* — remove a record.

#note[CRUD describes what our application needs to do, not a particular Python command.]
]

#slide[
  == Design before code

Imagine a small Dog Day Care Manager.

Each dog has an ID, name, breed and age.

For each CRUD operation, discuss:

- What information do we need?
- What do we find or change?
- What could go wrong?
]

#slide[
  == A useful pattern

```python
def find_dog(dogs, dog_id):
    for dog in dogs:
        if dog["id"] == dog_id:
            return dog
    return None
```

*Think:* Which CRUD operations could reuse `find_dog()`?
]

#slide[
  == A bigger question

We've used lists and dictionaries to manage *dogs* and *students*.

Could we use the same techniques to manage *knowledge*?

#note[This is the connection to our next project.]
]

#slide[
  == Our ongoing project

*PC Troubleshooting Assistant*

The program asks questions about a computer problem, then recommends something to try.

Example:

- Does the computer turn on? *No*
- Is the power cable connected? *Yes*
- Is the power light on? *No*

Recommendation: *Check the power supply or socket.*
]

#slide[
  == Where does its knowledge live?

```python
questions = [
    {"id": 1, "text": "Does the PC turn on?"},
    {"id": 2, "text": "Is the cable connected?"},
    {"id": 3, "text": "Is the power light on?"}
]
```

We can *store questions as data* rather than scattering them throughout our code.
]

#slide[
  == Even rules can be data

```python
rules = [
    {
        "id": 1,
        "question_id": 1,
        "expected_answer": "no",
        "recommendation": "Check the power supply"
    }
]
```

*Today:* understand the structure. *Later:* write code to evaluate rules.
]

#slide[
  == CRUD for an expert system

*Create* — add a troubleshooting question.

*Read* — list all questions.

*Update* — correct the wording of a question.

*Delete* — remove an outdated question.

#note[The same CRUD ideas work in very different applications.]
]

#slide[
  == Try it together

```python
def display_questions(questions):
    for question in questions:
        print(question["id"], question["text"])
```

*Challenge:* Design `find_question(questions, question_id)`.

What should it return if the ID does not exist?
]

#slide[
  == Looking ahead

Week 6: Questions and rules as *lists and dictionaries*.

Week 7: Save the knowledge base using *JSON*.

Later: Add *exceptions*, *classes*, *inheritance* and a general rule engine.

#note[We are not building the whole expert system today. Each week adds one piece.]
]
