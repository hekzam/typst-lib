#import "../QCM_rs0.typ" as mcq
#import "../lib.typ": rect-box, finalize-atomic-boxes

#mcq.confidence(15, ("a", "b", "c", "d", "e", "f", "g"), nuances: (0, 5, 15, 50, 75, 85, 95, 100), fill_color: red)
#mcq.confidence(16, auto, nuances: (5, 15, 5, 90, 50, 100, 0), fill_color: blue)
#mcq.confidence(17, auto, nuances: (), if_multiple_boxes: false, fill_color: yellow)
#mcq.confidence(18, auto, nuances: (10, 30, 50, 70, 90), vertical: true, fill_color: green)

#finalize-atomic-boxes()

/*{
  "15.a": {
    "page": 1,
    "x": 63.53542486571119,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.b": {
    "page": 1,
    "x": 84.16280351812289,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.c": {
    "page": 1,
    "x": 104.79018217053458,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.d": {
    "page": 1,
    "x": 123.61371158229927,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.e": {
    "page": 1,
    "x": 142.43724099406398,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.f": {
    "page": 1,
    "x": 161.26077040582868,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "15.g": {
    "page": 1,
    "x": 181.88814905824037,
    "y": 25.554189891168217,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ff4136"
  },
  "16.0": {
    "page": 1,
    "x": 72.22320767114105,
    "y": 37.84158648334009,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#0074d9"
  },
  "16.1": {
    "page": 1,
    "x": 98.64244152717266,
    "y": 37.84158648334009,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#0074d9"
  },
  "16.2": {
    "page": 1,
    "x": 125.06167538320427,
    "y": 37.84158648334009,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#0074d9"
  },
  "16.3": {
    "page": 1,
    "x": 149.6770599985889,
    "y": 37.84158648334009,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#0074d9"
  },
  "16.4": {
    "page": 1,
    "x": 176.0962938546205,
    "y": 37.84158648334009,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#0074d9"
  },
  "17.c": {
    "page": 1,
    "x": 145.0,
    "y": 44.49824603566578,
    "width": 10.0,
    "height": 5.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#ffdc00"
  },
  "18.0": {
    "page": 1,
    "x": 37.103979988711124,
    "y": 61.76464025541072,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "18.1": {
    "page": 1,
    "x": 38.90782922935812,
    "y": 68.82018503166175,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "18.2": {
    "page": 1,
    "x": 38.90782922935812,
    "y": 75.87572980791279,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "18.3": {
    "page": 1,
    "x": 38.90782922935812,
    "y": 82.93127458416383,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "18.4": {
    "page": 1,
    "x": 38.90782922935812,
    "y": 89.98681936041487,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  },
  "18.5": {
    "page": 1,
    "x": 40.71167847000511,
    "y": 97.0423641366659,
    "width": 2.0,
    "height": 2.0,
    "stroke-width": 0.25,
    "stroke-color": "#000000",
    "fill-color": "#2ecc40"
  }
}
*/
