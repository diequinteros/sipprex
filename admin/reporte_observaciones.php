<!DOCTYPE >
<html >
<?php
    require("../bibliotecas/conexion.php");
    header("Content-type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Reporte_Observaciones.xls");
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="8" bgcolor="DarkCyan"><CENTER><strong><font color="white">Reporte de Observaciones por Alumno</font></font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="Honeydew"><strong>CARNET</strong></td>
    <td bgcolor="Honeydew"><strong>Alumno</strong></td>
    <td bgcolor="Honeydew"><strong>Grado</strong></td>
    <td bgcolor="Honeydew"><strong>Especialidad</strong></td>
    <td bgcolor="Honeydew"><strong>Grupo Técnico</strong></td>
    <td bgcolor="Honeydew"><strong>Grupo Académico</strong></td>
    <td bgcolor="Honeydew"><strong>Observaciones Técnicas</strong></td>
    <td bgcolor="Honeydew"><strong>Observaciones Finales</strong></td>
  </tr>
  
<?php
$alumno = base64_decode($_GET["id"]);
$sql="SELECT * FROM alumnos, registrospp, especialidades WHERE alumnos.especialidad = especialidades.id_especialidad AND alumnos.carnet = registrospp.alumno AND id_registropp = ?";
$valores = array($alumno);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$carnet = $res["carnet"];
	$nombre = $res["nombre1"]." ".$res["nombre2"]." ".$res["apellido1"]." ".$res["apellido2"];
	$grado = $res["grado"];
	$especialidad = $res["especialidad"];
    $grupo_t = $res["grupo_Tecnic"];
    $grupo_a = $res["grupo_academ"];
    $observaciones_t = $res["observaciones_tecnicas"];
    $observaciones_f = $res["observacion_final"];
?>  
 <tr>
	<td><?php echo $carnet; ?></td>
	<td><?php echo $nombre; ?></td>
	<td><?php echo $grado; ?></td>
	<td><?php echo $especialidad; ?></td>
    <td><?php echo $grupo_t; ?></td>
    <td><?php echo $grupo_a; ?></td>
    <td><?php echo $observaciones_t; ?></td>
    <td><?php echo $observaciones_f; ?></td>     
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
