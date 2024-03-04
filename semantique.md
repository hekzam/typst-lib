/* FONCTION D'IDENTIFICATION */

ID_field :
---------------------
Permet d'afficher une zone pour que l'élève s'identifie. Avec la fonction annexe grid_num.

_Signature de la fonction_ 

ID_field(idq: integer or string, numb_rows: integer, numb_beginning: integer, numb_end: integer, if_names: bollean, if_grid: boolean, id_separator: string)

_Paramètres_

- idq -> identifiant du champ et préfixe des identifiants des rect-box associés
- numb_rows -> quantité de chiffres qui compose le numéro étudiant
- numb_beginning -> où commence l'incrémentation des chiffres
- numb_end -> où finit l'incrémentation des chiffres
- if_names -> faut-il demander les nom et prénom
- if_grid -> paramètre qui permet d'afficher le numéro étudiant sous forme de grille ou non
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


/* FONCTIONS DE L'A.P.I. */

question_zone :
---------------------
Énoncé avec captation de la réponse via parsing.

_Signature de la fonction_ 

question_zone(idq: integer or string, white_zone: relative length or none, id_separator: string)

_Paramètres_

- idq -> identifiant de la question et préfixe des identifiants du rect-box associé
- white_zone -> taille du rectangle blanc (en pt)
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


mcq_one :
---------------------
Affiche un énoncé et une question avec plusieurs réponses avec des cases à parser.

_Signature de la fonction_

mcq_one(idq: integer or string, cases: array, vertic : boolean, id_separator: string)

_Paramètres_

- idq -> identifiant du QCM et préfixe des identifiants des rect-box associés
- cases -> listes des reponses
- vertic -> boolean pour affichage en vertical ou horizontal
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


true_false :
---------------------
Affiche un énoncé et une série d'asertions auxquelles répondre par vrai ou faux.

_Signature de la fonction_

true(idq: integer or string, assertions: array, id_separator: string)

_Paramètres_

- idq -> identifiant du vrai/faux et préfixe des identifiants des rect-box associés
- assertions -> liste comprenant les assertions auxquelles il faut répondre vrai ou faux
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


mcq_grid :
---------------------
Affiche un énoncé et une série de questions aux choix identiques, sous forme de grille.

_Signature de la fonction_

mcq_grid(idq: integer or string, questions: array, answers: array, id_separator: string)

_Paramètres_

- idq -> identifiant du QCM et préfixe des identifiants des rect-box associés
- questions -> liste comprenant les questions
- answers -> liste comprenant les reponses
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


table_parse :
---------------------
Permet d'afficher un tableau avec le contenu des lignes, colonnes et cases. Inclusion d'espaces de parsing (rect-box) dans toutes les cases non pré-remplies.

_Signature de la fonction_

table_parse(idq: integer or string, row_size: relative length, sub-sub-numb: integer, title: string, col: array, row: array, cont: array, id_separator: string)

_Paramètres_

- idq -> identifiant du tableau et préfixe des identifiants des rect-box associés
- row_size -> indication de la hauteur de chaque ligne
- col -> liste des libellés des colonnes
- row -> liste des libellés des lignes
- cont -> contenu des cases; peut être laissé vide pour un tableau à compléter
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


table_column:
---------------------
Permet d'afficher un tableau avec uniquement des lignes ou des colonnes. Inclusion d'espaces de parsing de taille paramétrable.

_Signature de la fonction_

table_1d(idq: integer or string, size: relative length, col: array, horiz: boolean, id_separator: string)

_Paramètres_

- idq -> identifiant du tableau et préfixe des identifiants des rect-box associés
- size -> définition de la hauteur des cases à remplir
- col -> liste des libellés des colonnes
- horiz -> booléen déterminant la position du tableau: sous forme de lignes su horiz vrai, sous formes de colonnes sinon
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


/* FONCTIONS GÉNÉRIQUES ET ANNEXES */


string_field :
---------------------
Fonction permettant le parsing de mots.

_Signature de la fonction_
string_field(idb: integer or string, w: relative length, h: relative length)

_Paramètres_

- idb -> identifiant du champ et du rect-box associé
- w -> largeur du champ
- h -> hauteur du champ


number_field :
---------------------
Fonction permettant le parsing d'un nombre.

_Signature de la fonction_

number_field(idb: integer or string, w: relative length, h: relative length)

_Paramètres_

- idb -> identifiant du champ et du rect-box associé
- w -> largeur du champ
- h -> hauteur du champ


single_figure_field :
---------------------
Fonction permettant le parsing d'un seul chiffre.

_Signature de la fonction_

single_figure_field(idb: integer or string, w: relative length, h: relative length)

_Paramètres_

- idb -> identifiant du champ et du rect-box associé
- w -> largeur du champ
- h -> hauteur du champ


fields_suite :
--------------------
Fonction permettant l'affichage de plusieurs champs consécutifs d'une même catégorie.

_Signature de la fonction_

fields_suite(idb: integer or string, funk: function, how_many, integer, width, relative length, height: relative length, space: relative length, id_separator: string)

_Paramètres_

- idb -> identifiant de la série et préfixe des champs associés
- funk -> fonction à estampiller
- how_many -> nombre d'exemplaires du champ
- width -> largeur des champs
- height -> hauteur des champs
- space -> largeur de l'espace entre deux champs
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


grid_num(nbr) :
---------------------
Permet d'afficher le numéro étudiant sous forme de grille.

_Signature de la fonction_

grid_num(idb, numb_rows: 1, numb_beginning: 0, numb_end: 9, id_separator: ".")

_Paramètres_

- idq -> identifiant du champ et préfixe des identifiants des rect-box associés
- numb_rows -> quantité de chiffres qui compose le numéro étudiant
- numb_beginning -> où commence l'incrémentation des chiffres
- numb_end -> où finit l'incrémentation des chiffres
- id_separator -> séparateur du préfixe et du corps de l'identifiant de chaque rect-box


/* FONCTION DE VÉRIFICATION GLOBALE */


verify :
---------------------
Vérifie le typage de chaque fonction

_Signature de la fonction_

verify(name_function: string, name_parameter: string, variable: var, expected_type: type or type array)

_Paramètres_

- name_function -> nom de la fonction sous forme de chaîne de caractères pour le message d'erreur
- name_parameter -> num du paramètre sous forme de chaîne de caractères pour le message d'erreur
- variable -> le paramètre dont nous devons vérifier le typage
- expected_type -> type ou liste des types attendu.s
