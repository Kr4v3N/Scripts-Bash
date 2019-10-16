#!/bin/bash
#
# Calculer des discriminants afin de résoudre des équations du second degré.
#
# Alice fait des études en mathématiques et pour ses exercices d'algèbre elle doit calculer des discriminants afin de résoudre des équations du second degré. Comme elle a beaucoup d'équations à résoudre, elle souhaite disposer d'un programme pour effectuer rapidement ce type de calcul. Ça tombe bien car elle maîtrise justement le shell et le Bash en particulier. Elle décide donc d'écrire un script spécifique pour cette tâche.
# Votre mission est de produire ce script dans un fichier de nom delta.sh. Ce script va prendre en paramètre 3  valeurs que nous appellerons respectivement A, B et C. Ces valeurs représentent les coefficients de l'équation.
# Le lancement du script s'effectue par la commande suivante : ./delta.sh A B C.
#De plus pour éviter tout oubli de saisie ce script vérifiera la présence de chacun des arguments. En cas d'absence d'un des arguments il doit afficher un message d'erreur et arrêter le traitement sans réaliser le calcul. Le script s'arrête et le code retour est à faux (1).
#
  A=${1:?"Erreur : vous devez indiquer la valeur de A"}
  B=${2:?"Erreur : vous devez indiquer la valeur de B"}
  C=${3:?"Erreur : vous devez indiquer la valeur de C"}

  echo $((B*B-(4*A*C)))

