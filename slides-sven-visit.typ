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
  TODO INSERT TABLE WITH FEATURES 
  - *Proto*: forefather in the field of aggregate programming;
  
  - *Protelis*: has functioning libraries but it is in mantainance mode;
   
  - *ScaFi*: primarly used TODO;
  
  - *FCPP*: would compile on different platforms, but supports a range of features more limited than the other languages.
]

#slide(title: "Targeting of wearables and Apple devices")[
  TODO INSERT TABLE WITH FEATURES 
  The state of the art at the moment does not entirely support the development of applications for wearable devices, like smartphones or smartwatches, including Apple devices.

  At JVM' side, Kotlin Native is more mantained than Scala and has the support for different Apple devices.

  // forse ora scalajs è mainline
  TODO

]

#new-section-slide("Ingegneristic issues")

#slide(title: "Reified Fields")[
  TODO INSERT TABLE WITH FEATURES 
  There are more semantics of _Field Calculus_.
  ScaFi ne implementa una particolare, non consentendo allo sviluppatore di manipolare direttamente i campi, cosa che altri sistemi fanno e noi vogliamo fare.

  ci sono varie tecniche per implementare i costrutti del field calculus, alcune tra queste utilizzano i campi reificati, "che sarebbe meglio usare"
]

#slide(title: "Transparent Alignment")[
  TODO INSERT TABLE WITH FEATURES 
  
  i dispositivi riescono a comunicare tra di loro senza di fatto una nozione esplicita di 'mando messaggi'
  questa capacità di comunicare con altri dispositivi in punti arbitrari del codice viene chiamata allineamento

  l'ideale dal punto di vista di chi realizza sw aggregato è che non debba gestire a mano l'allineamento, a meno che non ci siano moenti specifici in cui si vuole andare a basso livello a controllare
  perche io scrivo in modo trasparente manipolando i field e assumo che sotto ciò venga gestito automaticamente, se fossero chiamate a libreria però sarebbero esplicite e quindi meno trasparenti, idem per le macro (fcpp)
  oppure può essere un sistema completamente nascosto che non si vede, a runtime

  
  non devi spiegare al compilatore cosa annotare

]

#let programs = box[
  #table(inset: 0.5em, stroke: none, columns: (1fr, 1fr),  align: (left, left),
    [
      ```scala
       nbr(1)::nbr(2)
       ```
    ]
    , [
      ```scala
       (nbr(1), nbr(2))
      ```
    ]
  )
]

#slide(title: "Complete or Partial Alignment")[
  #programs
  
  l'allineamento completo è quando non hai due programmi strutturalmente diversi che fra di loro si allineano (esempio della tesi)
  [programmi strutturalmente diversi non devono alinnearsi]
  esempio con scafi e protelis? 

  //those programs are different and should not be aligned
  (in scafi allineano)
  //they must not align because one is a concat operation and the other is the construction of a tuple, so the result of the programs are different types
  conto a quale nbr siamo arrivati, quindi la struttura astrae da quello che c'e intorno
  mentre in collektive sono due cose diverse 
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
        blue.lighten(80%)
      },
    align: right,
  )
  
  #table(
    columns: (6em, 5em, 3em, 2em, 5.4em, 5em, 7em, 6em),
    inset: 7pt,
    align: (left, center, center, center, center, center, center, center),
    table.header(
      [Language], [DSL Type], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], 
    ),
    [*Proto*],[external],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
    [*Protelis*],[external],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
    [*ScaFi*],[internal],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],
    [*FCPP*],[internal c++],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],
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

#slide(title: "Aim")[
  #set table(
    fill: (x, y) =>
      if x == 0 or y == 0 {
        blue.lighten(80%)
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
    columns: (6em, 5em, 3em, 2em, 5.4em, 5em, 7em, 6em),
    inset: 7pt,
    align: (left, center, center, center, center, center, center, center),
    table.header(
      [Language], [DSL Type], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], 
    ),
    [*Proto*],[external],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
    [*Protelis*],[external],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
    [*ScaFi*],[internal],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],
    [*FCPP*],[internal c++],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],
    collektive, kt, check, check, check, check, check, check, 
    //[*Collektive*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[internal kt]
  )
]


#slide(title: "Alignment")[
  quando riusciamo a fare un allineamento trasparente non si riesce a farlo anche completo
  se scrivo del sw e il compilatore lo compila, se l'all è completo cioe per ogni chiamata a funzione lo devo allineare, l'unica è che tu chiami una funzione per dire di allineare
  scafi ha una chiamata apposita chiamata 'aggregate' 
  
  l'unico(?) modo per fare un allineamento completo automatico è passare da un plugin del compilatore kotlin (che lavori a compile time), quando incontra la condizione per cui si deve allineare mantiene un secondo genera un percorso su cui deve allineare in uno stack interno e quando c'è una chiamata a funzione che implica comunicazione viene registrato
  quindi becchiamo allineamento totale e trasparente
]

#slide(title: "Heterogeneity")[
  i programmi aggregati assumono che ci sia lo stesso programma su i vari dispositivi altrimenti non allinea
  succede che ad un certo punto potremmo aver bisogno di leggere il valore di un sensore SE C'È, alcuni programmi non dovresti poterli chiamare (compilare) se una certa cosa non è disponi
  quessta cosa non è banale da esprimere
  noi possiamo definire questa cosa utilizzando i context function di Kotlin, snippettino di codice con if se ho il sensore altrimenti, mentre collektive ha context() in cima 
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