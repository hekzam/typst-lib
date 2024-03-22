#import "lib.typ": rect-box, finalize-atomic-boxes, mm-pos

/* TECHNICA: GENERIC VERIFICATION FONCTIONS */

#let verify(name_function, name_parameter, variable, expected_type) = {
	assert(type(name_function) == str, message: "verify function must have string as name_function")
	assert(type(name_parameter) == str, message: "verify function must have string as name_parameter")
	assert(type(expected_type) == type or type(expected_type) == array, message: "verify function must have type or array of types as expected_type")
	
	if (type(expected_type) == type) {
		assert(type(variable) == expected_type, message: name_function + " function must not have " + str(type(variable)) + " but " + str(expected_type) + " as " + name_parameter)
	} else if (type(expected_type) == array) {
		expected_type.flatten()
		assert(expected_type.contains(type(variable)), message: name_function + " function must not have " + str(type(variable)) + " but " + str(expected_type.join(", ", last: " or ")) + " as " + name_parameter)
	}
}

#let verify_id_suite(name_function, name_number, id_suite, number_to_compare) = {
	verify("verify_id_suite", "name_function", name_function, str)
	verify("verify_id_suite", "name_number", name_number, str)
	verify("verify_id_suite", "IDs suite", id_suite, array)
	verify("verify_id_suite", "number to compare with IDs suite length", number_to_compare, int)
	
	id_suite.flatten()
	id_suite.dedup()
	assert(id_suite.len() == 0 or id_suite.len() >= number_to_compare, message: "There are actually " + str(id_suite.len()) + " box identifiers and " + str(number_to_compare) + " boxes on input of fields_suite function. Box identifiers array length must be superior or equal to boxes number.")
}

/* PRIMAL MATERIAL */

#let base_field(idb, w, h, parse_type) = {
	verify("base_field", "ID", idb, (int, str))
	verify("base_field", "width", w, length)
	verify("base_field", "height", h, length)
	verify("base_field", "parse type", parse_type, str)
	if (not ("word", "number", "single_figure", "binary").contains(parse_type)) {
		panic(str(parse_type) + " is not among allowed parse type")
	}
	return rect-box(str(idb), w, h)
}

/* COMPOSITE MATERIAL */

#let fields_suite(idb, parse_type, how_many, width, height, space: 0pt, id_separator: ".", id_suite: ()) = {
	verify("figures_suite", "ID", idb, (int, str))
	verify("figures_suite", "parse type", parse_type, str)
	verify("figures_suite", "boxes number", how_many, int)
	verify("figures_suite", "width", width, length)
	verify("figures_suite", "height", height, length)
	verify("figures_suite", "spaces between boxes", space, length)
	verify("figures_suite", "ID separator", id_separator, str)
	verify("figures_suite", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("figures_suite", "how many fields to create", id_suite, how_many)
	
	let id_count = 0
	let l = ()
	for i in range(how_many) {
		let id_
		if (id_suite.len() > 0) {
			id_ = str(idb) + id_separator + str(id_suite.at(id_count))
			verify("figures_suite", "id_suite element " + str(id_count), id_, (int, str))
		} else {
			id_ = str(idb) + id_separator + str(id_count)
		}
		id_count = id_count + 1
		
		l.push(base_field(id_, width, height, parse_type))
	}
	return grid(rows: 1, columns: how_many, column-gutter: space, ..l)
}

/* IDENTIFICATION PRESETS */

