<?php
ob_start();
session_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
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
                        <title>Exalumnos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                    <div id='fixednav' class='navbar-fixed'>
                    <nav class='orange lighten-1 z-depth-2'>
                    <div  id='nav' class=''>
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
    $create = strip_tags(trim($_POST['create']));
    $update = strip_tags(trim($_POST['update']));
    $delete = strip_tags(trim($_POST['delete']));
    //Se declaran las consultas
    try 
    {
      	if($contraseña == $contraseña2)
          {
              
                if(isset($_POST['g-recaptcha-response']))
                        {
                            $captcha=$_POST['g-recaptcha-response'];
                        }
                        if (!$captcha) 
                        {
                           print("<div class='card-panel red'><i class='material-icons left'>llena todo los campos</i></div>");
                        }
                        $url = 'https://www.google.com/recaptcha/api/siteverify';
                        $llave = "6Ld5KygTAAAAAHeMM5B63xFqlDzsRnB0-zW9f8oD";
                        $resultado = file_get_contents($url."?secret=.".$llave."&response=".$_POST['g-recaptcha-response']."");
                        $data = json_decode($resultado,true);
                        if (isset($data->success) AND $data->success==true) {
                            print("<div class='card-panel red'><i class='material-icons left'>spamer</i></div>");
                           
                        }
                        else
                            {
                                $hash = password_hash($contraseña, PASSWORD_DEFAULT);
            $sql = "INSERT INTO administradores(codigo_admin, contraseña_admin, correo, permiso_create, permiso_update, permiso_delete) VALUES(?, ?, ?, ?, ?, ?)";
            $params = array($codigo, $hash, $correo, $create, $update, $delete);
            Database::executeRow($sql, $params);
            header("location: ../publico/login.php");
                            }
          }
          else{
             print("<div class='card-panel red'><i class='material-icons left'>error</i>Las contraseñas no son iguales</div>"); 
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
                        <input id='cod' type='text' name='cod' class='validate' length='50' maxlenght='50' required/>
                        <label class="active" for='cod'>Codigo de admin (Codigo brindado por institucion):</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña' type='password' name='contraseña' class='validate' length='50' maxlenght='50' required/>
                        <label class="active" for='contraseña'>Contraseña:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña2' type='password' name='contraseña2' class='validate' length='50' maxlenght='50' required/>
                        <label class="active" for='contraseña2'>Vuelva a introducir su contraseña:</label>
                    </div>
                    <div class='file-field input-field col s12 m6'>
                        <i class='material-icons prefix'>mail_outline</i>
                        <input id='correo_electronico' type='text' name='correo_electronico' class='validate' length='50' maxlenght='50'/>
                        <label class="active" for='correo_electronico'>Correo Electrónico:</label>
                        <BR>
                <div class="g-recaptcha" data-theme="dark" data-sitekey="6Lf9QiYTAAAAAG93eoZBNCZG0FVGOPevW3bhugra"></div>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m3'>
                        <label class="active">Permiso de Crear</label>
                        <input id='c_si' type='radio' name='create' class='with-gap' value='1'/>
                        <label for='c_si'><i class='material-icons'>check</i></label>
                        <input id='c_no' type='radio' name='create' class='with-gap' value='0'/>
                        <label for='c_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <label class="active">Permiso de Actualizar</label>
                        <input id='u_si' type='radio' name='update' class='with-gap' value='1'/>
                        <label for='u_si'><i class='material-icons'>check</i></label>
                        <input id='u_no' type='radio' name='update' class='with-gap' value='0'/>
                        <label for='u_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <label class="active">Permiso de Borrar</label>
                        <input id='d_si' type='radio' name='delete' class='with-gap' value='1'/>
                        <label for='d_si'><i class='material-icons'>check</i></label>
                        <input id='d_no' type='radio' name='delete' class='with-gap' value='0'/>
                        <label for='d_no'><i class='material-icons'>cancel</i></label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='exalumnos_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
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