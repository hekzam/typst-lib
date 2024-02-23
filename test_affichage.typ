#import "QCM_rs0.typ" as mcq

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

#let img1 = "images_insertion_bank/R-1627667-1367325593-4452.jpg"
#let img2 = "images_insertion_bank/R-1670206-1426927001-9189.jpg"
#let img3 = "images_insertion_bank/R-1740202-1421692551-4533.jpg"

#mcq.champ_identifiant(8, true)
#mcq.champ_identifiant(8, false)

= Premier exercice

#mcq.question(1, 1, 0, "Simple énoncé")

#mcq.question_zone(1, 2, 0, "Répondre sur la copie:", 24pt)

#mcq.question_zone(1, 3, 0, "Répondre sur la copie:", 60pt)

= Deuxième exercice

#mcq.mcq_simple(2, 1, 0, "Première question", (20, 25, 27, 37, 61, 89), false)

#mcq.mcq_simple(2, 2, 0, "Deuxième question", ("One", "Two", "Three", "Four", "Five"), true)

= Troisième exercice

#mcq.right_wrong(3, 1, 0, "Question vrai-faux", ("Assertion 1", "Assertion 2"))

#mcq.mcq_simple(3, 2, 0, "Question multi-formats", (1, 2, 3, "La réponse D"), false)

#mcq.mcq_simple(3, 3, 0, "Question multi-formats verticale", (1, 2, 3, "La réponse D"), true)

#mcq.mcq_grid(3, 4, 0, "Question multiple", ("Assertion 1", "Assertion 2", "Assertion 3", "Assertion 4", "Assertion 5", "Assertion 6", "Assertion 7"), (1, 2, 3, "La réponse D"))

= Quatrième exercice

#mcq.table_parse(4, 1, 1, "Tableau à compléter", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ())

#mcq.table_parse(4, 1, 2, "Tableau à compléter", ("Column 1", "Column 2 (very very very very very very very large)", "Column 3"), ("Row A \nThis is it", "Row B"), ("Content 1", "Content 2", "Content 3", "Content 4", "Content 5 (very very very very very very very thick)"))

#mcq.table_parse(4, 1, 3, "Tableau avec titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B", "Row C", "Row D\nYou\nYesyesyes"), ("", "Video Screens Control", "", "Content 3", "", "Content 5", "", "Content 7", "", "Content 9"))

#mcq.table_parse(4, 2, 1, "Tableau avec titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "Content 1", "Content 2", "Content 3", "Content 4", "Content 5"))

#mcq.table_parse(4, 2, 2, "Tableau avec sous-titre", ("Column 1", "Column 2", "Column 3"), ("Row A", "Row B"), ("Content 0", "", "Content 2", "Content 3"))

= Cinquième exercice

#mcq.table_column(5, 1, 0, "Tableau à une dimension", ("Column 1", "Column 2", "Column 3"), 180pt, horiz: false)

#mcq.table_column(5, 2, 0, "Tableau à une dimension renversé", ("Column 1", "Column 2", "Column 3"), 60pt, horiz: true)
