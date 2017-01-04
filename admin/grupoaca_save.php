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
                        <title>Grupos academicos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                include('../inc/nav.php');
                $head .="<body class='grey lighten-3'>
                    <div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar un grupo academico</h3>
                        </div>";
    print($head);
    $id = null;
    $grupo= null;
  
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Grupos academicos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                include('../inc/nav.php');
                $head .="<body class='grey lighten-3'>
                    <div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar un grupo academico</h3>
                        </div>";
    print($head);
    $id = trim(strip_tags(base64_decode($_GET['id'])));
    $sql = "SELECT * FROM grupo_academico WHERE id_grupo_aca = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $grupo = $data['grupo_aca'];
   
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $grupo = strip_tags(trim($_POST['grupo_aca']));
     

    try 
    {
      	if($grupo == "")
        {
            throw new Exception("Datos incompletos.");
        }
        if(is_numeric($grupo))
        {
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
         print("<script>
            alert('Proceso exitoso.');
            window.location='grupoaca_read.php';
            </script>");
        }
        else
        {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>El grupo academico solo debe ser un numero</div>");    
        }
        
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' autocomplete="off" enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='grupo_aca' type='text' name='grupo_aca' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($grupo)); ?>' required/>
          	<label class="active grey-text text-darken-4" for='grupo_aca'>Grupo Academico</label>
        </div>
    </div>
    <a href='grupoaca_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
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