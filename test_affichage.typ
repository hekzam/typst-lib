#import "QCM_rs0.typ" as mcq
#import "lib.typ" as lib

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

= Champs identifiant

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

= Questions de cours

Parsing de lettres
#mcq.base_field(101, 50pt, 15pt, "word")

Parsing de chiffres
#mcq.base_field(102, 35pt, 15pt, "word")

Parsing d'un chiffre
#mcq.base_field(103, 10pt, 15pt, "number")

Séquence de chiffres
#mcq.fields_suite(104, "single_figure", 8, 12pt, 18pt, space: 6pt, id_suite: (0, 1, 2, 3, 4, 5, 6, 33))

Séquence de mots
#mcq.fields_suite(105, "word", 4, 65pt, 15pt, space: 8pt)

= Premier exercice

Zone de texte (répondre sur la copie)
#mcq.question_zone(1, 24pt)
Zone de texte
#mcq.question_zone(2, 60pt)

= Deuxième exercice

Questions de QCM uniques

#mcq.mcq_one(3, (20, 25, 27, 37, 61, 89), false)

#mcq.mcq_one(4, ("One", "Two", "Three", "Four", "Five"), true)

#mcq.mcq_one(5, (1, 2, 3, "La réponse D"), false)

#mcq.mcq_one(6, (1, 2, 3, "La réponse D"), true)

= Troisième exercice

Question vrai-faux

#mcq.true_false(7, ("Assertion 1", "Assertion 2"))

Plusieurs questions, mêmes réponses

#mcq.mcq_grid(8, ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7"), (1, 2, 3, "La réponse D"))

= Quatrième exercice

Tableaux à parser

#mcq.table_parse(9, 25pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ())

#mcq.table_parse(10, 120pt, ("Column 1", "Column 2 (very very very very very very very large)", "Column 3"), ("Row A \nThis is it", "Row B"), ("Content 1", "Content 2", "Content 3", "Content 4", "Content 5 (very very very very very very very thick)"))

#mcq.table_parse(11, 60pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B", "Row C", "Row D\nYou\nYesyesyes"), ("", "Video Screens Control", "", "Content 3", "", "Content 5", "", "Content 7", "", "Content 9"))

#mcq.table_parse(12, 80pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "Content 1", "Content 2", "Content 3", "Content 4", "Content 5"))

#mcq.table_parse(13, 40pt, ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "", "Content 2", "Content 3"))

= Cinquième exercice

Tableaux version colonne

#mcq.table_column(14, 180pt, ("Column 1", "Column 2", "Column 3"))

#mcq.table_column(15, 45pt, ("Column 1", "Column 2", "Column 3"), horiz: true)

#mcq.table_column(16, 95pt, ("Long column 1", "Column 2", "VeryLongColumn"), horiz: true)

= Sixième exercice

Taux de confiance

#mcq.confidence(17, nuances: (0, 5, 15, 50, 75, 85, 95, 100))

#mcq.confidence(18, nuances: (5, 15, 5, 90, 50, 100, 0))

#mcq.confidence(19, nuances: (), display_mode: false)

#mcq.confidence(20, nuances: (10, 30, 50, 70, 90), vertical: true)
