#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/cetz:0.2.2": *

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals ],
    subtitle: [Topic 1 - Intro to Python - Setting up ],
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

= Why Python?

= Installing Python

= Installing Visual Studio Code for Python  
== Installing Visual Studio Code
== Installing the Python Extension in Visual Studio Code

= Setting up Python in Visual Studio Code

= Running Your First Python Code in Visual Studio Code
jadflakjhfalkjhfdlajdhaldfj




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
