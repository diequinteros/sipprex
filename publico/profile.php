<?php
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
session_start();

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$contraseña = strip_tags(trim($_POST['contraseña']));
  	$nombre = strip_tags(trim($_POST['nombre1']));
    $apellido = strip_tags(trim($_POST['apellido1']));
    $telefono = strip_tags(trim($_POST['telefono']));
    $ocupacion = strip_tags(trim($_POST['ocupacion']));
    $correo = strip_tags(trim($_POST['correo_electronico']));

    try 
    {
      	if($contraseña != "" && $nombre != "" && $apellido != "" && $telefono != "" && $ocupacion != "" && $correo != "")
        {
            $clave = password_hash($clave1, PASSWORD_DEFAULT);
            $sql = "UPDATE ex_alumnos SET contraseña = ?, nombre1= ?, apellido1 = ?, telefono = ?, ocupacion = ?, correo_electronico = ? WHERE id_exalumnos = ?";
            $params = array($contraseña, $nombre, $apellido, $telefono, $ocupacion, $correo, $_SESSION['id_exalumnos']);
        }
        else
        {
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
    $sql = "SELECT contraseña, nombre1, apellido1, telefono, ocupaciones.id_ocupacion, correo_electronico FROM ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion AND id_exalumnos = ?";
    $params = array($_SESSION['id_exalumno']);
    $data = Database::getRows($sql, $params);
    $contraseña = $data[0]['contraseña'];
    $nombre = $data[0]['nombre1'];
    $apellido = $data[0]['apellido1'];
    $telefono = $data[0]['telefono'];
    $ocupacion = $data[0]['id_ocupacion'];
    $correo = $data[0]['correo_electronico'];
}
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Perfil</title>
        <?php include '../inc/styles.php'; ?>
        <meta charset="utf-8">
    </head>
    <body>
        <div class="titulo">
            <h3>Tu perfil</h3>
        </div>
        <div class="card-panel paneles">
            <form method='post' class='row' enctype='multipart/form-data'>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña' type='text' name='contraseña' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($contraseña)); ?>' required/>
                        <label class="active" for='contraseña'>Contraseña:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>add_circle</i>
                        <input id='nombre1' type='text' name='nombre1' class='validate' length='25' maxlength='25' value='<?php print(htmlspecialchars($nombre)); ?>' required/>
                        <label class="active" for='nombre1'>Nombre</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>account_circle</i>
                        <input id='apellido1' type='text' name='apellido1' class='validate' length='30' maxlenght='30' value='<?php print(htmlspecialchars($apellido)); ?>'/>
                        <label class="active" for='apellido1'>Apellido:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>phone</i>
                        <input id='telefono' type='text' name='telefono' class='validate' length='15' maxlenght='25' value='<?php print(htmlspecialchars($telefono)); ?>'/>
                        <label class="active" for='telefono'>Teléfono:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Ocupaciones -->
                        <?php
                        $sql = "SELECT id_ocupacion, ocupacion FROM ocupaciones";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='ocupacion' required>";
                        if($ocupacion == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una ocupación</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['ocupacion']) == $row[0] || $ocupacion == $row[0])
                            {
                                $combo .= " selected";
                            }
                            $combo .= ">$row[1]</option>";
                        }	
                        $combo .= "</select>
                                <label class='active' style='text-transform: capitalize;'>Ocupación</label>";
                        print($combo);
                        ?>
                    </div>
                </div>
                <div class='row'>
                    <div class='file-field input-field col s12 m6'>
                        <i class='material-icons prefix'>mail_outline</i>
                        <input id='correo_electronico' type='text' name='correo_electronico' class='validate' length='25' maxlenght='25' value='<?php print(htmlspecialchars($correo)); ?>'/>
                        <label class="active" for='correo_electronico'>Correo Electrónico:</label>
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