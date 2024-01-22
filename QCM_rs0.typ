$/*Les deux premières fonctions furent écrites par M. Poquet
Les suivantes*/$

#import "typst-lib-main/lib.typ": rect-box, finalize-atomic-boxes

#let mm-pos(position) = (
  page: position.page,
  x: position.x.mm(),
  y: position.y.mm()
)

#let rect_simple(width, height) = {
	rect(width: width, height: height, fill: white, inset: 0pt, stroke: .25mm, {
		set align(left+top)
		locate(loc2 => {[#mm-pos(loc2.position())]})
	})
}

#let question_simple(n1, n2, libelle, white_zone) = {
	let idea = [#n1] + "." + [#n2]
	[#idea] + [.: ] + [#libelle]
	linebreak()
	if (white_zone > 0pt) {
		rect-box(idea, 100%, white_zone)
	}
}
#let qcm_simple(n1, n2, libelle, cases, checkbox: "[ ]", inv: false, vertic: false) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	linebreak()
	set text(10pt, weight: "regular")
	
	let l = ()
	let col = ()
	if vertic {
		if inv {set align(right)}
		for (case) in cases [
			#checkbox #case \
		]
	}
	else {
		/*if inv {set align(right)}*/
		for (case) in cases {
			l.push(if inv [#case #checkbox] else [#checkbox #case])
			col.push(1fr)
		}
		grid(columns: col, ..l)
	}
}
#let qcm_vf(n1, n2, libelle, quest, checkbox) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	set text(10pt, weight: "regular")
	
	let grille = ()
	for (q) in quest {
		grille.push([#q])
		grille.push([Vrai #checkbox])
		grille.push([Faux #checkbox])
	}
	/*grille.flatten()*/
	grid(columns: (2fr, 1fr, 1fr), gutter: 6pt, ..grille)
}
#let qcm_mult(n1, n2, libelle, quest, rep, checkbox) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	set text(10pt, weight: "regular")
	
	let col = ()
	let row = ()
	col.push(2fr)
	row.push(auto)
	let grille = ()
	grille.push("")
	for (r) in rep {
		col.push(1fr)
		grille.push([#r])
	}
	for (q) in quest {
		row.push(auto)
		grille.push([#q])
		for (r) in rep {
			grille.push("[]")
		}
	}
	grid(columns: col, rows: row, gutter: 6pt, ..grille)
}
#let qcm_tableau(n1, n2, axe_x, axe_y, libelle) = {
	table(
		columns: (1fr, auto, auto),
		inset: 10pt,
		align: (col, row) =>
		if row == 0 { center }
		else if col == 0 { left }
		else { right },
		[], for (x) in axe_x [#x],
		for (y) in axe_y [#y, #for (x) in axe_x []],
	)
}

#let champ_id(nb, aff) = {
	if aff == true {
		"|"
		for i in range(nb) {
			"__|"
		}
	}
}

#set heading(numbering: "1")
#show heading: it => [
	#set align(left)
	#set text(font: "Inria Serif")
	Exercice #counter(heading).display()\: #text(it.body)
]

/*
#set page(
	paper: "a4",
	header: [
		#rect(width: 100%, height: 1cm, inset: 0pt)
	],
	footer: [
		#set align(center)
		#rect(width: 100%, height: 1cm, inset: 0pt)
	]
)*/

#champ_id(8,true)

#rect_simple(10%, 12%)

#let cb1 = "[ ]"
#let cb2 = "()"

= Premier exercice

#question_simple(1, 1, "Simple énoncé", 0pt)

#question_simple(1, 2, "Répondre sur la copie:", 24pt)

#question_simple(1, 3, "Répondre sur la copie:", 60pt)

= Deuxième exercice

#qcm_simple(2, 1, "Première question", (20, 25, 27, 37, 61, 89), cb2, false, false)

#qcm_simple(2, 2, "Deuxième question", ("One", "Two", "Three", "Four", "Five"), cb1, true, false)

= Troisième exercice

#qcm_vf(3, 1, "Question vrai-faux", ("Assertion 1", "Assertion 2"), cb1)

#qcm_simple(3, 2, "Question à la verticale", (1, 2, 3, "La réponse D"), cb1, false, true)

#qcm_simple(3, 3, "Question à la verticale et à droite", (1, 2, 3, 4, 5), cb1, true, true)

= Quatrième exercice

#qcm_mult(4, 1, "Question multiple", ("Question 1", "Question 2"), (1, 2, 3, "La réponse D"), cb1)
