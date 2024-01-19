#import "../lib.typ": rect-box, finalize-atomic-boxes
#let bcol = json("./input-fill-colors.json")
#let f-color = white

#set align(left+top)

#set page(
  paper: "a4",
  header: [#rect-box("h0", 10cm, .5cm, fill-color: color.rgb(bcol.at("h0")))],
  footer: [
    #set align(center)
    #rect-box("f0", 10cm, 1cm, fill-color: color.rgb(bcol.at("f0")))
  ]
)

#rect-box("b0", 5cm, 1cm, fill-color: color.rgb(bcol.at("b0")))

#rect-box("b1", 100%, 1cm, fill-color: color.rgb(bcol.at("b1")))

Inline #box(rect-box("b2i", 8cm, 2.5cm, fill-color: color.rgb(bcol.at("b2i"))))

#finalize-atomic-boxes()
