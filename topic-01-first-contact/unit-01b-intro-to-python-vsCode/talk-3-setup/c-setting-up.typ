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
    author: [Progrmamming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
  
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

= Installing Python
#slide[
  Go to #link("https://https://www.python.org/downloads")[
 Python Downloads ]
 
 - This is the official Python website where you can download the latest version of Python for your operating system (Windows, macOS, Linux). 
 - Follow the instructions to install Python on your computer. Any problems, ask for help!
][
    #align(center)[#image("assets/python-downloads.png", width: 7cm)]
]
= Installing Visual Studio Code for Python  
#slide[
- Visual Studio Code (VS Code) is a popular code editor that supports Python development. 
- It provides features like syntax highlighting, code completion, debugging, and integrated terminal, making it a great choice for Python programming.][
    #align(center)[#image("assets/vscode.png", width: 7cm)]
]

== Installing Visual Studio Code
#slide[
  Go to #link("https://code.visualstudio.com/download")[
 Visual Studio Code Downloads ]
 
 - This is the official Visual Studio Code website where you can download the latest version of VS Code for your operating system (Windows, macOS, Linux). 
 - Follow the instructions to install VS Code on your computer. Any problems, ask for help!
][
    #align(center)[#image("assets/vscode-downloads.png", width: 7cm)
]]
== Installing the Python Extension in Visual Studio Code
#slide[
  - Open Visual Studio Code and go to the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of the window or by pressing `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (macOS). 
  
  - Search for "Python" in the Extensions marketplace and install the official *Python* extension provided by Microsoft. This extension provides features like linting, debugging, and code navigation for Python development in VS Code.
][
    #align(center)[#image("assets/vscode-plugin.png", width: 7cm)]
]
= Setting up Python in Visual Studio Code
To set up Python in Visual Studio Code, follow these steps:
1. Open Visual Studio Code and create a new file with a `.py` extension (e.g., `hello.py`).
2. Write your Python code in the file. For example, you can write a simple "
Hello, World!" program:
```python
print("Hello, World!")
```
= Running Your First Python Code in Visual Studio Code
To run your Python code in Visual Studio Code, follow these steps:
1. Open the Python file you want to run (e.g., `hello.py`).
2. You can run the code in several ways:
   - *(Preferred)* Right-click on the editor and select "Run Python File in Terminal" to run the code in the integrated terminal.
   - Press `Ctrl+F5` (Windows/Linux) or `Cmd+F5` (macOS) to run the code without debugging.

3. The output of your Python code will be displayed in the terminal. For example, if you run the "Hello, World!" program, you should see the output:
```
Hello, World!
```





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
