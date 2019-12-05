#!/bin/bash
## fichier : size.sh
#Alice possède une clé USB de petite taille, et quand elle copie un fichier sur sa clé elle se retrouve
# souvent devant une erreur d'espace disque insuffisant. Afin d'éviter ce type de problème à l'avenir,
# elle souhaite disposer d'une commande simple qui lui permettrait de consulter rapidement
# la taille d'un fichier en octets.
#
# Elle sait qu'il existe de nombreuses commandes qui affichent cette information (comme ls par exemple),
# mais elle veut un affichage synthétique qui ne montre que la valeur de la taille du fichier.

# Vous devez donc créer un script de nom size.sh qui réalise ce traitement.
# Votre script doit prendre un nom de fichier en argument et doit afficher sur la sortie standard
# la taille de ce fichier en octets.
#
#
declare -i i=0     #pour numeroter chaque iteration

if [ $# -eq 0 ] ; then
    echo " Usage: $0 file" >&2
    exit 1
fi
if ! [  -f "$1" ] ; then
    echo "Erreur: fichier $* non existant" >&2
    exit 1
fi

for field in $(ls -l "$1"); do
  #echo "$i -> $field"   # affichage pour trouver
                         # la position recherchee
  if [ $i -eq 4 ]    # no de la position de la taille
  then               # sur la ligne
    echo "$field" Octets    # taille du fichier
    break
  fi
  i=$((i+1))
done
exit 0

