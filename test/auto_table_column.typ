#import "../QCM_rs0.typ" as mcq
#import "../lib.typ": rect-box, finalize-atomic-boxes

#let flow = sys.inputs
#let id = int(flow.at("id"))
#let n_cols = int(flow.at("cols"))
#let width = int(flow.at("width"))
#let points = flow.at("points")
#let inset = if (flow.at("points") == "True") {(int(flow.at("parse_inset")) * 1pt).pt()} else {(int(flow.at("parse_inset")) * 1mm).mm()}
#let horiz = if (flow.at("horizontal") == "True") {true} else {false}
#assert(type(id) == int)
#assert(type(n_cols) == int)

#let cols = ()
#let rows = ()

#for c in range(0, n_cols) {cols.push(str(c))}
#for r in range(0, n_rows) {rows.push(str(r))}

#mcq.table_column(id, auto, width, cols, (), horiz: horizontal, parse_inset: inset, fill_color: yellow)

#finalize-atomic-boxes()
