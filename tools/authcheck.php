<?php
if(!isset($_SESSION['dernier_acces']) || !isset($_SESSION['ipaddr']) || !isset($_SESSION['id']))
{
	header("Location:../appweb/accueil.php");
		die();
}
 
if(time()-$_SESSION['dernier_acces']>$session_timeout)
{
	unset($_SESSION['dernier_acces']);
	unset($_SESSION['id']);
	unset($_SESSION['ipaddr']);
	unset($_SESSION['nom']);
	unset($_SESSION['prenom']);
	unset($_SESSION['droits']);
	header("Location:../appweb/accueil.php");
		die();
}

if($_SERVER['REMOTE_ADDR']!=$_SESSION['ipaddr'])
{
	unset($_SESSION['dernier_acces']);
	unset($_SESSION['id']);
	unset($_SESSION['ipaddr']);
	unset($_SESSION['nom']);
	unset($_SESSION['prenom']);
	unset($_SESSION['droits']);
	header("Location:../appweb/accueil.php");
		die();
	}

$_SESSION['dernier_acces']=time();
?>