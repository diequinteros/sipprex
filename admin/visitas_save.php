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
                        <title>Visitas</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Registrar una visita</h3>
                        </div>";
    print $head;
    $id = null;
    $Empresas= null;
    $Fecha = null;
    $Observacion = null;
    
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Visitas</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar visitas</h3>
                        </div>";
    print $head;
    $id = strip_tags(trim(base64_decode($_GET['id'])));
    $sql = "SELECT * FROM visitas WHERE id_visita = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $Empresas = $data['empresa'];
    $Fecha = $data['fecha_ultima_visita'];
    $Observacion = $data['observaciones'];

  
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$Empresas = strip_tags(trim($_POST['id_empresa']));
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
        if(is_numeric($Observacion))
        {
            if($id == null)
        {
        	$sql = "INSERT INTO visitas (empresa, fecha_ultima_visita, observaciones) VALUES(?, ?, ?)";
            $params = array($Empresas, $Fecha, $Observacion);
        }

        else
        {
            $sql = "UPDATE visitas SET empresa = ?, fecha_ultima_visita = ?, observaciones = ?  WHERE id_visita = ?";
            $params = array($Empresas, $Fecha, $Observacion, $id);
        }
        Database::executeRow($sql, $params);
        header("location: visitas_read.php");
        }
        else{
            print("<div class='card-panel red'><i class='material-icons left'>error</i>La observacion no puede contener solo numeros</div>");
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
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_depar, nombre_empresa, departamento FROM departamentosempre, empresas WHERE departamentosempre.empresa = empresas.id_empresa";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='id_empresa' required>";
                        if($Empresas == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un departamento de alguna empresa</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['id_depar']) == $row[0] || $Empresas == $row[0])
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
        <div class='col s12 m6'>
          	<i class='material-icons prefix'>add</i>
              <!--<input type="date" class="datepicker">-->
          	<input id='fecha_ultima_visita' type='date' name='fecha_ultima_visita' class='datepicker' value='<?php if($Fecha != null){print($Fecha);} ?>'/>
          	<!--<label for='fecha_ultima_visita'>Fecha</label>-->
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <textarea id="observacion" class="materialize-textarea"  name='observacion' class='validate' length='200' maxlenght='200'/><?php print(htmlspecialchars($Observacion));?></textarea>
            <label for="observacion">Observaciones</label>
            
        </div>
    </div>

    <a href='visitas_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
</div>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
<script type="text/javascript" src="../js/datepicker.js"></script>
 	</body>
</html>
<?php
ob_end_flush();
?>