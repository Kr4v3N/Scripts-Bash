#!/bin/bash

# Définition des binaires :
MYSQL="/usr/bin/mysql" ;
MYSQLDUMP="/usr/bin/mysqldump" ;
MYSQLADMIN="/usr/bin/mysqladmin" ;
MKDIR="/bin/mkdir" ;
DATE="/bin/date" ;

## FONCTIONS

# Fonction de sortie de script si l'un des binaires est inexistant:
die() {
    echo $@ >&2 ;
    exit 1 ;
}

# Fonction de test des binaires :
check_binaries() {
    # On vérifie si les binaires nécessaire au bon fonctionne du script sont installés
    [ -x ${MYSQL} ] || die "File \"${MYSQL}\" pas trouvé ! Vérifier la définition dans ${0}." ;
    [ -x ${MYSQLDUMP} ] || die "File \"${MYSQLDUMP}\" pas trouvé ! Vérifier la définition dans ${0}." ;
    [ -x ${MYSQLADMIN} ] || die "File \"${MYSQLADMIN}\" pas trouvé ! Vérifier la définition dans ${0}." ;
    [ -x ${MKDIR} ] || die "File \"${MKDIR}\" pas trouvé ! Vérifier la définition dans ${0}." ;
    [ -x ${DATE} ] || die "File \"${DATE}\" pas trouvé ! Vérifier la définition dans ${0}." ;
}

# Fonction de sauvegarde :
backup() {
    # On liste nos bases de données
    LISTEBDD=$( echo 'show databases' | ${MYSQL} --defaults-extra-file=/etc/mysql/user.cnf)
    for BDD in $LISTEBDD
    do
        # Exclusion des bases de données inutiles
        if [[ $BDD != "information_schema" ]] &&
           [[ $BDD != "mysql" ]] &&
           [[ $BDD != "Database" ]] &&
           [[ $BDD != "performance_schema" ]] &&
           [[ $BDD != "mysql" ]] &&
           [[ $BDD != "phpmyadmin" ]] &&
           [[ $BDD != "sys" ]];then
        # Emplacement du dossier ou nous allons stocker les bases de données,
        # un dossier par base de données
        CHEMIN=/home/user/.Mysql_Backup_BD/$BDD;
        # Si le repertoire de la BDD dans $CHEMIN n'existe pas, on le cree
        if [ ! -d "$CHEMIN" ];then
            ${MKDIR} -p $CHEMIN/
        fi
        # Format d'affichage de la date
        DATE=`date +%d_%m_%y`;
        # On liste les fichiers présent dans le dossier indiqué
        NbArchive=$(ls -A $CHEMIN/ |
        # On y compte les fichiers qui sont à l'intérieur
        wc -l)
        # Si il y a plus de 7 archives, on supprime la plus ancienne
        if [ "$NbArchive" -gt 7 ];then
            # On liste par date de modification les sauvegardes présentes dans le dossier
            Old_backup=$(ls -lrt $CHEMIN/ |
            # on filtre les fichiers affichés pour n'afficher que ceux qui ont l'extension ".sql"
            grep ".sql" |
            # on récupère la première ligne qui contient forcément le nom de la sauvegarde la plus ancienne
            head -n 1 |
            #  on coupe la ligne pour ne récupérer que le nom du fichier (on récupère la deuxième partie de la ligne quand elle est coupée par le ":"
            cut -d ":" -f 2 |
            # on coupe la ligne pour ne récupérer que le nom du fichier (on récupère la deuxième partie de la ligne quand elle est coupée par un espace
            cut -d " " -f 2);
            # On supprime l'archive la plus ancienne
            rm $CHEMIN/$Old_backup
        fi
        # On backup notre base de données avec la date de sauvegarde dans le nom du fichier enregistré
        mysqldump --defaults-extra-file=/etc/mysql/user.cnf --single-transaction --add-drop-database --databases $BDD > "$CHEMIN/$BDD"_"$DATE.sql"
        echo -e "\033[1;32mSauvegarde de la base de données $BDD réalisée avec succès!\033[0m";
        fi
    done
}

check_binaries ;
backup ;

