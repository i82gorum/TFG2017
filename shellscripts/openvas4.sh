#!/bin/bash

automatizaopenvas(){
echo $informe
echo $direccionIP
echo `whoami`
echo `pwd`
#Compruebo si existen los archivos target_id.xml, task_id.xml, report_id y respuestaxml.xml temporales.
if [ -f ./temporales/target_id.xml ];
then
	echo "Sí, sí existe la target."
	rm -f ./temporales/target_id.xml
fi
if [ -f ./temporales/task_id.xml ];
then
	echo "Sí, sí existe la task."
	rm ./temporales/task_id.xml
fi
if [ -f ./temporales/report_id.xml ];
then
	echo "Sí, sí existe el report_id."
	rm ./temporales/report_id.xml
fi
if [ -f ./temporales/respuestaxml.xml ];
then
	echo "Sí, sí existe la respuestaxml.xml."
	rm ./temporales/respuestaxml.xml
fi

#Creo target. Tengo que pasarle el nombre del informe desde php, para meterselo tanto a target como a tarea	
omp -u admin -w admin -X '<create_target><name>'$informe'</name><hosts>'$direccionIP'</hosts></create_target>' >> ./temporales/target_id.xml
sleep 4
#Parseo target
echo "estoy creando task"
echo `pwd`
python ./pythons/obtener_target.py

#echo "muestro valor de target-id"
#echo $target_id

}

#echo password root | sudo -S -l & >/dev/null
#Recibe los parámetros nombre_informe $0 y dirección IP $1
#if [ $# -ne 2 ];
#then
#	echo "No se han pasado los parámetros necesarios"
#	exit
#else
	informe=$1
	direccionIP=$2
	automatizaopenvas $informe $direccionIP
#fi




