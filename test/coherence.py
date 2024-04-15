import json
from helpers import automatic_query

def analysis(boxes, n_cols, n_rows, stroke = 0, points = False, verbose = False):
	assert n_cols > 0
	assert n_rows > 0
	c = 0
	r = 0
	
	if points:
		stroke *= 0.352777
	
	list_boxes = []
	for b in boxes:
		list_boxes.append(boxes.get(b))
	
	for i in range(len(list_boxes)):
		assert c < n_cols
		assert r < n_rows
		
		if c < n_cols - 1:
			if verbose:
				print(round(list_boxes[i+1]['x'], 5))
				print(round(list_boxes[i]['x'] + list_boxes[i]['width'] + 2 * stroke, 5))
			else:
				assert round(list_boxes[i+1]['x'], 5) == round(list_boxes[i]['x'] + list_boxes[i]['width'] + 2 * stroke, 5)
		
		if r < n_rows - 1:
			if verbose:
				print(round(list_boxes[i+n_cols]['y'], 5))
				print(round(list_boxes[i]['y'] + list_boxes[i]['height'] + 2 * stroke, 5))
			else:
				assert round(list_boxes[i+n_cols]['y'], 5) == round(list_boxes[i]['y'] + list_boxes[i]['height'] + 2 * stroke, 5)
		
		c += 1
		if c >= n_cols:
			c = 0
			r += 1
	
	assert c == 0
	assert r == n_rows

idq = 0
cols = 6
rows = 5
width = 60
inset = 1
horiz = False
points = True

object = automatic_query('test/auto_table_parse.typ', func = "table_parse", idq = idq, cols = cols, rows = rows, width = width, inset = inset, horiz = horiz, points = points)
analysis(object, cols, rows, 1, points, True)
