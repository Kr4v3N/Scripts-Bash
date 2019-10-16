#!/bin/bash
#
#Vous devez écrire un script shell, que vous appellerez exo2.sh, qui prend en argument un nom de fichier et qui teste que ce fichier est un fichier ordinaire qui n'a pas le droit d'écriture pour le propriétaire.
#
# Votre script ne doit rien afficher. Cependant :

#     Son code retour doit être 0 si l'argument donné au script est un fichier qui vérifie le test.
#     Son code retour doit être 1 si l'argument donné au script est un fichier qui ne vérifie pas le test.
#     Si l'argument est absent, votre script ne doit pas provoquer d'erreur et doit retourner un code retour 1.
#     S'il y a plus d'un argument, le script réalise le test sur le premier et ignore les autres.
#
[ -f "$1" -a ! -w "$1" ];
