#!/bin/bash
cat pedidos
while true; do
    echo "\n********MENU********"
    echo "1.Ordenar productos por unidades vendido"
    echo "2.Ganancias obtenidas por la venta de un producto"
    echo "3.Mostrar el listado de productos que están bajos de stock"
    echo "4.Salir"
    read -p "Seleccione opcion: " option
    case $option in
        "1")
            echo "\nOrdenado por unidades vendidas"
            echo "*******************************"
            cat pedidos | grep -v '#' | sort -n -r -t';' -k3
        ;;
        "2")
            echo "\nGanancias por producto"
            echo "*******************************"
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
            read -p "Eligue el producto para mostrar su ganancia: " indice
            producto=`grep "^$indice" lista | cut -d'.' -f2`
            precio=`grep "$producto" pedidos | cut -d';' -f2 | cut -d' ' -f1`
            cantidad=`grep "$producto" pedidos | cut -d';' -f3`
            ganancia=$(( $cantidad * $precio ))
            echo "\n$producto tiene una ganancia de $ganancia €"
            rm lista
        ;;
        "3")
            echo "\nProductos bajos de Stock"
            echo "**************************************"
            cat pedidos | grep -v '#' > aux
            while read line; do
                stock=`echo $line | cut -d';' -f4`
                if [ $stock -lt 10 ]; then
                    producto=`echo $line | cut -d';' -f1`
                    echo "Bajo de stock: $producto"
                fi
            done < aux
            rm aux
        ;;
        "4")
            echo "\nGracias por utilizar nuestros servicios"
            exit 0
        ;;
    esac
    echo "***********************************"
    echo "Operacion realizada\n"
done