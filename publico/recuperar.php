<!-- Primero referenciamos los archivos que enlazan las clases de conexion, las consultas y las validaciones -->
<?php
require("../bibliotecas/conexion.php");
session_start();
//Se revisa que los campos esten vacios para validarlos y se empieza con los procesos
if(!empty($_POST))
{
  	$carnet = $_POST['carnet'];
  	try
    {
		//Se verifica que el usuario no este vacio
      	if(strip_tags(trim($carnet)) != "")
  		{
			//Se realiza la consulta para ver si el usuario ingresado existe
            //Se verifica que tipo de usuario es para extraer su pregunta de recuperación
            //o enviarle un correo con su nueva contraseña
  			$sql = "SELECT * FROM alumnos WHERE carnet = ?";
		    $param = array($carnet);
		    $data = Database::getRow($sql, $param);
		    if($data != null)
		    {
		    	header("location: recuperar2.php");
				$_SESSION['carnet'] = $carnet;
				$_SESSION['tipo_usuario'] = 1;
            }
			//Si la consulta no devuelve valores, el usuario no existe
		    else
		    {
				$sql = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ?";
                $param = array($carnet);
                $data = Database::getRow($sql, $param);
                if($data != null){
                    header("location: recuperar2.php");
                    $_SESSION['id_exalumno'] = $carnet;
                    $_SESSION['tipo_usuario'] = 2;
                }
                else{
                    $sql = "SELECT * FROM empresas WHERE codigo_empresa = ?";
                    $param = array($carnet);
                    $data = Database::getRow($sql, $param);
                    if($data != null){
                        header("location: recuperar2.php");
                        $_SESSION['id_empresa'] = $carnet;
                        $_SESSION['tipo_usuario'] = 3;
                    }
                    else{
                        $sql = "SELECT * FROM administradores WHERE codigo_admin = ?";
                        $param = array($carnet);
                        $data = Database::getRow($sql, $param);
                        if($data != null){
                            header("location: recuperar2.php");
                            $_SESSION['codigo_admin'] = $carnet;
                            $_SESSION['tipo_usuario'] = 4;
                        }
                        else{
                            throw new Exception("No existe un usuario con ese codigo");
                        }
                    }
                }
		    }
	  	}
	  	else
	  	{
	    	throw new Exception("Debe ingresar un usuario");
	  	}
    }
	//Por medio de este catch se capturan todos los errores que pueden surgir
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
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
			<!-- Se crea el formulario de login -->
			<form class='row' method='post' autocomplete='off'>
				<div class='row'>
					<div class='input-field col m6 offset-m3 s6'>
						<i class='material-icons prefix'>person_pin</i>
						<input class='tooltipped' data-position='right' data-delay='25' data-tooltip='Ingrese su número de carnet' id='carnet' type='text' name='carnet' class='validate black-text'  maxlength='10' required />
						<label class='active black-text' for='carnet'>Código:</label>
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
        <?php include '../inc/footer.php'; ?>
	</body>
</html>