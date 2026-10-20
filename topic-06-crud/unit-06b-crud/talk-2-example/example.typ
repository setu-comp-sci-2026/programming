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
    subtitle: [Week 6 — Introducing the PC Troubleshooter],
    author: [Programming Fundamentals Team],
    institution: [SETU],
    date: datetime.today(),
  ),
)
#set text(size: 20pt)
#title-slide()

#slide(title: [Remember Assignment 1: Make My Decision!?])[
  In Assignment 1, you built a program that *made a recommendation*.

  Your program:
  - asked the user for information
  - used `if`, `elif` and `else` to check their answers
  - displayed a recommendation

  #pause

  #note[You have already written the beginnings of a rule-based system!]
]

#slide(title: [What Did Your Rules Look Like?])[
  A simple decision might have looked like this:

  ```python
  if budget < 500:
      print("Choose the budget option")
  else:
      print("Consider the premium option")
  ```

  The rule is *written directly into the program*.

  #pause

  *Question:* What would you need to change if you wanted to add 20 more rules?
]

#slide(title: [Assignment 2: Build an Expert System])[
  We are going to develop that idea further.

  Instead of one small decision, our program will:
  - ask a series of questions
  - use the answers to check *rules*
  - suggest possible solutions
  - explain *why* a recommendation was made

  #note[The big change: we will store much of the expert knowledge as data, rather than hard-code every decision.]
]

#slide(title: [Our Worked Example: PC Troubleshooter])[
  Imagine someone tells you:

  *"My computer isn't working!"*

  You cannot recommend a solution yet. You need more information.

  You might ask:
  - Does the computer turn on?
  - Is the power cable connected?
  - Is the power indicator light on?
  - Does the monitor show an image?

  #pause

  *Discuss:* Why is "My computer isn't working" not enough information?
]

#slide(title: [Why Do We Need Questions?])[
  *Questions collect evidence* about the problem.

  ```python
  questions = [
      {"id": 1, "text": "Does the computer turn on?"},
      {"id": 2, "text": "Is the power cable connected?"},
      {"id": 3, "text": "Is the power light on?"}
  ]
  ```

  Each question is a *dictionary*.

  All the questions are stored in a *list*.

  #note[We already know how to loop through, search and update lists of dictionaries. .]
]

#slide(title: [Why Do We Need Recommendations?])[
  A recommendation is the *advice* our system might give.

  ```python
  recommendations = [
      {"id": 1, "title": "Check the power cable"},
      {"id": 2, "title": "Check the power supply"},
      {"id": 3, "title": "Check the monitor"}
  ]
  ```

  Notice that recommendations have IDs too.

  Later, a rule can refer to a recommendation by its ID.

  #pause

  *Question:* Is a recommendation the same thing as a question?
]

#slide(title: [Why Do We Need Rules?])[
  A *rule* connects the evidence to a recommendation.

  *IF* the computer does not turn on, *THEN* suggest checking the power cable.

  We can represent that simple rule as data:

  ```python
  rule = {
      "id": 1,
      "question_id": 1,
      "expected_answer": "no",
      "recommendation_id": 1
  }
  ```

  #note[This is our first, simplified rule format. Later, rules can check several answers together.]
]

#slide(title: [From Assignment 1 to Assignment 2])[
  #table(
    columns: (1fr, 1fr),
    inset: 9pt,
    [*Assignment 1*], [*Assignment 2*],
    [Ask for input], [Ask troubleshooting questions],
    [Decisions written using `if` / `elif`], [Rules stored as data],
    [Display a recommendation], [Match rules and explain recommendations],
    [Small, fixed decision program], [Knowledge that can grow and change],
  )

  #pause

  *The same programming ideas — but a more flexible design.*
]

#slide(title: [What Are We Building This Week?])[
  *Not the finished expert system!*

  This week, we will practise managing its data.

  - Display the questions
  - Find a question by ID
  - Add a question
  - Update a question
  - Delete a question

  These are the *CRUD* operations: Create, Read, Update, Delete.

  #note[We'll start with lists, dictionaries and functions — no classes or JSON required yet.]
]

#slide(title: [Quick Class Activity])[
  A user says: *"The screen is blank."*

  Write:

  1. *Two questions* you would ask
  2. *Two recommendations* you might give
  3. *One IF/THEN rule* connecting an answer to advice

  #pause

  Then consider: Which parts are *data*? Which part is the *decision*?
]
#slide(title: [Class Activity: One Possible Answer])[
  A user tells us: *"The screen is blank."*

  *Two questions we could ask:*
  + Is the monitor switched on?
  + Is the monitor cable connected properly?

  *Two recommendations we could give:*
  + Switch on the monitor and check its power connection.
  + Check that the cable between the monitor and computer is secure.

  #note[There are several valid answers. The important thing is to ask useful questions and suggest relevant advice.]
]

#slide(title: [Connecting a Question to a Recommendation])[
  *Our first IF/THEN rule:*

  #note[*IF* the monitor is not switched on, *THEN* recommend switching it on.]

  The rule connects three things:
  - *Question:* Is the monitor switched on?
  - *Answer:* No
  - *Recommendation:* Switch on the monitor.

  *Would we give the same recommendation if the answer was "Yes"?*
]

#slide(title: [Representing the Questions and Advice as Data])[
  We can use the dictionaries and lists we already know:

  ```python
  questions = [
      {"id": 1, "text": "Is the monitor switched on?"},
      {"id": 2, "text": "Is the monitor cable connected?"}
  ]

  recommendations = [
      {"id": 1, "text": "Switch on the monitor"},
      {"id": 2, "text": "Check the monitor cable"}
  ]
  ```

  Each *ID* gives us a way to refer to a particular question or recommendation.
]

#slide(title: [Representing Our Rule as Data])[
  Our rule can also be a dictionary:

  ```python
  rule = {
      "question_id": 1,
      "expected_answer": "no",
      "recommendation_id": 1
  }
  ```


  IF the answer to *question 1* is *"no"*, THEN suggest *recommendation 1*.

  #note[We are only storing the rule today. We will write code to check rules later.]
]

#slide(title: [What If the Screen Is Still Blank?])[
  Suppose the user answers:

  *"Yes, the monitor is switched on — but the screen is still blank."*

  Our first rule doesn't help. We need more evidence.

  - Is the monitor cable connected?
  - Is the computer itself switched on?
  - Is the monitor set to the correct input?

  #pause

  *Looking ahead:* A more useful rule may need to check *several answers together*.

  #note[Questions gather evidence. Rules use the evidence. Recommendations provide advice.]
]


#slide(title: [The Bigger Picture])[
  Over the coming weeks, we'll develop our PC Troubleshooter step by step.

  *Week 6:* Lists, dictionaries, functions and CRUD

  *Next:* Save our questions and rules in JSON files

  *Later:* Use classes and objects, and build a more capable rule engine

  #note[Our goal: change what the system knows without rewriting all its decision-making code.]
]
