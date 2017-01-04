<!-- Se llaman los diferentes archivos que contienen nuestras clases de conexion y consultas -->
<?php
ob_start();
session_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
require("../bibliotecas/functions.php");

//Se realizan los procesos necesarios para modificar e insertar
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Prácticas Profesionales</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar un Registro</h3>
                        </div>";
    print $head;
    $id = null;
    $alumno = null;
    $empresa = null;
    $finalizo = null;
    $observaciones = null;
    $acuerdo = null;
    $bitacora = null;
    $carta = null;
    $evaluaciones = null;
    $observacion_final = null;
    $Fecha = null;
    $horas = null;
    $Fecha_ini = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Prácticas Profesionales</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=      "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar un Registro</h3>
                        </div>";
    print $head;
    $id = base64_decode($_GET['id']);
    $sql = "SELECT * FROM registrospp, alumnos, empresas WHERE registrospp.alumno = alumnos.carnet AND registrospp.empresa = empresas.id_empresa AND id_registropp = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $alumno = $data[0]['carnet'];
    $empresa = $data[0]['id_empresa'];
    $finalizo = $data[0]['finalizo'];
    $observaciones = $data[0]['observaciones_tecnicas'];
    $acuerdo = $data[0]['acuerdo'];
    $bitacora = $data[0]['bitacora'];
    $carta = $data[0]['carta'];
    $evaluaciones = $data[0]['evaluaciones'];
    $observacion_final = $data[0]['observacion_final'];
    $Fecha = $data[0]['fecha_finalizo'];
    $Fecha_ini = $data[0]['fecha_ini'];
    $horas = $data[0]['horas'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$alumno = strip_tags(trim($_POST['carnet']));
    $empresa = strip_tags(trim($_POST['id_empresa']));
    if($_POST['finalizo_si'] == 1){
	$finalizo = 1;
    }
    else{
	$finalizo = 0;
    }
    $observaciones = strip_tags(trim($_POST['observaciones']));
    if($_POST['acuerdo'] == 1){
	$acuerdo = 1;
    }
    else{
	$acuerdo = 0;
    }
    if($_POST['carta'] == 1){
        $carta = 1;
    }
    else{
        $carta = 0;
    }
    if($_POST['bitacora'] == 1){
        $bitacora = 1;
    }
    else{
        $bitacora = 0;
    }
    if($_POST['evaluaciones'] == 1){
        $evaluaciones = 1;
    }
    else{
        $evaluaciones = 0;
    }
    $observacion_final = strip_tags(trim($_POST['observacion_final']));
    $Fecha = strip_tags(trim($_POST['fecha']));
    $Fecha_ini = strip_tags(trim($_POST['fecha_ini']));
    $horas = strip_tags(trim($_POST['horas']));
    //Se declaran las consultas
    try 
    {
        if(!is_numeric($observacion_final) && !is_numeric($observaciones))
        {
        if($id == null){
        	  $sql = "INSERT INTO registrospp(alumno, empresa, finalizo, observaciones_tecnicas, acuerdo, bitacora, carta, evaluaciones, observacion_final, fecha_finalizo, fecha_ini, horas) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $params = array($alumno, $empresa, $finalizo, $observaciones, $acuerdo, $bitacora, $carta, $evaluaciones, $observacion_final, $Fecha, $Fecha_ini, $horas);
        }
        else
        {
            $sql = "UPDATE registrospp SET alumno = ?, empresa = ?, finalizo = ?, observaciones_tecnicas = ?, acuerdo = ?, bitacora = ?, carta = ?, evaluaciones = ?, observacion_final = ?, fecha_finalizo = ?, fecha_ini = ?, horas = ? WHERE id_registropp = ?";
            $params = array($alumno, $empresa, $finalizo, $observaciones, $acuerdo, $bitacora, $carta, $evaluaciones, $observacion_final, $Fecha, $Fecha_ini, $horas, $id);
        }
        Database::executeRow($sql, $params);
            print("<script>
            alert('Proceso exitoso.');
            window.location='registrospp_index.php';
            </script>");
            header("location: registrospp_index.php");
            
        }
        else{
            print("<div class='card-panel red'><i class='material-icons left'>error</i>Error en los datos, verifique que las observaciones no sean solo numeros</div>");
        }
    }
    //En caso de error se muestra al administrador en turno
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<!-- Se crea nuestro formulario general ya sea de creacion o modificacion -->
            <form method='post' autocomplete="off" class='row' enctype='multipart/form-data'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Alumnos -->
                        <?php
                        $sql = "SELECT carnet, nombre1, nombre2, apellido1, apellido2 FROM alumnos";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select id='carnet' class='browser-default' name='carnet' required>";
                        if($alumno == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un alumno</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['carnet']) == $row[0] || $alumno == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[0]"." - "."$row[1]"." "."$row[2]"." "."$row[3]"." "."$row[4]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active grey-text text-darken-4' style='text-transform: capitalize;'>Alumnos:</label>";
                        print($combo);
                        ?>
                    </div>
                    
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_depar, nombre_empresa, departamento FROM departamentosempre, empresas WHERE departamentosempre.empresa = empresas.id_empresa";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select id = 'empresas' class='browser-default' name='id_empresa' required>";
                        if($empresa == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un departamento de alguna empresa</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['id_depar']) == $row[0] || $empresa == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1] - $row[2]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active grey-text text-darken-4' style='text-transform: capitalize;'>Empresa:</label>";
                        print($combo);
                        ?>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <input type="checkbox" name="finalizo_si" class="filled-in" id="fi" value=1/>
                        <label for="fi">¿El alumno finalizo sus practicas profesionales? (Marcado para si, en blanco para no)</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>visibility</i>
                        <input id='observaciones' type="text" name='observaciones' class='validate' length='200' maxlength='200' value='<?php print(htmlspecialchars($observaciones)); ?>'/>
                        <label class="active grey-text text-darken-4" for='observaciones'>Observaciones</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='col s12 m6'>
                        <!--<input type="date" class="datepicker">-->
                        <label class="black-text" for='fecha'>Fecha de inicio</label>
                        <input id='fecha' type='date' name='fecha_ini' class='datepicker'/>
                        
                    </div>
                    <div class='col s12 m6'>
                        <!--<input type="date" class="datepicker">-->
                        <label class="black-text" for='fecha_ultima_visita'>Fecha de finalizacion</label>
                        <input id='fecha_ultima_visita' type='date' name='fecha' class='datepicker'/>
                        
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>access_time</i>
                        <input id='horas' type="text" name='horas' class='validate' length='200' maxlength='200' value='<?php print(htmlspecialchars($observaciones)); ?>'/>
                        <label class="active grey-text text-darken-4" for='horas'>Horas realizadas</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m3'>
                        <input type="checkbox" name="acuerdo" class="filled-in" id="acu" value="1"/>
                        <label for="acu">¿Entrego el acuerdo? (Marcado para si, en blanco para no)</label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <input type="checkbox" name="bitacora" class="filled-in" id="bit" value="1"/>
                        <label for="bit">¿Entrego la bitacora? (Marcado para si, en blanco para no)</label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <input type="checkbox" name="carta" class="filled-in" id="car" value="1"/>
                        <label for="car">¿Entrego la carta? (Marcado para si, en blanco para no)</label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <input type="checkbox" name="evaluaciones" class="filled-in" id="eva" value="1"/>
                        <label for="eva">¿Entrego el acuerdo? (Marcado para si, en blanco para no)</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='file-field input-field col s12 m12'>
                        <i class='material-icons prefix'>search</i>
                        <input id='observacion_final' type='text' name='observacion_final' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($observacion_final)); ?>'/>
                        <label class="active grey-text text-darken-4" for='observacion_final'>Observación Final:</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='registrospp_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; ?>
        <?php include('../inc/footer.php'); ?>
    </body>
    <script>
        $(document).ready(function(){$('#empresas').select2();});
        $(document).ready(function(){$('#carnet').select2();});
    </script>
    <script type="text/javascript" src="../js/datepicker.js"></script>
</html>
<?php
ob_end_flush();
?>
