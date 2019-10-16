#!/bin/bash
#
#Vous devez écrire un script shell, que vous appelerez ouinon.sh, qui attend un argument et qui doit avoir le comportement suivant :
#
    # Si aucun argument n'est présent, afficher "Vous n'avez pas donne votre reponse" et sortir avec le code retour 3.
    #
    # S'il y a plus d'un argument, afficher le message "Donnez une seule reponse" et sortir avec le code retour 4.
    #
    # Si l'argument est la lettre "o" ou la lettre "O", afficher "oui" et sortir avec le code retour 0.
    #
    # Si l'argument est la lettre "n" ou la lettre N", afficher "non" et sortir avec le code retour 1.
    #
    # Pour tout autre valeur de l'argument, afficher le message "Pas compris" et sortir avec le code retour 5.
#
# Si aucun argument n'est présent, afficher "Vous n'avez pas donne votre reponse" et sortir avec le code retour 3.
[ $# -le 0 ] && echo "Vous n'avez pas donné votre réponse">&2 && exit 3;

# S'il y a plus d'un argument, afficher le message "Donnez une seule reponse" et sortir avec le code retour 4.
[ $# -gt 1 ] && echo "Donnez une seule réponse">&2 && exit 4;

# Si l'argument est la lettre "o" ou la lettre "O", afficher "oui" et sortir avec le code retour 0.
[ $@ == "o" ] && echo "Oui">&2 && exit 0;
[ $@ == "O" ] && echo "Oui">&2 && exit 0;
# Si l'argument est la lettre "n" ou la lettre N", afficher "non" et sortir avec le code retour 1.
[ $@ == "n" ] && echo "non">&2 && exit 1;
[ $@ == "N" ] && echo "non">&2 && exit 1;
# Pour tout autre valeur de l'argument, afficher le message "Pas compris" et sortir avec le code retour 5.
[ $@ != "n" ] && echo "Pas compris">&2 && exit 5;


