#!/bin/bash
#
#Le script s'appellera galerie.sh. Pour sa première version, il faudra le placer dans un dossier contenant des images ; il générera des miniatures à partir de ces dernières et un fichier HTML présentant toutes les images du dossier.
#
# Concrètement, le script devra donc :

#     créer une miniature de chaque image du dossier ;

#     générer un fichier HTML et y insérer ces miniatures ;

#     faire un lien vers les images en taille originale.
#
#
#Vérification des parametres, S'ils sont absents, on met une valeur par default
if [ -z "$1" ]
    then
        sortie='galerie.html'
    else
        sortie=$1
fi

#Préparation des fichiers et dossiers
echo '' > "$sortie" # faire un echo vide dans ce fichier pour le vider.

#On crée le dossier qui accueillera les images miniatures s'il n'existe pas.
if [ ! -e miniatures ]
then
    mkdir miniatures
fi

#On écrit l'en-tête HTML dans le fichier.
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
   <head>
       <title>Ma galerie</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <style type="text/css">
       a img { border:5; }
       </style>
   </head>
   <body><p>' >> "$sortie"

## Génération des miniatures et de la page ##
#
# On fait une boucle sur tous les fichiers de type image (*.png, *.jpg, etc.) qui existent dans le dossier.
# Pour chacun d'eux, on crée une miniature d'une taille maximale de 200 x 200 pixels dans le sous-dossier miniatures
#
for image in `ls *.png *.jpg *.jpeg *.gif 2> /dev/null`
do
        # Le petit symbole « > » permet, comme indiqué dans la documentation du programme, de ne pas générer de miniature inutilement si l'image est de base plus petite que la taille des miniatures.
        convert $image -thumbnail '200x200>' miniatures/$image
        # On écrit dans la page web la balise qui affichera l'image et on fait un lien vers la version agrandie.
        echo '<a href="'"$image"'"><img src="miniatures/'"$image"'" alt="" /> </a> ' >> "$sortie"
done

## Pied de page HTML ##
# Enfin, on termine la page HTML en fermant les balises.
echo '</p>
   </body>
</html>' >> "$sortie"
