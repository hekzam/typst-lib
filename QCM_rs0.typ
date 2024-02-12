$/*Les fonctions furent écrites par M. Poquet*/$

#import "lib.typ": rect-box, finalize-atomic-boxes, mm-pos

#let case(phrase, largeur, hauteur) = {
  let case = grid(
    columns : 2,
    column-gutter: 3mm,
    phrase,
    [#box(rect-box("b0",largeur, hauteur))]
  )
  return case
}

#let suite_cases(phrase, nbr, largeur, hauteur) = {
	  let l = ()
		for i in range(nbr) {
			l.push([#box(rect-box("b0",largeur, hauteur))])
		}
	
	let g = grid(columns: l.len(),column-gutter:1.5mm, ..l)
	grid(columns: 2, gutter:3mm, phrase, g)
}

#let grid_num(nbr) = {
  let l = ()
  for a in range(0,nbr) {
    let lg = ()
    for b in range(0,10) {
      lg.push([#case([#b],5mm,5mm)])
    }
    l.push(grid(columns:10,rows:1,gutter:10mm,..lg))
  }
  return grid(rows:nbr,gutter:3mm,..l)
}

#let champ_identifiant( nbr, grille) = {
  let l = ()
  l.push([#case("Prenom",2cm,0.5cm)])
  l.push([#case("Nom",2cm,0.5cm)])
	if (grille) {
		  l.push([#grid_num(nbr)])
	}
	else {
      l.push([#suite_cases("Numero etudiant", nbr, 3mm,5mm)])
  
	}
	grid(columns: l.len(),column-gutter:5mm,..l)
}

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

#let table_content(n1, n2, col, row, libelle, content) = {
	let col_align = ()
	let row_align = ()
	let cases = ()
	let cc = 0 /*content counter*/
	col_align.push(auto)
	row_align.push(auto)
	cases.push("")
	for (c) in col {
		col_align.push(1fr)
		cases.push([#c])
	}
	for (r) in row {
		row_align.push(auto)
		cases.push([#r])
		for c in col {
			if content.len() > cc {
				cases.push(content.at(cc))
				cc = cc + 1
			} else {
				cases.push("")
			}
		}
	}
	
	question_simple(n1, n2, libelle, 0pt)
	table(
		columns: col_align,
		rows: row_align,
		inset: 10pt,
		align: (col, row) =>
		if row == 0 { center }
		else if col == 0 { left }
		else { center },
		..cases
	)
}
