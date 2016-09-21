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
				<div class='input-field col s3 m2'>
					<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Buscar</button> 	
				</div>
				<!-- Se incluye el boton de agregar un nuevo ex-alumno -->
				<div class='input-field col s3 m2'>
					<a href='exalumnos_save.php' class='btn indigo'><i class='material-icons right'>add_circle</i>Nuevo</a>
				</div>
				<div class='input-field col s3 m2'>
					<a href='reporte_ex.php' class='btn indigo'><i class='material-icons right'>description</i>Reporte</a>
				</div>
			</form>
		</div>
		<!-- Se realizan las operaciones de busqueda con la consulta "SELECT" -->
		<?php
		$page = null;
		//Se toma la variable de paginacion
		if(!empty($_GET['page'])) {
			$page = strip_tags(trim(base64_decode($_GET['page'])));
		}
		//Si la variable de paginacion esta vacia se pone como 1
		if($page == null) {
			$page = 1;
		}
		//Si la variable es 1 el limite empezara desde 0
		if($page == "" || $page == "1")
		{
			$page1 = 0;
		}
		else {
		//Se multiplica la pagina por el numero de items que se muestran (24) y se restan 24 para poder empezar desde el siguiente producto 
			$page1 = ($page*20)-20; 
		}
		if(!empty($_POST))
		{
			$search = strip_tags(trim($_POST['buscar']));
			$sql = "SELECT * FROM ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion AND apellido1 LIKE ? ORDER BY id_exalumnos LIMIT $page1,20";
			$params = array("%$search%");
		}
		else
		{
			$sql = "SELECT * FROM ex_alumnos, ocupaciones WHERE ocupaciones.id_ocupacion = ex_alumnos.ocupacion ORDER BY id_exalumnos LIMIT $page1,20";
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
										<a href='exalumnos_save.php?id=".base64_encode(htmlspecialchars($row['id_exalumnos']))."' class='btn blue'><i class='material-icons'>edit</i></a>
										<a href='exalumnos_delete.php?id=".base64_encode(htmlspecialchars($row['id_exalumnos']))."' class='btn red'><i class='material-icons'>delete</i></a>
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
	<ul class="pagination center-align">
	<?php
	$cons2 = ("SELECT COUNT(id_exalumnos) FROM ex_alumnos");
            $parametros = null;
            $filas = Database::getRow($cons2, $parametros);
            $filas = $filas[0]/20;
            $filas = ceil($filas);
            //Si la paginacion es 1, el 1 estara deshabilitado
                if($page == 1)
                {
                    $pagi = "<li class='disabled'><a><i class='material-icons'>chevron_left</i></a></li>";
                }
                //caso contrario esta habilitado
                else {
                    $page2 = $page - 1;
                    $pagi = "<li class='waves-efect'><a href='exalumnos_index.php?page=".base64_encode($page2)."'><i class='material-icons'>chevron_left</i></a></li>";
                }
                //Se imprime cada pagina, si la pagina que se imprimio concide con el numero de pagina que se imprime se imprimira seleccionado
                for($i = 1; $i<=$filas; $i++) {
                    if($page==$i)
                    {
                     $pagi .= "<li class='active blue'><a href='exalumnos_index.php?page=".base64_encode($i)."'>$i</a></li>";
                    }
                    //Si no solo se imprimira
                    else{
                        $pagi .= "<li class='waves-effect'><a href='exalumnos_index.php?page=".base64_encode($i)."'>$i</a></li>";
                    }
                }
                //Al igual que si la pagina es la primera, si es la ultima se vera deshabilitada o no
                if($page == $filas)
                {
                    $pagi .= "<li class='disabled'><a><i class='material-icons'>chevron_right</i></a></li>";
                }
                else {
                    $page2 = $page + 1;
                    $pagi .= "<li class='waves-efect'><a href='exalumnos_index.php?page=".base64_encode($page2)."'><i class='material-icons'>chevron_right</i></a></li>";
                }
                print($pagi);
	?>
</ul>
	<!-- Se incluye el archivo que referencia los scripts del sitios -->
	<?php include '../inc/scripts.php'; ?>
	</body>
	<!-- Asi como el footer del sitio -->
	<?php require("../inc/footer.php"); ?>
</html>
<?php
ob_end_flush();
?>