#!/usr//bin/env bash

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Début de la mise à jour\n"

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y autoremove
sudo apt-get autoclean

echo -e "\n$(date "+%T") \t Mise à jour terminé"
