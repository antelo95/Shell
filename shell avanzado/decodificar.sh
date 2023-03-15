#!/bin/bash
#Realizar un decodificador básico utilizando el fichero codificación para decodificar los caracteres a su correspondiente
#valor alfabético. Se le pedirá al usuario el texto a decodificar y la decodificación de caracteres debe mostrarse en 1 línea 
#con los dígitos separados por espacios. Ejemplo:
#Decodificar la palabra "8 16 12 1" da como resultado: hola
read -p "Introduce texto a decodificar: " texto
tamanio=`echo $texto | wc -w`
indice=1
textoDecodificado=""
while [ $indice -le $tamanio ]; do
    caracter=`echo $texto|cut -d' ' -f$indice`
    lineaCodificacion=`grep ":$caracter$" codificacion`
    caracterDecodificado=`echo $lineaCodificacion | cut -d':' -f1`
    #Si codifica como un espacio es porque estamos buscando la coma en el dichero codificacion, por lo que le añado un espacio al final
    if [ -z $caracterDecodificado ]; then
        textoDecodificado="$textoDecodificado$caracterDecodificado "
    else 
         textoDecodificado="$textoDecodificado$caracterDecodificado"
    fi
    indice=$(( $indice + 1 ))
done
echo "Texto decodificado= $textoDecodificado"