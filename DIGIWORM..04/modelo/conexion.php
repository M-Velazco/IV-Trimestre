<?php
function Conectarse()
{
	$Conexion=new mysqli("localhost","root","sinco","digiworm");
	
	if ($Conexion->connect_errno) 
		echo "Problemas en la Conexion ". $Conexion->connect_error;
	else
		return $Conexion;
}

?>