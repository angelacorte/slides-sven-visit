#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: [Optional Footnote]
)

#set text(font: "Inter", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 150)
#set par(justify: true)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

/*
, prepara una presentazioncina su Collektive.
AC sarà già stato introdotto, quindi a te sta spiegare:
* vari tipi di linguaggi (dsl interni vs. esterni)
* vari tipi di allineamento (parziale, totale, e cosa significa)
* rilevanza del targeting multiplatform per mobile e wearable
*puoi dire che la semantica è quella di XC che è la più recente
non hai limiti stretti di tempo, ma idealmente si punta a 30 minuti. Puoi fare meno se ti viene meno, o più se ti viene più, ma fai una bella presentazione, deve sembrare un ted talk, ok?
*/

#let author = box[
  #table(inset: 0.5em, stroke: none, columns: (1fr, auto),  align: (left, right),
    [*Angela Cortecchia*], [angela.cortecchia\@unibo.it]
  )
]

#title-slide(
  title: "Aggregate Programming in Kotlin Multiplatform with Collektive",
  author: author,
)

#new-section-slide("Why?")

#slide(title: "State of the Art")[
  - Proto: forefather in the field of aggregate programming;
  
  - Protelis: has functioning libraries but it is in mantainance mode;
  
  - ScaFi: primarly used;
  
  - FCPP: would compile on different platforms, but supports a range of features more limited than the other languages.
]

#slide(title: "Targeting of Wearables and Apple devices")[
  The state of the art at the moment does not entirely support the development of applications for wearable devices, like smartphones or smartwatches, including Apple devices.

  At JVM' side, Kotlin Native is more mantained than Scala and has the support for different Apple devices.

  // forse ora scalajs è mainline
  TODO

]

#slide(title: "Reified Fields")[
  TODO
]

#slide(title: "Transparent Alignment")[
  TODO
]

#slide(title: "Complete or Partial Alignment")[
  TODO  
]

#show table.cell: it => {
  if it.body == [*x*] {
    set text(red)
    it
  } else if it.body == [*\u{2713}*] {
    set text(green)
    it
  } else if it.body == [*\u{007E}*] {
    set text(yellow.darken(20%))
    it
  } else {
    it
  }
}

#slide(title: "Overview")[
  #set table(
    fill: (x, y) =>
      if x == 0 or y == 0 {
        m-caribbean.lighten(80%)
      },
    align: right,
  )
  
  #table(
    columns: (6em, 3em, 2em, 5em, 5em, 7em, 6em, 5em),
    inset: 7pt,
    align: (left, center, center, center, center, center, center, center),
    table.header(
      [Language], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], [DSL Type]
    ),
    [*Proto*],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[external],
    [*Protelis*],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[external],
    [*ScaFi*],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],[internal],
    [*FCPP*],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],[internal c++],
  )
]
#slide(title: "Aim")[
  #set table(
    fill: (x, y) =>
      if x == 0 or y == 0 {
        m-caribbean.lighten(80%)
      },
    align: right,
  )
   #let check = table.cell(
    fill: green.lighten(80%),
  )[*\u{2713}*]
  #let collektive = table.cell(
    fill: green.lighten(80%),
  )[*Collektive*]
  #let kt = table.cell(
    fill: green.lighten(80%),
  )[internal kt]

  #table(
    columns: (6em, 3em, 2em, 5.4em, 5em, 7em, 6em, 5em),
    inset: 7pt,
    align: (left, center, center, center, center, center, center, center),
    table.header(
      [Language], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], [DSL Type]
    ),
    [*Proto*],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[external],
    [*Protelis*],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[external],
    [*ScaFi*],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],[internal],
    [*FCPP*],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],[internal c++],
    collektive, check, check, check, check, check, check, kt,
    //[*Collektive*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[internal kt]
  )
]

#new-section-slide("What is Collektive?")

#let collektive = box[
  #table(inset: 1.5em, stroke: none, columns: (0.4fr, 1fr), align: (left, left),
    [
      #figure(
       image("figures/collektive-logo.svg", width: 70%),
      )
    ]
    , [
      *Collektive* is a minimal DSL for aggregate programming in _Kotlin Multiplatform_, to simplify the development of distributed systems, providing high-level abstractions for collective coordination and communication.
    ]
  )
]

#slide(title: "Collektive")[
  #collektive
  TODO
]

#slide(title: "Heterogeneity")[
  TODO
]

#slide(title: "Integration with Alchemist")[
  TODO
]

#slide(title: "Example code")[
  ```kotlin
    TODO() 
  ```
]

#new-section-slide("Live demo")

#let benchmarks = box[
  #figure(
    table(inset: 0.3em, stroke: none, columns: (2fr, 2fr, 2fr, 2fr, 0.5fr), align: (center, center),
      [
        #figure(
        image("figures/neighborCounter.svg", width: 200%),
        )
      ],[
        #figure(
          image("figures/branching.svg", width: 200%),
        )
      ],[
        #figure(
          image("figures/gradient_g.svg", width: 200%),
        )
      ],[
        #figure(
          image("figures/channel.svg", width: 200%),
        )
      ], [
        #figure(
          image("figures/legend.png", width: 200%),
        )
      ]
    ),
    caption: [In complex programs, *Collektive* results 6.90 times faster than _Protelis_ and 3.70 times faster than _ScaFi_.]
  )
]

#slide(title: "Benchmarks")[
  #benchmarks
  Note that performance results may have been influenced by the incarnation of the language and should be further investigated.
]

#slide(title: "Ongoing")[
  - Usable for experiments;
  
  - Standard library next to be done;
  
  - Actually working on an extension of an approach proposed at ACSOS.
]

#slide[
  #bibliography("bibliography.bib")
]
