#! /bin/bash
if [ -e "prueba" ]; then
    echo "El directorio ya existe, se borrará"
    rmdir prueba
fi
mkdir prueba
echo prueba.txt > ./prueba/prueba.txt
date >> ./prueba/prueba.txt
