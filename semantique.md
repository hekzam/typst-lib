question_simple :
---------------------
Permet d'afficher un ennoncé avec ou sans rectangle blanc pour la réponse.

Signature de la fonction 
--------------------------
question_simple(n1: int, n2: integer, libelle: string, white_zone: integer)

Paramètres 
------------
- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- white_zone -> taille du rectangle blanc (en pt)
                "none" sinon



qcm_simple :
---------------------
Permet d'afficher un ennoncé avec plusieurs réponses en format QCM.

Signature de la fonction 
--------------------------
qcm_simple(n1: integer, n2: integer, libelle: string, cases: type, vertic : boolean)

Paramètres 
------------
- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- cases -> listes des reponses
- vertic -> boolean pour affichage en vertical ou horizontal



qcm_vf :
---------------------
Permet d'afficher un ennoncé dont les réponses sont vrai ou faux.

Signature de la fonction 
--------------------------
qcm_vf(n1: integer, n2: integer, libelle: string, quest: type)

Paramètres 
------------
- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- quest -> listes comprenant les questions



qcm_mult :
---------------------
Permet d'afficher un ennoncé avec plusieurs questions en format QCM.

Signature de la fonction 
--------------------------
qcm_mult(n1: integer, n2: integer, libelle: string, quest: type, rep: type)

Paramètres 
------------
- n1, n2 -> identifiant de l'ennoncé
- libelle -> ennocé de l'exercice
- quest -> listes comprenant les questions
- rep -> listes comprenant les reponses



qcm_tableau :
---------------------
Permet d'afficher un QCM sous forme de tableau.

Signature de la fonction 
--------------------------
qcm_tableau(n1: integer, n2: integer, axe_x: type, axe_y: type, libelle: string)

Paramètres
------------
n1, n2 -> identifiant de l'ennoncé
axe_x -> 
axe_y -> 
libelle -> ennocé de l'exercice

