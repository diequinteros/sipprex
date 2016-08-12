<html>
  <?php
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
require("../lib/page.php");
require("../../lib/conexion.php");

if(empty($_GET['id'])) 
{
    $id = null;
    $Empresas= null;
    $fecha = null;
    $Observacion = null;
    
}
else
{
    
    $id = $_GET['id'];
    $sql = "SELECT * FROM visitas WHERE id_visita = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $Empresas = $data['empresa'];
    $Fecha = $data['fecha_ultima_visita'];
    $Observacion = $data['observacion'];

  
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$Empresas = strip_tags(trim($_POST['empresa']));
    $Fecha = strip_tags(trim($_POST['fecha_ultima_visita']));
    $Observacion = strip_tags(trim($_POST['observacion']));

    if($Fecha == "")
    {
        $Fecha = null;
    }
      if($Observacion == "")
    {
        $Observacion = null;
    }

    try 
    {
      	if($Empresas == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO visitas (empresa, fecha_ultima_visita, observacion) VALUES(?, ?, ?)";
            $params = array($Empresas, $Fecha, $Observacion);
        }

        else
        {
            $sql = "UPDATE visitas SET empresa = ?, fecha_ultima_visita = ?, observacion = ?  WHERE id_visita = ?";
            $params = array($Empresas, $Fecha, $Observacion, $id);
        }
        Database::executeRow($sql, $params);
        header("location: visitas_read.php");
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
          	<input id='fecha_ultima_visita' type='text' name='fecha_ultima_visita' class='validate' length='200' maxlenght='200' />
          	<label for='fecha_ultima_visita'>Fecha</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <textarea id="observacion" class="materialize-textarea"  name='observacion' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Observacion)); ?>'/>
            <label for="observacion">Observaciones</label>
            
        </div>
    </div>

    <a href='visitas_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>