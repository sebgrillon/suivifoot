<?php
//On inclut pour chaque page, l'entete g�n�rale au site (html, css, connexion bdd, ...)
include '../tools/connexbase.php';
include '../tools/textes.php';
include 'Entete.php';
?>
<!-- <nav></nav> -->
<section>
	<form class="login" name="form1" id="form1" method="post" action="/bot?appweb/connexion.php">
		<fieldset class="login">
			<legend class="login"><?php echo $t_invit_connexion;?></legend>
			<div class="login"><p class="login"><?php echo $t_username;?></p><p class="login"><input type="text" name="id"></p></div>
			<div class="login"><p class="login"><?php echo $t_password;?></p><p class="login"><input type="password" name="mdp"></p></div>
			<div class="login"><input type="submit" value="Valider"></div>
		</fieldset>
	</form>
</section>
<aside></aside>
<script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
<script type="text/javascript">captcha()</script>

<?php
//On inclut pour chaque page, le bas de page g�n�rale au site (html, css, connexion bdd, ...)
include 'PiedPage.php';
 ?>