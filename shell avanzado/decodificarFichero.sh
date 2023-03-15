#!/bin/bash
#Dado el fichero codificación. Leer el mensaje y mostrar su resultado por pantalla
mensaje=""
while read linea; do
    numPalabras=`echo $linea | wc -w`
    indice=1
    while [ $indice -le $numPalabras ]; do
        digito=`echo $linea|cut -d' ' -f$indice`
        caracterCodificado=`grep ":$digito$" codificacion | cut -d':' -f1`
        mensaje="$mensaje$caracterCodificado"
        indice=$(($indice + 1))
    done
    mensaje+="\n"
done < ficheroADecodificar.txt
echo "Mensaje Decodificado: \n$mensaje"