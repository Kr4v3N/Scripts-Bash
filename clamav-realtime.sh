#!/bin/bash

DOSSIER=$HOME
QUARANTAINE=$HOME/.infected/
LOG=/var/log/clamav/clamav-realtime.log

while :
do
    inotifywait -r -e  create,modify,move,moved_to,delete,open,close,access "$DOSSIER" --format '%w%f|%e' |
    sed --unbuffered 's/|.*//g' | while read FILE;
    do
    	clamdscan -m -v --fdpass "$FILE" --move=$QUARANTAINE
        if [ "$?" == "1" ]; then
    		echo "`date` - Malware trouvé dans le fichier '$FILE'. Le fichier a été déplacé dans $QUARANTAINE." >> $LOG
    		echo -e "\033[31m Malware trouvé!!!\033[00m" "\033[32m Le fichier '$FICHIER' a été déplacé en quarantaine.\033[0m"
    		if [ -f /usr/bin/notify-send ]; then
    			notify-send -u critical "ClamAV Temps Réel" "Malware trouvé!!! Le fichier '$FILE' a été déplacé en quarantaine."
    		fi
        fi
    done
done
