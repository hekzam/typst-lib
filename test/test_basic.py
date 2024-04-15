from helpers import *

def test_basic(test_root_dir, input_fill_colors):
	test_name = 'basic'
	typ, pdf, png = gen_filenames(test_name, test_root_dir)
	
	typst_compile(typ, pdf)
	atomic_boxes = typst_query(typ, '<atomic-boxes>')
	
	pdf_to_png(pdf, png)
	check_atomic_boxes(atomic_boxes, png, input_fill_colors, test_root_dir, test_name)

def test(test_root_dir, input_fill_colors, test_name):
	typ, pdf, png = gen_filenames(test_name, test_root_dir)
	
	typst_compile(typ, pdf)
	atomic_boxes = typst_query(typ, '<atomic-boxes>')
	
	pdf_to_png(pdf, png)
	check_atomic_boxes(atomic_boxes, png, input_fill_colors, test_root_dir, test_name)
