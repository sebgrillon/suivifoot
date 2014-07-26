<?php
session_start();
include "authconfig.php";
include "authcheck.php";

unset($_SESSION['dernier_acces']);
unset($_SESSION['id']);
unset($_SESSION['ipaddr']);
unset($_SESSION['prenom']);
unset($_SESSION['droits']);
header("Location:../appweb/accueil.php");
die();


?>