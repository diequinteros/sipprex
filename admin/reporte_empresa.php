<!DOCTYPE >
<html >
<?php
  ob_start();
  session_start();
   require("../bibliotecas/conexion.php");
   require_once("../admin/dompdf/dompdf_config.inc.php");
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=Reporte_Personal_empresas.xls");


		$conexion=mysql_connect("admin_sipprex","sipprexricaldone","");
		mysql_select_db("empresas",$conexion);		


?>

<head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php
      include("../inc/nav.php");
      ?>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="6" bgcolor="skyblue"><CENTER><strong>REPORTE DE LA TABLA EMPRESA</strong></CENTER></td>
  </tr>
  <tr bgcolor="red">
    <td><strong>Nombre</strong></td>
    <td><strong>Contacto</strong></td>
    <td><strong>Telefono</strong></td>
    <td><strong>Correo</strong></td>
  </tr>
  
<?PHP
		
$sql=mysql_query("select nombre_empresa,contacto, telefono, correo from empresas");
while($res=mysql_fetch_array($sql)){		

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
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
</body>
</html>
<?php
ob_end_flush();
?>