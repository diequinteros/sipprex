<!DOCTYPE >
<html >
<?php
  
    require("../bibliotecas/conexion.php");
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=Reporte_Personal_empresas.xls");


	


?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4" bgcolor="Teal"><CENTER><strong><font color="white">REPORTE DE LA TABLA EMPRESA</strong></CENTER></td>
  </tr>
  <tr>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Nombre</font></strong></td>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Contacto</font></strong></td>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Telefono</font></strong></td>
    <td bgcolor="LightSeaGreen"><strong><font color="white">Correo</font></strong></td>
  </tr>
  
<?php
$sql="select nombre_empresa,contacto, telefono, correo from empresas";
$valores = array(null);
$datos = Database::getRows($sql,$valores);
foreach($datos as $res)
{		
	$nombre=$res["nombre_empresa"];
	$contacto=$res["contacto"];
	$telefono=$res["telefono"];
	$correo=$res["correo"];
?>  
 <tr>
	<td><?php echo $nombre; ?></td>
	<td><?php echo $contacto; ?></td>
	<td><?php echo $telefono; ?></td>
	<td><?php echo $correo; ?></td>                  
 </tr> 
  <?php
}
  ?>
</table>
</body>
</html>
