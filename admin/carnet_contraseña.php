<!DOCTYPE >
<html >
<?php
  
    require("../bibliotecas/conexion.php");
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=Reporte_carnet_contraseña.xls");


	


?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4" bgcolor="Teal"><CENTER><strong><font color="white">REPORTE DE CARNET Y CONTRASEÑA</strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Carnet</font></strong></td>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Contraseña</font></strong></td>
  </tr>
  
<?php
$sql="SELECT carnet, contraseña FROM alumnos";
$valores = array(null);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$carnet=$res["carnet"];
	$contraseña=$res["contraseña"];
	
?>  
 <tr>
	<td><?php echo .base64_encode($canet).; ?></td>
	<td><?php echo .base64_encode($contraseña).; ?></td>                 
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
