<?php

// On v�rifie si le support MySql est bien disponible
if (!function_exists("mysql_connect"))
	die("Le support MySql n'est pas disponible.");

//On v�rifie les acc�s � la base de donn�e
if (!@mysql_connect("localhost", "monlogin", "monpassword"))
	die('Base de donn�e - mysql_connect: ' . mysql_error());

// On s�lectionnne la base de donn�e
mysql_select_db("footballmanagement") or die('Base de donn�e - mysql_select_db: ' . mysql_error());

//Bande haute du site aux couleurs du club, avec le logo
echo"<html>
	<head>Equipe de foot Test</head>";
?>