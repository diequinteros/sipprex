<!-- Primero referenciamos los archivos que enlazan las clases de conexion, las consultas y las validaciones -->
<?php
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
require("../bibliotecas/verios.php");
require_once '../email/phpmailer/PHPMailerAutoload.php';
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
  			$sql = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ?";
		    $param = array($codigo);
		    $data = Database::getRow($sql, $param);
		    if($data != null)
		    {
		    	$hash = $data['contraseña'];
		    	if($clave == base64_decode($hash)) 
				//Si es ex-alumno, redirecciona al sitio publico del ex-alumno
		    	{
			    	$_SESSION['id_exalumnos'] = $data['id_exalumnos'];
			      	$_SESSION['nombre_usuario'] = $data['nombre1']." ".$data['apellido1'];
					$sesU = uniqid().'_ses';
					$_SESSION['ses'] = $sesU;
					$sqlSes = "INSERT INTO sesiones_exalum(unisesion, usuario, os) VALUES(?, ?, ?)";
					$parametros = array($sesU, $data['id_exalumnos'], os_info($uagent));
					Database::executeRow($sqlSes, $parametros);
					$ahora = date("Y-n-j H:i:s");
					$_SESSION["ultimoAcceso"] = $ahora;  
			      	header("location: index.php");
				}
				else 
				{
					throw new Exception("La clave ingresada es incorrecta.");
				}
		    }
			//Si no es ex-alumno continua evaluando las siguientes posibilidades
			//Se prueba si es alumno
		    else
		    {
		    	$sql = "SELECT * FROM alumnos WHERE carnet = ?";
				$param = array($codigo);
				$data = Database::getRow($sql, $param);
				if($data != null)
				//Si es asi, redirecciona al sitio publico del alumno
				{
					$hash = $data['contraseña'];
					if($clave == base64_decode($hash)) 
					{
						$_SESSION['carnet'] = $data['carnet'];
						$_SESSION['nombre_usuario'] = $data['nombre1']." ".$data['nombre2']." ".$data['apellido1']." ".$data['apellido2'];
						$sesU = uniqid().'_ses';
						$_SESSION['ses'] = $sesU;
						$sqlSes = "INSERT INTO sesiones_alum(unisesion, usuario, os) VALUES(?, ?, ?)";
						$parametros = array($sesU, $data['carnet'], os_info($uagent));
						Database::executeRow($sqlSes, $parametros);
						$ahora = date("Y-n-j H:i:s");
						$_SESSION["ultimoAcceso"] = $ahora;
						header("location: index.php");
					}
					else 
					{
						throw new Exception("La clave ingresada es incorrecta2.");
					}
				}
				//Como ultima instancia prueba a ver si el codigo es de un administrador
				else 
				{
					$sql = "SELECT * FROM administradores WHERE codigo_admin = ?";
					$param = array($codigo);
					$data = Database::getRow($sql, $param);
					if($data != null)
					//Si es asi, redirecciona al sitio privado o a la dashboard siendo estos los accesos del administrador
					{
						$hash = $data['contraseña_admin'];
						if(password_verify($clave, $hash)) 
						{
							/*$_SESSION['codigo_admin'] = $data[0]['codigo_admin'];
							$_SESSION['nombre_usuario'] = "Administrador";
							$sesU = uniqid().'_ses';
							$_SESSION['ses'] = $sesU;
							$sqlSes = "INSERT INTO sesiones(unisesion, usuario, os) VALUES(?, ?, ?)";
							$parametros = array($sesU, $data[0]['codigo_admin'], os_info($uagent));
							Database::executeRow($sqlSes, $parametros);*/
							function randomPassword() {
							//$alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
							$alphabet = '1234567890';
							$pass = array(); //remember to declare $pass as an array
							$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
							for ($i = 0; $i < 6; $i++) {
								$n = rand(0, $alphaLength);
								$pass[] = $alphabet[$n];
							}
							return implode($pass); //turn the array into a string

						}

						$pass = randomPassword();
						$_SESSION['cod_secre'] = $pass;
						$_SESSION['codigo_admin_sec'] = $data['codigo_admin'];
						$_SESSION['nombre_usuario_sec'] = "Administrador";
						$mail = new PHPMailer;
						$mail->CharSet = 'UTF-8';
						$mail->isSMTP();                                      // Set mailer to use SMTP
						$mail->SMTPDebug = 0;                               // Enable verbose debug output
						$mail->Debugoutput = 'html'; 
						
						$mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
						$mail->Port = 587;                                    // TCP port to connect to
						$mail->SMTPSecure = 'tls';                         // Enable TLS encryption, `ssl` also accepted
						$mail->SMTPAuth = true;                               // Enable SMTP authentication 
						$mail->Username = 'sipprex.ricaldone@gmail.com';                 // SMTP username
						$mail->Password = 'ricaldone1';                           // SMTP password
						$mail->setFrom('sipprex.ricaldone@gmail.com', 'Sipprex');
						$mail->addAddress($data['correo'],'');     // Add a recipient
						$mail->Subject = 'Codigo de autenticacion';
						$mail->Body    = 'El codigo de autenticacion es: '.$pass;
						$sqlFe = "SELECT ultimaemail FROM administradores WHERE codigo_admin = ?";
						$parm = array($_SESSION['codigo_admin_sec']);
						$fecha = Database::getRow($sqlFe, $parm);
						if($fecha['ultimaemail'] == null){
						$fecha['ultimaemail'] == 0;
						if($mail->send())
						{
							//echo "OK";
							$ahora = date("Y-n-j H:i:s");
							$_SESSION["ultimoAcceso"] = $ahora;
							header("location: autenticacion.php");
						}
						else
						{
							//echo "NO";
							print("<div class='card-panel red'><i class='material-icons left'>error</i>Ha ocurrido un error al enviar el codigo de autenticacion, por favor vuelve a intentarlo.</div>");
						}
						}
						else{
						if((strtotime(date('Y-m-d')) - strtotime($fecha['ultimaemail'])) < 172800){
							$ahora = date("Y-n-j H:i:s");
							$_SESSION["ultimoAcceso"] = $ahora;
							header("location: autenticacion.php");				
						}
						else{
							if($mail->send())
						{
							//echo "OK";
							$ahora = date("Y-n-j H:i:s");
							$_SESSION["ultimoAcceso"] = $ahora;
							header("location: autenticacion.php");
						}
						else
						{
							//echo "NO";
							print("<div class='card-panel red'><i class='material-icons left'>error</i>Ha ocurrido un error al enviar el codigo de autenticacion, por favor vuelve a intentarlo.</div>");
						}
						}
						}
						
						
						}
						else 
						{
							throw new Exception("La clave ingresada es incorrecta3.");
						}
					}
					//De lo contrario se le muestra un mensaje al usuario, advirtiendole que no existe usuario con ese codigo
					else
					{
						throw new Exception("No existe usuario con ese código.");
					}
				}
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
else{
	$sqlVeri = "SELECT COUNT(codigo_admin) FROM administradores";
	$params = null;
	$data = Database::getRow($sqlVeri, $params);
	if($data[0] < 1)
	{
		header('location:../admin/crear_priadmin.php');
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
				<h3>Iniciar Sesión</h3>
			</div>
			<!-- Se crea el formulario de login -->
			<form class='row'autocomplete="off" method='post'>
				<div class='row'>
					<div class='input-field col m6 offset-m3 s12'>
						<i class='material-icons prefix'>person_pin</i>
						<input id='codigo' autocomplete="off" type='text' name='codigo' class='validate black-text' required/>
						<label class='active black-text' for='codigo'>Código</label>
					</div>
					<div class='input-field col m6 offset-m3 s12'>
						<i class='material-icons prefix'>vpn_key</i>
						<input id='clave' type='password' autocomplete="off" name='clave' class="validate black-text" required/>
						<label class='active black-text' for='clave'>Clave</label>
					</div>
				</div>
				<div class="titulo" id="log_btn">
					<button type='submit' class='btn blue'><i class='material-icons right'>swap_horiz</i>Aceptar</button>
					<br>
					<a class='white-text' href="recuperar.php">¿Olvidaste tu contraseña? Haz clic aqui.</a>
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
                <a class="waves-effect waves-teal btn-flat" href="login_empre.php">Soy una empresa</a>
              </div>
            </div>
          </div>
          
        </footer>
		<!-- Por ultimo se relaciona el archivo que enlaza los scripts del sitio -->
		<?php include '../inc/scripts.php'; ?>
	</body>
</html>