champ_identifiant :
---------------------
Permet d'afficher une zone pour que l'élève s'identifie.

_Signature de la fonction_ 

champ_identifiant(nbr: integer, grille: boolean)

_Paramètres_

- nbr -> quantité de chiffres qui compose le numéro étudiant
- grille -> paramètre qui permet d'afficher le numéro étudiant sous forme de grille ou non



question_simple :
---------------------
Permet d'afficher un ennoncé avec ou sans rectangle blanc pour la réponse.

_Signature de la fonction_ 

question_simple(n1: int, n2: integer, libelle: string, white_zone: integer)

_Paramètres_

- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- white_zone -> taille du rectangle blanc (en pt)
                "none" sinon



qcm_simple :
---------------------
Permet d'afficher un ennoncé avec plusieurs réponses en format QCM.

_Signature de la fonction_

qcm_simple(n1: integer, n2: integer, libelle: string, cases: type, vertic : boolean)

_Paramètres_

- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- cases -> listes des reponses
- vertic -> boolean pour affichage en vertical ou horizontal



qcm_vf :
---------------------
Permet d'afficher un ennoncé dont les réponses sont vrai ou faux.

_Signature de la fonction_

qcm_vf(n1: integer, n2: integer, libelle: string, quest: type)

_Paramètres_

- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- quest -> listes comprenant les questions



qcm_mult :
---------------------
Permet d'afficher un ennoncé avec plusieurs questions en format QCM.

_Signature de la fonction_

qcm_mult(n1: integer, n2: integer, libelle: string, quest: type, rep: type)

_Paramètres_

- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- quest -> listes comprenant les questions
- rep -> listes comprenant les reponses



qcm_tableau :
---------------------
Permet d'afficher un QCM sous forme de tableau.

_Signature de la fonction_

qcm_tableau(n1: integer, n2: integer, axe_x: type, axe_y: type, libelle: string)

_Paramètres_

- n1, n2 -> identifiant de l'ennoncé
- axe_x -> 
- axe_y -> 
- libelle -> ennocé de l'exercice





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