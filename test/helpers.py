import cv2
import json
import logging
import numpy as np
import re
import os
import subprocess

COLOR_RE = re.compile('^#([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$')
PAGES_RE = re.compile('^NumberOfPages: ([0-9]+)$')

def show_process_outputs(name, p):
    if p.stdout is not None and p.stdout != '':
        logging.error(f'{name} stdout: f{p.stdout}')
    if p.stderr is not None and p.stderr != '':
        logging.error(f'{name} stderr: f{p.stderr}')

def gen_filenames(prefix, test_root_dir):
    return f'{prefix}.typ', f'{test_root_dir}/{prefix}.pdf', f'{test_root_dir}/{prefix}-{{page}}.png'

def count_pdf_pages(filename):
    argv = [ 'pdftk', filename, 'dump_data' ]

    p = subprocess.run(argv, capture_output=True, encoding='utf-8')
    if p.returncode != 0:
        show_process_outputs('pdftk', p)
        raise RuntimeError(f'pdftk execution failed (returncode={p.returncode})')

    for output_line in p.stdout.split('\n'):
        m = PAGES_RE.match(output_line)
        if m is not None:
            return int(m.group(1))

    show_process_outputs('pdftk', p)
    raise RuntimeError(f'could not find number of pages in pdftk output')

def pdf_to_png(input_filename, output_filename, page=1, export_width=2000, export_background_color='#ffffff'):
    argv = [
        'inkscape',
        '--export-filename', output_filename,
        '--export-width', f"{export_width}",
        '--export-background', export_background_color,
        '--pages', f"{page}",
        input_filename
    ]

    p = subprocess.run(argv, capture_output=True, encoding='utf-8')
    if p.returncode != 0:
        show_process_outputs('inkscape', p)
        raise RuntimeError(f'inkscape execution failed (returncode={p.returncode})')

    if not os.path.isfile(output_filename):
        show_process_outputs('inkscape', p)
        raise RuntimeError(f"inkscape returned 0 but has not created file '{output_filename}'")

def typst_compile(input_filename, output_filename, typst_root='..', inputs_dict=None):
    argv = [ 'typst', 'compile', '--root', typst_root, input_filename, output_filename ]

    if inputs_dict is not None:
        for key, value in inputs_dict.items():
            argv.extend(["--input", f"{key}={value}"])

    p = subprocess.run(argv, capture_output=True, encoding='utf-8')
    if p.returncode != 0:
        show_process_outputs('typst compile', p)
        raise RuntimeError(f'typst compile execution failed (returncode={p.returncode})')

    if not os.path.isfile(output_filename):
        show_process_outputs('typst compile', p)
        raise RuntimeError(f"typst compile returned 0 but has not created file '{output_filename}'")

def typst_query(input_filename, selector, typst_root='..', inputs_dict=None):
    argv = [ 'typst', 'query', '--root', typst_root, '--one', '--field', 'value', input_filename, selector ]

    if inputs_dict is not None:
        for key, value in inputs_dict.items():
            argv.extend(["--input", f"{key}={value}"])

    p = subprocess.run(argv, capture_output=True, encoding='utf-8')
    if p.returncode != 0:
        show_process_outputs('typst query', p)
        raise RuntimeError(f'typst query execution failed (returncode={p.returncode})')

    if p.stdout == '':
        raise RuntimeError('typst query returned an empty string')
    return json.loads(p.stdout)

def vector_to_raster(coord, scale=2000/210):
    return int(coord*scale)

def check_single_color_1d_hist(hist, expected_value, box_id, fill_color, nb_pixels, component_name):
    assert hist[expected_value] == nb_pixels, f"atomic_box '{box_id}' should be filled by {nb_pixels} pixels colored '{fill_color}' ({component_name}={expected_value}) but its content {component_name} histogram does not match: {hist}"

def check_atomic_boxes(atomic_boxes, png_filenames, input_fill_colors, test_root_dir, test_name, vector_to_raster_scale=2000/210):
    imgs = [ cv2.imread(f) for f in png_filenames ]

    for box_id, box in atomic_boxes.items():
        x0,y0 = box['x'], box['y']
        x1,y1 = box['x'] + box['width'], box['y'] + box['height']
        stroke_width = box['stroke-width']
        fill_color = box['fill-color']
        page = box['page']

        # test whether typst fill-color metadata is the expected one
        expected_fill_color = input_fill_colors[box_id]
        assert expected_fill_color == fill_color, f"atomic box '{box_id}' should have fill_color '{expected_fill_color}' according to JSON fill color input, but the color obtained from typst query is '{fill_color}'"

        v2rs = vector_to_raster_scale
        inner_box_img = imgs[page - 1][
            vector_to_raster(y0 + stroke_width, v2rs) + 1 : vector_to_raster(y1 - stroke_width, v2rs) - 1,
            vector_to_raster(x0 + stroke_width, v2rs) + 1 : vector_to_raster(x1 - stroke_width, v2rs) - 1,
        ]

        inner_box_width, inner_box_height, _ = inner_box_img.shape
        nb_pixels = inner_box_width * inner_box_height

        cv2.imwrite(f'{test_root_dir}/{test_name}-inner-{box_id}.png', inner_box_img)

        # read component values of the expected fill color
        m = COLOR_RE.match(fill_color)
        r = int(m.group(1), 16)
        g = int(m.group(2), 16)
        b = int(m.group(3), 16)

        # compute histograms for all components (r, g and b) and make sure only the desired color is present in the inner box image
        bimg, gimg, rimg = cv2.split(inner_box_img)
        rhist = np.histogram(rimg, bins=256, range=(0, 256))[0]
        ghist = np.histogram(gimg, bins=256, range=(0, 256))[0]
        bhist = np.histogram(bimg, bins=256, range=(0, 256))[0]
        check_single_color_1d_hist(rhist, r, box_id, fill_color, nb_pixels, 'red')
        check_single_color_1d_hist(ghist, g, box_id, fill_color, nb_pixels, 'green')
        check_single_color_1d_hist(bhist, b, box_id, fill_color, nb_pixels, 'blue')
