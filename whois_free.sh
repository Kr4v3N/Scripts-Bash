#!/usr/bin/env bash
#
# Query the Whois database to find out if a domain name is free or not
#
#
#### Variable declaration ####
#
# Save to file ? : 0 = no 1 = yes
printfile=1
# si printfile=1 écrire également les domaines non libres? :  0 = non 1 = oui
printnonfree=1
# chemin et nom du fichier à enregistrer
pathrec="$PWD/whois.txt"

# tableau des tld à tester
tab_tld=(
    '.com'
    '.net'
    '.org'
    '.info'
    '.biz'
    '.edu'
    '.mobi'
    '.name'
    '.eu'
    '.fr'
    '.ch'
    '.be'
    '.ca'
    )

# /!\ attention: les cles des tableaux tab_tld et tab_msg doivent correspondre
# tableau des retours whois en cas de succès
tab_msg=(
    'No match for'                      #.com
    'No match for'                      #.net
    'NOT FOUND'                         #.org
    'NOT FOUND'                         #.info
    'Not found'                         #.biz
    'No Match'                          #.edu
    'NOT FOUND'                         #.mobi
    'No match.'                         #.name
    'Status:    AVAILABLE'              #.eu
    'No entries found'                  #.fr
    'We do not have an entry'           #.ch
    'Status:    AVAILABLE'              #.be
    'Domain status:         available'  #.ca
    )

# compter les entrées des tableaux (-1 pour index 0)
let "n=${#tab_tld[*]} -1"

#### debut du code ####

# tester si un paramètre existe
if [ -z $1 ] ; then
    echo -e "\033[1;41;37mLa commande doit être appelée avec une chaîne de caractère en paramètre.\033[32m \nex: dotfree nom.tld\033[0m"
else
    # tester si la syntaxe est correcte
    b=`expr match "$1" '\([a-zA-Z0-9.-]*\)'`
    if [ $1 == $b ]; then
        # la syntaxe est bonne on regarde si il y a une extension tld
        tld=${b#*.}
        nom=${b%%.*}
        # si tld == nom c'est qu'il n'y a pas d'extension on test donc avec tous les tld connus
        if [ $tld == $nom ]; then
            for i in `seq 0 $n`
            do
                tld_name="$1${tab_tld[$i]}"
                # enfin on regarde si le domaine est libre pour ces extensions
                if [ -z "`whois $tld_name | grep "${tab_msg[$i]}"`" ]; then
                    echo -e "\033[1;41;37m \033[0m $tld_name est déjà enregistré"
                    # écrire dans le fichier
                    if [ $printfile == 1 ] && [ $printnonfree == 1 ]; then
                        echo "-- $tld_name" >> "$pathrec";
                    fi
                else
                    echo -e "\033[1;42;37m \033[0m $tld_name est libre"
                    # écrire dans le fichier
                    if [ $printfile == 1 ]; then
                        echo "++ $tld_name" >> "$pathrec";
                    fi
                fi
            done
            # écriture du séparateur
            if [ $printfile == 1 ]; then
                echo "=======================================================" >> "$pathrec";
            fi

        # si tld != nom alors il y a une extension.???
        else
            # on regarde si cette extension est connue dans tab_tld
            ext=".$tld"
            id="not"
            for i in `seq 0 $n`
            do
                if [ ${tab_tld[$i]} == $ext ];then
                    id=$i
                fi
            done
            # si l'extension à été trouvée alors id correspond à la clé des tableaux tab_tld et tab_msg sinon id vaut "not"
            if [ $id == "not" ];then
                echo -e "\033[1;41;37mTLD \"$ext\" inconnue.\033[0m"
            else
                # enfin on regarde si le domaine est libre pour cette extension
                if [ -z "`whois $1 | grep "${tab_msg[$id]}"`" ]; then
                    echo -e "\033[1;41;37m \033[0m $1 est déjà enregistré"
                    # écrire dans le fichier
                    if [ $printfile == 1 ] && [ $printnonfree == 1 ]; then
                        echo "-- $1" >> "$pathrec";
                    fi
                else
                    echo -e "\033[1;42;37m \033[0m $1 est libre"
                    # écrire dans le fichier
                    if [ $printfile == 1 ]; then
                        echo "++ $1" >> "$pathrec";
                    fi
                fi
                # ecriture du séparateur
                if [ $printfile == 1 ]; then
                    echo "=======================================================" >> "$pathrec";
                fi
            fi
        fi
    else
        # mauvaise syntaxe
        echo -e "\033[1;41;37mErreur de syntaxe pour \"$1\":\033[0m\033[1;37m seuls les caractères alphanumériques et le tiret peuvent former un nom de domaine correcte.\033[0m"
    fi;
fi;
