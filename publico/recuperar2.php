<!-- Primero referenciamos los archivos que enlazan las clases de conexion, las consultas y las validaciones -->
<?php
require("../bibliotecas/conexion.php");
require_once '../email/phpmailer/PHPMailerAutoload.php';
session_start();
if($_SESSION['tipo_usuario'] == 1 || $_SESSION['tipo_usuario'] == 2){
	if($_SESSION['tipo_usuario'] == 1){
		//Se revisa que los campos esten vacios para validarlos y se empieza con los procesos
	if(!empty($_POST))
	{
		if($_SESSION['tipo_usuario'])
		$respuesta = $_POST['respuesta'];
		try
		{
			//Se verifica que el la contraseña no este vacia no este vacio
			if(strip_tags(trim($respuesta)) != "")
			{
				//Se realiza la consulta para extraer su pregunta de seguridad
				$sql = "SELECT * FROM alumnos WHERE carnet = ? AND respuesta = ?";
				$param = array($_SESSION['carnet'], $respuesta);
				$data = Database::getRow($sql, $param);
				if($data != null)
				{
					header("location: recuperar3.php");
				}
				//Si la consulta no devuelve valores, el usuario no existe
				else
				{
					throw new Exception("Respuesta equivocada");
				}
			}
			else
			{
				throw new Exception("Debes ingresar una respuesta");
			}
		}
		//Por medio de este catch se capturan todos los errores que pueden surgir
		catch (Exception $error)
		{
			print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
		}
	}
	else
	{
		$sql = "SELECT * FROM alumnos WHERE carnet = ?";
		$params = array($_SESSION['carnet']);
		$data = Database::getRow($sql, $params);
		$pregunta = $data['pregunta'];
		$respuesta = $data['respuesta'];
	}
	?>
	<!-- Se crea el formulario de respuesta -->
	<!-- Se especifica el tipo de documento, html -->
	<!DOCTYPE html>
	<!-- Se especifica el idioma del sitio, español -->
	<html lang='es'>
		<head>
			<title>Recuperación</title>
			<!-- Se relaciona el archivo que referencia las hojas de estilo del sitio -->
			<?php include '../inc/styles.php'; ?>
			<meta charset="utf-8">
		</head>
		<body>
		<a class='btn' href='index.php'><i class='material-icons'>home</i></a>
			<div class="log_form">
				<div class="center-align" id="log_tt">
					<h3>Recuperar contraseña</h3>
				</div>
				<!-- Se crea el formulario de respuesta -->
				<form class='row' method='post'autocomplete='off'>
					<div class='row'>
						<div class='input-field col m12 offset-m3 s12'>
							<i class='material-icons prefix'>lightbulb_outline</i>
							<input id='pregunta' type='text' name='pregunta' class='validate'  value='<?php print($pregunta); ?>' disabled/>
							<label class='active black-text' for='pregunta'>Pregunta:</label>
						</div>
						<div class='input-field col m12 offset-m3 s12'>
							<i class='material-icons prefix'>settings_voice</i>
							<input id='respuesta' type='text' name='respuesta' class='validate' required/>
							<label class='active black-text' for='respuesta'>Respuesta:</label>
						</div>
					</div>
					<div class="center-align">
						<button type='submit' class='btn blue'><i class='material-icons right'>swap_horiz</i>Aceptar</button>
					</div>
				</form>
			</div>
			<!-- Por ultimo se relaciona el archivo que enlaza los scripts del sitio -->
			<?php include '../inc/scripts.php'; ?>
			<!-- Asi como el footer del sitio -->
			<?php require("../inc/footer.php"); ?>
        </body>
    </html>
    <?php
	}
    if($_SESSION['tipo_usuario'] == 2){
		//Se revisa que los campos esten vacios para validarlos y se empieza con los procesos
	if(!empty($_POST))
	{
		if($_SESSION['tipo_usuario'])
		$respuesta = $_POST['respuesta'];
		try
		{
			//Se verifica que el la contraseña no este vacia no este vacio
			if(strip_tags(trim($respuesta)) != "")
			{
				//Se realiza la consulta para extraer su pregunta de seguridad
				$sql = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ? AND respuesta = ?";
				$param = array($_SESSION['id_exalumno'], $respuesta);
				$data = Database::getRow($sql, $param);
				if($data != null)
				{
					header("location: recuperar3.php");
				}
				//Si la consulta no devuelve valores, el usuario no existe
				else
				{
					throw new Exception("Respuesta equivocada");
				}
			}
			else
			{
				throw new Exception("Debes ingresar una respuesta");
			}
		}
		//Por medio de este catch se capturan todos los errores que pueden surgir
		catch (Exception $error)
		{
			print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
		}
	}
	else
	{
		$sql = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ?";
		$params = array($_SESSION['id_exalumno']);
		$data = Database::getRow($sql, $params);
		$pregunta = $data['pregunta'];
		$respuesta = $data['respuesta'];
	}
	?>
	<!-- Se crea el formulario de respuesta -->
	<!-- Se especifica el tipo de documento, html -->
	<!DOCTYPE html>
	<!-- Se especifica el idioma del sitio, español -->
	<html lang='es'>
		<head>
			<title>Recuperación</title>
			<!-- Se relaciona el archivo que referencia las hojas de estilo del sitio -->
			<?php include '../inc/styles.php'; ?>
			<meta charset="utf-8">
		</head>
		<body>
		<a class='btn' href='index.php'><i class='material-icons'>home</i></a>
			<div class="log_form">
				<div class="center-align" id="log_tt">
					<h3>Recuperar contraseña</h3>
				</div>
				<!-- Se crea el formulario de respuesta -->
				<form class='row' method='post' autocomplete='off'>
					<div class='row'>
						<div class='input-field col m12 offset-m3 s12'>
							<i class='material-icons prefix'>lightbulb_outline</i>
							<input id='pregunta' type='text' name='pregunta' class='validate'  value='<?php print($pregunta); ?>' disabled/>
							<label class='active black-text' for='pregunta'>Pregunta:</label>
						</div>
						<div class='input-field col m12 offset-m3 s12'>
							<i class='material-icons prefix'>settings_voice</i>
							<input id='respuesta' type='text' name='respuesta' class='validate' required/>
							<label class='active black-text' for='respuesta'>Respuesta:</label>
						</div>
					</div>
					<div class="center-align">
						<button type='submit' class='btn blue'><i class='material-icons right'>swap_horiz</i>Aceptar</button>
					</div>
				</form>
			</div>
			<!-- Por ultimo se relaciona el archivo que enlaza los scripts del sitio -->
			<?php include '../inc/scripts.php'; ?>
			<!-- Asi como el footer del sitio -->
			<?php require("../inc/footer.php"); ?>
        </body>
    </html>
    <?php
	}
}
if($_SESSION['tipo_usuario'] == 3 || $_SESSION['tipo_usuario'] == 4){
    if($_SESSION['tipo_usuario'] == 3){
        $sql = "SELECT correo FROM empresas WHERE id_empresa = ?";
        $param = array($_SESSION['id_empresa']);
        $data = Database::getRow($sql, $param);
    }    
}
?>