<html>
<body>

<?php
#$nombreInforme=$_POST["informe"];
#$direccionIP=$_POST["ip"];

#$resultado = shell_exec("./scripts/openvas3.sh "".$nombreInforme." " .$direccionIP");
#print "$resultado\n";
#$page = shell_exec("home/i82gorum/openvas3.sh " ".informe2" ".127.0.0.1");
#print "Salida: $page\n";
#$command_result = shell_exec('/home/i82gorum/openvas3.sh "'.$nombreInforme.'" "'.$direccionIP."');
#print "Salida: $page\n";
#$salida = shell_exec('/home/i82gorum/openvas3.sh ' . $nombreInforme . ' ' . $direccionIP);
#print "$salida\n";
$page = shell_exec("/opt/lampp/cgi-bin/obtener_target.py");
echo $page;
?> 

</body>
</html> 
