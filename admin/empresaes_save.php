<html>
  <?php
  session_start();
   require("../bibliotecas/conexion.php");
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
    $empre= null;
    $espe = null;
    
}
else
{
    $id = $_GET['id'];
    $sql = "SELECT * FROM espeempresa WHERE id_espeempresa = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $id = $data['id_espeempresa'];
    $empre = $data['empresa'];
    $espe = $data['especialiada'];
  
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $empre = strip_tags(trim($_POST['empresa']));
    $espe = strip_tags(trim($_POST['especialiada']));
    $id = strip_tags(trim($_POST['id_espeempresa']));

    if($espe == "")
    {
        $espe = null;
    }

    try 
    {
      	if($empre == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO espeempresa(empresa, especialida) VALUES(?, ?)";
            $params = array($empre, $espe);
        }
        else
        {
            $sql = "UPDATE espeempresa SET empresa = ?, especialida = ?  WHERE id_espeempresa = ?";
            $params = array($empre, $espe);
        Database::executeRow($sql, $params);
        header("location: empresaes_read.php");
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
          	<input id='empresa' type='text' name='empresa' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($Empresas)); ?>' required/>
          	<label for='empresa'>Empresas</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='especialidad' type='text' name='especialidad' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Rubro)); ?>'/>
          	<label for='especialidad'>Especialidad</label>
        </div>
    </div>
  
    <a href='empresaes_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
	</body>
</html>