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
if(isset($_GET['toempresa']) || isset($_GET['toex']) || isset($_GET['toalum'])){
    $id = $_GET["id"];
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
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
    $titulo = $_POST['titulo'];
    $conte = $_POST['contenido'];
    if(trim($titulo)!="" && $titulo != null && trim($conte)!="" && $conte != null){
        $sql = null;
        $params = null;
        //Origen de alumno
        if(isset($_SESSION['carnet']) && isset($_GET['toadmin'])){
            $sql = "INSERT INTO mensajes(id_usuario_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($_SESSION['carnet'], $titulo, $conte);
            print("entra");
        }
        if(isset($_SESSION['carnet']) && isset($_GET['toempresa'])){
            $sql = "INSERT INTO mensajes(id_usuario_origen, id_empre_destino, titulo, contenido) VALUES(?,?,?, ?)";
            $params = array($_SESSION['carnet'], $id, $titulo, $conte);
            print("entra");
        }
        if(isset($_SESSION['carnet']) && isset($_GET['toex'])){
            $sql = "INSERT INTO mensajes(id_usuario_origen, id_exalum_destino, titulo, contenido) VALUES(?,?,?, ?)";
            $params = array($_SESSION['carnet'], $id, $titulo, $conte);
            print("entra");
        }
        //Orgen de empresa
        if(isset($_SESSION['id_empresa']) && isset($_GET['toadmin'])){
            $sql = "INSERT INTO mensajes(id_empre_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($_SESSION['id_empresa'], $titulo, $conte);
            print("entra");
        }
        if(isset($_SESSION['id_empresa']) && isset($_GET['toalum'])){
            $sql = "INSERT INTO mensajes(id_empre_origen, id_usuario_destino, titulo, contenido) VALUES(?,?,?,?)";
            $params = array($_SESSION['id_empresa'], $id, $titulo, $conte);
            print("entra");
        }
        //Origen admin
        if(isset($_SESSION['codigo_admin']) && isset($_GET['toempresa'])){
            $sql = "INSERT INTO mensajes(id_empre_destino, admin_ori, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($id, $titulo, $conte);
            print("entra");
        }
        if(isset($_SESSION['codigo_admin']) && isset($_GET['toex'])){
            $sql = "INSERT INTO mensajes(id_exalum_destino, admin_ori, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($id, $titulo, $conte);
            print("entra".$id);
        }
        if(isset($_SESSION['codigo_admin']) && isset($_GET['toalum'])){
            $sql = "INSERT INTO mensajes(id_usuario_destino, admin_ori, titulo, contenido) VALUES(?,1,?, ?)";
            $params = array($id, $titulo, $conte);
            print("entra".$id);
        }
        Database::executeRow($sql,$params);
        header("location:mail.php");
    }
}
?>
	<?php
      include("../inc/nav_mail.php");
      ?>
      <div class="container">
      </div>
<div class="container z-depth-5">
<ul class="collection with-header">
<?php
        //<li> class="collection-header"><h5>Mensaje a administrador de empresa </h5></li>
        if(isset($_GET['toadmin']))
        {
            print("<form  method='post' action='enviar_mail.php?toadmin=true' enctype='multipart/form-data'>");
        }
        if(isset($_GET['toempresa']))
        {
            print("<form  method='post' action='enviar_mail.php?toempresa=true&&id=$id' enctype='multipart/form-data'>");
        }
        if(isset($_GET['toex']))
        {
            print("<form  method='post' action='enviar_mail.php?toex=true&&id=$id' enctype='multipart/form-data'>");
        }
        if(isset($_GET['toalum']))
        {
            print("<form  method='post' action='enviar_mail.php?toalum=true&&id=$id' enctype='multipart/form-data'>");
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