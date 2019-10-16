#!/bin/bash

# On teste l'existence du premier paramètre (le fichier)
if [ ! $# -ge 1 ] || [ ! -e $1 ]
then
    echo 'Fichier de dictionnaire introuvable'
    exit 1
fi

# On vide le fichier stats.txt (ou on le crée s'il n'existe pas déjà)
echo '' > stats.txt

# Pour chaque lettre de l'alphabet, on compte le nombre d'occurrences et on l'enregistre dans stats.txt
for lettre in {A..Z}
do
    occurrences=`grep $lettre $1 | wc -l`
    echo "$occurrences - $lettre" >> stats.txt
done

# On trie numériquement les stats et on affiche le résultat
# Mon petit ajout : le paramètre --letters qui demande de n'afficher que les lettres
if [ $# -ge 2 ] && [ $2 = '--letters' ]
then
    sort -nr stats.txt | cut -f2 -d'-'
else
    sort -nr stats.txt
fi

# On peut supprimer le fichier de travail stats.txt
rm stats.txt