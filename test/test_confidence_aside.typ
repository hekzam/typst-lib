#import "../QCM_rs0.typ" as mcq
#import "../lib.typ": rect-box, finalize-atomic-boxes

#mcq.confidence_aside(42, auto, mcq.table_parse(41, ("A", "B", "C", "D", "E", "F", "G", "H"), 40pt, ("Column 1", "Column 2", "Column 3", "Column 4"), ("Row A", "Row B"), (), fill_color: fuchsia), nuances: (), if_multiple_boxes: false, fill_color: green)

#mcq.confidence_aside(44, ("d", "c", "b", "a", "s", "s+"), mcq.table_column(43, ("A", "B", "C"), 180pt, ("Column 1", "Column 2", "Column 3"), parse_inset: 0pt, fill_color: yellow), nuances: (25, 50, 75, 90, 95), fill_color: aqua)

#finalize-atomic-boxes()

/*{
  "41.A": {
    "page": 1,
    "x": 41.061699636639446,
    "y": 32.8458484733565,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.B": {
    "page": 1,
    "x": 71.13446903718273,
    "y": 32.8458484733565,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.C": {
    "page": 1,
    "x": 101.20723843772599,
    "y": 32.8458484733565,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.D": {
    "page": 1,
    "x": 131.28000783826926,
    "y": 32.8458484733565,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.E": {
    "page": 1,
    "x": 41.061699636639446,
    "y": 46.95693802585857,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.F": {
    "page": 1,
    "x": 71.13446903718273,
    "y": 46.95693802585857,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.G": {
    "page": 1,
    "x": 101.20723843772599,
    "y": 46.95693802585857,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "41.H": {
    "page": 1,
    "x": 131.28000783826926,
    "y": 46.95693802585857,
    "width": 29.36721492291817,
    "height": 13.405535074876969,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#f012be"
  },
  "42.c": {
    "page": 1,
    "x": 171.55904388548848,
    "y": 60.715250339548085,
    "width": 10.0,
    "height": 5.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "43.A": {
    "page": 1,
    "x": 25.0,
    "y": 103.90937814192228,
    "width": 45.33333333333332,
    "height": 63.49990298625933,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#ffdc00"
  },
  "43.B": {
    "page": 1,
    "x": 70.33333333333331,
    "y": 103.90937814192228,
    "width": 45.33333333333332,
    "height": 63.49990298625933,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#ffdc00"
  },
  "43.C": {
    "page": 1,
    "x": 115.66666666666664,
    "y": 103.90937814192228,
    "width": 45.33333333333332,
    "height": 63.49990298625933,
    "stroke-width": 0.0,
    "stroke-color": "#000000",
    "fill-color": "#ffdc00"
  },
  "44.d": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 100.38160575379678,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  },
  "44.c": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 107.43715053004782,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  },
  "44.b": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 114.49269530629886,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  },
  "44.a": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 121.54824008254988,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  },
  "44.s": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 128.60378485880094,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  },
  "44.s+": {
    "page": 1,
    "x": 182.99999999999997,
    "y": 135.65932963505196,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#7fdbff"
  }
}
*/
