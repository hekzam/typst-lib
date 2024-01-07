$/*La majorité du code faite par Gabriel
Quelques corrections apportées par Anaïs*/$

#let question_simple(n1, n2, libelle) = {
	[#n1] + [.] + [#n2] + [.: ] + [#libelle]
}
#let qcm_simple(n1, n2, cases, libelle) = {
	[#question_simple(n1, n2, libelle)
	
	#for (case) in cases [ #case [ ]]]
}
#let qcm_tableau(n1, n2, axe_x, axe_y, libelle) = {
	table(
		columns: (1fr, auto, auto),
		inset: 10pt,
		align: (col, row) =>
		if row == 0 { center }
		else if col == 0 { left }
		else { right },
		[], for (x) in axe_x [x],
		for (y) in axe_y [y, #for (x) in axe_x []],
	)
}

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

#let rimbaud = "Quel âge avait Rimbaud?"
#let mieux = "Mieux!!!!"

= Quelle est la différence entre un pigeon?
Question à 10000 francs

#question_simple(1, 1, "Un pigeon, c'est facile…")

= Quel âge avait Rimbaud?
Question à 1000 francs

#qcm_simple(2, 1, (20, 25, 27, 37, 61, 89), rimbaud)

Il avait 27 ans, ça dépend quand, mais il avait 27 ans.

= Le russe Ishlakov a sauté 2 mètres 31. Pouvez-vous dire mieux?
Question à 100 francs

#qcm_tableau(3, 1, (mieux, mieux), (2.32, 2.33, 2.34, 2.35), "Plus fort!")

Trop tard.
