#import "../lib.typ": rect-box, gen-copies
#let bcol = json("./input-fill-colors.json")
#let f-color = white
#let b2i-separate-page = int(sys.inputs.at("b2i-separate-page", default: "0")) == 1

#let copy-content = [
  #set align(left+top)

  #rect-box("b0", 5cm, 1cm, fill-color: color.rgb(bcol.at("b0")))

  #rect-box("b1", 100%, 1cm, fill-color: color.rgb(bcol.at("b1")))

  Inline #box(rect-box("b2i", 8cm, 2.5cm, fill-color: color.rgb(bcol.at("b2i"))))

  #if b2i-separate-page {
    pagebreak()
  }
  #lorem(30)
]

#let n = int(sys.inputs.at("nb-copies", default: "1"))
#let d = int(sys.inputs.at("duplex-printing", default: "0")) == 1

#gen-copies("basic", copy-content, nb-copies: n, duplex-printing: d)
