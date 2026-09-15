// =====================================================================
//  Shared preamble for Python Programming Fundamentals slide decks
//
//  Usage, in each deck, immediately after the stargazer theme block:
//
//      #import "../../../preamble.typ": *
//      #show: styles
//
//  (adjust the number of "../" to the deck's depth below the repo root)
//
//  Exports:
//      styles          show-rule bundle: code blocks, bullets, heading numbering
//      note[..]        green highlighted note box
//      todo[..]        block TODO box, hidden when show-todos is false
//      itodo[..]       inline TODO tag
//      todo-outline()  summary slide listing every TODO and its slide number
//      show-todos      master switch — set false for student-facing exports
// =====================================================================

#import "@preview/numbly:0.1.0": numbly

// ---------------------------------------------------------------- styles
#let styles(doc) = {
  // code blocks: blue panel with a Python-blue border
  show raw.where(block: true): it => block(
    fill: rgb("#dbeafe"),
    stroke: (paint: rgb("#3572A5"), thickness: 1.5pt),
    radius: 6pt,
    inset: 12pt,
    width: 100%,
    it,
  )

  // baseline-aligned bullet markers (the theme default hangs below the text)
  set list(
    marker: (
      text(fill: rgb("#3572A5"))[•],
      text(fill: rgb("#3572A5"))[‣],
      text(fill: rgb("#3572A5"))[–],
    ),
    indent: 0.6em,
    body-indent: 0.6em,
  )

  set heading(numbering: numbly("{1}.", default: "1.1"))

  doc
}

// ----------------------------------------------------------------- note
#let note(body) = block(
  fill: rgb("#c6f1c7"),
  stroke: (paint: rgb("#4caf50"), thickness: 1.5pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
  body,
)

// ----------------------------------------------------------------- todo
#let show-todos = true    // set false before exporting for students

#let todo(body) = {
  [#metadata(body)<todo-item>]
  if show-todos {
    block(
      fill: rgb("#fff4d6"),
      stroke: (paint: rgb("#e0a800"), thickness: 1.5pt),
      radius: 6pt,
      inset: 12pt,
      width: 100%,
      text(fill: rgb("#8a6100"))[*TODO:* #body],
    )
  }
}

#let itodo(body) = {
  [#metadata(body)<todo-item>]
  if show-todos {
    box(
      fill: rgb("#fff4d6"),
      radius: 2pt,
      inset: (x: 3pt),
      outset: (y: 3pt),
      text(size: 0.85em, fill: rgb("#8a6100"))[*TODO* #body],
    )
  }
}

#let todo-outline() = context {
  let items = query(<todo-item>)
  if show-todos and items.len() > 0 {
    heading(outlined: false, numbering: none)[Outstanding TODOs]
    for (i, it) in items.enumerate() {
      [#(i + 1). #it.value #h(1fr) _slide #it.location().page()_ \ ]
    }
  }
}
