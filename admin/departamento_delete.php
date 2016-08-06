<!-- Se enlazan los archivos que contienen la conexion y las consultas a la base -->
<?php
session_start();
require("../bibliotecas/conexion.php");
//Se verifica que el id tenga un valor
if(!empty($_GET['id'])) 
{
    $id = $_GET['id'];
}
//De lo contrario devuelve al index
else
{
    header("location: departamento_index.php");
}

//Se envian los parametros a nuestra clase executeRows para la funcion delete 
if(!empty($_POST))
{
	$id = strip_tags(trim($_POST['id']));
	try 
	{
		$sql = "DELETE FROM departamentosempre WHERE id_depar = ?";
	    $params = array($id);
	    Database::executeRow($sql, $params);
	    header("location: departamaneto_index.php");
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
		<title>Departamentos</title>
		<!-- Se relaciona el archivo maestro que referencia las hojas de estilo del sitio -->
		<?php include '../inc/styles.php'; ?>
		<meta charset="utf-8">
	</head>
	<body>
		<div class="card-panel paneles">
			<div class="titulo">
				<h3>¿Eliminar departamento?</h3>
				<form method='post' class='row'>
					<input type='hidden' name='id' value='<?php print($id); ?>'/>
					<button type='submit' class='btn red'><i class='material-icons right'>check_circle</i>Si</button>
					<a href='departamento_index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
				</form>
			</div>
		</div>
		<!-- Finalmente se enlaza el archivo maestro que referencia los scripts del sitio -->
		<?php include '../inc/scripts.php'; ?>
	</body>
</html>