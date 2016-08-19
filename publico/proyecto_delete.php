<!-- Se enlazan los archivos que contienen la conexion y las consultas a la base -->
<?php
require("../bibliotecas/conexion.php");
session_start();
//Se verifica que el id tenga un valor
if(!empty($_GET['id'])) 
{
    $id = base64_decode($_GET['id']);
}
//De lo contrario devuelve al index
else
{
    header("location: proyecto_index.php");
}

//Se envian los parametros a nuestra clase executeRows para la funcion delete 
if(!empty($_POST))
{
	$id = strip_tags(trim($_POST['id']));
	try 
	{
		$sql = "DELETE FROM proyecto WHERE id_proyecto = ?";
	    $params = array($id);
	    Database::executeRow($sql, $params);
	    header("location: proyecto_index.php");
	}
	//En caso de error se le muestra al administrador en turno 
	catch (Exception $error) 
	{
		print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
	}
}
?>
<!-- Se crea el formulario de eliminacion de datos -->
<!-- Se especifica el tipo de documento, en este caso html -->
<!DOCTYPE html>
<!-- El idioma del sitio sera español -->
<html lang="es">
	<head>
		<title>Proyecto</title>
		<!-- Se relaciona el archivo maestro que referencia las hojas de estilo del sitio -->
		<?php include '../inc/styles.php'; ?>
		<meta charset="utf-8">
	</head>
	<body>
		<div class="card-panel paneles">
			<div class="titulo">
				<h3>¿Eliminar Proyecto?</h3>
				<form method='post' class='row'>
					<input type='hidden' name='id' value='<?php print(htmlspecialchars($id)); ?>'/>
					<button type='submit' class='btn red'><i class='material-icons right'>check_circle</i>Si</button>
					<a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
				</form>
			</div>
		</div>
		<!-- Finalmente se enlaza el archivo maestro que referencia los scripts del sitio -->
		<?php include '../inc/scripts.php'; ?>
	</body>
</html>