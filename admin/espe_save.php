  <?php
  ob_start();
  session_start(); 
  require("../bibliotecas/conexion.php");
  require("../bibliotecas/validator.php");
  require("../bibliotecas/functions.php");
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Especialidad</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                include('../inc/nav.php');
                $head .="<body class='grey lighten-3'>
                    <div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar una Especialidad</h3>
                        </div>";
    print($head);
    $id = null;
    $Especialidad= null;
  
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Especialidad</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                include('../inc/nav.php');
                $head .="<body class='grey lighten-3'>
                    <div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar una especialidad</h3>
                        </div>";
    print($head);
    $id = $_GET['id'];
    $sql = "SELECT * FROM especialidades WHERE id_especialidad = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $Especialidad = $data['especialidad'];
    

    
   
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $Especialidad = strip_tags(trim($_POST['especialidad']));
     

    try 
    {
      	if($Especialidad == "")
        {
            throw new Exception("Datos incompletos.");
        }
        if(ctype_alpha(str_replace(' ', '', $Especialidad)))
        {
            if($id == null)
        {
        	$sql = "INSERT INTO especialidades (especialidad) VALUES(?)";
            $params = array($Especialidad);
        }
        else
        {
            $sql = "UPDATE especialidades SET especialidad = ? WHERE id_especialidad = ?";
            $params = array($Especialidad, $id);
        }
        Database::executeRow($sql, $params);

        print("<script>
            alert('Proceso  exitoso.');
            window.location='espe_read.php';
            </script>");
        }
        else{
            print("<div class='card-panel red'><i class='material-icons left'>error</i>La especialidad solo debe contener numeros</div>");    
        }
    }
    catch(Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' class='row' autocomplete="off" enctype='multipart/form-data'>
    <div class='row'>
        
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='especialidad' type='text' name='especialidad' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Especialidad)); ?>' required/>
          	<label class="active grey-text text-darken-4" for='especialidad'>Especialidad</label>
        </div>
    </div>
    <a href='espe_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
</div>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>
<?php
ob_end_flush();
?>