<!DOCTYPE >
<html >
<?php
  
    require("../bibliotecas/conexion.php");
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=Reporte_Personal_practicas.xls");


	


?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="6" bgcolor="DarkCyan"><CENTER><strong><font color="white">REPORTE DE LA TABLA PRACTICAS</font></font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="Honeydew"><strong>carnet</strong></td>
    <td bgcolor="Honeydew"><strong>Primer nombre</strong></td>
    <td bgcolor="Honeydew"><strong>segundo nombre</strong></td>
    <td bgcolor="Honeydew"><strong>primer apellido</strong></td>
    <td bgcolor="Honeydew"><strong>segundo apellido</strong></td>
    <td bgcolor="Honeydew"><strong>especialidad</strong></td>
  
  </tr>
  
<?php
$sql="SELECT carnet, nombre1, nombre2, apellido1, apellido2, especialidades.especialidad FROM alumnos, registrospp, especialidades WHERE alumnos.especialidad = especialidades.id_especialidad AND alumnos.carnet = registrospp.alumno AND finalizo =1";
$valores = array(null);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$nombre1=$res["nombre1"];
	$nombre2=$res["nombre2"];
	$carnet=$res["carnet"];
	$especialidad=$res["especialidad"];

?>  
 <tr>
	<td><?php echo $nombre1; ?></td>
	<td><?php echo $nombre2; ?></td>
	<td><?php echo $carnet; ?></td>
	<td><?php echo $especialidad; ?></td>
                   
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
