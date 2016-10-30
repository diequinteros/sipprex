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
                        <title>Exalumnos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Agregar un Ex-alumno</h3>
                        </div>";
    print $head;
    $id = null;
    $contraseña = null;
    $nombre = null;
    $apellido = null;
    $telefono = null;
    $ocupacion = null;
    $correo = null;
    $observacion = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Exalumnos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=      "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar un Ex-alumno</h3>
                        </div>";
    print $head;
    $id = strip_tags(trim(base64_decode($_GET['id'])));
    $sql = "SELECT contraseña, nombre1, apellido1, telefono, ocupaciones.id_ocupacion, correo_electronico, observacion FROM ex_alumnos, ocupaciones WHERE ex_alumnos.ocupacion = ocupaciones.id_ocupacion AND id_exalumnos = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $contraseña = $data[0]['contraseña'];
    $nombre = $data[0]['nombre1'];
    $apellido = $data[0]['apellido1'];
    $telefono = $data[0]['telefono'];
    $ocupacion = $data[0]['id_ocupacion'];
    $correo = $data[0]['correo_electronico'];
    $observacion = $data[0]['observacion'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
    $id2 = strip_tags(trim($_POST['codigo']));
  	$contraseña = strip_tags(trim($_POST['contraseña']));
    $nombre = strip_tags(trim($_POST['nombre1']));
    $apellido = strip_tags(trim($_POST['apellido1']));
    $telefono = strip_tags(trim($_POST['telefono']));
    $ocupacion = strip_tags(trim($_POST['ocupacion']));
    $correo = strip_tags(trim($_POST['correo_electronico']));
    $observacion = strip_tags(trim($_POST['observacion']));
    //Se declaran las consultas
    try 
    {
       /* if (ctype_alpha(str_replace(' ', '', $name)) === false)  {
        $errors[] = 'Name must contain letters and spaces only';
        }
        */
        if(filter_var($correo, FILTER_VALIDATE_EMAIL) && ctype_alpha(str_replace(' ', '', $nombre)) && ctype_alpha(str_replace(' ', '', $apellido)) && (ctype_alpha(str_replace(' ', '', $observacion)) || $observacion == null) &&  is_numeric($id2) && $contraseña != null)
        {
        $contraseña = password_hash($contraseña, PASSWORD_DEFAULT);
      	if($id == null){
        	  $sql = "INSERT INTO ex_alumnos(id_exalumnos, contraseña, nombre1, apellido1, telefono, ocupacion, correo_electronico, observacion) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            $params = array($id2, $contraseña, $nombre, $apellido, $telefono, $ocupacion, $correo, $observacion);
        }
        else
        {
            $sql = "UPDATE ex_alumnos SET contraseña = ?, nombre1 = ?, apellido1 = ?, telefono = ?, ocupacion = ?, correo_electronico = ?, observacion = ? WHERE id_exalumnos = ?";
            $params = array($contraseña, $nombre, $apellido, $telefono, $ocupacion, $correo, $observacion, $id);
        }
        Database::executeRow($sql, $params);
<<<<<<< HEAD
         print("<script>
            alert('Porceso  exitoso.');
            window.location='exalumnos_index.php';
            </script>");
        
=======
        header("location: exalumnos_index.php");
        }
        else{
         print("<div class='card-panel red'><i class='material-icons left'>error</i>Por favor verifique que su correo, nombre (Solo letras) y observacion (Solo letras) sea valido.</div>");       
        }
    
>>>>>>> origin/master
    }
    //En caso de error se muestra al administrador en turno
    catch (Exception $error)
    {
        
    }
}
?>
<!-- Se crea nuestro formulario general ya sea de creacion o modificacion -->
            <form method='post' class='row' autocomplete="off" enctype='multipart/form-data'>
            <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class="material-icons prefix">keyboard_arrow_right</i>
                        <input id='codigo' type='text' name='codigo' class='validate' length='25' maxlength='25' value='<?php print(htmlspecialchars($id)); ?>' required/>
                        <label class="active" for='codigo'>Codigo</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>lock</i>
                        <input id='contraseña' type='password' name='contraseña' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($contraseña)); ?>' required/>
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
                        <input id='telefono' type='tel' name='telefono' class='validate' length='15' maxlenght='25' value='<?php print(htmlspecialchars($telefono)); ?>'/>
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
                        <input id='correo_electronico' type='email' name='correo_electronico' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($correo)); ?>'/>
                        <label class="active" for='correo_electronico'>Correo Electrónico:</label>
                    </div>
                    <div class='file-field input-field col s12 m6'>
                        <i class='material-icons prefix'>visibility</i>
                        <input id='observacion' type='text' name='observacion' class='validate' length='100' maxlenght='100' value='<?php print(htmlspecialchars($observacion)); ?>'/>
                        <label class="active" for='observacion'>Observación:</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='exalumnos_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; ?>
        <?php include('../inc/footer.php'); ?>
    </body>
</html>
<?php
ob_end_flush();
?>