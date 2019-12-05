#!/bin/bash
# fichier : tagalice.sh
# Alice doit transmettre ses fichiers à l'un de ses collègues avec lequel elle travaille sur un même projet.
# Pour qu'il soit facile d'identifier que les fichiers qu'elle va transmettre sont les siens,
# elle décide d'ajouter le tag _alice à la fin de chacun des noms de ses fichiers.
# Pour gagner du temps dans cette manipulation elle décide d'écrire le script renamer.sh pour faire
# automatiquement cette opération.
# Les noms des fichiers qu'Alice aura à transmettre auront toujours une extension précédée d'un point.
# Vous n'avez donc pas besoin de faire de vérification à ce niveau. On supposera aussi que le fichier à renommer existe.
# Par contre, vous devrez vérifier que le premier argument (le nom du fichier à renommer) est présent,
# et afficher ce message d'erreur s'il est absent : "Erreur : vous devez indiquer le nom du fichier a renommer".
# Dans ce cas, le script s'arrête et un code retour différent de zéro est produit.

#Votre mission est donc d'écrire ce script. Celui-ci doit prendre en argument le nom du fichier à renommer.
# Par exemple , si le fichier s'appelle projet1.tar.gz, le script doit le renommer projet1_alice.tar.gz.
#
FULL_NAME=${1:?"Erreur : vous devez indiquer le nom du fichier a renommer"}
#On va isoler le nom du fichier (partie avant le premier point)
NAME=$(echo "$FULL_NAME" | cut -d. -f1)

#On va isoler l'extension du fichier (partie apres le premier point)
#NB: on considere qu'il y a toujours au moins un point dans le nom
EXT=$(echo "$FULL_NAME" | cut -d. -f2-)

#Construction du nouveau nom
NEW_NAME="${NAME}_alice.$EXT"

#On renomme le fichier
mv "$FULL_NAME" "$NEW_NAME"

