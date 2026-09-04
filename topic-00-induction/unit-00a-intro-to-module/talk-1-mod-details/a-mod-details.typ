#import "@preview/red-agora:0.2.0": project
// ── Programming Fundamentals – Course Outline ─────────────────────────────────
// Rewritten from PDF original. Title page omitted.
// Assessment schedule is driven from semester1.yaml.

#let data = yaml("a-mod-details.yaml")

// ── Page & typography ─────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 3cm, y: 2.5cm),
  footer: context [
    #set text(size: 8pt, fill: luma(120))
    Course Outline and Essential Information – Certificate in Computer Science
    #h(1fr)
    #counter(page).display("1")
  ],
)
#set text(font: "New Computer Modern", size: 11pt)
#set par(leading: 0.75em, justify: true)
#show raw.where(block: true): it => block(
  fill: rgb("#dbeafe"),
  stroke: (paint: rgb("#3572A5"), thickness: 1.5pt),
  radius: 6pt,
  inset: 12pt,
  width: 100%,
  it
)

#set heading(numbering: "1.")
#show heading: it => { v(0.8em); it; v(0.4em) }


// ── Helpers (assessment table) ────────────────────────────────────────────────
#let fmt-date(d) = {
  let parts = d.split("-")
  let y = parts.at(0)
  let m = int(parts.at(1))
  let day = parts.at(2)
  let months = (
    "Jan","Feb","Mar","Apr","May","Jun",
    "Jul","Aug","Sep","Oct","Nov","Dec"
  )
  [#day #months.at(m - 1)]
}

#let fmt-week(n) = {
  if type(n) == int {
    if n < 0 { [–] } else { [#n] }
  } else {
    [#n]
  }
}

#let fmt-assess(a) = {
  if a == none {
    [–]
  } else {
    [*#a.name* \ #a.percentage% · due #fmt-date(str(a.due)) \ ] + emph(a.submission)
  }
}
#page(footer: none)[

  #align(center)[
    #text(size: 24pt, weight: "bold")[Programming Fundamentals]
    #v(0.2em)
    #text(size: 16pt, weight: "bold")[Using Python]
    #v(0.2em)
    #text(size: 16pt)[Semester 1 2026]
    #v(0.2em)
    #text(size: 14pt)[Certificate in Computer Science]
    #v(1em)
    #text(size: 13pt)[Course Outline and Essential Information]
  ]

  #align(center)[

    #grid(
      columns: 2,
      gutter: 3em,
      align(center)[
        #image("assets/siobhan.png", width: 3cm)
        #v(0.4em)
        *Siobhán Roche* \
        #link("mailto:siobhan.roche@setu.ie")[siobhan.roche\@setu.ie]
      ],
      align(center)[
        #image("assets/maireadMeagherPP.jpg", width: 4cm)
        #v(0.3em)
        *Mairéad Meagher* \
        #link("mailto:mairead.meagher@setu.ie")[mairead.meagher\@setu.ie]
      ],
    )
      #text(size: 16pt, weight:"bold")[Module Lecturing Team ]

]
// ── Table of Contents 

#show outline.entry: it => align(left, it)
#align(center)[
  #outline(
    title: text(size: 16pt, weight: "bold")[Table of Contents],
    depth: 2,
    indent: 1em,
  )
]]


// ═════════════════════════════════════════════════════════════════════════════
= Lecturers

*Siobhán Roche*, #link("mailto:siobhan.roche@setu.ie")[siobhan.roche\@setu.ie], Lecturer in Department of Computing and Mathematics.

*Mairéad Meagher*, #link("mailto:mairead.meagher@setu.ie")[mairead.meagher\@setu.ie], Lecturer in Department of Computing and Mathematics.


// ═════════════════════════════════════════════════════════════════════════════
= How to reach us

