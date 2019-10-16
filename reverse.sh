#!/bin/bash
## fichier : reverse.sh ###
#Elle vous explique que dans certaines combinaisons de commande qu'elle doit réaliser, elle aurait parfois besoin d'inverser l'ordre des valeurs produites à certaine étape.
#Elle a donc pensé à un script de nom reverse.sh dont l'effet serait d'afficher tous les arguments qu'il reçoit mais dans l'ordre inverse.
#
#fonction: selecteur P arg1 arg2 ... argN
#-> affiche l'argument de position P (1 à N)
selecteur(){
NUM=0  #sera le numero de passage dans la boucle
        #et donne ainsi le numéro de l'argument pour ce passage
FIND=$1  #position de l'argument à sélectionner

    for V in $@ ; do
        if [ $NUM -eq $FIND ]; then  #on est sur la
            echo $V             # position recherchee ?
                return         #on met fin à la fonction
         fi
            NUM=$(($NUM + 1))     #calcul de la prochaine position
    done
}

 N=$#        #nombre d'argument reçu
 RESULT=""   #va contenir la liste des arguments réordonnés
 SEL=$N      #on va faire une boucle pour faire varier SEL de N à 1
             #SEL sera la position de l'argument à afficher à chaque passage

 while [ $SEL -gt 0 ]; do
       ARG=$(selecteur $SEL $@)  #argument se trouvant sur la position SEL
       RESULT="$RESULT $ARG"     #on ajoute cet argument dans la liste finale
       SEL=$(($SEL - 1))         #on diminue SEL de 1
 done

 #affichage du résultat
 echo $RESULT

#######################################################################"
#######################################################################"
# Si on supprime la définition et l'utilisation de la fonction selecteur, quelle est la proposition qui indique les modifications supplémentaires à apporter au code d'Alice pour obtenir une version bien plus allégée de son script ?
#APRES FACTORISATION###
#
#
RESULT=""   # va contenir la liste des arguments reordonnes

for ARG in $@ ; do
   RESULT="$ARG $RESULT"  # on ajoute cet argument au debut
done            # de la liste finale (pour inverser l'ordre)

# affichage du resultat
echo $RESULT
###########################################################################
