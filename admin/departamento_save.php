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
                        <title>Departamentos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3 z-depth-3'>";
                include('../inc/nav.php');
    $head .=       "<div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar un departamento</h3>
                        </div>";
    print $head;
    $id = null;
    $departamento = null;
    $encargado = null;
    $telefono_encargado = null;
    $empresa = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Departamentos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles z-depth-3'>
                        <div class='titulo'>
                            <h3>Modificar un departamento</h3>
                        </div>";
    print $head;
    $id = trim(strip_tags(base64_decode($_GET['id'])));
    $sql = "SELECT * FROM departamentosempre, empresas WHERE departamentosempre.empresa = empresas.id_empresa AND id_depar = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $departamento = $data[0]['departamento'];
    $encargado = $data[0]['encargado'];
    $telefono_encargado = $data[0]['telefono_encargado'];
    $empresa = $data[0]['empresa'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$departamento = strip_tags(trim($_POST['departamento']));
    $encargado = strip_tags(trim($_POST['encargado']));
    $telefono_encargado = strip_tags(trim($_POST['telefono_encargado']));
    $empresa = strip_tags(trim($_POST['empresa']));
    //Se declaran las consultas
    try 
    {
        if(ctype_alpha(str_replace(' ', '', $encargado)) && !is_numeric($departamento))
        {
            if($id == null){
        	  $sql = "INSERT INTO departamentosempre(departamento, encargado, telefono_encargado, empresa) VALUES(?, ?, ?, ?)";
            $params = array($departamento, $encargado, $telefono_encargado, $empresa);
        }
        else
        {
            $sql = "UPDATE departamentosempre SET departamento = ?, encargado = ?, telefono_encargado = ?, empresa = ? WHERE id_depar = ?";
            $params = array($departamento, $encargado, $telefono_encargado, $empresa, $id);
        }
        Database::executeRow($sql, $params);
<<<<<<< HEAD
        print("<script>
            alert('Porceso  exitoso.');
            window.location='departamento_index.php';
            </script>");
           
    
=======
        header("location: departamento_index.php");
        }
        else
      	{
              print("<div class='card-panel red'><i class='material-icons left'>error</i>El nombre del encargado deben ser solo numeros, el nombre del departamento no puede contener solo numeros</div>");
        }
>>>>>>> origin/master
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
                        <input id='departamento' type='text' name='departamento' class='validate' length='25' maxlength='25' value='<?php print(htmlspecialchars($departamento)); ?>' required/>
                        <label class="active" for='departamento'>Departamento:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>account_circle</i>
                        <input id='encargado' type='text' name='encargado' class='validate' length='30' maxlength='30' value='<?php print(htmlspecialchars($encargado)); ?>' required/>
                        <label class="active" for='encargado'>Encargado:</label>
                    </div>
                </div>
                <div class='row'>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>phone</i>
                        <input id='telefono_encargado' type='text' name='telefono_encargado' class='validate' length='18' maxlength='18' value='<?php print(htmlspecialchars($telefono_encargado)); ?>'/>
                        <label class="active" for='telefono_encargado'>Teléfono Encargado:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_empresa, nombre_empresa FROM empresas";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='empresa' required>";
                        if($empresa == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una empresa</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['nombre_empresa']) == $row[0] || $empresa == $row[0])
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
                <div class='titulo'>
                    <a href='departamento_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
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