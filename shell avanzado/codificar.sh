#!/bin/bash
#Realizar un codificador básico utilizando el fichero codificación para codificar los caracteres a su correspondiente
#valor numérico. Se le pedirá al usuario el texto a codificar y la codificación de caracteres debe mostrarse en 1 línea 
#con los dígitos separados por espacios. Ejemplo:
#Codificar la palabra "hola" da como resultado: 8 16 12 1
read -p "Introduce texto a codificar:" texto
tamanio=`echo $texto | wc -c`
tamanio=$(( $tamanio - 1 ))
indice=1
textoCodificado=""
while [ $indice -le $tamanio ]; do
    caracter=`echo $texto|cut -c$indice`
    lineaCodificacion=`grep "$caracter" codificacion`
    caracterCodificado=`echo $lineaCodificacion | cut -d':' -f2`
    textoCodificado="$textoCodificado$caracterCodificado "
    indice=$(( $indice + 1 ))
done
echo "Texto codificado= $textoCodificado"