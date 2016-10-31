<html>
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
                        <title>Especialidades admitidos por departamento</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar una especialidad admitida por el departamento</h3>
                        </div>";
    print $head;
    $id = null;
    $empre= null;
    $espe = null;
    
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Especialidades admitidas por departamentos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar una especialidad admitida por el departamento</h3>
                        </div>";
    print $head;
    $id = trim(strip_tags(base64_decode($_GET['id'])));
    $sql = "SELECT * FROM espeempresa WHERE id_espeempresa = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $empre = $data['empresa'];
    $espe = $data['especialidad'];
  
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $empre = strip_tags(trim($_POST['id_empresa']));
    $espe = strip_tags(trim($_POST['id_especialidad']));
   

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
            $sql = "UPDATE espeempresa SET empresa = ?, especialidad = ?  WHERE id_espeempresa = ?";
            $params = array($empre, $espe, $id);
        Database::executeRow($sql, $params);
        print("<script>
            alert('Porceso  exitoso.');
            window.location='empresaes_read.php';
            </script>");
        }
=======
        
                if($id == null)
            {
                $sql = "INSERT INTO espeempresa(empresa, especialida) VALUES(?, ?)";
                $params = array($empre, $espe);
            }
            else
            {
                $sql = "UPDATE espeempresa SET empresa = ?, especialidad = ?  WHERE id_espeempresa = ?";
                $params = array($empre, $espe, $id);
            Database::executeRow($sql, $params);
            header("location: empresaes_read.php");
            }
        
        
>>>>>>> origin/master
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
          	<!--<i class='material-icons prefix'>add</i>
          	<input id='empresa' type='text' name='empresa' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($empre)); ?>' required/>
          	<label for='empresa'>Empresas</label>-->
            <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_depar, nombre_empresa, departamento FROM departamentosempre, empresas WHERE departamentosempre.empresa = empresas.id_empresa";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='id_empresa' required>";
                        if($empre == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un departamento de alguna empresa</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['id_depar']) == $row[0] || $empre == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1] - $row[2]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Empresa:</label>";
                        print($combo);
                        ?>
        </div>
        <div class='input-field col s12 m6'>
          	<!--<i class='material-icons prefix'>add</i>
          	<input id='especialidad' type='text' name='especialidad' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($espe)); ?>'/>
          	<label for='especialidad'>Especialidad</label>-->
            <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Especialidad -->
                        <?php
                        $sql = "SELECT id_especialidad, especialidad FROM especialidades";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='id_especialidad' required>";
                        if($espe == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una especialidad</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['especialidad']) == $row[0] || $espe == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Especialidad:</label>";
                        print($combo);
                        ?>
        </div>
    </div>
  
    <a href='empresaes_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
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