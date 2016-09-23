<!DOCTYPE >
<html >
<?php
  
    require("../bibliotecas/conexion.php");
    header("Content-type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Reporte_de_Proyectos_Disponibles.xls");
?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="6" bgcolor="DarkCyan"><CENTER><strong><font color="white">Reporte de Proyectos Vigentes</font></font></strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="Honeydew"><strong>ID_Proyecto</strong></td>
    <td bgcolor="Honeydew"><strong>Encargado</strong></td>
    <td bgcolor="Honeydew"><strong>Título</strong></td>
    <td bgcolor="Honeydew"><strong>Descripción</strong></td>
    <td bgcolor="Honeydew"><strong>Fecha de Propuesta</strong></td>
    <td bgcolor="Honeydew"><strong>¿Es Remunerado?</strong></td>  
  </tr>
  
<?php
$sql="SELECT * FROM proyecto WHERE vigente = 1";
$valores = array(null);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$id_proyecto = $res["id_proyecto"];
    if($res["id_exalum_encargado"] != null){
        $sql = "SELECT nombre1, apellido1 FROM exalumnos WHERE id_exalumnos = ?";
        $values = array($res["id_exalum_encargado"]);
        $data = Database::getRow($sql, $values);
        $encargado = $data["nombre1"]." ".$data["apellido1"];
    }
    if($res["id_empre_encargado"] != null){
        $sql = "SELECT nombre_empresa FROM empresas WHERE id_empresa = ?";
        $values = array($res["id_empre_encargado"]);
        $data = Database::getRow($sql, $values);
        $encargado = $data["nombre_empresa"];
    }
	$titulo = $res["titulo"];
	$descripcion = $res["descripcion"];
	$fecha = $res["fecha_propuesto"];
    $remunerado = $res["remunerado"]
?>  
 <tr>
	<td><?php echo $id_proyecto; ?></td>
	<td><?php echo $encargado; ?></td>
	<td><?php echo $titulo; ?></td>
	<td><?php echo $descripcion; ?></td>
    <td><?php echo $fecha; ?></td>
    <td><?php if($remunerado == 0){ echo "NO"; } elseif($remunerado == 1){ echo "SI"; }?></td>
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
