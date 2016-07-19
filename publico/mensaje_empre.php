<html>
  <?php
   require("../bibliotecas/conexion.php");
   require("../bibliotecas/validator.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
	<?php
      //include("../inc/nav.php");
      ?>
      <div class="container">
      </div>
<?php
if(empty($_GET) && !isset($_GET['id']))
{
	header("location:buscar_empresa.php");
}
else{
    $id = $_GET['id'];
}
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
    $email = $_POST['email'];
    $nombre = $_POST['nombre'];
    if(trim($email)!="" && $email != null && trim($nombre)!="" && $nombre != null){
        $sql = "INSERT INTO mensajes(id_empre_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
        $sqlNombre = "SELECT nombre_empresa FROM empresas WHERE id_empresa = ?";
        $parametrosNombre = array($id);
        $nombre_empre = Database::getRow($sqlNombre, $parametrosNombre);
        $titulo = "MENSAJE DEL SISTEMA - EMPRESA CON ID: ".$id." Y NOMBRE: ".$nombre_empre['nombre_empresa']." SOLICITA USUARIO Y CONTRASEÑA";
        $conte = "CORREO EMPRESA: ".$email." AL PROPIETARIO: ".$nombre;
        $params = array($id, $titulo, $conte);
        Database::executeRow($sql,$params);
        header("location: mensaje_enviado.php");
    }
}
?>
<div class="container z-depth-5">
<ul class="collection with-header">
<?php
        //<li> class="collection-header"><h5>Mensaje a administrador de empresa </h5></li>
?>
<form  method='post' enctype='multipart/form-data'>
        <li class="collection-item">
            <div class="input-field col s12">
            <input id="email" name="email" type="email" class="validate">
            <label for="email" data-error="wrong" data-success="right">Email donde enviar usuario y contraseña</label>
            </div>
        </li>
        <li class="collection-item">
            <div class="input-field col s12">
            <input id="nombre" name="nombre" type="text" class="validate">
            <label for="nombre">Nombre de propietario de correo</label>
            </div>
        </li>
        <li>
        <div class="center-align">
            <button class="btn waves-effect waves-light" type="submit" name="action">Enviar mensaje
                <i class="material-icons right">send</i>
            </button>
            <a class="waves-effect waves-light btn red" href="buscar_empresa.php"><i class="material-icons right">clear</i>cancelar</a>
        </div>
        </li>
      </ul>
      </div>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
	</body>
</html>