<html>
  <?php
  session_start(); 
  require("../bibliotecas/conexion.php");
  require("../bibliotecas/Validator.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php
include("../inc/nav.php");
if(empty($_GET['id'])) 
{
    $id = null;
    $sec= null;
  
}
else
{
    $id = $_GET['id'];
    $sql = "SELECT * FROM secciones WHERE id_seccion = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $sec = $data['seccion'];
    $id = $data['id_seccion'];
    
   
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $sec = strip_tags(trim($_POST['seccion']));
     $id = strip_tags(trim($_POST['id_seccion']));

    try 
    {
      	if($sec == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO secciones (seccion) VALUES(?)";
            $params = array($sec);
        }
        else
        {
            $sql = "UPDATE secciones SET seccion = ? WHERE id_seccion = ?";
            $params = array($sec, $id);
        }
        Database::executeRow($sql, $params);
        header("location: seccion_read.php");
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' class='row' enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='id_seccion' type='text' name='id_seccion' class='validate' length='50' maxlenght='50' value='<?php print($id); ?>' required/>
          	<label for='id_seccion'>ID</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='seccion' type='text' name='seccion' class='validate' length='200' maxlenght='200' value='<?php print($sec); ?>'/>
          	<label for='seccion'>Seccion</label>
        </div>
    </div>
    <a href='seccion_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>