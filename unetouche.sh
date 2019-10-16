#!/bin/bash
## unetouche.sh ##
#Vous devez écrire un script shell, que vous appelerez unetouche.sh, qui attend un seul argument sous la forme d'un caractère unique et qui doit répondre aux spécifications suivantes :
#
    # S'il n'y a pas exactement un argument le script affiche le message "Donner exactement un argument" et termine avec le code retour 90.
    # Si l'argument est une lettre minuscule, le script affiche "Minuscule" et termine avec le code retour 10.
    # Si l'argument est une lettre majuscule, le script affiche "Majuscule" et termine avec le code retour 11.
    # Si l'argument est un chiffre, le script affiche "Chiffre" et termine avec le code retour 12.
    # Si l'argument est un caractère autre qu'une lettre ou un chiffre, le script affiche "Autre" et termine avec le code retour 20.
    # Si l'argument est constitué de plus d'un caractère, le script affiche "Donner un seul caractere" et termine avec le code retour 91.
#
## on teste d’abord qu’il y a bien exactement un argument ##
if [ $# -ne 1 ]
    then
        echo "Donner exactement un argument">&2; exit 90
    else
        case $1 in
            [a-z])
                echo "Minuscule" >&2; exit 10;;
            [A-Z])
                echo "Majuscule" >&2; exit 11;;
            [0-9])
                echo "Chiffre" >&2; exit 12;;
            [!\W])
                echo "Autre" >&2; exit 20;;
            *)
                echo "Donner un seul caractère" >&2; exit 91;;
        esac
fi


