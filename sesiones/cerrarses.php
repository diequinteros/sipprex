<?php
require("../bibliotecas/conexion.php");
session_start();
if(isset($_SESSION['ses']) && isset($_GET['id'])){
$id = base64_decode($_GET['id']);
$sql = "DELETE FROM sesiones WHERE id_sesion = ?";
$params = array($id);
Database::executeRow($sql,$params);
header('location:versesiones.php');
}
?>