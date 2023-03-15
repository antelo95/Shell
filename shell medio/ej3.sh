#!/bin/bash
#Nos dan un fichero con todos los votos de los pueblos de Badajoz y Cáceres. Realizar un script
#que nos pida por pantalla un nombre de Provincia y cuente el número de votos de todos los pueblos
#de dicha provincia y nos muestre el mensaje "Badajoz tiene 605 votos"
 
read -p "Introduce la provincia: " provincia
grep $provincia ../votaciones.txt > aux
votosTotales=0
while read linea; do
 votos=`echo $linea | cut -d';' -f3`
 votosTotales=$(( $votosTotales + $votos))
done < aux
echo "$provincia tiene $votosTotales votos"
rm aux