#! /bin/bash
#leer el archivo registrosNginx.txt y sacar la siguiente data creando un script 


#Debe crear un script de shell que lea el archivo de registro y proporcione la siguiente información:
#Las 5 direcciones IP con mayor número de solicitudes
#Las 5 rutas más solicitadas
#Los 5 códigos de estado de respuesta más comunes
#Los 5 mejores agentes de usuario


echo "Top 5 IPs con más solicitudes:"
awk '{print $1}' registrosNginx.txt | sort | uniq -c | sort -nr | head -n 5
echo =========================================================================
echo "Top 5 Rutas mas solicitadas"
awk '{print $7}' registrosNginx.txt | sort | uniq -c | sort -nr | head -n 5
echo =========================================================================
echo "Top 5 de estados de respuesta mas comunes"
awk -F'"' '{print $3}' registrosNginx.txt | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5
