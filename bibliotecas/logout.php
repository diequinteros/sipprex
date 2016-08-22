<?php
	require("../bibliotecas/conexion.php");
	session_start();
	if(isset($_SESSION['ses']) && ( isset($_SESSION['carnet']) || isset($_SESSION['id_exalumno']) || isset($_SESSION['codigo_admin']) || isset($_SESSION['id_empresa'])  ) ){
	if(isset($_SESSION['carnet']))
	{
		$id = $_SESSION['carnet'];
	}
	if(isset($_SESSION['id_exalumno']))
	{
		$id = $_SESSION['id_exalumno'];
	}
	if(isset($_SESSION['codigo_admin']))
	{
		$id = $_SESSION['codigo_admin'];
	}
	if(isset($_SESSION['id_empresa']))
	{
		$id = $_SESSION['id_empresa'];
	}
	$sql = "DELETE FROM sesiones WHERE usuario = ? AND unisesion = ?";
	$params = array($id, $_SESSION['ses']);
	Database::executeRow($sql,$params);
	}
	session_destroy();
	header("location: ../publico/login.php");
?>