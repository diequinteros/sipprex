<?php
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
session_start();

if(isset($_SESSION['carnet'])){
    if(!empty($_POST))
    {
        $_POST = Validator::validateForm($_POST);
        $pregunta = strip_tags(trim($_POST['pregunta']));
        $respuesta = strip_tags(trim($_POST['respuesta']));
        $clave1 = strip_tags(trim($_POST['clave1']));
        $clave2 = strip_tags(trim($_POST['clave2']));

        try 
        {
            if($pregunta != "" && $respuesta != "" && $clave1 != "" && $clave2 != "")
            {
                if($clave1 == $clave2){
                    if($clave1 != $_SESSION['carnet']){
                        $hash = base64_encode($clave1);
                        $sql = "UPDATE alumnos SET contraseña= ?, pregunta = ?, respuesta = ? WHERE carnet = ?";
                        $params = array($hash, $pregunta, $respuesta, $_SESSION['carnet']);
                    }
                    else{
                        throw new Exception("La nueva contraseña no puede ser igual a su codigo.");
                    }
                }
                else{
                    throw new Exception("Las contraseñas deben ser iguales.");
                }
            }
            else if($pregunta != "" && $respuesta != "")
            {
                $sql = "UPDATE alumnos SET pregunta = ?, respuesta = ? WHERE carnet = ?";
                $params = array($pregunta, $respuesta, $_SESSION['carnet']);
            }
            else if($clave1 != "" && $clave2 != "")
            {
                if($clave1 == $clave2){
                    if($clave1 != $_SESSION['carnet']){
                        $hash = base64_encode($clave1);
                        $sql = "UPDATE alumnos SET contraseña= ? WHERE carnet = ?";
                        $params = array($hash, $_SESSION['carnet']);
                    }
                    else{
                        throw new Exception("La nueva contraseña no puede ser igual a su codigo.");
                    }
                }
                else{
                    throw new Exception("Las contraseñas deben ser iguales.");
                }
            }
            else{
                throw new Exception("Debe llenar todos los campos del formulario.");
            }
            Database::executeRow($sql, $params);
            header("location: index.php");
        }
        catch (Exception $error)
        {
            print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
        }
    }
    else
    {
        $sql = "SELECT carnet, nie, nombre1, nombre2, apellido1, apellido2, años.año, especialidades.especialidad, grupo_tecnico.grupo_tec, secciones.seccion, grupo_academico.grupo_aca, inscrito, pregunta, respuesta FROM alumnos, años, especialidades, grupo_tecnico, secciones, grupo_academico WHERE alumnos.grado = años.id_año AND alumnos.especialidad = especialidades.id_especialidad AND alumnos.grupo_Tecnic = grupo_tecnico.id_grupo_tec AND alumnos.secc = secciones.id_seccion AND alumnos.grupo_academ = grupo_academico.id_grupo_aca AND carnet = ?";
        $params = array($_SESSION['carnet']);
        $data = Database::getRow($sql, $params);
        $carnet = $data['carnet'];
        $nie = $data['nie'];
        $nombre1 = $data['nombre1'];
        $nombre2 = $data['nombre2'];
        $apellido1 = $data['apellido1'];
        $apellido2 = $data['apellido2'];
        $año = $data['año'];
        $especialidad = $data['especialidad'];
        $grupo_tecnico = $data['grupo_tec'];
        $seccion = $data['seccion'];
        $grupo_academico = $data['grupo_aca'];
        $inscrito = $data['inscrito'];
        $pregunta = $data['pregunta'];
        $respuesta = $data['respuesta'];
    }
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Tu Perfil</title>
        <?php include '../inc/styles.php'; ?>
        <meta charset="utf-8">
    </head>
    <body>
    <a class='btn' href='index.php'><i class='material-icons'>home</i></a>
        <div class="titulo">
            <h3>Tu perfil</h3>
        </div>
        <div class="card-panel paneles">
            <form method='post' class='row' enctype='multipart/form-data' autocomplete='off'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>account_circle</i>
                        <input id='carnet' type='number' name='carnet' class='validate black-text' length='8' maxlength='8' value='<?php print(htmlspecialchars($carnet)); ?>' required disabled/>
                        <label class="active" for='carnet'>Carnet:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>account_circle</i>
                        <input id='nie' type='number' name='nie' class='validate black-text' length='15' maxlength='15' value='<?php print(htmlspecialchars($nie)); ?>' required disabled/>
                        <label class="active" for='nie'>NIE:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='nombre1' type='text' name='nombre1' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($nombre1)); ?>' required disabled/>
                        <label class="active" for='nombre1'>Primer Nombre:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='nombre2' type='text' name='nombre2' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($nombre2)); ?>' required disabled/>
                        <label class="active" for='nombre2'>Segundo Nombre:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='apellido1' type='text' name='apellido1' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($apellido1)); ?>' required disabled/>
                        <label class="active" for='apellido1'>Primer Apellido:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='apellido2' type='text' name='apellido2' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($apellido2)); ?>' required disabled/>
                        <label class="active" for='apellido2'>Segundo Apellido:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>alarm</i>
                        <input id='grado' type='text' name='grado' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($año)); ?>' required disabled/>
                        <label class="active" for='grado'>Grado:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>group_add</i>
                        <input id='grupo_tecnico' type='number' name='grupo_tecnico' class='validate black-text' length='2' maxlength='2' value='<?php print(htmlspecialchars($grupo_tecnico)); ?>' required disabled/>
                        <label class="active" for='grupo_tecnico'>Grupo Técnico:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>letter</i>
                        <input id='seccion' type='text' name='seccion' class='validate black-text' length='2' maxlength='2' value='<?php print(htmlspecialchars($seccion)); ?>' required disabled/>
                        <label class="active" for='seccion'>Sección:</label>
                    </div>
                    <div class='input-field col s6 m3'>
                        <i class='material-icons prefix'>group_add</i>
                        <input id='grupo_academico' type='number' name='grupo_academico' class='validate black-text' length='2' maxlength='2' value='<?php print(htmlspecialchars($grupo_academico)); ?>' required disabled/>
                        <label class="active" for='grupo_academico'>Grupo Académico:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='especialidad' type='text' name='especialidad' class='validate black-text' length='25' maxlength='25' value='<?php print(htmlspecialchars($especialidad)); ?>' disabled/>
                        <label class="active" for='especialidad'>Especialidad:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>lightbulb_outline</i>
                        <input id='pregunta' type='text' name='pregunta' class='validate black-text' length='50' maxlength='50' value='<?php print(htmlspecialchars($pregunta)); ?>'/>
                        <label class="active" for='pregunta'>Pregunta de Seguridad:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>settings_voice</i>
                        <input id='respuesta' type='text' name='respuesta' class='validate black-text' length='50' maxlength='50' value='<?php print(htmlspecialchars($respuesta)); ?>' required/>
                        <label class="active" for='respuesta'>Respuesta de Seguridad:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='clave1' type='password' name='clave1' class='validate black-text' length='25' maxlength='25'/>
                        <label class="active" for='clave1'>Nueva Contraseña:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='clave2' type='password' name='clave2' class='validate black-text' length='25' maxlength='25'/>
                        <label class="active" for='clave2'>Confirmar Contraseña:</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <?php include '../inc/scripts.php'; ?>
    </body>
