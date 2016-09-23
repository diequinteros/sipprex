<!-- Se referencia el archivo de la conexion y nuestras clases -->
<?php
ob_start();
session_start();
 require("../bibliotecas/conexion.php"); 
 ?>
<!-- Se especifica el tipo de documento "html" -->
<!DOCTYPE html>
<!-- Se especifica el idioma del sitio, en este caso español -->
<html lang="es">
	<head>
		<title>Proyectos</title>
		<!-- Se incluye el archivo que llama nuestras hojas de estilo -->
		<?php include '../inc/styles.php'; ?>
	</head>
	<body>
		<?php include("../inc/nav.php"); ?>
		<div class="card-panel paneles">
			<!-- Se crea el formulario de busqueda -->
			<div class="titulo">
				<h3>Proyectos</h3>
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
			</form>
			<a class="btn" href="reporte_proyectos.php"><i class="material-icons prefix">assignment</i> Lista de Proyectos Vigentes</a>
		</div>
		<!-- Se realizan las operaciones de busqueda con la consulta "SELECT" -->
		<?php
		if(!empty($_POST))
		{
			$search = strip_tags(trim($_POST['buscar']));
			$sql = "SELECT id_proyecto, titulo, descripcion, remunerado, fecha_propuesto, id_empre_encargado, id_exalum_encargado FROM proyecto WHERE titulo LIKE ? ORDER BY id_proyecto";
			$params = array("%$search%");
		}
		else
		{
			$sql = "SELECT id_proyecto, titulo, descripcion, remunerado, fecha_propuesto, id_empre_encargado, id_exalum_encargado FROM proyecto ORDER BY id_proyecto";
			$params = array(null);
		}
		//A traves de un arreglo se muestran los datos en la tabla 
		$data = Database::getRows($sql, $params);
		if($data != null)
		{
			$tabla = 	"<div class='card-panel paneles'>
							<table class='centered striped responsive-table'>
								<thead>
									<tr>
										<th>ID</th>
										<th>Titulo del proyecto</th>
										<th>Descripcion del proyecto</th>
										<th>Encargado</th>
										<th>remunerado</th>
									</tr>
								</thead>
								<tbody>";
				foreach($data as $row)
				{
					$tabla .= 	"<tr>
									<td>".htmlspecialchars($row['id_proyecto'])."</td>
									<td>".htmlspecialchars($row['titulo'])."</td>";
									$tabla .=		"<td>".htmlspecialchars($row['descripcion'])."</td>";
									if($row['id_empre_encargado'] != null){
										$sqlEn = "SELECT * FROM empresas WHERE id_empresa = ?";
										$params = array($row['id_empre_encargado']);
										$dats = Database::getRow($sqlEn,$params);
									$tabla .= "<td>".htmlspecialchars($dats['nombre_empresa'])."</td>";
									}
									else{
										$sqlEn = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ?";
										$params = array($row['id_exalum_encargado']);
										$dats = Database::getRow($sqlEn,$params);
										$tabla .=	"<td>".htmlspecialchars($dats['nombre1'])." ".htmlspecialchars($dats['apellido1'])."</td>";
									}
					
									if($row['remunerado'] == 1){
										$tabla .= "<td>Sí</td>";
									}
									else{
										$tabla .= "<td>No</td>";
									}
					$tabla .=	"	<td>
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
<?php
ob_end_flush();
?>