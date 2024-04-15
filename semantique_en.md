# Summary


## API FUNCTIONS

    question_zone: Statement with a single parsing zone, adjustable in height.
    mcq_one: Displays a statement and a question with multiple choices with parsing boxes.
    true_false: Displays a statement and a series of assertions to answer true or false.
    mcq_grid: Displays a statement and a series of identical choice questions in grid form.
    table_parse: Allows to display a table with the content of rows, columns and boxes. Inclusion of parsing spaces (rect-box) in all non pre-filled boxes.
    table_column: Allows to display a table with only lines or columns. Inclusion of parsing spaces of parametrizable size.
    confidence: Creates parsing zones allowing the candidate to indicate his confidence rate in a question.
    confidence_aside: Creates a confidence rate zone next to any other question.
    ID_field: Allows to display a zone for the student to identify himself. With the annex function grid_num.

## GENERIC AND ANNEX FUNCTIONS

    base_field: Function allowing the parsing of a single digit.
    fields_suite: Function allowing the display of several consecutive fields of the same category.
    grid_num: Allows to display the student number in grid form.

## GLOBAL VERIFICATION FUNCTIONS

    verify: Checks the typing of each function.
    verify_id_suite: Checks the correct length of the identifier list with respect to the number of parsing fields.


# API FUNCTIONS


## question_zone

Statement with a single parsing zone, adjustable in height.

### Function signature

question_zone(idq: integer or string, white_zone: relative length or none, fill_color: color)

### Parameters

    idq → question identifier and prefix of associated rect-box identifiers
    white_zone → size of the white rectangle (in pt)
    fill_color → background color of the parsing field for visual consistency tests


## mcq_one

Displays a statement and a question with multiple choices with parsing boxes.

### Function signature

mcq_one(idq: integer or string, id_suite: string array or auto, cases: array, vertic : boolean, id_separator: string, fill_color: color)

### Parameters

    idq → MCQ identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    cases → lists of answers
    vertic → boolean for vertical or horizontal display
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## true_false

Displays a statement and a series of assertions to answer true or false.

### Function signature

true(idq: integer or string, id_suite: string array or auto, assertions: array, id_separator: string, fill_color: color)

### Parameters

    idq → true/false identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    assertions → list containing the assertions to which it is necessary to answer true or false
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## mcq_grid

Displays a statement and a series of identical choice questions in grid form.

### Function signature

mcq_grid(idq: integer or string, id_suite: string array or auto, questions: array, answers: array, id_separator: string, fill_color: color)

### Parameters

    idq → MCQ identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    questions → list containing the questions
    answers → list containing the answers
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## table_parse

Allows to display a table with the content of rows, columns and boxes. Inclusion of parsing spaces (rect-box) in all non pre-filled boxes.

### Function signature

table_parse(idq: integer or string, id_suite: string array or auto, row_size: relative length, col: array, row: array, cont: array, parse_inset: relative length, id_separator: string, fill_color: color)

### Parameters

    idq → table identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    row_size → indication of the height of each row
    col → list of column labels
    row → list of row labels
    cont → content of the boxes; can be left empty for a table to be completed
    parse_inset → indicates the margin of the parsing zone in each of the boxes in the table
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## table_column

Allows to display a table with only lines or columns. Inclusion of parsing spaces of parametrizable size.

### Function signature

table_1d(idq: integer or string, id_suite: string array or auto, size: relative length, col: array, horiz: boolean, parse_inset: relative length, id_separator: string, fill_color: color)

### Parameters

    idq → table identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    size → definition of the height of the boxes to be filled
    col → list of column labels
    horiz → boolean determining the position of the table: in the form of lines if horiz is true, in the form of columns otherwise
    parse_inset → indicates the margin of the parsing zone in each of the boxes in the table
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## confidence

Creates parsing zones allowing the candidate to indicate his confidence rate in a question.

### Function signature

confidence(idq: integer or string, id_suite: string array or auto, nuances: integer array, if_multiple_boxes: boolean, vertical: boolean, id_separator: string, id_suite: array, fill_color: color)

