<?php
if(isset($_POST["g-recaptcha-response"]) && $_POST["g-recaptcha-response"])
{
	var_dump($_POST);
	$secret ="6Lff-CcTAAAAAJjQHKT4BcSGTPtEoQGn4lz_lE4f";
	$id = $_SERVER["REMOTE_ADDR"];

	$capt = $_POST["g-recaptcha-response"];

	$res = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$capt&remoteid=$id");

	echo "<br>";
	var_dump($res);

	$array = json_decode($res, TRUE);
	echo "<br>";
	if($array["success"])
	{
		echo "Eres Bueno";
	}
	else{
		echo "Eres muy malo";
	}
}
?>
