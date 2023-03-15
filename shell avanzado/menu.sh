#!/bin/bash
#Realizar un menú con 3 opciones: 1. Codificar 2.Decodificar y 3.Salir. La opción 1 ejecutará el script de la codificación. La opción 2 pedirá el nombre del
#fichero a decodificar y ejecutará el script de decodificación. La opción 3 saldrá del programa.
while true
do
 echo "Menu de Codificacion"
 echo "1.-Codificar"
 echo "2.-Decodificar"
 echo "3.-Decodificar fichero"
 echo "4.-Salir"
 echo -n "Seleccione una opción:"
 read opcion
case $opcion in
    1)sh codificar.sh;;
    2)sh decodificar.sh;;
    3)echo -n "Introduce el fichero a decodificar"
        read fichero
        sh decodificarFichero.sh "$fichero"
    ;;
    4)exit;;
esac
done