### Parameters

    idq → field identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    nuances → list of integers indicating the precision of percentages to be displayed for the check boxes
    if_multiple_boxes → determines the display mode of the confidence rate; in the form of a series of binary boxes if this parameter is true, in the form of a single box to be filled in otherwise
    vertical → boolean for vertical or horizontal display
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## confidence_aside

Creates a confidence rate zone next to any other question.

### Function signature

confidence_aside(idq: integer, id_suite: string array or auto, question: table or grid, nuances: integer array, if_multiple_boxes: boolean, id_separator: string, id_suite: array, fill_color: color)

### Parameters

    idq → identifier of the confidence rate function and prefix of associated rect-box identifiers
    id_suite → list of identifiers of the confidence rate function
    question → any other API function call
    nuances → list of integers indicating the precision of percentages to be displayed for the check boxes
    if_multiple_boxes → determines the display mode of the confidence rate; in the form of a series of binary boxes if this parameter is true, in the form of a single box to be filled in otherwise
    the vertical boolean parameter of the confidence function thus called is set to true
    id_separator → separator of the prefix and the body of the identifier of each rect-box, for the confidence rate function
    fill_color → background color of the parsing fields for visual consistency tests, for the confidence rate function


## ID_field

Allows to display a zone for the student to identify himself. With the annex function grid_num.

### Function signature

ID_field(idq: integer or string, id_suite: string array or auto, numb_rows: integer, numb_beginning: integer, numb_end: integer, if_names: bollean, if_grid: boolean, id_separator: string, fill_color: color)

### Parameters

    idq → field identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    numb_rows → number of digits composing the student number
    numb_beginning → where the digit incrementation begins
    numb_end → where the digit incrementation ends
    if_names → should we ask for first and last name
    if_grid → parameter allowing to display the student number in grid form or not
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


# GENERIC AND ANNEX FUNCTIONS


## base_field

Function allowing the parsing of a single digit.

### Function signature

single_figure_field(idb: integer or string, w: relative length, h: relative length, parse_type: string, fill_color: color)

### Parameters

    idb → field identifier and associated rect-box identifier
    w → width of the field
    h → height of the field
    parse_type → type of data to be parsed
    fill_color → background color of the parsing fields for visual consistency tests


## fields_suite

Function allowing the display of several consecutive fields of the same category.

### Function signature

fields_suite(idb: integer or string, id_suite: string array or auto, funk: function, how_many, integer, width, relative length, height: relative length, space: relative length, id_separator: string, fill_color: color)

### Parameters

    idb → series identifier and prefix of associated fields
    id_suite → list of identifiers
    funk → function to be stamped
    how_many → number of copies of the field
    width → width of the fields
    height → height of the fields
    space → width of the space between two fields
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


## grid_num

Allows to display the student number in grid form.

### Function signature

grid_num(idb, id_suite: string array or auto, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".", fill_color: color)

### Parameters

    idq → field identifier and prefix of associated rect-box identifiers
    id_suite → list of identifiers
    numb_rows → number of digits composing the student number
    numb_beginning → where the digit incrementation begins
    numb_end → where the digit incrementation ends
    id_separator → separator of the prefix and the body of the identifier of each rect-box
    fill_color → background color of the parsing fields for visual consistency tests


# GLOBAL VERIFICATION FUNCTIONS


## verify

Checks the typing of each function.

### Function signature

verify(name_function: string, name_parameter: string, variable: var, expected_type: type or type array)

### Parameters

    name_function → function name in string form for the error message
    name_parameter → number of the parameter in string form for the error message
    variable → the parameter whose typing we must check
    expected_type → expected type or list of types.


## verify_id_suite

Checks the correct length of the identifier list with respect to the number of parsing fields

### Function signature

verify_id_suite(name_function: string, name_number: string, number_to_compare: integer)

### Parameters

    name_function → function name in string form for the error message
    name_number → number of the expected number in string form for the error message
    id_suite → list of identifiers to be checked
    number_to_compare → expected length of the list
