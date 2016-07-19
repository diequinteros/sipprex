<!-- Se llaman los diferentes archivos que contienen nuestras clases de conexion y consultas -->
<?php
require("../../bibliotecas/conexion.php");
require("../../bibliotecas/validator.php");

//Se realizan los procesos necesarios para modificar e insertar
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Prácticas Profesionales</title>";
                        include '../../inc/styles2.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../../inc/nav.1.php'); ?>
                    <div class='card-panel paneles'>
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
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Prácticas Profesionales</title>";
                        include '../../inc/styles2.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../../inc/nav.1.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Registro</h3>
                        </div>";
    print $head;
    $id = $_GET['id'];
    $sql = "SELECT * FROM registrospp, alumnos, empresas WHERE registrospp.alumno = alumnos.carnet AND registrospp.empresa = empresas.id_empresa AND id_registropp = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $alumno = $data[0]['carnet'];
    $empresa = $data[0]['id_empresa'];
    $finalizo = $data[0]['finalizo'];
    $observaciones = $data[0]['observaciones'];
    $acuerdo = $data[0]['acuerdo'];
    $bitacora = $data[0]['bitacora'];
    $carta = $data[0]['carta'];
    $evaluaciones = $data[0]['evaluaciones'];
    $observacion_final = $data[0]['observacion_final'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$alumno = $_POST['carnet'];
    $empresa = $_POST['id_empresa'];
    $finalizo = $_POST['finalizo'];
    $observaciones = $_POST['observaciones'];
    $acuerdo = $_POST['acuerdo'];
    $bitacora = $_POST['bitacora'];
    $carta = $_POST['carta'];
    $evaluaciones = $_POST['evaluaciones'];
    $observacion_final = $_POST['observacion_final'];
    //Se declaran las consultas
    try 
    {
      	if($id == null){
        	  $sql = "INSERT INTO registrospp(alumno, empresa, finalizo, observaciones, acuerdo, bitacora, carta, evaluaciones, observacion_final) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $params = array($alumno, $empresa, $finalizo, $observaciones, $acuerdo, $bitacora, $carta, $evaluaciones, $observacion_final);
        }
        else
        {
            $sql = "UPDATE registrospp SET alumno = ?, empresa = ?, finalizo = ?, observaciones = ?, acuerdo = ?, bitacora = ?, carta = ?, evaluaciones = ?, observacion_final = ? WHERE id_registropp = ?";
            $params = array($alumno, $empresa, $finalizo, $observaciones, $acuerdo, $bitacora, $carta, $evaluaciones, $observacion_final, $id);
        }
        Database::executeRow($sql, $params);
        header("location: index.php");
    }
    //En caso de error se muestra al administrador en turno
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<!-- Se crea nuestro formulario general ya sea de creacion o modificacion -->
            <form method='post' class='row' enctype='multipart/form-data'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Alumnos -->
                        <?php
                        $sql = "SELECT carnet, nombre1, nombre2, apellido1, apellido2 FROM alumnos";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='carnet' required>";
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
                                <label class='active' style='text-transform: capitalize;'>Alumnos:</label>";
                        print($combo);
                        ?>
                    </div>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_empresa, nombre_empresa FROM empresas";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='id_empresa' required>";
                        if($empresa == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una empresa</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['id_empresa']) == $row[0] || $empresa == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Empresa:</label>";
                        print($combo);
                        ?>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <label class="active">¿Finalizó?</label>
                        <input id='f_si' type='radio' name='finalizo' class='with-gap' value='1' <?php print(($finalizo == 1)?"checked":""); ?>/>
                        <label for='f_si'><i class='material-icons'>check</i></label>
                        <input id='f_no' type='radio' name='finalizo' class='with-gap' value='0' <?php print(($finalizo == 0)?"checked":""); ?>/>
                        <label for='f_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>visibility</i>
                        <input id='observaciones' type="text" name='observaciones' class='validate' length='200' maxlength='200' value='<?php print($observaciones); ?>'/>
                        <label class="active" for='observaciones'>Observaciones</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m3'>
                        <label class="active">¿Entrego Acuerdo?</label>
                        <input id='a_si' type='radio' name='acuerdo' class='with-gap' value='1' <?php print(($acuerdo == 1)?"checked":""); ?>/>
                        <label for='a_si'><i class='material-icons'>check</i></label>
                        <input id='a_no' type='radio' name='acuerdo' class='with-gap' value='0' <?php print(($acuerdo == 0)?"checked":""); ?>/>
                        <label for='a_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <label class="active">¿Entrego Bitácora?</label>
                        <input id='b_si' type='radio' name='bitacora' class='with-gap' value='1' <?php print(($bitacora == 1)?"checked":""); ?>/>
                        <label for='b_si'><i class='material-icons'>check</i></label>
                        <input id='b_no' type='radio' name='bitacora' class='with-gap' value='0' <?php print(($bitacora == 0)?"checked":""); ?>/>
                        <label for='b_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <label class="active">¿Entrego Carta?</label>
                        <input id='c_si' type='radio' name='carta' class='with-gap' value='1' <?php print(($carta == 1)?"checked":""); ?>/>
                        <label for='c_si'><i class='material-icons'>check</i></label>
                        <input id='c_no' type='radio' name='carta' class='with-gap' value='0' <?php print(($carta == 0)?"checked":""); ?>/>
                        <label for='c_no'><i class='material-icons'>cancel</i></label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <label class="active">¿Entrego Evaluaciones?</label>
                        <input id='e_si' type='radio' name='evaluaciones' class='with-gap' value='1' <?php print(($evaluaciones == 1)?"checked":""); ?>/>
                        <label for='e_si'><i class='material-icons'>check</i></label>
                        <input id='e_no' type='radio' name='evaluaciones' class='with-gap' value='0' <?php print(($evaluaciones == 0)?"checked":""); ?>/>
                        <label for='e_no'><i class='material-icons'>cancel</i></label>
                    </div>
                </div>
                <div class='row'>
                    <div class='file-field input-field col s12 m12'>
                        <i class='material-icons prefix'>search</i>
                        <input id='observacion_final' type='text' name='observacion_final' class='validate' length='200' maxlenght='200' value='<?php print($observacion_final); ?>'/>
                        <label class="active" for='observacion_final'>Observación Final:</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../../inc/scripts.php'; ?>
        <?php include('../../inc/footer .php'); ?>
    </body>
</html>