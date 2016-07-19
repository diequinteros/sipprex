<?php
	session_start();
	session_destroy();
	header("location: ../publico/login.php");
?>