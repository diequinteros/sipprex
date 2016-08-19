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
  	$clave = strip_tags(trim($_POST['clave']));
  	try
    {
		//Se verifica que el codigo y la clave no esten vacios
      	if($codigo != "" && $clave != "")
  		{
			  //Se realiza la consulta para ver si el codigo ingresado es de un ex-alumno, un alumno o un administrador
			  //Primero se evalua si es ex-alumno
  			$sql = "SELECT * FROM empresas WHERE codigo_empresa = ?";
		    $param = array($codigo);
		    $data = Database::getRows($sql, $param);
		    if($data != null)
		    {
		    	$hash = $data[0]['contraseña_empre'];
		    	if($clave == $hash) 
				//Si es ex-alumno, redirecciona al sitio publico del ex-alumno
		    	{
			    	$_SESSION['id_empresa'] = $data[0]['id_empresa'];
			      	$_SESSION['nombre_empresa'] = $data[0]['nombre_empres'];
					$sesU = uniqid().'_ses';
					$_SESSION['ses'] = $sesU;
					$sqlSes = "INSERT INTO sesiones_empre(unisesion, usuario, os) VALUES(?, ?, ?)";
					$parametros = array($sesU, $data[0]['id_empresa'], os_info($uagent));
					Database::executeRow($sqlSes, $parametros);
					$ahora = date("Y-n-j H:i:s");
					$_SESSION["ultimoAcceso"] = $ahora;
			      	header("location: index_empresa.php");
				}
				else 
				{
					throw new Exception("La clave ingresada es incorrecta.");
				}
		    }
			else{
			throw new Exception("No existe esta empresa.");	
			}
	  	}
	  	else
	  	{
	    	throw new Exception("Debe ingresar un codigo y una clave.");
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
	<body class="blue-grey darken-3">
		<div class="blue-grey darken-3 log_form">
			<div class="titulo" id="log_tt">
				<img class="img_responsive" src="../img/iconSipprex.png" width="150">
				<h3 class="white-text">Iniciar Sesión</h3>
			</div>
			<!-- Se crea el formulario de login -->
			<form class='row' method='post'>
				<div class='row'>
					<div class='input-field col m6 offset-m3 s12'>
						<i class='material-icons prefix blue-text'>person_pin</i>
						<input id='codigo' type='text' name='codigo' class='validate black-text' required/>
						<label class='active white-text' for='codigo'>Código</label>
					</div>
					<div class='input-field col m6 offset-m3 s12'>
						<i class='material-icons prefix blue-text'>vpn_key</i>
						<input id='clave' type='password' name='clave' class="validate black-text" required/>
						<label class='active white-text' for='clave'>Clave</label>
					</div>
				</div>
				<div class="titulo" id="log_btn">
					<button type='submit' class='btn blue'><i class='material-icons right'>swap_horiz</i>Ingresar</button>
					<br>
					<a href="recuperar.php">¿Olvidaste tu contraseña?</a>
				</div>
                <div class="titulo" id="log_btn">
					<a class='btn blue' href="buscar_empresa.php"><i class='material-icons right'>group_add</i>Crear cuenta</a>
				</div>
			</form>
		</div>
		<!--<div class='orange darken-1 log_foot'>
			<a class="waves-effect waves-teal btn-flat">Empresas</a>
		</div>-->
		        <footer class="page-footer blue-grey darken-4 log_foot">
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