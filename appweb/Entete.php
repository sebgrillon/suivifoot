<?php

// On vérifie si le support MySql est bien disponible
if (!function_exists("mysql_connect"))
	die("Le support MySql n'est pas disponible.");

//On vérifie les accès à la base de donnée
if (!@mysql_connect("localhost", "monlogin", "monpassword"))
	die('Base de donnée - mysql_connect: ' . mysql_error());

// On sélectionnne la base de donnée
mysql_select_db("footballmanagement") or die('Base de donnée - mysql_select_db: ' . mysql_error());

//Bande haute du site aux couleurs du club, avec le logo
echo"<html>
	<head><title>Equipe de foot Test</title></head>";
?>