- The quickest way to reach us is via the main Slack channel. We will be using this as the main form of communication for this module. You can join our Slack channel at #link("https://setu.ie/slack")[https://setu-comp-sci-26.slack.com].

- We are available during work hours from Monday to Friday. You can email/Slack us outside of these hours and we will reply as soon as we can, but always within three days. (If this does not happen, assume your contact has gone into spam etc. and please re-contact us.) If you are  emailing us, please indicate what module you are taking as well as the nature of your query in the subject line, and do not forget to use an appropriate greeting and sign off. Whether communicating via email or Slack, please be polite. It's important to be polite and to treat one another with respect; let's start as we mean to go on.

// ═════════════════════════════════════════════════════════════════════════════
= Programming Technologies

We will be using Python and will use the Visual Studio Code editor to code in Python.
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align(center)[
    
    #image("assets/python.png", width: 6cm)
    #v(0.4em)
    *Python*
  ],
  align(center)[

  
    #image("assets/vscode.png", width: 6cm)
    #v(0.4em)
    *Visual Studio Code*  
  ]
)
#pagebreak()
= Learning Technologies

In order to maximise our ability to connect with one another and to make our classes as accessible as possible for everyone, we will use both synchronous and asynchronous learning technologies during this module. They will include:

- All lectures will happen as per timetable. The lecture will be delivered live and streamed through YouTube via the tutors page. This will be available to you from then on.

- Tutorials will be held online at times to be confirmed.

- *tutors* – This static website will hold all the notes, labs and links to videos. This site will be updated each week to include the following week's material.
#pagebreak()
== Structure of a week of the module

Each week of the module is structured as follows:
#table(
  columns: (1fr, 1fr),
  fill: (col, row) => {
    if row == 0 { none }
    else if col == 0 { rgb("#d4edda") }
    else { rgb("#f8d7da") }
  },
  stroke: 0.5pt + luma(200),
  inset: 9pt,
  table.header(
    text(weight: "bold")[Monday],
    text(weight: "bold")[Wednesday],
  ),
  [*Seminar 1 - 12:15 - 2:00pm*],
  [*Seminar 2 - 12:15 - 2:00pm*],
  [ synchronous webinar via youtube and available later all via tutors],
  [ synchronous webinar via youtube and available later all via tutors],
  [*Lab#footnote[We call these 'labs' because traditionally they were done in 'labs' which we now call computer rooms. Old habits, however… tutors uses this terminology also. You will not need white coats!] 1 - 7 to 8 pm*],
  [*Lab 2 - 7 to 8 pm*],
  [tutor is available on Zoom ],
  [tutor is available on Zoom ],
)



- Each week, we will have two 2-hour webinars. These will introduce topics.

- There will be _labs_ associated with each topic. These are step-by-step walkthroughs of what we have covered in the webinar with some exercises added in. What we are aiming for here is to give you a chance to practice what you have learnt in the webinar. You should then be able to attempt the exercises associated with the lab. These exercises will typically be small programming tasks that are very similar to what you have just practiced in the lab.

- Most labs (especially at the start) will include *Challenge Exercises*. These are more difficult exercises that will stretch your understanding of the topic but they are not necessary to complete.

- Remember that the labs are not graded but are there to help you understand the material.

- Just by trying the exercises, you will be in a better position to understand the solution when you see it.

#block(
  fill: luma(230),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  _Please do not be tempted to look at the solution before you have tried the exercise. This will give you a false sense of confidence in your understanding._
]

#pagebreak()

// ═════════════════════════════════════════════════════════════════════════════
= Module objectives / Learning outcomes

On completion of this module students should be able to:

+ Apply core problem solving approaches suitable to the programming discipline to build algorithms.
+ Write small applications using standard sequence, conditional and iterative control structures.
+ Modify and expand small applications.
+ Write small applications that use simple UI, computation and data structures.
+ Develop techniques to effectively test, debug and document small applications.
+ Analyse and explain how the above applications work.



= Assessment Breakdown

