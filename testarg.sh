#!/bin/bash
### testargu.sh  ###
#
#Vous devez écrire un script que vous appelerez testargu.sh qui attend  2 ou 3  arguments et qui doit répondre aux spécifications suivantes :
#     S'il y a 2 arguments :
#         Le premier argument doit être un fichier ordinaire pour lequel l'utilisateur a le droit d'accès en lecture et en écriture.
#         Le deuxième argument doit être un répertoire dans lequel l'utilisateur peut se positionner.
#     S'il y a 3 arguments :
#         Le premier argument doit être un fichier ordinaire pour lequel l'utilisateur a le droit d'accès en lecture et en écriture.
#         Le deuxième argument doit être un répertoire dans lequel l'utilisateur peut se positionner.
#         Le troisième argument doit être un entier strictement positif.

# Votre script doit réaliser les vérifications sur ses arguments dans l'ordre ci-dessous.
# Dès qu'une des conditions n'est pas vérifiée, votre script doit afficher le message
# "usage : testargu.sh fichier repertoire [nombre_positif ]" sur la sortie d'erreur puis :
#     Terminer avec le code retour 3 s'il n'y a pas 2 ou 3 arguments.
#     Terminer avec le code retour 4 si la condition sur le premier argument n'est pas vérifiée.
#     Terminer avec le code retour 5 si la condition sur le deuxième argument n'est pas vérifiée
#     (la condition sur le premier argument ayant été vérifiée).
#     Terminer avec le code retour 6 s'il y a 3 arguments et si la condition sur le troisième argument n'est pas vérifiée
#     (la condition sur les deux premiers arguments ayant été vérifiée).

# Si toutes les conditions sur les arguments sont vérifiées, votre script doit :

#     Afficher la valeur du troisième argument s'il y en a 3 et terminer avec le code retour 0.
#     ou bien afficher 999 s'il n'y a que deux arguments et terminer avec le code retour 0.
#

usage="usage : $0 fichier repertoire [nombre_positif]"
# vérification du nombre d'arguments
if [ $# -ne 2 ] && [ $# -ne 3 ]
  then
  echo "$usage" >&2
  exit 3
  fi
# on teste le premier argument
if [ ! -f "$1" ] || [ ! -r "$1" ] || [ ! -w "$1" ]
  then
  echo "$usage" >&2; exit 4
  fi
# on teste le deuxieme argument
if [ ! -d "$2" ] || [ ! -x "$2" ]
  then
  echo "$usage" >&2; exit 5
  fi
# s'il y en a un, on teste le 3e argument
if [ $# -eq 3 ]
  then
  if [ "$3" -gt 0 ]
  then
  echo "$3"; exit 0
  else
  echo "$usage" >&2; exit 6
  fi
fi
# Arriver ici il y a exactement 2 arguments
echo 999
#######################
