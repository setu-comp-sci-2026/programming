#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/SETUProfile.png", width: 2cm, height: 2cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals ],
    subtitle: [Using Python],
    author: [Mairead Meagher, Siobhan Roche, Peter Windle],
    date: datetime.today(),
    institution: [SETU],
    contact: [mairead.meagher\@setu.ie],
    logo-position: bottom + right,
    logo: my-logo
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(
  background: place(left + top, dx: 8.5em, dy: 1em,)[
#opaque-logo]
   )


#title-slide()
#set page(background: none)
#outline-slide()

= Lecturers/Tutors
== Introducing the Lecturers/Tutors
#grid(
  columns: 1fr,
  gutter: .5em,
 
  // Siobhan Roche
  rect(fill: rgb("#20B2AA"), inset: 1em)[
    #grid(
      columns: (2fr, 1fr),  // 2/3 text, 1/3 image
      gutter: 0.5em,
      [
        *Siobhan Roche*
        - Profile: #link("https://www.setu.ie/staff/siobhan-roche")[setu.ie/staff/siobhan-roche]
        - Email: #link("mailto:siobhan.roche@setu.ie")[siobhan.roche\@setu.ie]
      ],
      align(center)[
        #image("assets/siobhan.png", width: 21%)
      ]
    )
  ], 
  
  // Peter Windle
  rect(fill: rgb("#20B2AA"), inset: 1em)[
    #grid(
      columns: (2fr, 1fr),
      gutter: .5em,
      [
        *Peter Windle*
        - Profile: #link("https://www.setu.ie/staff/peter-windle")[setu.ie/staff/peter-windle]
        - Email: #link("mailto:peter.windle@setu.ie")[peter.windle\@setu.ie]
      ],
      align(center)[
        #image("assets/pete.png", width: 25%)
      ]
    )
  ],
  
  // Mairead Meagher
  rect(fill: rgb("#20B2AA"), inset: 1em)[
    #grid(
      columns: (2fr, 1fr ),
      gutter: 0.5em,
      [
        *Mairead Meagher*
        - Profile: #link("https://www.setu.ie/staff/mairead-meagher")[setu.ie/staff/mairead-meagher]
        - Email: #link("mailto:mairead.meagher@setu.ie")[mairead.meagher\@setu.ie]
      ],
      align(center)[
        #image("assets/mairead.png", width: 25%)
      ]
    )
  ],
)




= Module Strucure and Delivery




// Header
#rect(fill: rgb("#287bd3"), width: 100%, inset: 1em)[
  #set align(center)
  #set text(fill: white, size: 28pt, weight: "bold")
  10 weeks of delivery
]

// Schedule grid
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center + horizon,  
  
  // Lectures
  rect( fill:  rgb("#287bd3"), inset: .5em)[
     #set text(fill: white, size: 20pt, weight: "bold")
    #align(center)[
      2 x Lectures 
      (webinar/video)
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      rect(fill: rgb("#20B2AA"), inset: 0.5em)[
        #set align(center)
        #set text(size: 12pt)
        Mon

        12:15 - 2:00
      ],
      rect(fill: rgb("#20B2AA"), inset: 0.5em)[
        #set align(center)
        #set text(size: 12pt)
        Wed

        12:15 - 2:00
      ],
    )
  ],
  
  //  Labs
  rect(fill: rgb("#287bd3"), inset: 1em, height: 7em)[
    #set text(fill: white, weight: "bold")
    #align(center)[
      2 x Labs
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      rect(fill: rgb("#20B2AA"), inset: 0.5em)[
        #set align(center)
        #set text(size: 12pt)
        Mon

        Tues
      ],
      rect(fill: rgb("#20B2AA"), inset: 0.5em)[
        #set align(center)
        #set text(size: 12pt)
        Wed

        Thurs
      ],
    )
  ],
  
  // Lab Support
  rect(fill: rgb("#287bd3"), inset: 1em, height: 7em)[
    #set text(fill: white, weight: "bold")

    #align(center)[

      Lab Support
      on Slack
  ]
  #v(0.5em)
   #grid(
      columns: (1fr),
      gutter: 0.5em,
      rect(fill: rgb("#20B2AA"), inset: 0.5em)[
         #set text(size: 12pt)
        #set align(center)
      //  #set text(size: 12pt)
      response to queries
    
      within 24 hours M-T 
  ])
   ], 
  
)
  


