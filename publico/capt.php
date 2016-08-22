<?php
if(isset($_POST['g-recaptcha-response']))
{
	$captcha=$_POST['g-recaptcha-response'];
}
if (!$captcha) {
	echo "<h2>porfavor ingresa el captcha</h2>";
	echo '<a href=index.php>Click</a>';
	exit;
}
$url = 'https://www.google.com/recaptcha/api/siteverify';
$llave = "6Ld5KygTAAAAAHeMM5B63xFqlDzsRnB0-zW9f8oD";
$resultado = file_get_contents($url."?secret=.".$llave."&response=".$_POST['g-recaptcha-response']."");
$data = json_decode($resultado,true);
if (isset($data->success) AND $data->success==true) {
	echo "<h2>Eres un Spam</h2>";
	echo '<a href=crear_empresa.php>Click aqui para volver a llenar tus datos</a>';
}
else
	{
	echo "<h2>Gracias por inscribirte</h2>";
	echo '<a href=index.php>Click</a>';
	}
?>
