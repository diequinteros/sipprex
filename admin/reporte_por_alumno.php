<!DOCTYPE >
<html >
<?php
    require("../bibliotecas/conexion.php");
    header("Content-type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Reporte_de_contraseña_alumno.xls");
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="50%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3" bgcolor="DarkCyan"><CENTER><strong><font color="white"> Recuperacion de contraseña por alumno </font></font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="Honeydew"><strong>CARNET</strong></td>
    <td bgcolor="Honeydew"><strong> Nombre </strong></td>
    <td bgcolor="Honeydew"><strong>Contraseña</strong></td>
   
  </tr>
  
<?php
$alumno = base64_decode($_GET["id"]);
$sql="SELECT carnet, contraseña, nombre1, nombre2, apellido1, apellido2 FROM alumnos WHERE carnet = ? ";
$valores = array($alumno);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$carnet = $res["carnet"];
	$nombre = $res["nombre1"]." ".$res["nombre2"]." ".$res["apellido1"]." ".$res["apellido2"];
	$contraseña = $res["contraseña"];
	
    
?>  
 <tr>
	<td><?php echo $carnet; ?></td>
	<td><?php echo $nombre; ?></td>
	<td><?php echo base64_decode($contraseña); ?></td>   
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
