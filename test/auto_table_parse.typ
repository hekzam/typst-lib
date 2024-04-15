#import "../QCM_rs0.typ" as mcq
#import "../lib.typ": rect-box, finalize-atomic-boxes

#let flow = sys.inputs
#let id = int(flow.at("id"))
#let n_cols = int(flow.at("cols"))
#let n_rows = int(flow.at("rows"))
#let points = flow.at("points")
#let width = if (flow.at("points") == "True") {(int(flow.at("width")) * 1pt)} else {(int(flow.at("parse_width")) * 1mm)}
#let inset = if (flow.at("points") == "True") {(int(flow.at("parse_inset")) * 1pt)} else {(int(flow.at("parse_inset")) * 1mm)}
#assert(type(id) == int)
#assert(type(n_cols) == int)
#assert(type(n_rows) == int)

#let cols = ()
#let rows = ()

#for c in range(0, n_cols) {cols.push(str(c))}
#for r in range(0, n_rows) {rows.push(str(r))}

#mcq.table_parse(id, auto, width, cols, rows, (), parse_inset: inset, fill_color: green)

#finalize-atomic-boxes()