#let grid_num(idb, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".", id_suite: ()) = {
	verify("grid_num", "ID", idb, (int, str))
	verify("grid_num", "ID separator", id_separator, str)
	verify("grid_num", "number of rows", numb_rows, int)
	verify("grid_num", "numb_beginning", numb_beginning, int)
	verify("grid_num", "numb_end", numb_end, int)
	verify("grid_num", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("grid_num", "numb_rows * (1 + numb_end - numb_beginning)", id_suite, numb_rows * (1 + numb_end - numb_beginning))
	
	let id_count = 0
	let l = ()
	
	for a in range(0, numb_rows) {
		for b in range(numb_beginning, numb_end + 1) {
			let id_
			if(id_suite.len() > 0) {
				id_ = str(idb) + id_separator + str(id_suite.at(id_count))
				id_count = id_count + 1
			} else {
				id_ = str(idb) + id_separator + str(a) + id_separator + str(b)
			}
			
			let lll = base_field(id_, 4mm, 4mm, "binary")
			l.push(grid(rows: 1, columns: 2, column-gutter: 3mm, [#b], lll))
		}
	}
	return grid(rows: numb_rows, columns: 1 + numb_end - numb_beginning, row-gutter: 2mm, column-gutter: 4mm, ..l)
}

#let ID_field(idq, rows: 8, numb_beginning: 0, numb_end: 9, if_names: true, if_grid: false, id_separator: ".", id_suite: ()) = {
	verify("ID_field", "ID", idq, (int, str))
	verify("ID_field", "ID separator", id_separator, str)
	verify("ID_field", "number of rows", rows, int)
	verify("ID_field", "numb_beginning", numb_beginning, int)
	verify("ID_field", "numb_end", numb_end, int)
	verify("ID_field", "if_names", if_names, bool)
	verify("ID_field", "if_grid", if_grid, bool)
	verify("ID_field", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("ID_field", "number of fields", id_suite, 2 + rows * (1 + numb_end - numb_beginning))
	
	let l = ()
	if (if_names) {
		let ll = ()
		ll.push("Last name")
		ll.push(base_field(str(idq) + id_separator + if (id_suite.len() > 0) {str(id_suite.at(0))} else {"l"}, 4cm, 0.5cm, "word"))
		ll.push("First name")
		ll.push(base_field(str(idq) + id_separator + if (id_suite.len() > 0) {str(id_suite.at(1))} else {"f"}, 4cm, 0.5cm, "word"))
		l.push(grid(columns: 4, column-gutter: (2mm, 5mm, 2mm), ..ll))
	}
	
	if (if_grid) {
		l.push(grid_num(idq, numb_rows: rows, numb_beginning: numb_beginning, numb_end: numb_end, id_separator: id_separator, id_suite: id_suite))
	} else {
		let ll = ()
		ll.push("Student ID")
		ll.push(fields_suite(str(idq), "single_figure", rows, 3mm, 5mm, space: 2mm, id_separator: id_separator, id_suite: if (if_names and id_suite.len() > 0) {id_suite.slice(2)} else {id_suite}))
		l.push(grid(columns: 2, column-gutter: 2mm, ..ll))
	}
	return grid(columns: 1, row-gutter: 7pt, ..l)
}

/* A.P.I. MAIN PART: PARSING FUNCTIONS */

#let confidence(idq, nuances: (25, 50, 75), display_mode: true, vertical: false, id_separator: ".", id_suite: ()) = {
	verify("confidence", "ID", idq, (int, str))
	verify("confidence", "ID separator", id_separator, str)
	verify("confidence", "list of nuances", nuances, array)
	verify("confidence", "display mode", display_mode, bool)
	verify("confidence", "vertical mode", vertical, bool)
	verify("confidence", "IDs suite", id_suite, array)
	id_suite.dedup()
	id_suite.flatten()
	nuances.dedup()
	verify_id_suite("confidence", "nuances array length", id_suite, nuances.len() + 2)
	
	let l = ()
	let row = ()
	row.push(3fr)
	nuances.push(0)
	nuances.push(100)
	nuances = nuances.sorted().dedup()
	l.push([Taux de certitude:])
	
	if (display_mode) {
		for i in range(nuances.len() - 1) {
			let n1 = nuances.at(i)
			let n2 = nuances.at(i+1)
			let id_
			if (id_suite.len() > 0) {
				id_ = id_suite.at(i)
			} else {
				id_ = str(idq) + id_separator + "c" + id_separator + str(i)
			}
			
			l.push([#n1 - #n2% #box(base_field(id_, 2mm, 2mm, "binary"))])
			row.push(2fr)
		}
	} else {
		l.push([#box(base_field(str(idq) + id_separator + "c", 10mm, 5mm, "number")) %])
		row.push(1fr)
	}
	return grid(rows: if (vertical) {20pt} else {1}, columns: if (vertical) {1} else {row}, ..l)
}

#let question_zone(idq, white_zone, id_separator: ".") = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "white_zone", white_zone, length)
	verify("mcq_grid", "ID separator", id_separator, str)
	
	if (white_zone > 0pt) {
		linebreak()
		rect-box(str(idq), 100%, white_zone)
	}
}

#let mcq_one(idq, answers, vertical, id_separator: ".", id_suite: ()) = {
	verify("mcq_one", "ID", idq, int)
	verify("mcq_one", "ID separator", id_separator, str)
	verify("mcq_one", "answers list", answers, array)
	verify("mcq_one", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("mcq_one", "answers array length", id_suite, answers.len())
	
	let id_count = 0
	let l = ()
	let col = ()
	
	for (case) in answers {
		let id_
		if (id_suite.len() > 0) {
			id_ = str(id_suite.at(id_count))
		} else {
			id_ = str(idq) + id_separator + str(id_count)
		}
		l.push([#box(base_field(id_, 2mm, 2mm, "binary")) #case])
		if (vertical) {col.push(16pt)} else {col.push(1fr)}
		id_count = id_count + 1
	}
	
	/*set par(justify: true)
	set text(10pt, weight: "regular")
	linebreak()*/
	return grid(rows: if (vertical) {col} else {auto}, columns: if (vertical) {auto} else {col}, ..l)
}

#let true_false(idq, assertions, id_separator: ".", id_suite: ()) = {
	verify("true_false", "ID", idq, int)
	verify("true_false", "ID separator", id_separator, str)
	verify("true_false", "assertions list", assertions, array)
	verify("true_false", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("true_false", "assertions array length * 2", id_suite, assertions.len() * 2)
	
	/*set par(justify: true)
	set text(10pt, weight: "regular")*/
	
	let id_count = 0
	let g = ()
	
	for (a) in assertions {
		let id_1
		let id_2
		if (id_suite.len() > 0) {
			id_1 = str(idq) + id_separator + id_suite.at(2 * id_count)
			id_2 = str(idq) + id_separator + id_suite.at(2 * id_count + 1)
		} else {
			id_1 = str(idq) + id_separator + str(id_count) + "r"
			id_2 = str(idq) + id_separator + str(id_count) + "w"
		}
		g.push([#a])
		g.push([True #box(base_field(id_1, 2mm, 2mm, "binary"))])
		g.push([False #box(base_field(id_2, 2mm, 2mm, "binary"))])
		id_count = id_count + 1
	}
	return grid(columns: (2fr, 1fr, 1fr), gutter: 6pt, ..g)
}

#let mcq_grid(idq, questions, answers, id_separator: ".", id_suite: ()) = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "ID separator", id_separator, str)
	verify("mcq_grid", "questions list", questions, array)
	verify("mcq_grid", "questions list", answers, array)
	verify("mcq_grid", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("mcq_grid", "questions * answers", id_suite, questions.len() * answers.len())
	
	/*set par(justify: true)
	set text(10pt, weight: "regular")*/
	
	let id_count_1 = 0
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
		let id_count_2 = 0
		row.push(auto)
		grille.push([#q])
		for (r) in answers {
			let id_
			if (id_suite.len() > 0) {
				id_ = str(idq) + id_separator + id_suite.at(id_count_1 * answers.len() + id_count_2)
			} else {
				id_ = str(idq) + id_separator + str(id_count_1) + id_separator + str(id_count_2)
			}
			
			grille.push([#box(base_field(id_, 2mm, 2mm, "binary"))])
			id_count_2 = id_count_2 + 1
		}
		id_count_1 = id_count_1 + 1
	}
	return grid(columns: col, rows: row, gutter: 6pt, ..grille)
}

#let table_parse(idq, row_size, col, row, cont, id_separator: ".", id_suite: ()) = {
	verify("table_parse", "ID", idq, int)
	verify("table_parse", "row size", row_size, length)
	verify("table_parse", "ID separator", id_separator, str)
	verify("table_parse", "columns list", col, array)
	verify("table_parse", "rows list", row, array)
	verify("table_parse", "contents list", cont, array)
	verify("table_parse", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("table_parse", "cells zone dimension", id_suite, col.len() * row.len())
	
	let col_align = ()
	let row_align = ()
	let title = ()
	let table_cases = ()
	let global_col_align = ()
	let global_row_align = ()
	let row_count = 0
	let case_count = 0
	let id_count = 0
	
	col_align.push(auto)
	row_align.push(auto)
	table_cases.push("")
	
	for (c) in col {
		col_align.push(1fr)
		table_cases.push([#c])
	}
	for (r) in row {
		row_align.push(row_size)
		table_cases.push([#r])
		for c in col {
			if (case_count < cont.len()) and (cont.at(case_count) != "") {
				table_cases.push(cont.at(case_count))
			} else {
				let id_
				if (id_suite.len() > 0) {
					id_ = str(idq) + id_separator + str(id_suite.at(id_count))
				} else {
					id_ = str(idq) + id_separator + str(id_count)
				}
				
				table_cases.push(rect-box(id_, 100%, 100%, stroke-width: 0mm))
				id_count = id_count + 1
			}
			case_count = case_count + 1
		}
	}
	global_row_align.push(auto)
	global_col_align.push(auto)
	
	return table(
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

#let table_column(idq, size, col, horiz: false, id_separator: ".", id_suite: ()) = {
	verify("table_column", "ID", idq, int)
	verify("table_column", "row or column size", size, length)
	verify("table_column", "ID separator", id_separator, str)
	verify("table_column", "columns list", col, array)
	verify("table_column", "IDs suite", id_suite, array)
	id_suite.flatten()
	id_suite.dedup()
	verify_id_suite("table_column", "columns number", id_suite, col.len())
	
	let col_align = ()
	let table_cases = ()
	let id_count = 0
	
	if (horiz) {
		for (c) in col {
			let id_
			if (id_suite.len() > 0) {
				id_ = str(idq) + id_separator + id_suite.at(id_count)
			} else {
				id_ = str(idq) + id_separator + str(id_count)
			}
			
			col_align.push(auto)
			table_cases.push([#c])
			table_cases.push(rect-box(id_, 100%, 100%, stroke-width: 0mm))
			id_count = id_count + 1
		}
	} else {
		for (c) in col {
			col_align.push(1fr)
			table_cases.push([#c])
		}
		for (c) in col {
			table_cases.push(rect-box(str(idq) + id_separator + str(id_count), 100%, 100%))
			id_count = id_count + 1
		}
	}
	
	return table(
		columns: if (horiz) {(auto, 1fr)} else {col_align},
		rows: if (horiz) {size} else {(auto, size)},
		row-gutter: if (horiz) {0pt} else {2pt},
		column-gutter: if (horiz) {2pt} else {0pt},
		inset: 8pt,
		align: horizon + center,
		..table_cases
	)
}
