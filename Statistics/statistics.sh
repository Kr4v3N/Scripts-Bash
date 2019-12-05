#!/bin/bash
#
#Le script Bash que vous devez créer
#
#Je vais vous demander de créer un script Bash qui fournit des statistiques sur l'utilisation des lettres dans une langue.
# Pour cela, vous allez devoir vous baser sur un fichier de dictionnaire contenant tous les mots de la langue française.
#
#Mission n°1 : combien de fois est utilisée chaque lettre ?
#
#A partir de ce fichier (dico.txt) vous devez extraire le nombre de mots utilisant chaque lettre de l'alphabet de A à Z.
# Le script que vous allez créer prendra en paramètre le nom du fichier dictionnaire à analyser.
#
#Mission n°2 : un peu de créativité !
#Une fois que vous aurez réalisé la première mission, vous devrez créer une fonctionnalité supplémentaire dans votre script.
#Cette fonctionnalité pourra être activée par la présence d'un second paramètre que vous devez inventer :
#
#Le barème
#
# Vous serez noté sur plusieurs critères :
#
#     Afficher le nombre de fois que chaque lettre est utilisée au moins une fois dans un mot (mission n°1)
#     Vérifier la présence du paramètre indiquant le nom du fichier dictionnaire à utiliser
#     Vérifier que le fichier dictionnaire existe bel et bien
#     Ne pas laisser de fichier temporaire de travail sur le disque
#     Proposer une seconde fonctionnalité originale à partir d'un second paramètre (mission n°2)
#     Fournir quelques commentaires dans le script expliquant son fonctionnement
#
# Vous connaissez la plupart des commandes vous permettant de réaliser ce script : vous les avez apprises dans ce cours.
# Cependant, la lecture du manuel et quelques recherches sur le Net vous seront probablement indispensables.
#
clear
echo -e "\033[1;31mScript de statistiques linguistiques pour Linux\033[0m"
echo

# Teste si au moins une option est présente
if [ -z "$1" ]; then
	echo -e "\033[1;31mBesoin d'au moins une option\033[0m"
        echo "Afficher l'aide avec --help"
	exit 1
else
	echo -e "Vous avez lancé $0, il y a $#  paramètre(s)"
	echo -e "Le premier paramètre est $1"
fi
# Affiche l'aide
# Lorsqu'il n'y a pas de deuxième option, une erreur est renvoyée mais automatiquement supprimée.
if [ "$1" = "--help" ] || [ "$2" = "--help" ] 2> /dev/null
	then
	echo
	echo -e "\033[1;31mHelp\033[0m"
	echo -e "Options disponibles:"
	echo -e "syntaxe : \033[1m./langstat.sh \033[0;31m \033[0;4mfile\033[0m [\033[0;4moptions\033[0m]"
	echo
	echo -e "Le fichier sur lequel travailler est dans le dossier en cours (ex : dico.txt)"
	echo -e "	--result Pour afficher les résultats dans l'ordre alphabétique"
	echo -e "	--help Pour afficher l'aide"
	echo
	exit 1
fi
# Assure que cette deuxième option est vraiment un fichier.
if [ ! -f "$1" ] ; then
	echo -e "\033[1;31mLe fichier n'existe pas\033[0m"
	echo -e "Réessayer avec un nom de fichier valide"
    exit 1
else
# Choix du type d'affichage en fonction de la deuxième option.
	if [ -z $2 ]; then
# Pour chaque lettre de l'alphabet, on compte le nombre d'occurrences et on l'affiche dans l'ordre du plus grand au plus petit.
		for letter in {A..Z}; do
			echo "`grep -c $letter $1` - $letter"
		done | sort -rn
		echo -e "Résultats affichés du plus grand nombre au plus petit."
# Pour chaque lettre de l'alphabet, on compte le nombre d'occurrences et on l'affiche dans l'ordre alphabétique.
	elif [ "$2" = "--result" ]; then
		for letter in {A..Z}; do
			echo "`grep -c $letter $1` - $letter"
		done
		echo -e "Résultats affichés par ordre alphabétique"
# Si options non valides: erreur renvoyée
	else
		echo -e "\033[1;31m ERREUR DE SYNTAXE\033[0m"
	fi
fi

