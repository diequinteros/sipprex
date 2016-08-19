<?php
$correo = $_POST['Correo'];

require("../bibliotecas/conexion.php");
require_once 'phpmailer/PHPMailerAutoload.php';

function randomPassword() {
	$alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
    	$n = rand(0, $alphaLength);
    	$pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string

}

$pass = randomPassword();
//$passHash = password_hash($pass, PASSWORD_DEFAULT);

$mail = new PHPMailer;
$mail->CharSet = 'UTF-8';
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->SMTPDebug = 0;                               // Enable verbose debug output
    $mail->Debugoutput = 'html'; 
    
    $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
    $mail->Port = 587;                                    // TCP port to connect to
    $mail->SMTPSecure = 'tls';                         // Enable TLS encryption, `ssl` also accepted
    $mail->SMTPAuth = true;                               // Enable SMTP authentication 
    $mail->Username = 'sipprex.ricaldone@gmail.com';                 // SMTP username
    $mail->Password = 'ricaldone1';                           // SMTP password
    $mail->setFrom('sipprex.ricaldone@gmail.com', 'Sipprex');
    $mail->addAddress($correo,'');     // Add a recipient
    $mail->Subject = 'Codigo de autenticacion';
    $mail->Body    = 'El codigo de autenticacion es: '.$pass;

    if($mail->send())
    {
        echo "OK";
    }
    else
    {
        echo "NO";
    }

    ?>
    