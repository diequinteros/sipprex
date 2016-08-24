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
    $año= null;
  
}
else
{
    $id = base64_decode($_GET['id']);
    $sql = "SELECT * FROM años WHERE id_año = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $año = $data['año'];
    $id = $data['id_año'];

    
   
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $año = strip_tags(trim($_POST['año']));
     $id = strip_tags(trim($_POST['id_año']));

    try 
    {
      	if($año == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO años(año) VALUES(?)";
            $params = array($año);
        }
        else
        {
            $sql = "UPDATE años SET año = ? WHERE id_año = ?";
            $params = array($año, $id);
        }
        Database::executeRow($sql, $params);
        header("location: grado_read.php");
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
          	<input id='id_especialidad' type='text' name='id_año' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($id)); ?>'/>
          	<label for='id_especialidad'>ID</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='especialidad' type='text' name='año' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($año)); ?>' required/>
          	<label for='especialidad'>Grado</label>
        </div>
    </div>
    <a href='grado_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
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