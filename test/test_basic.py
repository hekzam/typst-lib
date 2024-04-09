import pytest
from helpers import *

@pytest.fixture(scope="module", params=[1, 2, 3])
def nb_copies(request):
    return request.param

@pytest.fixture(scope="module", params=[0, 1])
def duplex_printing(request):
    return request.param

@pytest.fixture(scope="module", params=[0, 1])
def b2i_separate_page(request):
    return request.param

def predict_nb_pages(copy_pages, nb_copies, duplex_printing):
    if nb_copies <= 0:
        return 1

    nb_pages = copy_pages
    if nb_copies > 1:
        non_last_copy_pages = copy_pages
        if duplex_printing and (copy_pages % 2) == 1:
            non_last_copy_pages += 1
        nb_pages += (nb_copies - 1) * non_last_copy_pages
    return nb_pages

def test_basic(test_root_dir, input_fill_colors, nb_copies, duplex_printing, b2i_separate_page):
    test_name = f'basic-{nb_copies}-{duplex_printing}-{b2i_separate_page}'
    typ, pdf, png_format = gen_filenames(test_name, test_root_dir)
    typ = 'basic.typ'

    inputs_dict = {
        "nb-copies": nb_copies,
        "duplex-printing": duplex_printing,
        "b2i-separate-page": b2i_separate_page,
    }

    typst_compile(typ, pdf, inputs_dict=inputs_dict)
    nb_pages = count_pdf_pages(pdf)
    copy_nb_pages = 1 + b2i_separate_page
    assert nb_pages == predict_nb_pages(copy_nb_pages, nb_copies, duplex_printing)

    atomic_boxes = typst_query(typ, '<atomic-boxes>')
    with open(f'{test_root_dir}/{test_name}-atomic-boxes.json', 'w') as f:
        json.dump(atomic_boxes, f, allow_nan=False, sort_keys=True)
    assert(len(atomic_boxes)) == 4 + 3

    pngs = []
    for page in range(1,nb_pages+1):
        png = png_format.format(page = page)
        pdf_to_png(pdf, png)
        pngs.append(png)

    check_atomic_boxes(atomic_boxes, pngs, input_fill_colors, test_root_dir, test_name)
