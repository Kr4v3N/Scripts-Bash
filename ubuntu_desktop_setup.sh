#!/usr//bin/env bash

#Le script de configuration des postes permet d’administrer le poste par SSH,
#de configurer le hostname du poste et de créer un compte utilisateur.
#Ce script permet de configurer un poste à partir d’une machine fraîchement
#installée mais également de “réinitialiser” le poste en fin de formation
#en vue d’une utilisation lors d’un futur stage.

## Vérification si root
if [ "$(id -u)" != "0" ]; then
    echo -e "\033[0;31mVeuillez executer le script avec les droits root \n\033[0m"
    exit 1
fi

echo -e "\033[0;31m############################################################\n\033[0m"
echo -e "          \033[1;32mFormation À fond Linux Edition 2020 \n\033[0m      "
echo -e "\033[0;31m############################################################\n\033[0m"

## "Sauvegarde" du nom du PC avant changement
old_hostname=$(cat /etc/hostname)

## Fonction qui réalise 4 taches
starter(){
echo -e "Quel est votre choix ? \n"
echo -e "1. Modifier le nom du poste de travail"
echo -e "2. Ajouter un utilisateur"
echo -e "3. Réinitialiser le poste de travail "
echo -e "4. Quitter \n"

read -p "Renseignez votre choix (1-4): " num

case $num in
    1)
    echo -e "\033[34mModification du nom du pc en cours....\n\033[0m"

    # On récupèrel'adresse IP du PC
    ip_pc=$(hostname -I)
    # On récupère l'avant dernier octet pour pouvoir 
    # tester dans quelle salles ce trouve le PC
    num_classroom=$(echo $ip_pc | cut -f3 -d.)
    # Récuperation du dernier octet de l'IP afin d'attribuer une nombre unique au PC
    num_pc=$(echo $ip_pc | cut -f4 -d.)
    # Modification du hostname de la machine si...
    if [ $num_classroom == 100 ]
    then
        name_classroom="Abeille"
    elif [ $num_classroom == 101 ]
        then
        name_classroom="Baobab"
    else
        echo -e "Attention, vous n'avez pas le droit de modifier le nom de ce PC!!!"
        sleep 3
        starter
    fi
    hostname_pc=$name_classroom$num_pc
    sudo hostnamectl set-hostname $hostname_pc
    echo -e "\033[32mLe changement du nom de la machine c'est réalisé avec succés!\n\033[0m"
    sleep 3
    starter
    ;;
    2)

    ## Création d'un nouveau compte
    echo -e "\033[34mCréation d'un nouveau compte en cours...\n\033[0m"

    if [ -n "$(grep Stagiaire /etc/passwd)" ];
    then
        echo -e "Attention l'utilisateur Stagiaire existe déjà"
        sleep 3
        starter
    else
        sudo useradd -m "Stagiaire"
        new_passwd=$(cat /dev/urandom | tr -dc '0-9' | fold -w 8 | head -n 1)
        echo "Stagiaire:$new_passwd" | sudo chpasswd -c SHA256
        count=$(cat /etc/passwd | grep "Stagiaire" | cut -b1-9)
        echo -e "\033[32mLe compte "$count" a été crée avec succès!!!\n\033[0m"
        sleep 2
        echo "Voici les informations concernant le nouveau compte:"
        echo "=========================================================="
        echo -e "\033[32mLe nom d'utilisateur est: Stagiaire \033[0m"
        echo -e "\033[32mLe mot de passe est     : $new_passwd \033[0m"
        echo "=========================================================="
    fi
    sleep 3
    starter
    ;;
    3)

    ## Réinitialisation du PC
    echo -e "\033[34mRéinitialisation du PC en cours...\n\033[0m"
    sleep 3
    echo -e "\033[34mSuppression du compte utilisateur en cours...\n\033[0m"
    sudo deluser --remove-home Stagiaire
    sleep 3
    echo -e "\033[32mSuppression du compte terminée avec succès!!!\n\033[0m"
    sleep 3
    echo -e "\033[34mRéinitialisation du nom de la machine en cours...\n\033[0m"
    sudo hostnamectl set-hostname $old_hostname
    sleep 3
    if [ -z "$(grep "^Stagiaire" /etc/passwd)" ];
    then
    echo -e "\033[32mRéinitialisation terminée avec succès!!!\n\033[0m"
    fi
    ;;
    4) 
    echo -e "Au revoir"
    exit 0 
    ;;
esac
}

starter