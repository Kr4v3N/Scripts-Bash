#!/bin/bash
## fichier : ploumploum.sh ###
#
#Alice maîtrise enfin les commandes du Bash, mais elle n'a malheureusement pas suivi la quatrième séquence de ce MOOC... Donc elle compte toujours sur vous pour lui écrire des scripts.
# Son autre souci, c'est qu'elle aime manger des fruits pour son goûter, et entre pomme, pêche, poire, et abricot, elle ne sait jamais quel fruit choisir.
#
# Pour l'aider dans ce choix critique, votre mission est d'écrire le script ploumploum.sh.
# Ce script attend un nombre quelconque d'arguments (au maximum 120) et doit choisir l'un d'entre eux au hasard afin de l'afficher sur la console.
#
#la fonction alea
alea() {
    return $((($RANDOM % $1)+1))
}

#la fonction: selecteur P arg1 arg2 ... argN
#-> affiche l'argument de position P (1 a N)
selecteur(){
   NUM=0  #sera le numero de passage dans la boucle
          #et donne ainsi le numero de l'argument pour ce passage

   FIND=$1  #position de l'argument a selectionner

   for V in $@ ; do
       if [ $NUM -eq $FIND ]; then  #on est sur la position recherchee ?
              echo $V
              return         #on met fin a la fonction
       fi
       NUM=$(($NUM + 1))   #calcul de la prochaine position
   done
}

#le nombre d'argument reçu est $#
#on va generer un nombre aleatoire entre 1 et $#
alea $#
#le nombre aleatoire est disponible dans $? car c'est le resultat de la derniere commande

#selection et affichage de l'argument qui se trouve sur cette position
selecteur $? $@
########################
