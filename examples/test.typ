#import "../lib.typ": rect-box, finalize-atomic-boxes

#set text(lang: "fr")
#set figure.caption(separator: [])
#show raw: set text(font: "Liberation Mono", weight: "semibold")
#let mbox = id => box(rect-box(id, 2.5mm, 2.5mm))
#let digit-width = 3.5mm

#set page(
  paper: "a4",
  margin: (top: 4cm),
  header: [
    #grid(
      columns: 2,
      column-gutter: 1fr,
      grid(
        columns: 2,
        align: (x, y) => {
          if x == 0 { right }
          else { left }
        },
        column-gutter: 2mm,
        row-gutter: .5em,
        [Prénom], box(rect-box("id prénom", 4cm, 5mm)),
        [Nom], box(rect-box("id nom", 4cm, 5mm)),
        [N° étudiant], grid(
          columns: 8,
          box(rect-box("id num_étu 0", digit-width, 5mm)),
          box(rect-box("id num_étu 1", digit-width, 5mm)),
          box(rect-box("id num_étu 2", digit-width, 5mm)),
          box(rect-box("id num_étu 3", digit-width, 5mm)),
          box(rect-box("id num_étu 4", digit-width, 5mm)),
          box(rect-box("id num_étu 5", digit-width, 5mm)),
          box(rect-box("id num_étu 6", digit-width, 5mm)),
          box(rect-box("id num_étu 7", digit-width, 5mm)),
        )
      ),
      {
        image("./qr-code.svg", width: 2cm)
      }
    )
  ]
)

= Exercice 1

#grid(
  columns: (auto, auto),
  column-gutter: 1fr,
  [
    *Q1.* Dans quel langage @code1 est-il écrit ?
    #grid(
      columns: (auto, 1.9cm, 1.9cm, 1.9cm),
      column-gutter: 0mm,
      row-gutter: .5em,
      grid.header(
        [], [*Vrai*], [*Faux*], [*Ne sait pas*]
      ),
      align: (x, y) => {
        if x == 0 { right }
        else { center }
      },
      //[], [vrai], [faux],
      [C], mbox("exo1 C true"), mbox("exo1 C false"), mbox("exo1 C nosé"),
      [C++], mbox("exo1 C++ true"), mbox("exo1 C++ false"), mbox("exo1 C++ nosé"),
      [LaTeX], mbox("exo1 LaTeX true"), mbox("exo1 LaTeX false"), mbox("exo1 LaTeX nosé"),
      [Python], mbox("exo1 Python true"), mbox("exo1 Python false"), mbox("exo1 Python nosé"),
      [Rust], mbox("exo1 Rust true"), mbox("exo1 Rust false"), mbox("exo1 Rust nosé"),
      [Typst], mbox("exo1 Typst true"), mbox("exo1 Typst false"), mbox("exo1 Typst nosé"),
    )

    *Q2.* Compléter : exécuter @code1 affiche `hi!` #box(rect-box("exo1 num_hi", 1.5cm, 5mm)) fois.
  ],
  [
    #figure({
      set align(left)
      rect(raw(read("./fork.c"), lang: "c", theme: "./mpoquet.tmTheme"))
    }, kind:"Code", caption:"", supplement: "Code",
    ) <code1>
  ]
)



= Exercice 2

#grid(
  columns: (auto, auto),
  column-gutter: 1fr,
  [
    *Q3.* La fonction `f` de @code2...
    #grid(
      columns: (10mm, auto),
      column-gutter: 2mm,
      row-gutter: .5em,
      align: (x, y) => {
        if x == 0 { right }
        else { left }
      },
      mbox("exo2 cc_no_error"), [Compile sans erreur],
      mbox("exo2 cc_no_warn"), [Compile sans avertissement (gcc 12.3.0, `-Wall -Wextra`)],
      mbox("exo2 no_crash"), [S'exécute sans planter],
      mbox("exo2 ret_double"), [Renvoie $x*2$],
      mbox("exo2 ret_square"), [Renvoie $x^2$],
      mbox("exo2 ret_exp"), [Renvoie $2^x$],
      mbox("exo2 ret_no"), [Ne renvoie rien],
    )

    *Q4.* Le programme de @code2...
        #grid(
      columns: (10mm, auto),
      column-gutter: 2mm,
      row-gutter: .5em,
      align: (x, y) => {
        if x == 0 { right }
        else { left }
      },
      mbox("exo2 cc_no_error"), [Compile sans erreur],
      mbox("exo2 cc_no_warn"), [Compile sans avertissement (gcc 12.3.0, `-Wall -Wextra`)],
      mbox("exo2 no_crash"), [S'exécute sans planter],
      mbox("exo2 ret_double"), [Renvoie 0],
      mbox("exo2 ret_no"), [Ne renvoie rien],
    )
  ],
  [
    #figure({
      set align(left)
      rect(raw(read("./stack.c"), lang: "c", theme: "./mpoquet.tmTheme"))
    }, kind:"Code", caption:"", supplement: "Code",
    ) <code2>
  ]
)

#finalize-atomic-boxes()
