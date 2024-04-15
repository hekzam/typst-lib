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
	verify("verify_id_suite", "IDs suite", id_suite, (array, none))
	verify("verify_id_suite", "number to compare with IDs suite length", number_to_compare, int)
	
	id_suite.flatten()
	id_suite.dedup()
	assert(type(id_suite) == auto or id_suite.len() >= number_to_compare, message: "There are actually " + str(id_suite.len()) + " box identifiers and " + str(number_to_compare) + " boxes on input of fields_suite function. Box identifiers array length must be superior or equal to boxes number.")
}

/* PRIMAL MATERIAL */

#let base_field(idb, w, h, parse_type, fill_color: white) = {
	verify("base_field", "ID", idb, (int, str))
	verify("base_field", "width", w, length)
	verify("base_field", "height", h, length)
	verify("base_field", "parse type", parse_type, str)
	verify("base_field", "test fill color", fill_color, color)
	if (not ("word", "number", "single_figure", "binary").contains(parse_type)) {
		panic(str(parse_type) + " is not among allowed parse type")
	}
	return rect-box(str(idb), w, h, fill-color: fill_color)
}

/* COMPOSITE MATERIAL */

#let fields_suite(idb, id_suite, parse_type, how_many, width, height, space: 0pt, id_separator: ".", fill_color: white) = {
	verify("figures_suite", "ID", idb, (int, str))
	verify("figures_suite", "parse type", parse_type, str)
	verify("figures_suite", "boxes number", how_many, int)
	verify("figures_suite", "width", width, length)
	verify("figures_suite", "height", height, length)
	verify("figures_suite", "spaces between boxes", space, length)
	verify("figures_suite", "ID separator", id_separator, str)
	verify("figures_suite", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("figures_suite", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("figures_suite", "how many fields to create", id_suite, how_many)
	}
	
	let id_count = 0
	let l = ()
	for i in range(how_many) {
		let id_
		if (id_suite != auto) {
			id_ = str(idb) + id_separator + str(id_suite.at(id_count))
			verify("figures_suite", "id_suite element " + str(id_count), id_, (int, str))
		} else {
			id_ = str(idb) + id_separator + str(id_count)
		}
		id_count = id_count + 1
		
		l.push(base_field(id_, width, height, parse_type, fill_color: fill_color))
	}
	return grid(rows: 1, columns: how_many, column-gutter: space, ..l)
}

/* IDENTIFICATION PRESETS */

