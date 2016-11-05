<html>
  <?php
  ob_start();
  session_start(); 
  require("../bibliotecas/conexion.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php
include("../inc/nav.php");

if(!empty($_GET['id'])) 
{
    $id = base64_decode($_GET['id']);
}
else
{
    header("location: registrospp_index.php");
}

if(!empty($_POST))
{
	$id = strip_tags(trim($_POST['id']));
	try 
	{
		$sqlA = "SELECT * FROM alumnos WHERE carnet = ?";
		$parame = array($id);
		$datos = Database::getRow($sqlA, $parame);
		$sqlE = "INSERT INTO ex_alumnos(id_exalumnos, contraseña, nombre1, apellido1) VALUES(?,?,?,?)";
		$parameex = array($id, $datos['contraseña'], $datos['nombre1'], $datos['apellido1']);
		Database::executeRow($sqlE, $parameex);
		$sql = "DELETE FROM alumnos WHERE carnet = ?";
	    $params = array($id);
	    Database::executeRow($sql, $params);
	    header("location: registrospp_index.php");
	} 
	catch (Exception $error) 
	{
		print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
	}
}
?>
<form method='post' class='row'>
<h3>¿Desea mover al alumno a los ex alumnos (Esto hara que su registro de practicas profesionales ya no sea visible en el sistema)?</h3>
	<input type='hidden' name='id' value='<?php print(htmlspecialchars($id)); ?>'/>
	<button type='submit' class='btn red'><i class='material-icons right'>check_circle</i>Si</button>
	<a href='registrospp_index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
	</body>
</html>
<?php
ob_end_flush();
?>