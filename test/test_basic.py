import pytest
from helpers import *

@pytest.fixture(scope="module", params=[1, 2, 3])
def nb_copies(request):
    return request.param

@pytest.fixture(scope="module", params=[0, 1])
def duplex_printing(request):
    return request.param

@pytest.fixture(scope="module", params=[0, 1])
def copy_two_pages(request):
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

def test_basic(test_root_dir, input_fill_colors, nb_copies, duplex_printing, copy_two_pages):
    test_name = f'basic-{nb_copies}-{duplex_printing}-{copy_two_pages}'
    test_basedir = f"{test_root_dir}/{test_name}"
    os.makedirs(test_basedir, exist_ok=True)

    typ_filename = 'basic.typ'
    pdf_filename = f"{test_basedir}/output.pdf"
    json_filename = f"{test_basedir}/atomic-boxes.json"
    png_format = f"{test_basedir}/output-{{page}}.png"

    inputs_dict = {
        "nb-copies": nb_copies,
        "duplex-printing": duplex_printing,
        "copy-two-pages": copy_two_pages,
    }

    typst_compile(typ_filename, pdf_filename, inputs_dict=inputs_dict)
    nb_pages = count_pdf_pages(pdf_filename)
    copy_nb_pages = 1 + copy_two_pages
    assert nb_pages == predict_nb_pages(copy_nb_pages, nb_copies, duplex_printing)

    atomic_boxes = typst_query(typ_filename, '<atomic-boxes>', inputs_dict=inputs_dict)
    with open(json_filename, 'w') as f:
        json.dump(atomic_boxes, f, allow_nan=False, sort_keys=True)
    assert(len(atomic_boxes)) == 3 + 6

    pngs = []
    for page in range(1,nb_pages+1):
        png_filename = png_format.format(page = page)
        pdf_to_png(pdf_filename, png_filename, page=page)
        pngs.append(png_filename)

    check_atomic_boxes(atomic_boxes, pngs, input_fill_colors, test_root_dir, test_name)
