<!DOCTYPE >
<html >
<?php
  
    require("../bibliotecas/conexion.php");
 header("Content-type: application/vnd.ms-excel");
 header("Content-Disposition: attachment; filename=Reporte_Personal_ex-alumnos.xls");


	


?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="5" bgcolor="IndianRed"><CENTER><strong><font color="white">REPORTE DE LA TABLA EX-AlUMNOS</font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="DarkSalmon"><strong><font color="white">Nombre</font></strong></td>
    <td bgcolor="DarkSalmon"><strong><font color="white">Apellido</font></strong></td>
    <td bgcolor="DarkSalmon"><strong><font color="white">Telefono</font></strong></td>
    <td bgcolor="DarkSalmon"><strong><font color="white">Ocupacion</font></strong></td>
      <td bgcolor="DarkSalmon"><strong><font color="white">Correo</font></strong></td>
  </tr>
  
<?php
$sql="SELECT nombre1, apellido1, telefono, correo_electronico, ocupaciones.ocupacion from ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion";
$valores = array(null);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$nombre=$res["nombre1"];
	$apellido=$res["apellido1"];
	$telefono=$res["telefono"];
  $ocupacion=$res["ocupacion"];
	$correo=$res["correo_electronico"];
?>  
 <tr>
	<td><?php echo $nombre; ?></td>
	<td><?php echo $apellido; ?></td>
	<td><?php echo $telefono; ?></td>
  <td><?php echo $ocupacion; ?></td>  
	<td><?php echo $correo; ?></td>                  
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
