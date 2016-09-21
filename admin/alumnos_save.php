<!-- Se llaman los diferentes archivos que contienen nuestras clases de conexion y consultas -->
<?php
ob_start();
session_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");

//Se realizan los procesos necesarios para modificar e insertar
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Alumnos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>";
                //include('../inc/nav.php');
                $head .="<body>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar un Alumno</h3>
                        </div>";
    print $head;
    $id = null;
    $contraseña1 = null;
    $contraseña2 = null;
    $nie = null;
    $nombre1 = null;
    $nombre2 = null;
    $apellido1 = null;
    $apellido2 = null;
    $grado = null;
    $especialidad = null;
    $grupo_tecnico = null;
    $seccion = null;
    $grupo_academico = null;
    $inscrito = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Alumnos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>";
                    
                    include('../inc/nav.php');
                    
    $head .=  "<div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Alumno</h3>
                        </div>";
    print $head;
    $id = base64_decode($_GET['id']);
    $sql = "SELECT * FROM alumnos, años, especialidades, grupo_tecnico, secciones, grupo_academico WHERE alumnos.grado = años.id_año AND alumnos.especialidad = especialidades.id_especialidad AND alumnos.grupo_Tecnic = grupo_tecnico.id_grupo_tec AND alumnos.secc = secciones.id_seccion AND alumnos.grupo_academ = grupo_academico.id_grupo_aca AND carnet = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $nie = $data['nie'];
    $nombre1 = $data['nombre1'];
    $nombre2 = $data['nombre2'];
    $apellido1 = $data['apellido1'];
    $apellido2 = $data['apellido2'];
    $grado = $data['grado'];
    $especialidad = $data['especialidad'];
    $grupo_tecnico = $data['grupo_Tecnic'];
    $seccion = $data['secc'];
    $grupo_academico = $data['grupo_academ'];
    $inscrito = $data['inscrito'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$contraseña1 = strip_tags(trim($_POST['contraseña1']));
    $contraseña2 = strip_tags(trim($_POST['contraseña2']));
    $nie = strip_tags(trim($_POST['nie']));
    $nombre1 = strip_tags(trim($_POST['nombre1']));
    $nombre2 = strip_tags(trim($_POST['nombre2']));
    $apellido1 = strip_tags(trim($_POST['apellido1']));
    $apellido2 = strip_tags(trim($_POST['apellido2']));
    $grado = strip_tags(trim($_POST['grado']));
    $especialidad = strip_tags(trim($_POST['especialidad']));
    $grupo_tecnico = strip_tags(trim($_POST['grupo_Tecnic']));
    $seccion = strip_tags(trim($_POST['secc']));
    $grupo_academico = strip_tags(trim($_POST['grupo_academ']));
    $inscrito = strip_tags(trim($_POST['inscrito']));
    //Se declaran las consultas
    try 
    {
        if(strlen($nie) <= 8 && strlen($nombre1) <= 15 && strlen($nombre2) <= 15 && strlen($apellido1) <= 15 && strlen($apellido2) <= 15 && is_numeric($grado) && is_numeric($especialidad) && is_numeric($grupo_tecnico) && is_numeric($grupo_academico) && is_numeric($seccion) && ($inscrito == "VERDADERO" || $inscrito == "FALSO"))
        {
            if($id == null){
                $id = strip_tags(trim($_POST['carnet']));
                if($contraseña1 != null && $contraseña2 != null){
                    if(strlen($id) >= 8 && strlen($contraseña1) >= 8 && strlen($contraseña1) <= 25 && strlen($contraseña2) >= 8 && strlen($contraseña2) <= 25){
                        if($contraseña1 == $contraseña2){
                            if($contraseña1 != $id){
                                $hash = password_hash($contraseña1, PASSWORD_DEFAULT);
                                $sql = "INSERT INTO alumnos(carnet, contraseña, nie, nombre1, nombre2, apellido1, apellido2, grado, especialidad, grupo_Tecnic, secc, grupo_academ, inscrito) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                $params = array($id, $hash, $nie, $nombre1, $nombre2, $apellido1, $apellido2, $grado, $especialidad, $grupo_tecnico, $seccion, $grupo_academico, $inscrito);
                            }
                            else{
                                print("<div class='card-panel red'><i class='material-icons left'>error</i>La contraseña no puede seri igual al código del carnet.</div>");
                            }
                        }
                        else{
                            print("<div class='card-panel red'><i class='material-icons left'>error</i>Las contraseñas no coinciden.</div>");    
                        }
                    }
                    else{
                        print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de las contraseñas no es valido</div>");    
                    }
                }
                else{
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>Las contraseñas no pueden estar vacias.</div>");    
                }
            }
            else
            {
                if($contraseña1 != null && $contraseña2 != null){
                    if(strlen($id) >= 8 && strlen($contraseña1) >= 8 && strlen($contraseña1) <=25 && strlen($contraseña2) >= 8 && strlen($contraseña2) <= 25){
                        if($contraseña1 == $contraseña2){
                            if($contraseña1 != $id){
                                $hash = password_hash($contraseña1, PASSWORD_DEFAULT);
                                $sql = "UPDATE alumnos SET carnet = ?, contraseña = ?, nie = ?, nombre1 = ?, nombre2 = ?, apellido1 = ?, apellido2 = ?, grado = ?, especialidad = ?, grupo_Tecnic = ?, secc = ?, grupo_academ = ?, inscrito = ? WHERE carnet = ?";
                                $params = array($id, $hash, $nie, $nombre1, $nombre2, $apellido1, $apellido2, $grado, $especialidad, $grupo_tecnico, $seccion, $grupo_academico, $inscrito, $id);
                            }
                            else{
                                print("<div class='card-panel red'><i class='material-icons left'>error</i>La contraseña nueva no puede ser igual al carnet.</div>");
                            }
                        }
                        else{
                            print("<div class='card-panel red'><i class='material-icons left'>error</i>Las contraseñas no coinciden.</div>");
                        }
                    }
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de las contraseñas no es valido.</div>");
                }
                else{
                    $sql = "UPDATE alumnos SET carnet = ?, nie = ?, nombre1 = ?, nombre2 = ?, apellido1 = ?, apellido2 = ?, grado = ?, especialidad = ?, grupo_Tecnic = ?, secc = ?, grupo_academ = ?, inscrito = ? WHERE carnet = ?";
                    $params = array($id, $nie, $nombre1, $nombre2, $apellido1, $apellido2, $grado, $especialidad, $grupo_tecnico, $seccion, $grupo_academico, $inscrito, $id);
                }
            }
            Database::executeRow($sql, $params);
            header("location: alumnos_index.php");
        }
        else{
        print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de los datos ingresados no es correcto, por favor verifique sus datos.</div>");    
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
            <form method='post' class='row' autocomplete="off" enctype='multipart/form-data'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='carnet' type='text' name='carnet' class='validate' length='8' maxlength='8' value='<?php print(htmlspecialchars($id)); ?>' required/>
                        <label class="active" for='carnet'>Carnet</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='nie' type='text' name='nie' class='validate' length='8' maxlength='8' value='<?php print(htmlspecialchars($nie)); ?>' required/>
                        <label class="active" for='nie'>NIE</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña1' type='password' name='contraseña1' class='validate' length='8' maxlength='25'/>
                        <label class="active" for='contraseña1'>Contraseña:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña2' type='password' name='contraseña2' class='validate' length='8' maxlength='25' />
                        <label class="active" for='contraseña2'>Confirmar Contraseña:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>add_circle</i>
                        <input id='nombre1' type='text' name='nombre1' class='validate' length='15' maxlength='15' value='<?php print(htmlspecialchars($nombre1)); ?>'/>
                        <label class="active" for='nombre1'>Primer Nombre:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>add_circle</i>
                        <input id='nombre2' type='text' name='nombre2' class='validate' length='15' maxlength='25' value='<?php print(htmlspecialchars($nombre2)); ?>'/>
                        <label class="active" for='nombre2'>Segundo Nombre:</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class='material-icons prefix'>add_circle</i>
                        <input id='apellido1' type='text' name='apellido1' class='validate' length='15' maxlength='25' value='<?php print(htmlspecialchars($apellido1)); ?>'/>
                        <label class="active" for='apellido1'>Primer Apellido:</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class='material-icons prefix'>add_circle</i>
                        <input id='apellido2' type='text' name='apellido2' class='validate' length='15' maxlength='25' value='<?php print(htmlspecialchars($apellido2)); ?>'/>
                        <label class="active" for='apellido2'>Segundo Apellido:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m3'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Años -->
                        <?php
                        $sql = "SELECT id_año, año FROM años";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='grado' required>";
                        if($grado == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un grado</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['grado']) == $row[0] || $grado == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Grado:</label>";
                        print($combo);
                        ?>
                    </div>
                    <div class='input-field col s12 m3'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Especialidad -->
                        <?php
                        $sql = "SELECT id_especialidad, especialidad FROM especialidades";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='especialidad' required>";
                        if($especialidad == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una especialidad</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['especialidad']) == $row[1] || $especialidad == $row[1])
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
                    <div class='input-field col s12 m3'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Grupos Técnicos -->
                        <?php
                        $sql = "SELECT id_grupo_tec, grupo_tec FROM grupo_tecnico";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='grupo_Tecnic' required>";
                        if($grupo_tecnico == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un Grupo Técnico</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['grupo_Tecnic']) == $row[0] || $grupo_tecnico == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Grupo Técnico:</label>";
                        print($combo);
                        ?>
                    </div>
                    <div class='input-field col s12 m3'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Secciones -->
                        <?php
                        $sql = "SELECT id_seccion, seccion FROM secciones";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='secc' required>";
                        if($seccion == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una sección/option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['secc']) == $row[0] || $seccion == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Sección:</label>";
                        print($combo);
                        ?>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Grupos Académicas -->
                        <?php
                        $sql = "SELECT id_grupo_aca, grupo_aca FROM grupo_academico";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='grupo_academ' required>";
                        if($grupo_academico == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione un grupo académico</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['grupo_academ']) == $row[0] || $grupo_academico == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Grupo Académico:</label>";
                        print($combo);
                        ?>
                    </div>
                    <div class='file-field input-field col s12 m6'>
                        <i class='material-icons prefix'>visibility</i>
                        <input id='inscrito' type='text' name='inscrito' class='validate' length='9' maxlength='9' value='<?php print(htmlspecialchars($inscrito)); ?>'/>
                        <label class="active" for='inscrito'>¿Esta inscrito? (VERDADERO o FALSO)</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='alumnos_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; 
        ?>
        <?php include("../inc/footer.php")
        ?>
    </body>
</html>
<?php
ob_end_flush();
?>
