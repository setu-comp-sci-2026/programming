#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Python & Data Science],
    subtitle: [How Python Became the Standard],
    author: [Historical Overview],
    date: datetime.today(),
    institution: [Python History],
    contact: [mairead.meagher\@setu.ie],
    logo-position: bottom + right,
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

= The Perfect Storm (2005-2012)

The convergence of technical and historical factors that made Python dominant in data science

#v(1em)

Key ingredients:
- Technical tools became available
- Business demand for data analysis exploded
- Perfect timing with academic adoption
- Community-driven open source development

= Early Technical Foundations

== NumPy (2005)

Fast, efficient numerical arrays created by Travis Oliphant

- Filled the gap pure Python couldn't handle
- Made Python competitive with MATLAB and R
- Enabled high-performance numerical computing

== SciPy (2001) & Matplotlib (2003)

- *SciPy*: Scientific computing algorithms
- *Matplotlib*: Easy data visualization and plotting
- Established Python as viable for scientific work

= The Data Science Demand Explosion

== Financial Crisis (2008)

- Banks needed better data analysis
- Risk modeling required massive computational power
- Python + NumPy could handle it efficiently

== Web 2.0 & Big Data

- Companies like Google, Facebook, Amazon generated enormous datasets
- Data-driven decision making became competitive advantage
- Need for tools to process massive amounts of data

== Machine Learning Boom

Scikit-learn (2007) released:
- Easy-to-use machine learning algorithms
- Made ML accessible to non-experts
- Simple, consistent API

= Pandas: The Game Changer (2008)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,

  [
    *Created by:* Wes McKinney (AQR Capital)

    *Why revolutionary:*
    - DataFrames (table-like data)
    - SQL-like operations in Python
    - Handle missing data easily
    - Reshape and merge datasets
  ],

  [
    *Before Pandas:*
    Manual loops, complex data structures

    *After Pandas:*
    ```python
    df = pd.read_csv('data.csv')
    result = df[df['age'] > 30]\
      .groupby('dept').sum()
    result.plot()
    ```
  ]
)

= Academic Adoption (2010-2015)

== Universities Switch to Python

- Replaced expensive MATLAB licenses with free Python
- New generation learned Python in school
- Entered industry already knowing the language

== Jupyter Notebooks (2014)

IPython evolved into Jupyter:
- Interactive exploratory data analysis
- Code, results, and documentation in one place
- Perfect for sharing and reproducible research
- Scientists could document entire analyses

= Machine Learning Explosion

== Deep Learning Libraries (2015-2020)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,

  [
    *TensorFlow (2015)*
    - Google's deep learning framework
    - Written with Python-first design
  ],

  [
    *PyTorch (2016)*
    - Facebook's alternative
    - Even more Pythonic and flexible
  ]
)

*Keras (2015)* — High-level API on top of TensorFlow

== Virtuous Cycle

- ML papers came with Python code
- New researchers learned by reading papers
- Adoption drove more adoption

== Comparison with Alternatives

=== Python vs R
- Python: General-purpose language
- R: Statistical language only
- Winner: Python (broader ecosystem)

== Python vs MATLAB
- MATLAB: Expensive, proprietary
- Python: Free and open source
- Winner: Python (accessibility)

== Python vs Java/C++
- Traditional languages: Verbose, compilation needed
- Python: Quick prototyping, simple syntax
- Winner: Python (data scientists want simplicity)

= Emergence of Python 

== Timeline of Dominance

#align(center)[
  #table(
    columns: (auto, 1fr),
    [*Year*], [*Event*],
    [2005], [NumPy released],
    [2008], [Pandas created],
    [2010], [Jupyter notebooks appear],
    [2012], [Python clearly winning],
    [2015], [TensorFlow/PyTorch released],
    [2017], [Python #1 for data science],
    [2020], [Python most popular overall],
  )
]

== Key Cultural Factor: Open Source

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,

  [
    *Python's Strength:*
    - Hundreds of community contributions
    - Clear, consistent APIs
    - Easy to install (pip)
    - Libraries built on libraries
  ],

  [
    *Why R Struggled:*
    - Many packages, less standardization
    - Different conventions between packages
    - Harder to chain operations
  ]
)

== Why This Matters Today

=== Network Effects

```
More people use Python
  ↓
More libraries exist
  ↓
More people use Python (repeat)
```

- Job market wants Python talent
- Universities teach Python
- New scientists learn Python
- The snowball keeps rolling

= The Perfect Requirements for Data Science

Python provided everything needed:
#text(size: 12pt)[

✓ Fast computation (NumPy) 

✓ Easy data manipulation (Pandas)

✓ Beautiful visualizations (Matplotlib)

✓ Machine learning (Scikit-learn, TensorFlow)

✓ Easy to learn syntax

✓ Reproducible research (Jupyter)

✓ Free and open source

✓ General-purpose language

*No other language had all of these at the right time.*]

== The NumPy Performance Secret

Many people think Python is "too slow" for data science.

The secret: *NumPy operations are not in Python!*

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,

  [
    *Looks like Python:*
    ```python
    result = array1 + array2
    ```
  ],

  [
    *Actually runs:*
    Optimized C and Fortran code
  ]
)

This allowed Python to maintain ease-of-use while achieving competitive performance.

== What if Python Hadn't Won?

Data science would likely:
- Still use R for statistics, MATLAB for computation
- Lack unified ecosystem
- Require multiple languages per project
- Have slower reproducibility
- AI/ML explosion would be delayed

Python's victory was about **timing, free access, and simple syntax for domain experts.**

== Key Takeaways

1. *Timing matters* — Tools appeared when demand exploded
2. *Community-driven* — Individuals, not top-down mandates
3. *Ecosystem effects* — Libraries built on libraries
4. *Accessibility* — Free, easy syntax, no compilation
5. *Versatility* — Not just for data science
6. *Education* — Universities teaching Python created talent pipeline

== The Perfect Storm

#align(center)[
  + Technical Foundations (NumPy, Pandas)

  + Business Demand (Big Data, ML boom)

  + Academic Adoption (Universities)

  + Community Contributions (Open Source)


  + *Python as Data Science Standard*
]

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
