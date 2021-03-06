<?php
ob_start();
session_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
require("../bibliotecas/functions.php");
function comprobar_nombre_usuario($nombre_usuario){ 
   //compruebo que el tamaño del string sea válido. 
   if (strlen($nombre_usuario)<= 8 || strlen($nombre_usuario)> 4){ 
      print("<div class='card-panel red'><i class='material-icons left'>warning</i>El codigo puede tener maximo 8 caracteres y minimo 5.</div>"); 
      return false; 
   } 

   //compruebo que los caracteres sean los permitidos 
   $permitidos = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; 
   for ($i=0; $i<strlen($nombre_usuario); $i++){ 
      if (strpos($permitidos, substr($nombre_usuario,$i,1))===false){ 
         print("<div class='card-panel red'><i class='material-icons left'>warning</i>El codigo debe contener letras y numeros.</div>"); 
         return false; 
      } 
   }  
   return true; 
}
$sqlVeri = "SELECT COUNT(codigo_admin) FROM administradores";
	$params = null;
	$data = Database::getRow($sqlVeri, $params);
	if($data[0] > 0)
	{
		//header('location:../publico/index.php');
	}
//Se realizan los procesos necesarios para modificar e insertar

    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Administrador</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                    <div id='fixednav' class='navbar-fixed'>
                    <nav class='orange lighten-1 z-depth-2 extendido'>
                    <div  id='nav'>
                        <img id='imgnav' class='responsive-img hide-on-small-only' src='../img/iconSipprex.png' width='120'>
                        <a id = 'navlogo' href='index.php' class='brand-logo'>Sipprex</a>
                        <a href='#' data-activates='mobile-demo' class='button-collapse'><i class='material-icons'>menu</i></a>
                    </div>
                    </nav>
                    <div id='espa'></div>
                </div>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Cree un usuario administrador</h3>
                        </div>";
    print $head;
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$codigo = strip_tags(trim($_POST['cod']));
    $contraseña = strip_tags(trim($_POST['contraseña']));
    $contraseña2 = strip_tags(trim($_POST['contraseña2']));
    $correo = strip_tags(trim($_POST['correo_electronico']));
    //Se declaran las consultas
    try 
    {
        if(filter_var($correo, FILTER_VALIDATE_EMAIL))
        {
            if($contraseña == $contraseña2)
          {
              if(isset($_POST["g-recaptcha-response"]) && $_POST["g-recaptcha-response"])
                {
                    
                    $secret ="6Lff-CcTAAAAAJjQHKT4BcSGTPtEoQGn4lz_lE4f";
                    $id = $_SERVER["REMOTE_ADDR"];

                    $capt = $_POST["g-recaptcha-response"];

                    $res = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$capt&remoteid=$id");

                    //echo "<br>";
                    //var_dump($res);

                    $array = json_decode($res, TRUE);
                    echo "<br>";
                    if(!$array["success"])
                    {
                        if(comprobar_nombre_usuario($codigo))
                        {
                            $hash = password_hash($contraseña, PASSWORD_DEFAULT);
                            $sql = "INSERT INTO administradores(codigo_admin, contraseña_admin, correo, permiso_create, permiso_update, permiso_delete) VALUES(?, ?, ?, ?, ?, ?)";
                            $params = array($codigo, $hash, $correo, 1, 1, 1);
                            Database::executeRow($sql, $params);
                            header("location: ../publico/login.php");
                        }   
                    }     
                    else{
                        print("<div class='card-panel red'><i class='material-icons left'>warning</i>Eres un Spamer</div>");
                    }
                }
                else 
                {
                    throw new Exception("No se resolvio el reCaptcha");                    
                }
            }
            else 
            {
                throw new Exception("Las contraseñas son diferentes.");
            }
        }
        else{
        print("<div class='card-panel red'><i class='material-icons left'>error</i>El correo ingresado no es valido</div>");    
        }
      	
    }
                
       
    //En caso de error se muestra al administrador en turno
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<!-- Se crea nuestro formulario general ya sea de creacion o modificacion -->
            <form method='POST' class='row' autocomplete="off" enctype='multipart/form-data'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='cod' type='text' name='cod' class='validate tooltipped' data-position='bottom' data-delay='10' data-tooltip='El codigo no puede ser solo numerico debe contener una letra por lo menos, y debe contener entre 5 a 8 caracteres' length='50' maxlenght='50' required/>
                        <label class="active grey-text text-darken-4" for='cod'>Codigo de admin (Codigo brindado por institucion):</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña' type='password' name='contraseña' class='validate tooltipped' data-position='bottom' data-delay='10' data-tooltip='Ingrese su contraseña' length='50' maxlenght='50' required/>
                        <label class="active grey-text text-darken-4" for='contraseña'>Contraseña:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña2' type='password' name='contraseña2' class='validate tooltipped' data-position='bottom' data-delay='10' data-tooltip='Confirme su contraseña' length='50' maxlenght='50' required/>
                        <label class="active grey-text text-darken-4" for='contraseña2'>Vuelva a introducir su contraseña:</label>
                    </div>
                    <div class='file-field input-field col s12 m6'>
                        <i class='material-icons prefix'>mail_outline</i>
                        <input id='correo_electronico' type='text' name='correo_electronico' class='validate tooltipped' data-position='bottom' data-delay='10' data-tooltip='ejemplo@ejemplo.ejemplo' length='50' maxlenght='50' required/>
                        <label class="active grey-text text-darken-4" for='correo_electronico'>Correo Electrónico:</label>
                        <BR>
                <div class="g-recaptcha" data-theme="dark" data-sitekey="6Lf9QiYTAAAAAG93eoZBNCZG0FVGOPevW3bhugra"></div>
                    </div>
                </div>
                <div class='titulo'>
                    <button type='submit' class='btn blue tooltipped' data-position='bottom' data-delay='10' data-tooltip='Guardar primer administrador'><i class='material-icons right'>check_circle</i>Crear</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; ?>
        <?php include('../inc/footer.php'); ?>
        <script src='https://www.google.com/recaptcha/api.js'></script>
<script src="js/jquery.min"></script>
    </body>
</html>
<?php
ob_end_flush();
?>