<?php
session_start();
if(empty($_SESSION)&&empty($_GET))
{
header("location: ../publico/login.php");
}
$toadmin = null;
if(isset($_GET['toadmin'])){
    $id = 1;
}
?>
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
      include("../inc/nav_mail.php");
      ?>
      <div class="container">
      </div>
<?php
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
    $titulo = $_POST['titulo'];
    $conte = $_POST['contenido'];
    if(trim($titulo)!="" && $titulo != null && trim($conte)!="" && $conte != null && $id = 1){
        $sql = null;
        $params = null;
        if(isset($_SESSION['carnet'])){
            $sql = "INSERT INTO mensajes(id_usuario_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($_SESSION['carnet'], $titulo, $conte);
            print("entra");
        }
        if(isset($_SESSION['id_empresa'])){
            $sql = "INSERT INTO mensajes(id_empre_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($_SESSION['id_empresa'], $titulo, $conte);
            print("entra");
        }
        Database::executeRow($sql,$params);
        header("location: mail.php");
    }
}
?>
<div class="container z-depth-5">
<ul class="collection with-header">
<?php
        //<li> class="collection-header"><h5>Mensaje a administrador de empresa </h5></li>
        if(isset($_GET['toadmin']))
        {
            print("<form  method='post' action='enviar_mail.php?toadmin = true' enctype='multipart/form-data'>");
        }
?>

        <li class="collection-item">
            <div class="input-field col s12">
            <input id="nombre" name="titulo" type="text" class="validate">
            <label for="nombre">Titulo</label>
            </div>
        </li>
        <li class="collection-item">
            <div class="input-field col s12">
                <textarea id="textarea1" name="contenido" class="materialize-textarea"></textarea>
                <label for="textarea1">Mensaje</label>
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