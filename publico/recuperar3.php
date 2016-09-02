<!-- Primero referenciamos los archivos que enlazan las clases de conexion, las consultas y las validaciones -->
<?php
require("../bibliotecas/conexion.php");
session_start();
//Se revisa que los campos esten vacios para validarlos y se empieza con los procesos
if($_SESSION['tipo_usuario'] == 2){
if(!empty($_POST))
{
    $clave1 = $_POST['clave1'];
  	$clave2 = $_POST['clave2'];
  	try
    {
		//Se verifica que las claves esten vacias
      	if(strip_tags(trim($clave1)) != "" && strip_tags(trim($clave2)) != "")
  		{
              if($clave1 == $clave2){
				  if($_SESSION['id_exalumno'] != $clave1){
					  $clave_nueva = password_hash($clave1, PASSWORD_DEFAULT);
                  	  //Se realiza la consulta actualizar la clave
                  	  $sql = "UPDATE ex_alumnos SET contraseña = ? WHERE id_exalumnos = ?";
                  	  $param = array($clave_nueva, $_SESSION['id_exalumno']);
				  	  Database::executeRow($sql, $param);
            	  	  header("location: index.php");
				  }
				  else{
					  //La clave no puede lo mismo que el codigo
					  throw new Exception("La clave ingresada no puede ser igual a su código");
				  }
              }
              else{
                  //Si las claves no son iguales no deja pasar
                  throw new Exception("Las claves deben ser iguales");
              }
	  	}
	  	else
	  	{
	    	throw new Exception("Debes ingresar datos en los campos de clave");
	  	}
    }
	//Por medio de este catch se capturan todos los errores que pueden surgir
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
}
if($_SESSION['tipo_usuario'] == 1){
if(!empty($_POST))
{
    $clave1 = $_POST['clave1'];
  	$clave2 = $_POST['clave2'];
  	try
    {
		//Se verifica que las claves esten vacias
      	if(strip_tags(trim($clave1)) != "" && strip_tags(trim($clave2)) != "")
  		{
              if($clave1 == $clave2){
				  if($_SESSION['carnet'] != $clave1){
					  $clave_nueva = password_hash($clave1, PASSWORD_DEFAULT);
					  //Se realiza la consulta actualizar la clave
					  $sql = "UPDATE alumnos SET contraseña = ? WHERE carnet = ?";
					  $param = array($clave_nueva, $_SESSION['carnet']);
					  Database::executeRow($sql, $param);
					  header("location: index.php");
				  }
				  else{
					  //La clave no puede lo mismo que el codigo
					  throw new Exception("La clave ingresada no puede ser igual a su código");
				  }
              }
              else{
                  //Si las claves no son iguales no deja pasar
                  throw new Exception("Las claves deben ser iguales");
              }
	  	}
	  	else
	  	{
	    	throw new Exception("Debes ingresar datos en los campos de clave");
	  	}
    }
	//Por medio de este catch se capturan todos los errores que pueden surgir
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
}
?>
<!-- Se crea el formulario de login -->
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
			<!-- Se crea el formulario de restauracion de clave -->
			<form class='row' method='post' autocomplete='off'>
				<div class='row'>
					<div class='input-field col m12 offset-m3 s12'>
						<i class='material-icons prefix'>lock</i>
						<input id='clave1' type='password' name='clave1' minlength='6' maxlength='25' class='validate' required/>
						<label class='active black-text' for='clave1'>Nueva clave:</label>
					</div>
                    <div class='input-field col m12 offset-m3 s12'>
						<i class='material-icons prefix'>lock</i>
						<input id='clave2' type='password' name='clave2' minlength='6' maxlength='25'class='validate' required/>
						<label class='active black-text' for='clave2'>Confirmar clave:</label>
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