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
    subtitle: [Week 6B – Building a CRUD Application],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#title-slide()

#slide[
  == Last time...

We combined lists, dictionaries, loops, selection and functions.

We also met CRUD: *Create, Read, Update, Delete*.

Today we build a small application using those ideas.
]

#slide[
  == Our starting data

```python
dogs = [
    {"id": 1, "name": "Buddy", "breed": "Retriever", "age": 4},
    {"id": 2, "name": "Luna", "breed": "Labrador", "age": 2}
]
```

Why is an ID more reliable than searching only by name?
]

#slide[
  == Design the operations

Before writing code, decide:

- Create: what information must we ask for?
- Read: all dogs, or one dog?
- Update: how do we identify the correct dog?
- Delete: how do we avoid removing the wrong one?

*Pair discussion:* What errors should we anticipate?
]

#slide[
  == One helper function

```python
def find_dog(dogs, dog_id):
    for dog in dogs:
        if dog["id"] == dog_id:
            return dog
    return None
```

*Predict:* What does `find_dog(dogs, 99)` return?
]

#slide[
  == READ: Display all dogs

```python
def display_dogs(dogs):
    for dog in dogs:
        print(dog["id"], dog["name"], dog["age"])
```

*Challenge:* What message would be helpful if there are no dogs?
]

#slide[
  == CREATE: Add a dog

```python
def add_dog(dogs):
    dog_id = int(input("ID: "))
    if find_dog(dogs, dog_id) is not None:
        print("That ID already exists")
        return
    name = input("Name: ")
    breed = input("Breed: ")
    age = int(input("Age: "))
    dogs.append({"id": dog_id, "name": name,
                 "breed": breed, "age": age})
```

Why do we check the ID *before* adding?
]

#slide[
  == UPDATE: Change an age

```python
def update_dog(dogs):
    dog_id = int(input("ID to update: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    else:
        dog["age"] = int(input("New age: "))
```

Why does changing `dog` also change the record in `dogs`?
]

#slide[
  == DELETE: Remove a dog

```python
def delete_dog(dogs):
    dog_id = int(input("ID to delete: "))
    dog = find_dog(dogs, dog_id)
    if dog is None:
        print("Dog not found")
    else:
        dogs.remove(dog)
```

*Discuss:* How could we add a confirmation step?
]

#slide[
  == A menu brings it together

```python
choice = ""
while choice != "5":
    print("1. View dogs")
    print("2. Add dog")
    print("3. Update dog")
    print("4. Delete dog")
    print("5. Exit")
    choice = input("Choose: ")
    # Call the appropriate function here
```

Which topics from previous weeks are we reusing?
]

#slide[
  == Predict, test, improve

Test these situations:

1. View all dogs.
2. Add a new dog.
3. Add a duplicate ID.
4. Update an unknown ID.
5. Delete a dog, then search for it.

*Question:* What happens if the user types `hello` when asked for an age?
]

#slide[
  == From dogs to questions

Our Dog Day Care program manages dog records.

Our expert system will manage *question records* and *rule records*.

The structure of the solution is surprisingly similar.
]

#slide[
  == Expert system: READ

```python
def display_questions(questions):
    for question in questions:
        print(question["id"], question["text"])
```

*Predict:* What changes compared with `display_dogs()`?

What stays exactly the same?
]

#slide[
  == Expert system: CREATE

```python
def add_question(questions, question_id, text):
    for question in questions:
        if question["id"] == question_id:
            return False
    questions.append({"id": question_id, "text": text})
    return True
```

*Discuss:* Why might returning `True` or `False` be useful?
]

#slide[
  == Expert system: UPDATE and DELETE

Work with a partner and write *pseudocode* for:

- `update_question(questions, question_id, new_text)`
- `delete_question(questions, question_id)`

Both must handle an ID that does not exist.

*Hint:* Could a `find_question()` helper make this easier?
]

#slide[
  == Knowledge and program logic

Our goal is to keep two things separate:

*Knowledge:* questions, rules and recommendations.

*Program logic:* code that displays, searches, edits and eventually evaluates those rules.

#note[Later, adding a new rule should not usually require another `if/elif` in the decision engine.]
]

#slide[
  == One problem remains...

We can add and edit questions while the program is running.

But what happens when we close Python and start again?

*The changes disappear.*

#note[Next week: files and JSON — making our knowledge base persistent.]
]
