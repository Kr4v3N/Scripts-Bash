#!/bin/bash
# Alice souhaite faire une grille de loto. Elle n'a aucune idée des nombres à jouer. Comme c'est un jeu de hasard, elle s'en remet au hasard.
# Elle décide alors d'obtenir un nombre aléatoire à l'aide de son shell.

# Elle décide d'écrire le script shell de nom alea50.sh.
# Ce script va afficher sur le terminal un nombre entier aléatoire compris dans l'intervalle 0,50.
# Pour cela elle utilise la variable d'environnement spéciale de nom RANDOM.
# Cette variable est spéciale dans le sens où à chaque consultation de sa valeur, elle renvoie un nombre différent aléatoire compris entre  0 et  32767.
# Utiliser donc cette variable pour écrire un script de nom alea50.sh qui va afficher sur le terminal un nombre entier aléatoire compris dans l'intervalle [0; 50[.
#
min=0
max=50
number=$[($RANDOM % ($[$max - $min] + 1)) + $min]
echo $number
