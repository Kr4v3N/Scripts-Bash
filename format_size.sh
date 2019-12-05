#!/bin/bash
## fichier : format_size.sh ###
# taille en octets à formater
taille=${1:?"Erreur: il manque la taille en argument"}

# Constantes
KIO=1024 # 1 Kio
MIO=$((1024*KIO)) # 1 Mio
GIO=$((1024*MIO)) # 1 Gio

# Calcul du nombre W de Gio
W=0
while [ "$taille" -gt $GIO ] ; do
  W=$((W + 1))  # 1 Gio de plus
  taille=$(( taille - GIO)) #taille restante moins 1 Gio
done

# Calcul du nombre X de Mio
X=0
while [[ "$taille" -gt $MIO ]];
do
    X=$((X + 1)) # 1 Mio de plus
    taille=$((taille - MIO)) #taille restante moins 1 Mio
done

# Calcul du nombre Y de Kio
Y=0
while [[ $taille -gt $KIO ]];
do
    Y=$((Y + 1)) # 1 Kio de plus
    taille=$((taille - KIO)) #taille restante moins 1 Kio
done

#calcul du nombre Z d'octets
Z=$taille  #c'est en fait la taille restante

echo "$W Gio $X Mio $Y Kio $Z octets"
