#!/bin/bash
#Mostrar los 2 pueblos con más votos del fichero votaciones.txt

cat votaciones.txt | sort -nr -t';' -k3 | head -n2