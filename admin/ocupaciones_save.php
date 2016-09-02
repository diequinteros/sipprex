<html>
  <?php
  ob_start();
  session_start(); 
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
include("../inc/nav.php");
if(empty($_GET['id'])) 
{
    $id = null;
    $ocu= null;
  
}
else
{
    $id = base64_decode(strip_tags($_GET['id']));
    $sql = "SELECT * FROM ocupaciones WHERE id_ocupacion = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $ocu = $data['ocupacion'];
    $id = $data['id_ocupacion'];
}
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $ocu = strip_tags(trim($_POST['ocupacion']));
     $id = strip_tags(trim($_POST['id_ocupacion']));

    try 
    {
      	if($ocu == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO ocupaciones(ocupacion) VALUES(?)";
            $params = array($ocu);
        }
        else
        {
            $sql = "UPDATE ocupaciones SET ocupacion = ? WHERE id_ocupacion = ?";
            $params = array($ocu, $id);    
        }
        Database::executeRow($sql, $params);
        header("location: ocupaciones_read.php");
        
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' class='row' autocomplete="off" enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='id_ocupacion' type='text' name='id_ocupacion' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($id)); ?>'/>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='ocupacion' type='text' name='ocupacion' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($ocu)); ?>'  required/>
          	<label for='ocupacion'>Ocupacion</label>
        </div>
    </div>
    <a href='ocupaciones_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>
<?php
ob_end_flush();
?>