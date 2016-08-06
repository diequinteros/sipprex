<!-- Se llaman los diferentes archivos que contienen nuestras clases de conexion y consultas -->
<?php
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
                        <title>Grupos Técnicos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../inc/nav.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar un Grupo Técnico</h3>
                        </div>";
    print $head;
    $id = null;
    $grupo = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Grupos Técnicos</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../inc/nav.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Grupo Técnico</h3>
                        </div>";
    print $head;
    $id = $_GET['id'];
    $sql = "SELECT * FROM grupo_tecnico WHERE id_grupo_tec = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $grupo = $data[0]['grupo_tec'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$alumno = strip_tags(trim($_POST['grupo_tec']));
    //Se declaran las consultas
    try 
    {
      	if($id == null){
        	$sql = "INSERT INTO grupo_tecnico(grupo_tec) VALUES(?)";
            $params = array($grupo);
        }
        else
        {
            $sql = "UPDATE grupo_tecnico SET grupo_tec = ? WHERE id_grupo_tec = ?";
            $params = array($grupo, $id);
        }
        Database::executeRow($sql, $params);
        header("location: grupotec_index.php");
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
                        <input id='grupo_tec' type="text" name='grupo_tec' class='validate' length='1' maxlength='1' value='<?php print($grupo); ?>'/>
                        <label class="active" for='grupo_tec'>Grupo Técnico</label>
                    </div>
                </div>
                <div class='titulo'>
                    <a href='grupotec_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; ?>
        <?php include('../inc/footer.php'); ?>
    </body>
</html>