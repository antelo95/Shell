#! /bin/bash
num=1
cat pedidos | grep -v '#' > aux
while read line; do
    componente=`echo $line | cut -d';' -f1`
    elemento="$num.$componente"
    echo $elemento >> lista
    num=$(( $num + 1 ))
done < aux 
rm aux
cat lista
read -p "Eligue el producto para mostrar su precio: " indice
producto=`grep "^$indice" lista | cut -d'.' -f2`
precio=`grep "$producto" pedidos | cut -d';' -f2`
echo "\n$producto tiene un precio de $precio"
rm lista