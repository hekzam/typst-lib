champ_identifiant
- mismatch entre ce que fait la fonction et son nom
  - soit c'est juste une fonction pour afficher un formulaire sur une séquence de chiffres
  - soit c'est une fonction pour faire TOUTE l'identification, qui doit forcément être customisable par l'appelant
    (séquences de chiffres ? lesquelles ? préfixées par quel label ? prénom ? nom ? etc.)
-> je vote pour faire une fonction dédiée pour faire une séquence de chiffres ; celle d'identification a plus sa place dans un module lié au sujet qu'aux questions

paramètres n1 et n2
- mal nommés (si c'était une fonction qui compare deux nombres ce serait ok, mais là c'est censé être des identifiants)
- pourquoi il y a deux identifiants et pas qu'un seul ?

paramètre libelle
- c'est indiqué que c'est énoncé dans la plupart des fonctions -> le paramètre est mal nommé
- pourquoi il est de type string ? la string est du texte brut ? du typst à évaluer ?

question_simple
- il n'y a aucune sémantique associée à cette fonction : "simple" ne veut rien dire
- white_zone est mal nommé. si c'est une taille, ça doit être clair dans le nom de la variable. pourquoi forcer des pt ? comportement none non défini

qcm_simple
- "simple"
- cases est mal typé.
- il faut que l'utilisateur puisse indiquer un identifiant et un label par réponse,
  pour qu'on puisse afficher les réponses et placer correctement les métadonnées du document
- vertic : je pense qu'à terme il serait mieux d'avoir un paramètre plus générique qui permette de choisir la stratégie de mise en place des réponses
  en terme de type ça devrait être un type énuméré mais je ne crois pas que typst en ait pour l'instant, donc on peut partir sur une string
  contrainte en valeurs du type "vertical" ou "horizontal" pour commencer

qcm_vf
- la littérature oppose souvent les multiple choice questions et les multiple true false -> le nom de la fonction me semble étrange
- besoin identifiant+label par réponse
- quest est mal nommé (préfixe ambigu et singulier alors que c'est censé être un conteneur)

qcm_mult
- je ne comprends pas ce que fait cette fonction ni son intérêt, c'est redondant avec qcm_simple ?

image_figure
- je ne comprends pas ce que fait cette fonction dans l'API d'hekzam

table_content
- nom de fonction étrange
- l'API actuelle me semble trop limitée côté customisation
  - il faut que l'utilisateur puisse indiquer des propriétés d'affichage de sa table d'une manière ou d'une autre
    on peut partir sur quelque chose de très simple pour l'instant comme une suite de taille fixe pour la longueur des lignes et des colonnes
  - plutôt partir sur une structure de donnée creuse pour indiquer quelles cases doivent avoir du contenu

case
- ce genre de fonctions est utile dans l'API, mais il faudrait un nom parlant et générique (ce n'est pas que nécessaire pour un numéro d'étudiant)

suite_cases : d'après la doc ça fait pareil que case ?

grid_Num
- idem case, c'est plus générique que pour un numéro d'étudiant
