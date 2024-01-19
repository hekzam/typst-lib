#import "lib.typ": rect-box, finalize-atomic-boxes
#let f-color = white

#set align(left+top)

#set page(
  paper: "a4",
  header: [#rect-box("h0", 10cm, .5cm, fill-color: f-color)],
  footer: [
    #set align(center)
    #rect-box("f0", 10cm, 1cm, fill-color: f-color)
  ]
)

#rect-box("b0", 5cm, 1cm, fill-color: f-color)

#rect-box("b1", 100%, 1cm, fill-color: f-color, stroke-width: 0.01mm)

Inline #box(rect-box("b2i", 8cm, 2.5cm, fill-color: f-color))

#finalize-atomic-boxes()
