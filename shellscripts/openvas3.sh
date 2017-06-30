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
target_id=`python ./pythons/obtener_target.py`
echo "muestro valor de target-id"
echo $target_id
#Creo task
omp -u admin -w admin -X '<create_task>
 		<name>'$informe'</name>
 		<comment>Automatizado Miguel Angel</comment>
 		<config id="daba56c8-73ec-11df-a475-002264764cea"/>
 		<target id="'$target_id'"/>
	</create_task>' >> ./temporales/task_id.xml
sleep 4
#Parseo task
task_id=`python ./pythons/obtener_task.py`
#Iniciamos la tarea
omp -u admin -w admin -X '
<start_task task_id="'$task_id'"/>' >> ./temporales/report_id.xml
omp -u admin -w admin -G > estado.txt
sleep 5
awk 'NR==1' estado.txt > listo.txt #Coge la primera linea
sleep 5
esdone=`cat listo.txt | cut -d" "  -f3` #Extrae el campo necesario, running o done, queremos done
while [ $esdone != "Done" ];
do 
	omp -u admin -w admin -G > estado.txt
	awk 'NR==1' estado.txt > listo.txt #Coge la primera linea
	esdone=`cat listo.txt | cut -d" "  -f3` #Extrae el campo necesario, running o done, queremos done	
	printf $esdone	
	sleep 30
done
echo "Terminada la tarea con el campo ID=$task_id"
sleep 5
#Parseo repor_id
report_id=`./pythons/obtener_report.py`
#Creo el informe en xml
omp -u admin -w admin -X '<get_reports report_id="'$report_id'"/>' >> ./informes/respuestaxml.xml
sleep 10
#Elimino la tarea
omp -u admin -w admin -X '<delete_task task_id="'$task_id'"/>' 
#Parseo respuestaxml.xml
}

echo password root | sudo -S -l & >/dev/null
#Recibe los parámetros nombre_informe $0 y dirección IP $1
if [ $# -ne 2 ];
then
	echo "No se han pasado los parámetros necesarios"
	exit
else
	informe=$1
	direccionIP=$2
	automatizaopenvas $informe $direccionIP
#fi




