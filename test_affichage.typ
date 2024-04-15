#import "QCM_rs0.typ" as mcq
#import "lib.typ" as lib

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

= Identifier field

Identifier experiment 1
#mcq.ID_field(91, if_grid: true)

Identifier experiment 2
#mcq.ID_field(92)

Identifier experiment 3
#mcq.ID_field(93, if_names: false, if_grid: true)

Identifier experiment 4
#mcq.ID_field(94, if_names: false)

Identifier experiment 5
#mcq.ID_field(95, rows: 13, if_grid: true)

= Course questions

Letter parsing
#mcq.base_field(101, 50pt, 15pt, "word")

Number parsing
#mcq.base_field(102, 35pt, 15pt, "word")

Parsing a digit
#mcq.base_field(103, 10pt, 15pt, "number")

Sequence of number
#mcq.fields_suite(104, "single_figure", 8, 12pt, 18pt, space: 6pt, id_suite: (0, 1, 2, 3, 4, 5, 6, 33))

Sequence of words
#mcq.fields_suite(105, "word", 4, 65pt, 15pt, space: 8pt)

= First exercise

Text zone (reply on the copy)
#mcq.question_zone(1, 24pt)
Text zone
#mcq.question_zone(2, 60pt)

= Second exercise

Unique MCQ questions

#mcq.mcq_one(3, (20, 25, 27, 37, 61, 89), false)

#mcq.mcq_one(4, ("One", "Two", "Three", "Four", "Five"), true)

#mcq.mcq_one(5, (1, 2, 3, "Answer D"), false)

#mcq.mcq_one(6, (1, 2, 3, "Answer D"), true)

= Third exercise

True-false question

#mcq.true_false(7, ("Assertion 1", "Assertion 2"))

Several questions, same responses

#mcq.mcq_grid(8, ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7"), (1, 2, 3, "La réponse D"))

= Fourth exercise

Tables to parse

#mcq.table_parse(9, 25pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ())

#mcq.table_parse(10, 120pt, ("Column 1", "Column 2 (very very very very very very very large)", "Column 3"), ("Row A \nThis is it", "Row B"), ("Content 1", "Content 2", "Content 3", "Content 4", "Content 5 (very very very very very very very thick)"), turn_aside: true)

#mcq.table_parse(11, 60pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B", "Row C", "Row D\nYou\nYesyesyes"), ("", "Video Screens Control", "", "Content 3", "", "Content 5", "", "Content 7", "", "Content 9"))

#mcq.table_parse(12, 80pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "Content 1", "Content 2", "Content 3", "Content 4", "Content 5"), turn_aside: true)

#mcq.table_parse(13, 40pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "", "Content 2", "Content 3"))

= Fifth exercise

Tables column version

#mcq.table_column(14, 180pt, ("Column 1", "Column 2", "Column 3"))

#mcq.table_column(15, 45pt, ("Column 1", "Column 2", "Column 3"), horiz: true)

#mcq.table_column(16, 95pt, ("Long column 1", "Column 2", "VeryLongColumn"), horiz: true)

#mcq.table_column(16, 105pt, ("Long column", "Sh. Col.", "VeryLongColumn", "Another Long Column"), horiz: true, turn_aside: true)

= Sixth exercise

Confidence rate

#mcq.confidence(17, nuances: (0, 5, 15, 50, 75, 85, 95, 100))

#mcq.confidence(18, nuances: (5, 15, 5, 90, 50, 100, 0))

#mcq.confidence(19, nuances: (), if_multiple_boxes: false)

#mcq.confidence(20, nuances: (10, 30, 50, 70, 90), vertical: true)

= Seventh exercise

Confidence rate next to a question
#mcq.confidence_aside(22, mcq.question_zone(21, 30pt), nuances: (), if_multiple_boxes: false)

Confidence rate with MCQ 
#mcq.confidence_aside(24, mcq.mcq_grid(23, ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7", "Assertion 8", "Assertion 9", "Assertion 10", "Assertion 11", "Assertion 12"), (1, 2, 3, 4)), nuances: (10, 30, 50, 70, 90))

One-box confidence rate
#mcq.confidence_aside(26, mcq.mcq_grid(25, ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7"), (1, 2, 3, 4)), nuances: (), if_multiple_boxes: false)

Confidence rate with a table
#mcq.confidence_aside(28, mcq.table_parse(27, 75pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B", "Row C", "Row D"), (), turn_aside: true), nuances: (25, 50, 75, 90, 95))