</html>
<?php
}
elseif(isset($_SESSION['id_exalumnos'])){
    if(!empty($_POST))
    {
        $_POST = Validator::validateForm($_POST);
        $nombre = strip_tags(trim($_POST['nombre']));
        $apellido = strip_tags(trim($_POST['apellido']));
        $telefono = strip_tags(trim($_POST['telefono']));
        $ocupacion = strip_tags(trim($_POST['id_ocupacion']));
        $correo = strip_tags(trim($_POST['correo']));
        $observacion = strip_tags(trim($_POST['observacion']));
        $pregunta = strip_tags(trim($_POST['pregunta']));
        $respuesta = strip_tags(trim($_POST['respuesta']));
        $clave1 = strip_tags(trim($_POST['clave1']));
        $clave2 = strip_tags(trim($_POST['clave2']));
        try 
        {
            if($nombre != "" && $apellido != "" && $telefono != "" && $ocupacion != "" && $correo != ""  && $pregunta != "" && $respuesta != "" && $clave1 != "" && $clave2 != "")
            {
                if($clave1 == $clave2){
                    if($clave1 != $_SESSION['id_exalumnos']){
                        $hash = base64_encode($clave1);
                        $sql = "UPDATE ex_alumnos SET contraseña= ?, nombre1 = ?, apellido1 = ?, telefono = ?, ocupacion = ?, correo_electronico = ?, observacion = ?, pregunta = ?, respuesta = ? WHERE id_exalumnos = ?";
                        $params = array($hash, $nombre, $apellido, $telefono, $ocupacion, $correo, $observacion, $pregunta, $respuesta, $_SESSION['id_exalumnos']);
                    }
                    else{
                        throw new Exception("La nueva contraseña no puede ser igual a su codigo.");
                    }
                }
                else{
                    throw new Exception("Las contraseñas deben ser iguales.");
                }
            }
            else if($nombre != "" && $apellido != "" && $telefono != "" && $ocupacion != "" && $correo != "" && $pregunta != "" && $respuesta != "")
            {
                $sql = "UPDATE ex_alumnos SET nombre1 = ?, apellido1 = ?, telefono = ?, ocupacion = ?, correo_electronico = ?, observacion = ?, pregunta = ?, respuesta = ? WHERE id_exalumnos = ?";
                $params = array($nombre, $apellido, $telefono, $ocupacion, $correo, $observacion, $pregunta, $respuesta, $_SESSION['id_exalumnos']);
            }
            else if($nombre != "" && $apellido != "" && $telefono != "" && $ocupacion != "" && $correo != "" && $clave1 != "" && $clave2 != "")
            {
                if($clave1 == $clave2){
                    if($clave1 != $_SESSION['id_exalumnos']){
                        $hash = base64_encode($clave1);
                        $sql = "UPDATE ex_alumnos SET contraseña= ?, nombre1 = ?, apellido1 = ?, telefono = ?, ocupacion = ?, correo_electronico = ? WHERE id_exalumnos = ?";
                        $params = array($hash, $_SESSION['id_exalumnos']);
                    }
                    else{
                        throw new Exception("La nueva contraseña no puede ser igual a su codigo.");
                    }
                }
                else{
                    throw new Exception("Las contraseñas deben ser iguales.");
                }
            }
            else{
                throw new Exception("Debe llenar todos los campos del formulario.");
            }
            Database::executeRow($sql, $params);
            header("location: index.php");
        }
        catch (Exception $error)
        {
            print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
        }
    }
    else
    {
        $sql = "SELECT id_exalumnos, nombre1, apellido1, telefono, correo_electronico, observacion, pregunta, respuesta, ocupaciones.ocupacion FROM ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion AND id_exalumnos = ?";
        $params = array($_SESSION['id_exalumnos']);
        $data = Database::getRow($sql, $params);
        $id_exalumnos = $data['id_exalumnos'];
        $nombre1 = $data['nombre1'];
        $apellido1 = $data['apellido1'];
        $telefono = $data['telefono'];
        $ocupacion = $data['ocupacion'];
        $correo = $data['correo_electronico'];
        $observacion = $data['observacion'];
        $pregunta = $data['pregunta'];
        $respuesta = $data['respuesta'];
    }
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Tu Perfil</title>
        <?php include '../inc/styles.php'; ?>
        <meta charset="utf-8">
    </head>
    <body>
    <a class='btn' href='index.php'><i class='material-icons'>home</i></a>
        <div class="titulo">
            <h3>Tu perfil</h3>
        </div>
        <div class="card-panel paneles">
            <form method='post' class='row' enctype='multipart/form-data' autocomplete='off'>
                <div class='row'>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>account_circle</i>
                        <input id='id_exalumnos' type='text' name='id_exalumnos' class='validate black-text' length='10' maxlength='10' value='<?php print(htmlspecialchars($id_exalumnos)); ?>' required disabled/>
                        <label class="active" for='id_exalumnos'>Código:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='nombre' type='text' name='nombre' class='validate black-text' length='20' maxlength='20' value='<?php print(htmlspecialchars($nombre1)); ?>' required/>
                        <label class="active" for='nombre'>Nombre:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>person_pin</i>
                        <input id='apellido' type='text' name='apellido' class='validate black-text' length='20' maxlength='20' value='<?php print(htmlspecialchars($apellido1)); ?>' required/>
                        <label class="active" for='apellido'>Apellido:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>phone</i>
                        <input id='telefono' type='text' name='telefono' class='validate black-text' length='15' maxlength='15' value='<?php print(htmlspecialchars($telefono)); ?>'/>
                        <label class="active" for='telefono'>Teléfono:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>email</i>
                        <input id='correo' type='email' name='correo' class='validate black-text' length='50' maxlength='50' value='<?php print(htmlspecialchars($correo)); ?>'/>
                        <label class="active" for='correo'>Correo Electrónico:</label>
                    </div>
                    <div class='input-field col s12 m3'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Ocupacion -->
                        <?php
                        $sql = "SELECT id_ocupacion, ocupacion FROM ocupaciones";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='id_ocupacion' required>";
                        if($ocupacion == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una ocupacion</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['id_ocupacion']) == $row[1] || $ocupacion == $row[1])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Ocupación:</label>";
                        print($combo);
                        ?>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='observacion' type='text' name='observacion' class='validate black-text' length='75' maxlength='75' value='<?php print(htmlspecialchars($observacion)); ?>'/>
                        <label class="active" for='observacion'>Observación:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>lightbulb_outline</i>
                        <input id='pregunta' type='text' name='pregunta' class='validate black-text' length='50' maxlength='50' value='<?php print(htmlspecialchars($pregunta)); ?>'/>
                        <label class="active" for='pregunta'>Pregunta de Seguridad:</label>
                    </div>
                    <div class='input-field col s12 m4'>
                        <i class='material-icons prefix'>settings_voice</i>
                        <input id='respuesta' type='text' name='respuesta' class='validate black-text' length='50' maxlength='50' value='<?php print(htmlspecialchars($respuesta)); ?>' required/>
                        <label class="active" for='respuesta'>Respuesta de Seguridad:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='clave1' type='password' name='clave1' class='validate black-text' length='25' maxlength='25'/>
                        <label class="active" for='clave1'>Nueva Contraseña:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='clave2' type='password' name='clave2' class='validate black-text' length='25' maxlength='25'/>
                        <label class="active" for='clave2'>Confirmar Contraseña:</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <?php include '../inc/scripts.php'; ?>
    </body>
</html>
<?php
}
?>