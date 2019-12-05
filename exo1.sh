#!/bin/bash
#
#Vous devez écrire un script shell, que vous appelerez exo1.sh, qui prend 3 chaînes en arguments
# et qui teste si ces trois chaînes sont différentes et données dans l'ordre alphanumérique croissant.
# Votre script ne doit rien afficher. Cependant :

#     Son code retour doit être 0 si les 3 chaînes en arguments sont différentes et données
#     dans l'ordre alphanumérique croissant.
#     Si les 3 chaînes données ne sont pas toutes différentes ou bien si elle ne sont pas données
#     dans l'ordre alphanumérique croissant le code retour doit être 1.
#     S'il n'y a pas exactement 3 arguments le script ne doit pas provoquer d'erreur et son code retour doit aussi être 1.
#
[ $"$1" \< "$2" -a "$2" \< "$3" -a ! "$4" ]
