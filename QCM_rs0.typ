$/*Les fonctions furent écrites par M. Poquet*/$

#import "lib.typ": rect-box, finalize-atomic-boxes, mm-pos

#let question_simple(n1, n2, libelle, white_zone) = {
	let idea = [#n1] + "." + [#n2]
	[#idea] + [.: ] + [#libelle]
	linebreak()
	if (white_zone > 0pt) {
		rect-box(idea, 100%, white_zone)
	}
}

#let qcm_simple(n1, n2, libelle, cases, vertical) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	linebreak()
	set text(10pt, weight: "regular")
	
	let l = ()
	let col = ()
	if vertical {
		for case in cases [
			#grid(
				columns: (10pt, 1fr, 1fr),
				rows: (auto, 0pt),
				gutter: 0pt,
				rect-box("none", 2mm, 2mm),
				[#case]
			)
		]
	}
	else {
		for (case) in cases {
			l.push([
				#box(rect-box("none", 2mm, 2mm)) #case])
			col.push(1fr)
		}
		grid(columns: col, ..l)
	}
}

#let qcm_vf(n1, n2, libelle, question) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	set text(10pt, weight: "regular")
	
	let grille = ()
	for (q) in question {
		grille.push([#q])
		grille.push([Vrai #box(rect-box("none", 2mm, 2mm))])
		grille.push([Faux #box(rect-box("none", 2mm, 2mm))])
	}
	/*grille.flatten()*/
	grid(columns: (2fr, 1fr, 1fr), gutter: 6pt, ..grille)
}

#let qcm_mult(n1, n2, libelle, questions, reponses) = {
	set par(justify: true)
	question_simple(n1, n2, libelle, 0pt)
	set text(10pt, weight: "regular")
	
	let col = ()
	let row = ()
	col.push(2fr)
	row.push(auto)
	let grille = ()
	grille.push("")
	for (r) in reponses {
		col.push(1fr)
		grille.push([#r])
	}
	for (q) in questions {
		row.push(auto)
		grille.push([#q])
		for (r) in reponses {
			grille.push([
				#box(rect-box("none", 2mm, 2mm))])
		}
	}
	grid(columns: col, rows: row, gutter: 6pt, ..grille)
}

#let image_figure(libelle, img, zoom, upside) = {
	if upside {show figure.caption: set figure.caption(position: top)}
	else {show figure.caption: set figure.caption(position: bottom)}
	figure(image(img, width: zoom), caption: libelle)
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