= Learning Technologies

// Turquoise box as background
#rect(fill: rgb("#20B2AA"), width: 100%, height: 100%)[
  #set text(size: 48pt, weight: "bold")
  #v(3em)
  #h(1em)
]

// Icons scattered around

#place(top + left, dx: 5em, dy: 5em)[
  #image("assets/moodle-logo.png", width: 4cm)
]
#place(top + right, dx: -2em, dy: 4em)[
  #image("assets/tutors-logo.png", width: 4cm)
]

#place(top + right, dx: -16em, dy: 4em)[
  #image("assets/youtube-logo.png", width: 4cm)
]



#place(left, dx: 6em, dy: -5em)[
  #image("assets/slack-logo.png", width: 4cm)
]

#place(right, dx: -10em, dy: -5em)[
  #image("assets/zoom-logo.png", width: 4cm)
]


= Programming Technologies
// Turquoise box as background
#rect(fill: rgb("#20B2AA"), width: 100%, height: 100%)[
  #set text(size: 48pt, weight: "bold")
  #v(3em)
  #h(1em)
]
#place(top ,  dx: 2em, dy: 6em)[
  #image("assets/python-logo.png", width: 8cm)
  
]
#place(top ,  dx: 19em, dy: 12em)[
   #set text(size: 24pt, weight: "bold")
  Visual Studio Code
  
]

#place(top + left, dx: 21em, dy: 5em)[
  #image("assets/vscode.png", width: 4cm)
]

= Calendar 
TODO: Add calendar content here.
= Schedule
TODO: Add schedule content here.

= Assessment and Interviews

 - 100% Continuous Assessment (CA).
- All Individual assignments (no team-based ones).
- Submit via Moodle assignment dropboxes.
- Hard deadlines; extensions only permitted if mitigating circumstances apply.
- Interviews 

= Use of Slack 



== Decision Diagram

// Start
// Start
#align(center)[
  #rect(fill: rgb("#20B2AA"), inset: .5em, width: 40%)[
    #text(size: 16pt, white, weight: "bold")[Start (having checked your notes)]
  ]
]
#align(center)[
  #text(size: 30pt)[↓]
]


// Decision
#align(center)[
  #rect(fill: rgb("#20B2AA"), inset: .5em, width: 30%)[
    #text(white, size: 16pt, weight: "bold")[Check the Slack channel - has it already been answered? ?]
  ]
]
#grid(
  columns: (1fr, 1fr),
  gutter: 0em,
  
  align(center)[#text(size: 30pt)[↙]],
  align(center)[#text(size: 30pt)[↘]],
)



// Yes/No branches
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  
  // Yes branch
  align(center)[
    #rect(fill: rgb("#E63946"), inset: .5em, width: 80%)[
      #text(white, size:16pt, weight: "bold")[Yes- Great! Check the answer and try it out. ?]
    ]
  ],
  
  // No branch
  align(center)[
    #rect(fill: rgb("#457B9D"), inset: .5em, width: 80%)[
      #text(white, size:16pt, weight: "bold")[No - Post the question in Slack, including any relevant screenshots, recordings, etc.]
    ]
  ]
)
== Troubleshooting Problems 

- We encourage classmates to help each other (peer learning), if you know the answer to another student’s issue, please do respond.
- All our responses will be via Slack 
	so that all students can see the resolution.
- For private issues, use DM in Slack. 
= Starting point for module 

== Where to start?
Links for tutors, Moodle, Slack, YouTube channel, etc.

== Getting Started
where to find the first lecture, how to access the labs, etc.

