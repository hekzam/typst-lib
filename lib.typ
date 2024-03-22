#let atomic-boxes = state("atomic-boxes", (:))

#let rect-box(id, width, height, fill-color: white, stroke-width: 0.25mm, stroke-color: black) = {
  assert.eq(type(fill-color), color, message: "fill-color must be a color")
  assert.eq(rgb(fill-color).components().at(3), 100%, message: "fill-color must be fully opaque (no alpha or alpha=100%)")
  assert.eq(type(stroke-color), color, message: "stroke-color must be a color")
  assert.eq(rgb(stroke-color).components().at(3), 100%, message: "stroke-color must be fully opaque (no alpha or alpha=100%)")
  assert.eq(type(stroke-width), length, message: "stroke must be a length")

  rect(width: width, height:height, fill: fill-color, stroke: stroke-width + stroke-color, radius: 0mm, inset: 0mm, outset: 0mm, {
    layout(size => context {
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
  })
}

#let finalize-atomic-boxes() = context [
  #metadata(atomic-boxes.final()) <atomic-boxes>
]
