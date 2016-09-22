<!DOCTYPE >
<html >
<?php
    require("../bibliotecas/conexion.php");
    header("Content-type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Alumnos_Pendientes.xls");
?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="7" bgcolor="DarkCyan"><CENTER><strong><font color="white">Reporte de Alumnos con Documentos Pendientes</font></font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="Honeydew"><strong>CARNET</strong></td>
    <td bgcolor="Honeydew"><strong>Nombre</strong></td>
    <td bgcolor="Honeydew"><strong>Grado</strong></td>
    <td bgcolor="Honeydew"><strong>Especialidad</strong></td>
    <td bgcolor="Honeydew"><strong>Grupo Técnico</strong></td>
    <td bgcolor="Honeydew"><strong>Grupo Académico</strong></td>
    <td bgcolor="Honeydew"><strong>Documentos Pendientes</strong></td>
  </tr>
<?php
$esp = $_POST["Especialidad"];
$sql="SELECT carnet, nombre1, nombre2, apellido1, apellido2, grado, especialidades.especialidad, grupo_Tecnic, grupo_academ, acuerdo, bitacora, carta, evaluaciones FROM alumnos, especialidades, registrospp WHERE alumnos.especialidad = especialidades.id_especialidad AND alumnos.carnet = registrospp.alumno AND (acuerdo IS NULL OR bitacora IS NULL OR carta IS NULL OR evaluaciones IS NULL) AND alumnos.especialidad = ?";
$valores = array($esp);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
    $Carnet = $res["carnet"];
    $Nombre = $res["nombre1"]." ".$res["nombre2"]." ".$res["apellido1"]." ".$res["apellido2"];
	$Grado = $res["grado"];
    $Especialidad = $res["especialidad"];
    $Grupo_Tecnico = $res["grupo_Tecnic"];
    $Grupo_Academico = $res["grupo_academ"];
    $Acuerdo = $res["acuerdo"];
    $Bitacora = $res["bitacora"];
    $Carta = $res["carta"];
    $Evaluaciones = $res["evaluaciones"];
    $Documentos_Pendientes = "";
    if($Acuerdo == null){
        $Documentos_Pendientes .= "Acuerdo ";
    }
    if($Bitacora == null){
        $Documentos_Pendientes .= "Bitacora ";
    }
    if($Carta == null){
        $Documentos_Pendientes .= "Carta ";
    }
    if($Evaluaciones == null){
        $Documentos_Pendientes .= "Evaluaciones ";
    }
    $Documentos_Pendientes .= "."
?>  
 <tr>
	<td><?php echo $Carnet; ?></td>
	<td><?php echo $Nombre; ?></td>
	<td><?php echo $Grado; ?></td>
	<td><?php echo $Especialidad; ?></td>
    <td><?php echo $Grupo_Tecnico; ?></td>  
    <td><?php echo $Grupo_Academico; ?></td>     
    <td><?php echo $Documentos_Pendientes; ?></td>        
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
