#!/bin/bash
#
#Vous devez écrire un script shell, que vous appelerez exo3.sh, qui prend en argument une chaîne de
#caractères et qui teste que cette chaîne contient au moins un caractère 'X' et au moins un caractère 'Y'.
#
# Votre script ne doit rien afficher. Cependant :
#
#     Son code retour doit être 0 si la chaîne donnée en argument contient au moins un X et au moins un Y.
#     Le code retour doit être 1 si la chaîne donnée ne vérifie pas le test.
#     S'il n'y a pas d'argument le script ne doit pas provoquer d'erreur et son code retour doit être 1.
#     S'il y a plus d'un argument le script doit tester le premier argument et ignorer ceux en trop.
#
 [[ "$1" == *X* && "$1" == *Y* ]]
