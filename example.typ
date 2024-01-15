#import "lib.typ": m-rect, finalize-atomic-boxes
#let f-color = white

#set align(left+top)

#set page(
  paper: "a4",
  header: [#m-rect("h0", 10cm, .5cm, fill: f-color)],
  footer: [
    #set align(center)
    #m-rect("f0", 10cm, 1cm, fill: f-color)
  ]
)

#m-rect("b0", 5cm, 1cm, fill: f-color)

#m-rect("b1", 100%, 1cm, fill: f-color)

Inline #box(m-rect("b2i", 8cm, 2.5cm, fill: f-color))

#finalize-atomic-boxes()
