#!/bin/bash

check_spam(){

    WORDPRESS_DB="wordpress"
    TIME_LIMIT=4

    ## Obtenir le nombre de commentaires au cours des 4 dernières heures
    COMMENTS_NUM=$(mysql -u wpuser -pXS0jpOYTSXhowgdP4GWlpLw3H -NB -e \
    "SELECT COUNT(c.comment_date) FROM $WORDPRESS_DB.wp_comments as c
        WHERE HOUR(TIMEDIFF( LOCALTIME(), c.comment_date ) ) < $TIME_LIMIT;")

    ## Format de sortie
    OUTPUT_PRF="WordPress Check Spam"
    OUTPUT_NUM="Nombre de commentaires: $COMMENTS_NUM"


    if [ $COMMENTS_NUM -lt 4 ]
        then
        echo "$OUTPUT_PRF OK - $OUTPUT_NUM"
        exit 0
    elif [ $COMMENTS_NUM -eq 4 -a $COMMENTS_NUM -lt 10 ]
        then
        echo "$OUTPUT_PRF WARNING - $OUTPUT_NUM"
        exit 1
    elif [ $COMMENTS_NUM -ge 10 ]
        then
        echo "$OUTPUT_PRF CRITICAL - $OUTPUT_NUM"
        exit 2
    else
        echo "$OUTPUT_PRF UNKNOWN - $OUTPUT_NUM"
        exit 3
    fi
}

check_spam;
