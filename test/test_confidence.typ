#import "../QCM_rs0.typ" as mcq
#import "../lib.typ": rect-box, finalize-atomic-boxes

#mcq.confidence(15, nuances: (0, 5, 15, 50, 75, 85, 95, 100), id_suite: ("a", "b", "c", "d", "e", "f", "g"), fill_color: red)
#mcq.confidence(16, nuances: (5, 15, 5, 90, 50, 100, 0), fill_color: blue)
#mcq.confidence(17, nuances: (), display_mode: false, fill_color: yellow)
#mcq.confidence(18, nuances: (10, 30, 50, 70, 90), vertical: true, fill_color: green)

#finalize-atomic-boxes()

/**/
