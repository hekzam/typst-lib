# Sommaire


## FONCTIONS DE L’A.P.I.

- question_zone: Énoncé avec une unique zone de parsing, réglable en hauteur.
- mcq_one: Affiche un énoncé et une question avec plusieurs réponses avec des cases à parser.
- true_false: Affiche un énoncé et une série d’asertions auxquelles répondre par vrai ou faux.
- mcq_grid: Affiche un énoncé et une série de questions aux choix identiques, sous forme de grille.
- table_parse: Permet d’afficher un tableau avec le contenu des lignes, colonnes et cases. Inclusion d’espaces de parsing (rect-box) dans toutes les cases non pré-remplies.
- table_column: Permet d’afficher un tableau avec uniquement des lignes ou des colonnes. Inclusion d’espaces de parsing de taille paramétrable.
- confidence: Crée des zones de parsing permettant au candidat d’indiquer son taux de confiance à une question.
- confidence_aside: Crée une zone de taux de confiance à côté de n’importe quelle autre question.
- ID_field: Permet d’afficher une zone pour que l’élève s’identifie. Avec la fonction annexe grid_num.

## FONCTIONS GÉNÉRIQUES ET ANNEXES

- base_field: Fonction permettant le parsing d’un seul chiffre.
- fields_suite: Fonction permettant l’affichage de plusieurs champs consécutifs d’une même catégorie.
- grid_num: Permet d’afficher le numéro étudiant sous forme de grille.

## FONCTIONS DE VÉRIFICATION GLOBALE

- verify: Vérifie le typage de chaque fonction.
- verify_id_suite: Vérifie la bonne longueur de la liste d’identifiants vis-à-vis du nombre de champs de parsing.


# FONCTIONS DE L’A.P.I.


## question_zone

Énoncé avec une unique zone de parsing, réglable en hauteur.

### Signature de la fonction

question_zone(idq: integer or string, white_zone: relative length or none, fill_color: color)

### Paramètres

- idq → identifiant de la question et préfixe des identifiants du rect-box associé
- white_zone → taille du rectangle blanc (en pt)
- fill_color → couleur de fond du champ de parsing pour tests visuels de cohérence


## mcq_one

Affiche un énoncé et une question avec plusieurs réponses avec des cases à parser.

### Signature de la fonction

