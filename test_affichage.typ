#import "QCM_rs0.typ" as mcq

#let img1 = "images_insertion_bank/R-1627667-1367325593-4452.jpg"
#let img2 = "images_insertion_bank/R-1670206-1426927001-9189.jpg"
#let img3 = "images_insertion_bank/R-1740202-1421692551-4533.jpg"

= Champs identifiant

== Premier champ identifiant
#mcq.ID_field(8, true, false, false)

== Deuxième champ identifiant
#mcq.ID_field(8, debutCol : 0, finCol: 6, true, false, true)

== Troisème champ identifiant
#mcq.ID_field(8, true, true, false)

== Quatrième champ identifiant
#mcq.ID_field(8, debutCol : 0, finCol: 9, true, true, true)

== Cinquième champ identifiant
#mcq.ID_field(8, false, false, false)

== Sixième champ identifiant
#mcq.ID_field(8, false, false, true)

== Septième champ identifiant
#mcq.ID_field(8, false, true, false)

== Huitième champ identifiant
#mcq.ID_field(8, false, true, true)

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

= Premier exercice

#mcq.question(1, 1, 0, "Simple énoncé")

#mcq.question_zone(1, 2, 0, "Répondre sur la copie:", 24pt)

#mcq.question_zone(1, 3, 0, "Répondre sur la copie:", 60pt)

= Deuxième exercice

#mcq.mcq_simple(2, 1, 0, "Première question", (20, 25, 27, 37, 61, 89), false, false)

#mcq.mcq_simple(2, 2, 0, "Deuxième question", ("One", "Two", "Three", "Four", "Five"), true, false)

#mcq.mcq_simple(2, 1, 0, "Troisième question", (20, 25, 27, 37, 61, 89), false, true)

#mcq.mcq_simple(2, 2, 0, "Quatrième question", ("One", "Two", "Three", "Four", "Five"), true, true)

= Troisième exercice

#mcq.true_false(3, 1, 0, "Question vrai-faux", ("Assertion 1", "Assertion 2"), true)

#mcq.true_false(3, 2, 0, "Question vrai-faux 2", ("Assertion 1", "Assertion 2"), false)

#mcq.mcq_simple(3, 3, 0, "Question multi-formats", (1, 2, 3, "La réponse D"), false, false)

#mcq.mcq_simple(3, 4, 0, "Question multi-formats verticale", (1, 2, 3, "La réponse D"), true, false)

#mcq.mcq_grid(3, 5, 0, "Question multiple", ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7"), (1, 2, 3, "La réponse D"))

= Quatrième exercice

#mcq.table_parse(4, 1, 1, "Tableau à compléter", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ())

#mcq.table_parse(4, 1, 2, "Tableau à compléter", ("Column 1", "Column 2 (very very very very very very very large)", "Column 3"), ("Row A \nThis is it", "Row B"), ("Content 1", "Content 2", "Content 3", "Content 4", "Content 5 (very very very very very very very thick)"))

#mcq.table_parse(4, 1, 3, "Tableau avec titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B", "Row C", "Row D\nYou\nYesyesyes"), ("", "Video Screens Control", "", "Content 3", "", "Content 5", "", "Content 7", "", "Content 9"))

#mcq.table_parse(4, 2, 1, "Tableau avec titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "Content 1", "Content 2", "Content 3", "Content 4", "Content 5"))

#mcq.table_parse(4, 2, 2, "Tableau avec sous-titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "", "Content 2", "Content 3"))

= Cinquième exercice

#mcq.table_column(5, 1, 0, "Tableau à une dimension", ("Column 1", "Column 2", "Column 3"), 180pt, horiz: false)

#mcq.table_column(5, 2, 0, "Tableau à une dimension renversé", ("Column 1", "Column 2", "Column 3"), 60pt, horiz: true)
