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
                        <title>Sección</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                include('../inc/nav.php');
                $head .="<body class='grey lighten-3'>
                    <div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar una Sección</h3>
                        </div>";
    print($head);
    $id = null;
    $sec= null;
  
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Sección</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                    
                    include('../inc/nav.php');
                    
    $head .=  "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar una Sección</h3>
                        </div>";
    print($head);
    $id = trim(strip_tags(base64_decode($_GET['id'])));
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
        if(ctype_alpha(str_replace(' ', '', $sec)))
        {
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

         print("<script>
            alert('Porceso  exitoso.');
            window.location='seccion_read.php';
            </script>");

        }
        else{
        print("<div class='card-panel red'><i class='material-icons left'>error</i>La seccion solo debe contener letras</div>");    
        }

        
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>

<form method='post' autocomplete="off" class='row' enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='id_seccion' type='text' name='id_seccion' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($id)); ?>'/>
          	<label for='id_seccion'>ID</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='seccion' type='text' name='seccion' class='validate' length='30' maxlenght='30' value='<?php print(htmlspecialchars($sec)); ?>' required/>
          	<label for='seccion'>Seccion</label>
        </div>
    </div>
    <a href='seccion_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
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