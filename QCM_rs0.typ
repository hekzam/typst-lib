#import "lib.typ": rect-box, finalize-atomic-boxes, mm-pos

/* TECHNICA */

#let verify(name_function, name_parameter, variable, expected_type) = {
	if (type(name_function) != str) {panic("verify function must have string as name_function")}
	if (type(name_parameter) != str) {panic("verify function must have string as name_parameter")}
	
	if (type(expected_type) == type) {
		if (type(variable) != expected_type) {panic(str([#name_function function must have #expected_type as #name_parameter]))}
	}
	else if (type(expected_type) == array) {
		expected_type.flatten()
		let lives = expected_type.len()
		for (et) in expected_type {
			if (type(et) == type) {
				if (type(variable) != et) {lives = lives - 1}
			}
		}
		if (lives < 1) {
			panic([#name_function function must have #(expected_type.join(", ", last: " or ")) as #name_parameter])
		}
	} else {
		panic("verify function must have type or array of types as expected_type")
	}
}

/* PRIMAL MATERIAL */

#let string_field(idb, w, h) = {
	verify("string_field", "ID", idb, (int, str))
	verify("string_field", "width", w, length)
	verify("string_field", "height", h, length)
	return rect-box(str(idb), w, h)
}

#let number_field(idb, w, h) = {
	verify("number_field", "ID", idb, (int, str))
	verify("number_field", "width", w, length)
	verify("number_field", "height", h, length)
	return rect-box(str(idb), w, h)
}

#let single_figure_field(idb, w, h) = {
	verify("single_figure_field", "ID", idb, (int, str))
	verify("single_figure_field", "width", w, length)
	verify("single_figure_field", "height", h, length)
	return rect-box(str(idb), w, h)
}

/* COMPOSITE MATERIAL */

#let fields_suite(idb, funk, how_many, width, height, space: 0pt, id_separator: ".") = {
	verify("figures_suite", "ID", idb, (int, str))
	verify("figures_suite", "field function", funk, function)
	verify("figures_suite", "boxes number", how_many, int)
	verify("figures_suite", "width", width, length)
	verify("figures_suite", "height", height, length)
	verify("figures_suite", "spaces between boxes", space, length)
	verify("figures_suite", "ID separator", id_separator, str)
	
	let l = ()
	let cc = 0
	for i in range(how_many) {
		l.push(funk(str(idb) + id_separator + str(cc), width, height))
		cc = cc + 1
	}
	return grid(rows: 1, columns: how_many, column-gutter: space, ..l)
}

/* IDENTIFICATION PRESETS */

#let grid_num(idb, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".") = {
	let l = ()
	for a in range(0, numb_rows) {
		for b in range(numb_beginning, numb_end + 1) {
			let lll = rect-box(str(idb) + id_separator + str(a) + id_separator + str(b), 4mm, 4mm)
			l.push(grid(rows: 1, columns: 2, column-gutter: 3mm, [#b], lll))
		}
	}
	return grid(rows: numb_rows, columns: 1 + numb_end - numb_beginning, row-gutter: 2mm, column-gutter: 4mm, ..l)
}

#let ID_field(idq, rows: 8, numb_beginning: 0, numb_end: 9, if_names: true, if_grid: false, id_separator: ".") = {
	verify("ID_field", "ID", idq, (int, str))
	verify("ID_field", "ID separator", id_separator, str)
	
	let l = ()
	if (if_names) {
		let ll = ()
		ll.push("Last name")
		ll.push(string_field(str(idq) + id_separator + "l", 4cm, 0.5cm))
		ll.push("First name")
		ll.push(string_field(str(idq) + id_separator + "f", 4cm, 0.5cm))
		l.push(grid(columns: 4, column-gutter: (2mm, 5mm, 2mm), ..ll))
	}
	if (if_grid) {
		l.push(grid_num(idq, numb_rows: rows, numb_beginning: numb_beginning, numb_end: numb_end))
	} else {
		let ll = ()
		ll.push("Student ID")
		ll.push(fields_suite(str(idq), single_figure_field, 8, 3mm, 5mm, space: 2mm))
		l.push(grid(columns: 2, column-gutter: 2mm, ..ll))
	}
	return grid(columns: 1, row-gutter: 7pt, ..l)
}

/* API MAIN PART: PARSING FUNCTIONS */

#let question_zone(idq, white_zone, id_separator: ".") = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "white_zone", white_zone, length)
	verify("mcq_grid", "ID separator", id_separator, str)
	
	if (white_zone > 0pt) {
		linebreak()
		rect-box(str(idq) + id_separator + "0", 100%, white_zone)
	}
}

#let mcq_one(idq, answers, vertical, id_separator: ".") = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "ID separator", id_separator, str)
	verify("mcq_simple", "answers list", answers, array)
	
	set par(justify: true)
	set text(10pt, weight: "regular")
	linebreak()
	
	let cc = 0
	let l = ()
	let col = ()
	
	for (case) in answers {
		l.push([#box(rect-box(str(idq) + id_separator + str(cc), 2mm, 2mm)) #case])
		if (vertical) {col.push(16pt)} else {col.push(1fr)}
		cc = cc + 1
	}
	grid(rows: if (vertical) {col} else {auto}, columns: if (vertical) {auto} else {col}, ..l)
}

#let true_false(idq, assertions, id_separator: ".") = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "ID separator", id_separator, str)
	verify("true_false", "assertions list", assertions, array)
	
	set par(justify: true)
	set text(10pt, weight: "regular")
	
	let cc = 0
	let grille = ()
	
	for (a) in assertions {
		grille.push([#a])
		grille.push([Vrai #box(rect-box(str(idq) + id_separator + str(cc) + "r", 2mm, 2mm))])
		grille.push([Faux #box(rect-box(str(idq) + id_separator + str(cc) + "w", 2mm, 2mm))])
		cc = cc + 1
	}
	/*grille.flatten()*/
	grid(columns: (2fr, 1fr, 1fr), gutter: 6pt, ..grille)
}

#let mcq_grid(idq, questions, answers, id_separator: ".") = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "ID separator", id_separator, str)
	verify("mcq_grid", "questions list", questions, array)
	verify("mcq_grid", "questions list", answers, array)
	
	set par(justify: true)
	set text(10pt, weight: "regular")
	
	let cc = 0
	let col = ()
	let row = ()
	let grille = ()
	col.push(2fr)
	row.push(auto)
	grille.push("")
	
	for (r) in answers {
		col.push(1fr)
		grille.push([#r])
	}
	for (q) in questions {
		let ccc = 0
		row.push(auto)
		grille.push([#q])
		for (r) in answers {
			grille.push([#box(rect-box(str(idq) + id_separator + str(cc) + id_separator + str(ccc), 2mm, 2mm))])
			ccc = ccc + 1
		}
		cc = cc + 1
	}
	grid(columns: col, rows: row, gutter: 6pt, ..grille)
}

#let table_parse(idq, row_size, col, row, cont, id_separator: ".") = {
	verify("table_parse", "ID", idq, int)
	verify("table_parse", "row size", row_size, length)
	verify("table_parse", "ID separator", id_separator, str)
	verify("table_parse", "columns list", col, array)
	verify("table_parse", "rows list", row, array)
	verify("table_parse", "contents list", cont, array)
	
	let col_align = ()
	let row_align = ()
	let title = ()
	let table_cases = ()
	let global_col_align = ()
	let global_row_align = ()
	let cc = 0 /*content counter*/
	
	col_align.push(auto)
	row_align.push(auto)
	table_cases.push("")
	
			/*
			let tall(body) = style(styles => measure(body, styles).width)
			tall("why styles parameter")
			
			if horiz != "" and vertic != "" {
				titre.push("")
			}
			if horiz != "" {
				global_row_align.push(15pt)
				titre.push(rect(height: 15pt, width: (100%), [#horiz]))
			}
			if vertic != "" {
				global_col_align.push(15pt)
				titre.push(rotate(270deg, origin: center, rect(height: 15pt, width: tall(vertic), [#vertic])))
			}
			*/
	
	for (c) in col {
		col_align.push(1fr)
		table_cases.push([#c])
	}
	for (r) in row {
		row_align.push(row_size)
		table_cases.push([#r])
		for c in col {
			if (cc < cont.len()) and (cont.at(cc) != "") {
				table_cases.push(cont.at(cc))
			} else {
				table_cases.push(rect-box(str(idq) + id_separator + str(cc), auto, auto))
			}
			cc = cc + 1
		}
	}
	global_row_align.push(auto)
	global_col_align.push(auto)
	
	table(
				/*columns: global_col_align,
				rows: global_row_align,
				inset: 0pt,
				align: horizon + center,
					..title,
					table(*/
		columns: col_align,
		rows: row_align,
		inset: 8pt,
		gutter: (2pt, 0pt),
		align: (col, row) =>
		if row == 0 { center }
		else if col == 0 { left }
		else { center },
		..table_cases
	)
}

#let table_column(idq, size, col, horiz: false, id_separator: ".") = {
	verify("table_column", "ID", idq, int)
	verify("table_column", "row or column size", size, length)
	verify("table_column", "ID separator", id_separator, str)
	verify("table_column", "columns list", col, array)
	let col_align = ()
	let table_cases = ()
	let cc = 0
	
	if (horiz) {
		for (c) in col {
			col_align.push(auto)
			table_cases.push([#c])
			table_cases.push(rect-box(str(idq) + id_separator + str(cc), auto, auto))
			cc = cc + 1
		}
	} else {
		for (c) in col {
			col_align.push(1fr)
			table_cases.push([#c])
		}
		for (c) in col {
			table_cases.push(rect-box(str(idq) + id_separator + str(cc), auto, auto))
			cc = cc + 1
		}
	}
	
	table(
		columns: if (horiz) {(auto, 1fr)} else {col_align},
		rows: if (horiz) {size} else {(auto, size)},
		row-gutter: if (horiz) {0pt} else {2pt},
		column-gutter: if (horiz) {2pt} else {0pt},
		inset: 8pt,
		align: horizon + center,
		..table_cases
	)
}
