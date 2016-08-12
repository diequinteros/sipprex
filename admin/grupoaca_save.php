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
    $grupo= null;
  
}
else
{
    $id = $_GET['id'];
    $sql = "SELECT * FROM grupo_academico WHERE id_grupo_aca = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $grupo = $data['grupo_aca'];
    $id = $data['id_grupo_aca'];
   
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $grupo = strip_tags(trim($_POST['grupo_aca']));
     $id = strip_tags(trim($_POST['id_grupo_aca']));

    try 
    {
      	if($grupo == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO grupo_academico (grupo_aca)  VALUES(?)";
            $params = array($grupo);
        }
        else
        {
            $sql = "UPDATE grupo_academico SET grupo_aca = ? WHERE id_grupo_aca = ?";
            $params = array($grupo, $id);
        }
        Database::executeRow($sql, $params);
        header("location: grupoaca_read.php");
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
          	<input id='id_grupo_aca' type='text' name='id_grupo_aca' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($id)); ?>' required/>
          	<label for='id_grupo_aca'>ID</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='grupo_aca' type='text' name='grupo_aca' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($grupo)); ?>'/>
          	<label for='grupo_aca'>Grupo Academico</label>
        </div>
    </div>
    <a href='grupoaca_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>