mcq_one(idq: integer or string, id_suite: string array or auto, cases: array, vertic : boolean, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du QCM et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- cases → listes des reponses
- vertic → booléen pour affichage en vertical ou horizontal
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## true_false

Affiche un énoncé et une série d’asertions auxquelles répondre par vrai ou faux.

### Signature de la fonction

true(idq: integer or string, id_suite: string array or auto, assertions: array, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du vrai/faux et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- assertions → liste comprenant les assertions auxquelles il faut répondre vrai ou faux
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## mcq_grid

Affiche un énoncé et une série de questions aux choix identiques, sous forme de grille.

### Signature de la fonction

mcq_grid(idq: integer or string, id_suite: string array or auto, questions: array, answers: array, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du QCM et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- questions → liste comprenant les questions
- answers → liste comprenant les reponses
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## table_parse

Permet d’afficher un tableau avec le contenu des lignes, colonnes et cases. Inclusion d’espaces de parsing (rect-box) dans toutes les cases non pré-remplies.

### Signature de la fonction

table_parse(idq: integer or string, id_suite: string array or auto, row_size: relative length, col: array, row: array, cont: array, parse_inset: relative length, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du tableau et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- row_size → indication de la hauteur de chaque ligne
- col → liste des libellés des colonnes
- row → liste des libellés des lignes
- cont → contenu des cases; peut être laissé vide pour un tableau à compléter
- parse_inset → indique la marge de la zone de parsing dans chacune des cases du tableau
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## table_column

Permet d’afficher un tableau avec uniquement des lignes ou des colonnes. Inclusion d’espaces de parsing de taille paramétrable.

### Signature de la fonction

table_1d(idq: integer or string, id_suite: string array or auto, size: relative length, col: array, horiz: boolean, parse_inset: relative length, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du tableau et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- size → définition de la hauteur des cases à remplir
- col → liste des libellés des colonnes
- horiz → booléen déterminant la position du tableau: sous forme de lignes su horiz vrai, sous formes de colonnes sinon
- parse_inset → indique la marge de la zone de parsing dans chacune des cases du tableau
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## confidence

Crée des zones de parsing permettant au candidat d’indiquer son taux de confiance à une question.

### Signature de la fonction

confidence(idq: integer or string, id_suite: string array or auto, nuances: integer array, if_multiple_boxes: boolean, vertical: boolean, id_separator: string, id_suite: array, fill_color: color)

### Paramètres

- idq → identifiant du champ et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- nuances → liste d’entiers indiquant la précision de pourcentages à afficher pour les cases à cocher
- if_multiple_boxes → détermine le mode d’affichage du taux de confiance; sous forme d’une série de cases bonaires si ce paramètre est vrai, sous forme d’un unique chant à remplir sinon
- vertical → booléen pour affichage en vertical ou horizontal
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## confidence_aside

Crée une zone de taux de confiance à côté de n’importe quelle autre question.

### Signature de la fonction

confidence_aside(idq: integer, id_suite: string array or auto, question: table or grid, nuances: integer array, if_multiple_boxes: boolean, id_separator: string, id_suite: array, fill_color: color)

### Paramètres

- idq → identifiant de la fonction de taux de confiance et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants de la fonction de taux de confiance
- question → n’importe quel autre appel de fonction de l’API
- nuances → liste d’entiers indiquant la précision de pourcentages à afficher pour les cases à cocher
- if_multiple_boxes → détermine le mode d’affichage du taux de confiance; sous forme d’une série de cases bonaires si ce paramètre est vrai, sous forme d’un unique chant à remplir sinon
- le paramètre booléen vertical de la fonction confidence ainsi appelée est fixé à true
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box, pour la fonction de taux de confiance
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence, pour la fonction de taux de confiance


## ID_field

Permet d’afficher une zone pour que l’élève s’identifie. Avec la fonction annexe grid_num.

### Signature de la fonction

ID_field(idq: integer or string, id_suite: string array or auto, numb_rows: integer, numb_beginning: integer, numb_end: integer, if_names: bollean, if_grid: boolean, id_separator: string, fill_color: color)

### Paramètres

- idq → identifiant du champ et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- numb_rows → quantité de chiffres qui compose le numéro étudiant
- numb_beginning → où commence l’incrémentation des chiffres
- numb_end → où finit l’incrémentation des chiffres
- if_names → faut-il demander les nom et prénom
- if_grid → paramètre qui permet d’afficher le numéro étudiant sous forme de grille ou non
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


# FONCTIONS GÉNÉRIQUES ET ANNEXES


## base_field

Fonction permettant le parsing d’un seul chiffre.

### Signature de la fonction

single_figure_field(idb: integer or string, w: relative length, h: relative length, parse_type: string, fill_color: color)

### Paramètres

- idb → identifiant du champ et du rect-box associé
- w → largeur du champ
- h → hauteur du champ
- parse_type → type des données à parser
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## fields_suite

Fonction permettant l’affichage de plusieurs champs consécutifs d’une même catégorie.

### Signature de la fonction

fields_suite(idb: integer or string, id_suite: string array or auto, funk: function, how_many, integer, width, relative length, height: relative length, space: relative length, id_separator: string, fill_color: color)

### Paramètres

- idb → identifiant de la série et préfixe des champs associés
- id_suite → liste des identifiants
- funk → fonction à estampiller
- how_many → nombre d’exemplaires du champ
- width → largeur des champs
- height → hauteur des champs
- space → largeur de l’espace entre deux champs
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


## grid_num

Permet d’afficher le numéro étudiant sous forme de grille.

### Signature de la fonction

grid_num(idb, id_suite: string array or auto, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".", fill_color: color)

### Paramètres

- idq → identifiant du champ et préfixe des identifiants des rect-box associés
- id_suite → liste des identifiants
- numb_rows → quantité de chiffres qui compose le numéro étudiant
- numb_beginning → où commence l’incrémentation des chiffres
- numb_end → où finit l’incrémentation des chiffres
- id_separator → séparateur du préfixe et du corps de l’identifiant de chaque rect-box
- fill_color → couleur de fond des champs de parsing pour tests visuels de cohérence


#FONCTIONS DE VÉRIFICATION GLOBALE


## verify

Vérifie le typage de chaque fonction.

### Signature de la fonction

verify(name_function: string, name_parameter: string, variable: var, expected_type: type or type array)

### Paramètres

- name_function → nom de la fonction sous forme de chaîne de caractères pour le message d’erreur
- name_parameter → num du paramètre sous forme de chaîne de caractères pour le message d’erreur
- variable → le paramètre dont nous devons vérifier le typage
- expected_type → type ou liste des types attendu.s


## verify_id_suite

Vérifie la bonne longueur de la liste d’identifiants vis-à-vis du nombre de champs de parsing

### Signature de la fonction

verify_id_suite(name_function: string, name_number: string, number_to_compare: integer)

### Paramètres

- name_function → nom de la fonction sous forme de chaîne de caractères pour le message d’erreur
- name_number → num du nombre attendu sous forme de chaîne de caractères pour le message d’erreur
- id_suite → liste des identifiants à vérifier
- number_to_compare → longueur attendue de la liste
