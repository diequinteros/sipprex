<!-- Se referencia el archivo de la conexion y nuestras clases -->
<?php
session_start(); 
require("../bibliotecas/conexion.php"); 
?>
<!-- Se especifica el tipo de documento "html" -->
<!DOCTYPE html>
<!-- Se especifica el idioma del sitio, en este caso español -->
<html lang="es">
	<head>
		<title>Exalumnos</title>
		<!-- Se incluye el archivo que llama nuestras hojas de estilo -->
		<?php include '../inc/styles.php'; ?>
	</head>
	<body>
		<?php include('../inc/nav.php'); ?>
		<div class="card-panel paneles">
			<!-- Se crea el formulario de busqueda -->
			<div class="titulo">
				<h3>Ex-alumnos</h3>
			</div>
			<br>
			<form method='post' autocomplete="off" class='row'>
				<div class='input-field col s6 m4'>
					<i class='material-icons prefix'>search</i>
					<input id='buscar' type='text' name='buscar' class='validate'/>
					<label for='buscar' class='active'>Búsqueda</label>
				</div>
				<div class='input-field col s6 m4'>
					<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Buscar</button> 	
				</div>
				<!-- Se incluye el boton de agregar un nuevo ex-alumno -->
				<div class='input-field col s12 m4'>
					<a href='exalumnos_save.php' class='btn indigo'><i class='material-icons right'>add_circle</i>Nuevo</a>
				</div>
			</form>
		</div>
		<!-- Se realizan las operaciones de busqueda con la consulta "SELECT" -->
		<?php
		if(!empty($_POST))
		{
			$search = strip_tags(trim($_POST['buscar']));
			$sql = "SELECT * FROM ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion AND apellido1 LIKE ? ORDER BY id_exalumnos";
			$params = array("%$search%");
		}
		else
		{
			$sql = "SELECT * FROM ex_alumnos, ocupaciones WHERE ocupaciones.id_ocupacion = ex_alumnos.ocupacion ORDER BY id_exalumnos";
			$params = null;
		}
		//A traves de un arreglo se muestran los datos en la tabla 
		$data = Database::getRows($sql, $params);
		if($data != null)
		{
			$tabla = 	"<div class='card-panel paneles'>
							<table class='centered striped responsive-table'>
								<thead>
									<tr>
										<th>Código</th>
										<th>Nombre</th>
										<th>Apellido</th>
										<th>Teléfono</th>
										<th>Ocupación</th>
										<th>Email</th>
										<th>Observación</th>
										<th>Acción</th>
									</tr>
								</thead>
								<tbody>";
				foreach($data as $row)
				{
					$tabla .= 	"<tr>
									<td>".htmlspecialchars($row['id_exalumnos'])."</td>
									<td>".htmlspecialchars($row['nombre1'])."</td>
									<td>".htmlspecialchars($row['apellido1'])."</td>
									<td>".htmlspecialchars($row['telefono'])."</td>
									<td>".htmlspecialchars($row['ocupacion'])."</td>
									<td>".htmlspecialchars($row['correo_electronico'])."</td>
									<td>".htmlspecialchars($row['observacion'])."</td>
									<td>
										<a href='exalumnos_save.php?id=$row[id_exalumnos]' class='btn blue'><i class='material-icons'>edit</i></a>
										<a href='exalumnos_delete.php?id=$row[id_exalumnos]' class='btn red'><i class='material-icons'>delete</i></a>
									</td>
								</tr>";
				}
				$tabla .= "</tbody>
						</table>
					</div>";
			print($tabla);
		}
		else
		{
			print("<br><div class='card-panel paneles'><i class='material-icons left'>warning</i>No hay registros.</div>");
		}
	?>
	<!-- Se incluye el archivo que referencia los scripts del sitios -->
	<?php include '../inc/scripts.php'; ?>
	</body>
	<!-- Asi como el footer del sitio -->
	<?php require("../inc/footer.php"); ?>
</html>