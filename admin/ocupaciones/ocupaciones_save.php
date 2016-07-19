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
                        <title>Ocupaciones</title>";
                        include '../../inc/styles2.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../../inc/nav.1.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar una Ocupación</h3>
                        </div>";
    print $head;
    $id = null;
    $ocupacion = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Ocupaciones</title>";
                        include '../../inc/styles2.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../../inc/nav.1.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar una Ocupación</h3>
                        </div>";
    print $head;
    $id = $_GET['id'];
    $sql = "SELECT * FROM ocupaciones WHERE id_ocupacion = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $ocupacion = $data[0]['ocupacion'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$ocupacion = $_POST['ocupacion'];
    //Se declaran las consultas
    try 
    {
      	if($id == null){
        	$sql = "INSERT INTO ocupaciones(ocupacion) VALUES(?)";
            $params = array($ocupacion);
        }
        else
        {
            $sql = "UPDATE ocupaciones SET ocupacion = ? WHERE id_ocupacion = ?";
            $params = array($ocupacion, $id);
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
                    <div class='input-field col s12 m12'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='ocupacion' type="text" name='ocupacion' class='validate' length='20' maxlength='20' value='<?php print($ocupacion); ?>'/>
                        <label class="active" for='ocupacion'>Ocupación</label>
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
        <?php include('../../inc/footer.php'); ?>
    </body>
</html>