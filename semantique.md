champ_identifiant :
---------------------
Permet d'afficher une zone pour que l'élève s'identifie.

_Signature de la fonction_ 

champ_identifiant(nbr: integer, grille: boolean)

_Paramètres_

- nbr -> quantité de chiffres qui compose le numéro étudiant
- grille -> paramètre qui permet d'afficher le numéro étudiant sous forme de grille ou non


question
------------------
Simple affichage d'un énoncé avec numéro d'exercice, question et sous-question. Fonction générique incorporée dans toutes les autres fonctions d'énoncé.

_Signature de la fonction_ 

question(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de l'exercice


question_zone :
---------------------
Énoncé avec captation de la réponse via parsing.

_Signature de la fonction_ 

question_zone(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, white_zone: integer)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de l'exercice
- white_zone -> taille du rectangle blanc (en pt)
                "none" sinon


mcq_simple :
---------------------
Affiche un énoncé et une question avec plusieurs réponses avec des cases à parser.

_Signature de la fonction_

qcm_simple(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, cases: content, vertic : boolean)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de l'exercice
- cases -> listes des reponses
- vertic -> boolean pour affichage en vertical ou horizontal


right_wrong :
---------------------
Affiche un énoncé et une série d'asertions auxquelles répondre par vrai ou faux.

_Signature de la fonction_

qcm_vf(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, assertions: type)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de la question
- assertions -> liste comprenant les assertions auxquelles il faut répondre vrai ou faux



mcq_multiple :
---------------------
Affiche un énoncé et une série de questions aux choix identiques, sous forme de grille.

_Signature de la fonction_

qcm_mult(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, quest: type, rep: type)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de la question
- quest -> liste comprenant les questions
- rep -> liste comprenant les reponses


table_parse :
---------------------
Permet d'afficher un tableau avec le contenu des lignes, colonnes et cases. Inclusion d'espaces de parsing (rect-box) dans toutes les cases non pré-remplies.

_Signature de la fonction_

table_content(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, col: type, row: type, content: type)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de la question
- col -> liste des libellés des colonnes
- row -> liste des libellés des lignes
- content -> contenu des cases; peut être laissé vide pour un tableau à compléter


table_column:
---------------------
Permet d'afficher un tableau avec uniquement des lignes ou des colonnes. Inclusion d'espaces de parsing de taille paramétrable.

_Signature de la fonction_

table_1d(numb: integer, sub-numb: integer, sub-sub-numb: integer, title: string, col: type, taille: relative_length, horiz: boolean)

_Paramètres_

- numb -> numéro de l'exercice
- sub-numb -> numéro de la question
- sub-sub-numb -> éventuellement numéro de la sous-question, si pas de sous-question entrer 0
- title -> énoncé de la question
- col -> liste des libellés des colonnes
- taille -> définition de la hauteur des cases à remplir
- horiz -> booléen déterminant la position du tableau: sous forme de lignes su horiz vrai, sous formes de colonnes sinon


*Annexe*
--------------------


case :
---------------------
Permet d'afficher le numéro étudiant sous forme d'une suite de cases.

_Signature de la fonction_

case(phrase, largeur, hauteur)

_Paramètres_

- phrase -> texte à afficher devant la suite de cases
- largeur -> largeur de chaque case
- libelle -> hauteur de chaque cases



suite_cases :
---------------------
Permet d'afficher le numéro étudiant sous forme d'une suite de cases.

_Signature de la fonction_

suite_cases(phrase: string, nbr: integer, largeur: relative, hauteur: relative)

_Paramètres_

- phrase -> texte à afficher devant la suite de cases
- nbr -> quantité de chiffres qui compose le numéro étudiant
- largeur -> largeur de chaque case
- libelle -> hauteur de chaque cases



grid_Num(nbr) :
---------------------
Permet d'afficher le numéro étudiant sous forme de grille.

_Signature de la fonction_

grid_num(nbr: integer)

_Paramètres_

- nbr -> quantité de chiffres qui compose le numéro étudiant
