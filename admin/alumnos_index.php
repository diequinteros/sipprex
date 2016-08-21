<!-- Se referencia el archivo de la conexion y nuestras clases -->
<?php
 require("../bibliotecas/conexion.php");
 session_start(); 
 ?>
<!-- Se especifica el tipo de documento "html" -->
<!DOCTYPE html>
<!-- Se especifica el idioma del sitio, en este caso español -->
<html lang="es">
	<head>
		<title>Alumnos</title>
		<!-- Se incluye el archivo que llama nuestras hojas de estilo -->
		<?php include '../inc/styles.php'; ?>
	</head>
	<body>
		<?php include("../inc/nav.php")?>
		<div class="card-panel paneles">
			<!-- Se crea el formulario de busqueda -->
			<div class="titulo">
				<h3>Alumnos</h3>
			</div>
			<br>
			<form method='post' autocomplete="off" class='row'>
				<div class='input-field col s6 m4'>
					<i class='material-icons prefix'>search</i>
					<input id='buscar' autocomplete="off" type='text' name='buscar' class='validate'/>
					<label for='buscar' class='active'>Búsqueda</label>
				</div>
				<div class='input-field col s6 m4'>
					<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Buscar</button> 	
				</div>
				<!-- Se incluye el boton de agregar un nuevo ex-alumno -->
				<div class='input-field col s12 m4'>
					<a href='alumnos_save.php' class='btn indigo'><i class='material-icons right'>add_circle</i>Nuevo</a>
				</div>
			</form>
		</div>
		<!-- Se realizan las operaciones de busqueda con la consulta "SELECT" -->
		<?php
		if(!empty($_POST))
		{
			$search = strip_tags(trim($_POST['buscar']));
			$sql = "SELECT * FROM alumnos, años, especialidades, grupo_tecnico, secciones, grupo_academico WHERE alumnos.grado = años.id_año AND alumnos.especialidad = especialidades.id_especialidad AND alumnos.grupo_Tecnic = grupo_tecnico.id_grupo_tec AND alumnos.secc = secciones.id_seccion AND alumnos.grupo_academ = grupo_academico.id_grupo_aca AND apellido1 LIKE ? ORDER BY carnet";
			$params = array("%$search%");
		}
		else
		{
			$sql = "SELECT * FROM alumnos, años, especialidades, grupo_tecnico, secciones, grupo_academico WHERE alumnos.grado = años.id_año AND alumnos.especialidad = especialidades.id_especialidad AND alumnos.grupo_Tecnic = grupo_tecnico.id_grupo_tec AND alumnos.secc = secciones.id_seccion AND alumnos.grupo_academ = grupo_academico.id_grupo_aca ORDER BY carnet";
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
										<th>NIE</th>
										<th>Grado</th>
										<th>Especialidad</th>
										<th>Grupo técnico</th>
										<th>Sección</th>
										<th>Grupo académico</th>
										<th>Inscrito</th>
										<th>Acción</th>
									</tr>
								</thead>
								<tbody>";
				foreach($data as $row)
				{
					$tabla .= 	"<tr>
									<td>$row[carnet]</td>
									<td>".htmlspecialchars($row['nombre1']).""." "."".htmlspecialchars($row['nombre2']).""." "."".htmlspecialchars($row['apellido1']).""." "."".htmlspecialchars($row['apellido2'])."</td>
									<td>".htmlspecialchars($row['nie'])."</td>
									<td>".htmlspecialchars($row['año'])."</td>
									<td>".htmlspecialchars($row['especialidad'])."</td>
									<td>".htmlspecialchars($row['grupo_tec'])."</td>
									<td>".htmlspecialchars($row['seccion'])."</td>
									<td>".htmlspecialchars($row['grupo_aca'])."</td>";
					if($row['inscrito'] == "VERDADERO"){
						$tabla .= "<td><i class='material-icons right'>check_circle</i></td>";
					}
					else{
						$tabla .= "<td><i class='material-icons right'>cancel</i></td>";
					}
					$tabla .=	"<td>
										<a href='alumnos_save.php?id=$row[carnet]' class='btn blue'><i class='material-icons'>edit</i></a>
										<a href='alumnos_delete.php?id=".base64_encode($row['carnet'])."' class='btn red'><i class='material-icons'>delete</i></a>
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