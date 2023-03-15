#ª/bin/bash

echo -n "Introduce texto al revés:"
read texto
tamanio=`echo $texto | wc -c`
tamanio=$(( $tamanio - 1 ))
textoAlDerecho=""
while [ $tamanio -gt 0 ]; do
    caracter=`echo $texto | cut -c$tamanio`
    textoAlDerecho="$textoAlDerecho$caracter"
    tamanio=$(( $tamanio - 1 ))
done
echo "Texto al derecho: $textoAlDerecho"