<?php
session_start();
$_SESSION['id'] = '';
$_SESSION['nom'] = '';
$_SESSION['prenom'] = '';
/*$_SESSION['droits'] = '';*/
$_SESSION['dernier_acces'] = '';
$_SESSION['ipaddr'] = '';
/*$_SESSION['identite'] = '';
*/
include "../tools/connexbase.php";
//include "../tools/fonctions.php";

$q_user = $bdd->query('SELECT * FROM personne WHERE username=\''.$_POST['id'].'\' AND password=\''.$_POST['mdp'].'\'');
$r_user = $q_user->fetch();
if (!$r_user)
{
include 'entete.php';
?>
		<div class="erreur">Nom d'utilisateur ou mot de passe erron&eacute; ! Vous serez redirig&eacute; vers la page d'acc&eagrave;s dans quelques secondes...</div>
	</body>
</html>
<?php
header('Refresh: 3; url=\'accueil.php\''); 
ob_flush();
}
else
{
	$_SESSION['dernier_acces'] = time();
	$_SESSION['ipaddr'] = $_SERVER['REMOTE_ADDR'];
	$_SESSION['id'] = $r_user[0];
	$_SESSION['nom'] = $rep1[1];
	$_SESSION['prenom'] = $rep1[2];
/*	$_SESSION['droits'] = $rep1[5];
	

	$identite = html_entity_decode($_SESSION['nom'], ENT_QUOTES | ENT_IGNORE, "ISO-8859-1").' '.html_entity_decode($_SESSION['prenom'], ENT_QUOTES | ENT_IGNORE, "ISO-8859-1").' / ';
	if ($_SESSION['droits'] == 0) $identite = $identite."Super Administrateur";
	if ($_SESSION['droits'] == 1) $identite = $identite."Administrateur";
	if ($_SESSION['droits'] == 2) $identite = $identite."Consultant";

	$_SESSION['identite'] = $identite;
*/

	header('Refresh: 0; url=\'menu.php\'');
	ob_flush();
}
?>