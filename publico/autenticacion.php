<!-- Primero referenciamos los archivos que enlazan las clases de conexion, las consultas y las validaciones -->
<?php
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
require("../bibliotecas/verios.php");
session_start();
//Se revisa que los campos esten vacios para validarlos y se empieza con los procesos
if(!empty($_POST))
{
	$_POST = validator::validateForm($_POST);
  	$codigo = strip_tags(trim($_POST['codigo']));
  	try
    {
		//Se verifica que el codigo y la clave no esten vacios
      	if($codigo != "")
  		{
			  //Se realiza la consulta para ver si el codigo ingresado es de un ex-alumno, un alumno o un administrador
			  //Primero se evalua si es ex-alumno
		    	if($codigo == $_SESSION['cod_secre']) 
				//Si es admin lo redireccionamos
		    	{
			    	$_SESSION['codigo_admin'] = $_SESSION['codigo_admin_sec'];
					$_SESSION['nombre_usuario'] = "Administrador";
					$sesU = uniqid().'_ses';
					$_SESSION['ses'] = $sesU;
					$sqlSes = "INSERT INTO sesiones(unisesion, usuario, os) VALUES(?, ?, ?)";
					$parametros = array($sesU, $_SESSION['codigo_admin'], os_info($uagent));
					Database::executeRow($sqlSes, $parametros);
					header("location: ../admin/index.php");
				}
				else 
				{
					throw new Exception("El codigo de verificacion no funciona.");
				}
	  	}
	  	else
	  	{
	    	throw new Exception("Debe ingresar el codigo enviado a su correo.");
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
		<title>Iniciar Sesion</title>
		<!-- Se relaciona el archivo que referencia las hojas de estilo del sitio -->
		<?php include '../inc/styles.php'; ?>
		<meta charset="utf-8">
	</head>
	<body class="orange lighten-1">
		<div class="orange lighten-1 log_form">
			<div class="titulo" id="log_tt">
				<img class="img_responsive" src="../img/iconSipprex.png" width="150">
				<h3 class="white-text">Iniciar Sesión</h3>
			</div>
			<!-- Se crea el formulario de login -->
			<form class='row' autocomplete="off" method='post'>
				<div class='row'>
				<h3 class="center-align">Introduzca el codigo enviado a su correo electronico</h3>
					<div class='input-field col m6 offset-m3 s12'>
						<input id='codigo' type='text' name='codigo' class='validate black-text' required/>
						<label class='active white-text' for='codigo'>Código de autenticacion</label>
					</div>
				</div>
				<div class="titulo" id="log_btn">
					<button type='submit' class='btn blue'><i class='material-icons right'>swap_horiz</i>Ingresar</button>
				</div>
                <div class="titulo" id="log_btn">
					<a class='btn blue' href="../bibliotecas/logout.php"><i class='material-icons right'>group_add</i>Cancelar</a>
				</div>
			</form>
		</div>
		<!--<div class='orange darken-1 log_foot'>
			<a class="waves-effect waves-teal btn-flat">Empresas</a>
		</div>-->
		        <footer class="page-footer orange darken-1 log_foot">
          <div class="">
            <div class="row">
              <div class="col l3 offset-l9 m4 offset-m8 s6 offset-s6">
                
              </div>
            </div>
          </div>
          
        </footer>
		<!-- Por ultimo se relaciona el archivo que enlaza los scripts del sitio -->
		<?php include '../inc/scripts.php'; ?>
	</body>
</html>