#let grid_num(idb, id_suite, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".", fill_color: white) = {
	verify("grid_num", "ID", idb, (int, str))
	verify("grid_num", "ID separator", id_separator, str)
	verify("grid_num", "number of rows", numb_rows, int)
	verify("grid_num", "numb_beginning", numb_beginning, int)
	verify("grid_num", "numb_end", numb_end, int)
	verify("grid_num", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("grid_num", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("grid_num", "numb_rows * (1 + numb_end - numb_beginning)", id_suite, numb_rows * (1 + numb_end - numb_beginning))
	}
	
	let id_count = 0
	let l = ()
	
	for a in range(0, numb_rows) {
		for b in range(numb_beginning, numb_end + 1) {
			let id_
			if (id_suite != auto) {
				id_ = str(idb) + id_separator + str(id_suite.at(id_count))
				id_count = id_count + 1
			} else {
				id_ = str(idb) + id_separator + str(a) + id_separator + str(b)
			}
			
			let lll = base_field(id_, 4mm, 4mm, "binary", fill_color: fill_color)
			l.push(grid(rows: 1, columns: 2, column-gutter: 3mm, [#b], lll))
		}
	}
	return grid(rows: numb_rows, columns: 1 + numb_end - numb_beginning, row-gutter: 2mm, column-gutter: 4mm, ..l)
}

#let ID_field(idq, id_suite, rows: 8, numb_beginning: 0, numb_end: 9, if_names: true, if_grid: false, id_separator: ".", fill_color: white) = {
	verify("ID_field", "ID", idq, (int, str))
	verify("ID_field", "ID separator", id_separator, str)
	verify("ID_field", "number of rows", rows, int)
	verify("ID_field", "numb_beginning", numb_beginning, int)
	verify("ID_field", "numb_end", numb_end, int)
	verify("ID_field", "if_names", if_names, bool)
	verify("ID_field", "if_grid", if_grid, bool)
	verify("ID_field", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("ID_field", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("ID_field", "number of fields", id_suite, if (if_grid) {if (if_names) {2 + rows * (1 + numb_end - numb_beginning)} else {rows * (1 + numb_end - numb_beginning)}} else {if (if_names) {2 + rows} else {rows}})
	}
	
	let l = ()
	if (if_names) {
		let ll = ()
		ll.push("Last name")
		ll.push(base_field(str(idq) + id_separator + if (id_suite != auto) {str(id_suite.at(0))} else {"l"}, 4cm, 0.5cm, "word", fill_color: fill_color))
		ll.push("First name")
		ll.push(base_field(str(idq) + id_separator + if (id_suite != auto) {str(id_suite.at(1))} else {"f"}, 4cm, 0.5cm, "word", fill_color: fill_color))
		l.push(grid(columns: 4, column-gutter: (2mm, 5mm, 2mm), ..ll))
	}
	
	if (if_grid) {
		l.push(grid_num(idq, id_suite, numb_rows: rows, numb_beginning: numb_beginning, numb_end: numb_end, id_separator: id_separator, fill_color: fill_color))
	} else {
		let ll = ()
		ll.push("Student ID")
		ll.push(fields_suite(str(idq), if (if_names and id_suite != auto) {id_suite.slice(2)} else {id_suite}, "single_figure", rows, 3mm, 5mm, space: 2mm, id_separator: id_separator, fill_color: fill_color))
		l.push(grid(columns: 2, column-gutter: 2mm, ..ll))
	}
	return grid(columns: 1, row-gutter: 7pt, ..l)
}

/* A.P.I. MAIN PART: PARSING FUNCTIONS */

#let confidence(idq, id_suite, nuances: (25, 50, 75), if_multiple_boxes: true, vertical: false, id_separator: ".", fill_color: white) = {
	verify("confidence", "ID", idq, (int, str))
	verify("confidence", "ID separator", id_separator, str)
	verify("confidence", "list of nuances", nuances, array)
	verify("confidence", "if_multiple_boxes", if_multiple_boxes, bool)
	verify("confidence", "vertical mode", vertical, bool)
	verify("confidence", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("confidence", "IDs suite", id_suite, array)
		id_suite.dedup()
		id_suite.flatten()
		nuances.dedup()
		verify_id_suite("confidence", "nuances array length", id_suite, if (if_multiple_boxes) {nuances.len() - 1} else {0})
	}
	
	for n in nuances {
		assert(n >= 0)
		assert(n <= 100)
	}
	
	let l = ()
	let row = ()
	row.push(3fr)
	nuances.push(0)
	nuances.push(100)
	nuances = nuances.sorted().dedup()
	l.push([Taux de certitude:])
	
	if (if_multiple_boxes) {
		for i in range(nuances.len() - 1) {
			let n1 = nuances.at(i)
			let n2 = nuances.at(i+1)
			let id_
			if (id_suite != auto) {
				id_ = str(idq) + id_separator + id_suite.at(i)
			} else {
				id_ = str(idq) + id_separator + str(i)
			}
			
			l.push([#n1 - #n2% #box(base_field(id_, 2mm, 2mm, "binary", fill_color: fill_color))])
			row.push(2fr)
		}
	} else {
		l.push([#box(base_field(str(idq) + id_separator + "c", 10mm, 5mm, "number", fill_color: fill_color)) %])
		row.push(1fr)
	}
	return grid(rows: if (vertical) {20pt} else {1}, columns: if (vertical) {1} else {row}, ..l)
}

#let question_zone(idq, white_zone, fill_color: white) = {
	verify("question_zone", "ID", idq, int)
	verify("question_zone", "white_zone", white_zone, length)
	verify("question_zone", "test fill color", fill_color, color)
	
	if (white_zone > 0pt) {
		linebreak()
		rect-box(str(idq), 100%, white_zone, fill-color: fill_color)
	}
}

#let mcq_one(idq, id_suite, answers, vertical, id_separator: ".", fill_color: white) = {
	verify("mcq_one", "ID", idq, int)
	verify("mcq_one", "ID separator", id_separator, str)
	verify("mcq_one", "answers list", answers, array)
	verify("mcq_one", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("mcq_one", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("mcq_one", "answers array length", id_suite, answers.len())
	}
	
	let id_count = 0
	let l = ()
	let col = ()
	
	for (case) in answers {
		let id_
		if (id_suite != auto) {
			id_ = str(idq) + id_separator + str(id_suite.at(id_count))
		} else {
			id_ = str(idq) + id_separator + str(id_count)
		}
		l.push([#box(base_field(id_, 2mm, 2mm, "binary", fill_color: fill_color)) #case])
		if (vertical) {col.push(16pt)} else {col.push(1fr)}
		id_count = id_count + 1
	}
	
	/*set par(justify: true)
	set text(10pt, weight: "regular")
	linebreak()*/
	return grid(rows: if (vertical) {col} else {auto}, columns: if (vertical) {auto} else {col}, ..l)
}

#let true_false(idq, id_suite, assertions, id_separator: ".", fill_color_t: white, fill_color_f: white) = {
	verify("true_false", "ID", idq, int)
	verify("true_false", "ID separator", id_separator, str)
	verify("true_false", "assertions list", assertions, array)
	verify("true_false", "test fill color for true cases", fill_color_t, color)
	verify("true_false", "test fill color for false cases", fill_color_f, color)
	if (id_suite != auto) {
		verify("true_false", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("true_false", "assertions array length * 2", id_suite, assertions.len() * 2)
	}
	
	let id_count = 0
	let g = ()
	
	for (a) in assertions {
		let id_1
		let id_2
		if (id_suite != auto) {
			id_1 = str(idq) + id_separator + id_suite.at(2 * id_count)
			id_2 = str(idq) + id_separator + id_suite.at(2 * id_count + 1)
		} else {
			id_1 = str(idq) + id_separator + str(id_count) + "r"
			id_2 = str(idq) + id_separator + str(id_count) + "w"
		}
		g.push([#a])
		g.push([True #box(base_field(id_1, 2mm, 2mm, "binary", fill_color: fill_color_t))])
		g.push([False #box(base_field(id_2, 2mm, 2mm, "binary", fill_color: fill_color_f))])
		id_count = id_count + 1
	}
	return grid(columns: (2fr, 1fr, 1fr), gutter: 6pt, ..g)
}

#let mcq_grid(idq, id_suite, questions, answers, id_separator: ".", fill_color: white) = {
	verify("mcq_grid", "ID", idq, int)
	verify("mcq_grid", "ID separator", id_separator, str)
	verify("mcq_grid", "questions list", questions, array)
	verify("mcq_grid", "questions list", answers, array)
	verify("mcq_grid", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("mcq_grid", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("mcq_grid", "questions * answers", id_suite, questions.len() * answers.len())
	}
	
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
			if (id_suite != auto) {
				id_ = str(idq) + id_separator + id_suite.at(id_count_1 * answers.len() + id_count_2)
			} else {
				id_ = str(idq) + id_separator + str(id_count_1) + id_separator + str(id_count_2)
			}
			
			grille.push([#box(base_field(id_, 2mm, 2mm, "binary", fill_color: fill_color))])
			id_count_2 = id_count_2 + 1
		}
		id_count_1 = id_count_1 + 1
	}
	return grid(columns: col, rows: row, gutter: 6pt, ..grille)
}

#let table_parse(idq, id_suite, row_size, col, row, cont, turn_aside: false, parse_inset: 0pt, id_separator: ".", fill_color: white) = {
	verify("table_parse", "ID", idq, int)
	verify("table_parse", "row size", row_size, length)
	verify("table_parse", "ID separator", id_separator, str)
	verify("table_parse", "columns list", col, array)
	verify("table_parse", "rows list", row, array)
	verify("table_parse", "contents list", cont, array)
	verify("table_parse", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("table_parse", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("table_parse", "cells zone dimension", id_suite, col.len() * row.len())
	}
	
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
		table_cases.push(box(inset: 5pt, c))
	}
	for (r) in row {
		row_align.push(row_size)
		table_cases.push(if (turn_aside) {table.cell(inset: 5pt, rowspan: 1, align: horizon, rotate(-90deg, reflow: true)[#r])} else {box(inset: 5pt, r)})
		for c in col {
			if (case_count < cont.len()) and (cont.at(case_count) != "") {
				table_cases.push(cont.at(case_count))
			} else {
				let id_
				if (id_suite != auto) {
					id_ = str(idq) + id_separator + str(id_suite.at(id_count))
				} else {
					id_ = str(idq) + id_separator + str(id_count)
				}
				
				table_cases.push(rect-box(id_, 100%, 100%, stroke-width: 0mm, fill-color: fill_color))
				id_count = id_count + 1
			}
			case_count = case_count + 1
		}
	}
	global_row_align.push(auto)
	global_col_align.push(auto)
	
	return table(
		columns: col_align,
		rows: row_align,
		inset: parse_inset,
		gutter: (2pt, 0pt),
		align: (col, row) =>
		if row == 0 { center }
		else if col == 0 { left }
		else { center },
		..table_cases
	)
}

#let table_column(idq, id_suite, size, col, horiz: false, turn_aside: false, parse_inset: 0pt, id_separator: ".", fill_color: white) = {
	verify("table_column", "ID", idq, int)
	verify("table_column", "row or column size", size, length)
	verify("table_column", "ID separator", id_separator, str)
	verify("table_column", "columns list", col, array)
	verify("table_column", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("table_column", "IDs suite", id_suite, array)
		id_suite.flatten()
		id_suite.dedup()
		verify_id_suite("table_column", "columns number", id_suite, col.len())
	}
	
	let col_align = ()
	let table_cases = ()
	let id_count = 0
	
	if (horiz) {
		for (c) in col {
			let id_
			if (id_suite != auto) {
				id_ = str(idq) + id_separator + str(id_suite.at(id_count))
			} else {
				id_ = str(idq) + id_separator + str(id_count)
			}
			
			col_align.push(auto)
			table_cases.push(if (turn_aside) {table.cell(inset: 5pt, rowspan: 1, align: horizon, rotate(-90deg, reflow: true)[#c])} else {box(inset: 5pt, c)})
			table_cases.push(rect-box(id_, 100%, 100%, stroke-width: 0mm, fill-color: fill_color))
			id_count = id_count + 1
		}
	} else {
		for (c) in col {
			col_align.push(1fr)
			table_cases.push(box(inset: 5pt, c))
		}
		for (c) in col {
			let id_
			if (id_suite != auto) {
				id_ = str(idq) + id_separator + str(id_suite.at(id_count))
			} else {
				id_ = str(idq) + id_separator + str(id_count)
			}
			
			table_cases.push(rect-box(id_, 100%, 100%, stroke-width: 0mm, fill-color: fill_color))
			id_count = id_count + 1
		}
	}
	
	return table(
		columns: if (horiz) {(auto, 1fr)} else {col_align},
		rows: if (horiz) {size} else {(auto, size)},
		row-gutter: if (horiz) {0pt} else {2pt},
		column-gutter: if (horiz) {2pt} else {0pt},
		inset: parse_inset,
		align: horizon + center,
		..table_cases
	)
}

/* COMPLEX LAYERS */

#let confidence_aside(idq, id_suite, question, nuances: (25, 50, 75), if_multiple_boxes: true, id_separator: ".", fill_color: white) = {
	verify("confidence_aside", "ID", idq, (int, str))
	/* verify("confidence_aside", "question", question, (table, grid)) */
	verify("confidence_aside", "ID separator", id_separator, str)
	verify("confidence_aside", "list of nuances", nuances, array)
	verify("confidence_aside", "if_multiple_boxes", if_multiple_boxes, bool)
	verify("confidence_aside", "test fill color", fill_color, color)
	if (id_suite != auto) {
		verify("confidence_aside", "IDs suite", id_suite, array)
	}
	
	return grid(
		columns: (85%, 15%),
		rows: (auto), 
		align: (left, right + bottom),
		question,
		grid.vline(start: 0),
		confidence(idq, id_suite, nuances: nuances, if_multiple_boxes: if_multiple_boxes, vertical: true, id_separator: id_separator, fill_color: fill_color)
	)
}
