<?php
//On inclut pour chaque page, l'entete g�n�rale au site (html, css, connexion bdd, ...)
include '../tools/connexbase.php';
include '../tools/textes.php';
include 'Entete.php';

echo "<body>";
echo "<h1>".$titre_banniere."</h1>";



//On inclut pour chaque page, le bas de page g�n�rale au site (html, css, connexion bdd, ...)
include 'PiedPage.php';
 ?>