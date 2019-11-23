#!/usr/bin/sh
#
split -d -l $1 $2 $3
    for i in ip.*;
    do mv $i $i.txt ;
    done

# ./Split-Renamer.sh 50000 original.txt "ip."
