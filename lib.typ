#import "@preview/tiaoma:0.2.0"

#let atomic-boxes = state("atomic-boxes", (:))
#let copy-counter = counter("copy-counter")
#let generating-content = state("generating-content", true)

#let rect-box(id, width, height, fill-color: white, stroke-width: 0.25mm, stroke-color: black) = {
  assert.eq(type(fill-color), color, message: "fill-color must be a color")
  assert.eq(rgb(fill-color).components().at(3), 100%, message: "fill-color must be fully opaque (no alpha or alpha=100%)")
  assert.eq(type(stroke-color), color, message: "stroke-color must be a color")
  assert.eq(rgb(stroke-color).components().at(3), 100%, message: "stroke-color must be fully opaque (no alpha or alpha=100%)")
  assert.eq(type(stroke-width), length, message: "stroke must be a length")

  rect(width: width, height: height, fill: fill-color, stroke: stroke-width + stroke-color, radius: 0mm, inset: 0mm, outset: 0mm, {
    context if copy-counter.get().at(0) == 0 {
      layout(size => {
        set align(left+top)
        let pos = here().position()
        let box = (
          page: pos.page,
          x: pos.x.mm(),
          y: pos.y.mm(),
          width: if type(width) == length { width.mm() }
            else if type(width) == ratio { (width * size.width).mm() },
          height: if type(height) == length { height.mm() }
              else if type(height) == ratio { (height * size.height).mm() },
          stroke-width: stroke-width.mm(),
          stroke-color: stroke-color.to-hex(),
          fill-color: fill-color.to-hex(),
        )
        atomic-boxes.update(x => { x.insert(str(id), box) ; x })
        []
      })
    }
  })
}

#let finalize-atomic-boxes() = context [
  #metadata(atomic-boxes.final()) <atomic-boxes>
]

#let gen-copies(exam-id, copy-content, nb-copies: 1, duplex-printing: true) = {
  let marker(id) = rect-box(id, 4mm, 4mm, fill-color: black, stroke-width: 0.5mm, stroke-color: black)

  set page(
    paper: "a4",
    margin: (
      x: 1.5cm,
      top: 2cm,
      bottom: 2.5cm,
    ),
    header-ascent: 0mm,
    header: {
      set align(top)
      context if generating-content.get() {
        v(1cm)
        grid(
          columns: 2,
          column-gutter: 1fr,
          {
            marker("marker top-left")
          },
          {
            marker("marker top-right")
          },
        )
      } else []
    },
    footer-descent: 0mm,
    footer: {
      set align(top)
      context if generating-content.get() {
        grid(
          columns: 4,
          column-gutter: 1fr,
          {
            marker("marker bottom-left")
          },
          {
            context tiaoma.qrcode(exam-id + "000" + str(copy-counter.get().at(0)) + "000" + str(counter(page).get().at(0)),
              height: 1.25cm
            )
          },
          {
            grid(
              columns: 1,
              row-gutter: 2mm,
              [
                #exam-id #copy-counter.display()
              ],
              [
                page #counter(page).display() / #context counter(page).final().at(0)
              ],
            )
          },
          {
            marker("marker bottom-right")
          },
        )
        v(1cm)
      } else []
    },
  )

  let pagebreak_to = if duplex-printing { "odd" } else { none }
  let n = 0
  while n < nb-copies {
    copy-counter.update(n)
    n = n + 1
    counter(page).update(1)

    copy-content

    if n < nb-copies {
      pagebreak(to: pagebreak_to)

      // as typst-0.11.0, the page added by pagebreak(to:"odd") contains header/footer
      // this is annoying as it means all these empty pages will be kept by the scanner since they have header/footer
      // this code creates a special page without footer instead of using pagebreak in this case.
      // this code hinders layout converging so is not used for now
      /*context if duplex-printing and calc.odd(here().position().page) {
        page(header: none, footer: none)[]
      }
      else {
        pagebreak()
      }*/
    }
  }
  finalize-atomic-boxes()
}
