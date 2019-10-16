#!/bin/bash
## fichier : size_movie_mkv.sh
#Alice possède des fichiers vidéos dans son dossier Movies. Elle veut pouvoir facilement afficher la taille occupée par les fichiers portant l'extension .mkv car elle sait que ce sont des fichiers volumineux. Elle souhaite garder un œil sur l'espace total que ces fichiers utilisent sur son disque dur.
#
# Votre mission est donc d'écrire un script size_movie_mkv.sh qui va afficher sur la sortie standard la taille totale de tous les fichiers d'extension .mkv du dossier /home/alice/Movies. Vous devez produire le code de ce script en utilisant une boucle for afin de comptabiliser la taille de chacun de ces fichiers. Vous obtiendrez la taille de chaque fichier en utilisant le script size.sh que vous avez réalisé lors du challenge précédent.
#
#
declare -i taille=0  # taille total
for file in $(ls /home/alice/Movies/*.mkv)
do
  ((taille += $(./size.sh $file) ))
done
echo $taille