The module is assessed by continuous assessment.

== Continuous Assessment (100%)

Your module assessment is made up of the following:

#let total = data.weeks.fold(0, (acc, w) => {
  if w.assessment != none { acc + w.assessment.percentage } else { acc }
})

#for w in data.weeks {
  if w.assessment != none {
    let a = w.assessment
    [- *#a.name* -- #a.percentage% -- due #fmt-date(str(a.due)). Submission: #a.submission. ]
  }
}

The percentage associated with each assignment reflects the difficulty and complexity of the assignment. For each of the assessment deliverables, you may be asked to be available to be interviewed on your submission.

You will get your marks back as soon as is possible. If you are wondering why you got a particular mark, *always ask us*. The marking schemes are very comprehensive and we are happy to go through the breakdowns with you.

A marking scheme will be published with the specification of the assignment. *Please ensure that you are fully aware of the marking scheme.* If there are marks going for a particular part and you haven't attempted that part, there is nothing we can do. Always make it easy for the examiner to give you marks!
#pagebreak()
=== Topics and Assessment Schedule

#v(0.5em)

#table(
 columns: (2cm, 2cm, 1fr, 1fr),
  fill: (_, row) => if row == 0 { rgb("#2e4057") } else if calc.odd(row) { rgb("#f5f7fa") } else { white },
  stroke: (x, y) => (
    bottom: if y == 0 { (paint: rgb("#2e4057"), thickness: 1.5pt) }
            else      { (paint: luma(200),       thickness: 0.5pt) }
  ),
  inset: (x: 8pt, y: 7pt),
  table.header(
    text(fill: white, weight: "bold")[Week],
    text(fill: white, weight: "bold")[Week Starting],
    text(fill: white, weight: "bold")[Topic],
    text(fill: red, weight: "bold")[Assessment],
  ),
  ..data.weeks.map(w => (
    align(center, fmt-week(w.week)),
    fmt-date(str(w.date)),
    [#w.topic],
    text(fill:red)[#fmt-assess(w.assessment)],
  )).flatten(),
)

#v(0.3em)
#align(right)[#text(size: 9pt, fill: luma(100))[Total marks: *#total%*]]

== Submission of Assignments

If you wish to seek an extension for an assignment, you must do so in sufficient time (i.e. not on the day of submission, and not when the submission date has passed) and must provide a valid reason for seeking the extension including medical certification where appropriate.

#block(
  fill: rgb("#fff3cd"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Note on AI Bots:* Due to prevalence of AI Bots in the general ecosphere, we need to re-iterate that use of AI Bots is not allowed, as usual in these cases, without referencing. Use of AI Bots, even with good understanding, may result in significantly lower marks.
]

// ═════════════════════════════════════════════════════════════════════════════
= Important note about engagement in the module and time management

Part of active engagement for any module involves a degree of time management. As part of this module, we will be asking you to complete exercises between class times, e.g. labs including exercises. These will not be graded but, by engaging in these tasks at the time, you will be in a better position to understand the next part of the module. We will approach the module in a step-by-step manner, so opting out at any part will make it more difficult for you to keep up. 

Always ask questions, via Slack or during the webinars. One way to help to stay engaged is to ask questions if you don't understand what is going on. Remember, when you are asking questions:

+ Just the process of asking a question means that you have learned something.
+ If you cannot understand, in most cases, you are not the only one.
+ Asking questions means that the pace of the lecture/labs will suit you better – we will always keep going if there are no questions!

// ═════════════════════════════════════════════════════════════════════════════
= Netiquette and Decorum

In all of our asynchronous discussions online, e.g. Slack, it is important that we foster a supportive, safe, and engaging learning environment. Diverse views are encouraged and welcomed and should be based on evidence. You are free to express your views and ideas as long as your words or actions do not demean, intimidate, or intend to violate the rights and dignities of others. Hate speech is not acceptable and may result in disciplinary action. Hate speech includes words or actions that threaten or target the safety and liberties of an individual or group.

== Netiquette

The word _netiquette_ is a combination of 'net' (from internet) and 'etiquette'. It means respecting other users' views and displaying courtesy when posting your views to online discussion groups, in this and other modules. 

#v(0.5em)

- *Remember that there is a human being on the other end of your communication* and treat them with respect.
- Do not post a message that you would not be willing to communicate in a face-to-face environment. Keep it courteous.
- *Be kind and professional:* Online communication comes with a level of anonymity that doesn't exist when talking to someone face-to-face. Make a point to be kind and respectful in your comments—even if you disagree with someone.
- *Extend your good nature online:* The digital world is an increasingly important part of our lives. We should be our best selves there too. Good manners are a good thing to apply everywhere.
- *Promote healthy discussions:* You can help your online community by posing questions, sharing experiences, providing positive feedback, asking follow-up questions, and referring to information sources. Being a positive contributor is better than being a critic, troll or other negative force.
- *Respect others as equals:* Show a little respect and humility online. That person whose opinion you completely disagree with is a human being. They have feelings and experiences. They may believe passionately in what they're saying. And they may actually be right.
- *You're here to learn and contribute, not dictate:* Adopt a listening mode. Read posts carefully, ask questions, and write something only if it offers value to the discussion.
- *Read first:* Take some time to read through the previous discussion responses before writing your own. Building upon a classmate's thought or adding something new to the conversation shows you've been paying attention.
- *Remember, your words are permanent:* Be careful with what you post online. Once it's out there, you may not be able to get it back.
- *Pause before you post:* Take a moment to reflect before hitting send. Are you truly comfortable with what you're sending?
- *Respect the opinion of your classmates:* If you feel the need to disagree, do so respectfully and acknowledge the valid points in your classmate's argument. If you reply to a question from a classmate, make sure your answer is accurate!
- *Forgive and Forget:* If you're offended by something another student says online, keep in mind that you may have misunderstood their intentions. Give them the benefit of the doubt.

= Organising Your College Work

== Use of Bookmarks
Whichever web browser you use, you should be using bookmarks to keep track of important resources. If you have a 'bookmarks' folder in your browser, you should be using that. If you don't, you should create one. Maybe have a separate folder for each module. Now is the time to set all those up/organise them. *This will significantly help you during this and other  modules.* 

== Suggested Filing System

A suggested filing system for organising your college work is shown below. Note you could have subfolders named Week 1 / Topic 1 etc., whichever is most appropriate. Having set this up, you will get used to using it very quickly and will save a lot of time in the long run.
#align(center)[
        #image("assets/filing.png", width: 6cm)]

== Do's and Dont's of Filing Systems 
#v(0.5em)
#table(
  columns: (1fr, 1fr),
  fill: (col, row) => {
    if row == 0 { none }
    else if col == 0 { rgb("#d4edda") }
    else { rgb("#f8d7da") }
  },
  stroke: 0.5pt + luma(200),
  inset: 9pt,
  table.header(
    text(weight: "bold")[DO],
    text(weight: "bold")[DON'T],
  ),
  [Set up the folder structure and continue to use it],
  [Set up and use it 'an odd time'],
  [Set up a 'favourites' folder in Explorer/Finder for your 'college' subfolder],
  [Use Downloads or Desktop as the root folder for 'college'],
  [Store data (weekly homework, etc.) using this structure],
  [Mix up data and programs in the college folder],
  [Store your software (e.g. your IDE) in a separate folder, e.g. #raw("/dev")],
  [],
)
#pagebreak()
#v(10em)

#align(center)[
  #text(size: 12pt)[Finally, we wish you all the best of luck with this module and all of your university experience.]
#v(6em)
  #image("assets/good-luck.jpg", width: 7cm)

#v(6em)
  Siobhán and Máiréad
]
