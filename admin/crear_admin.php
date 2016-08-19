<?php
session_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");

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
    //Se declaran las consultas
    try 
    {
      	if($contraseña == $contraseña2)
          {
            $sql = "INSERT INTO administradores(codigo_admin, contraseña_admin, correo) VALUES(?, ?, ?)";
            $params = array($codigo, $contraseña, $correo);
            Database::executeRow($sql, $params);
            header("location: ../publico/login.php");
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
            <form method='post' class='row' enctype='multipart/form-data'>
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
    </body>
</html>