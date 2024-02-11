#import "QCM_rs0.typ" as qcm

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

#let img1 = "images_insertion_bank/R-1627667-1367325593-4452.jpg"
#let img2 = "images_insertion_bank/R-1670206-1426927001-9189.jpg"
#let img3 = "images_insertion_bank/R-1740202-1421692551-4533.jpg"

= Premier exercice

#qcm.question_simple(1, 1, "Simple énoncé", 0pt)

#qcm.question_simple(1, 2, "Répondre sur la copie:", 24pt)

#qcm.question_simple(1, 3, "Répondre sur la copie:", 60pt)

= Deuxième exercice

#qcm.qcm_simple(2, 1, "Première question", (20, 25, 27, 37, 61, 89), false)

#qcm.qcm_simple(2, 2, "Deuxième question", ("One", "Two", "Three", "Four", "Five"), true)

= Troisième exercice

#qcm.image_figure("Ceci est une image simple.", img1, 20%, false)

#qcm.qcm_vf(3, 1, "Question vrai-faux", ("Assertion 1", "Assertion 2"))

#qcm.qcm_simple(3, 2, "Question multi-formats", (1, 2, 3, "La réponse D"), false)

#qcm.image_figure("Ceci est une autre image simple.", img2, 115pt, false)

#qcm.qcm_simple(3, 3, "Question multi-formats verticale", (1, 2, 3, "La réponse D"), true)

= Quatrième exercice

#qcm.image_figure("Ceci est encore une autre image simple mais cette fois le libellé est au-dessus.", img3, 60%, true)

#qcm.qcm_mult(4, 1, "Question multiple", ("Question 1", "Question 2"), (1, 2, 3, "La réponse D"))