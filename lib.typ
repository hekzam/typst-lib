#let atomic-boxes = state("atomic-boxes", (:))

#let m-rect(id, width, height, fill: white, stroke: 0.25mm) = {
  rect(width: width, height:height, fill: fill, radius: 0mm, inset: 0mm, outset: 0mm, stroke: stroke, {
    layout(size => {
      locate(loc => {
        set align(left+top)
        let pos = loc.position()
        let box = (
          page: pos.page,
          x: pos.x.mm(),
          y: pos.y.mm(),
          width: if type(width) == length { width.mm() }
            else if type(width) == ratio { (width * size.width).mm() },
          height: if type(height) == length { height.mm() }
              else if type(height) == ratio { (height * size.height).mm() },
        )
        atomic-boxes.update(x => { x.insert(str(id), box) ; x })
        []
      })
    })
  })
}

#let finalize-atomic-boxes() = {
  locate(loc => {
    let final-boxes = atomic-boxes.final(loc)
    [ #metadata(final-boxes) <atomic-boxes> ]
  })
}
