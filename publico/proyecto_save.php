<?php
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");

session_start();
		if($_SESSION['id_empresa'] != null) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Proyecto</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../inc/nav.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar un Proyecto</h3>
                        </div>";
    print $head;
    $id = null;
    $titulo = null;
    $descripcion = null;
    $remunerado = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Anuncios</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                include('../inc/nav.php');
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Proyecto</h3>
                        </div>";
    print $head;
    $id = $_GET['id_proyecto'];
    $sql = "SELECT * FROM proyecto WHERE id_proyecto = ? AND id_empre_encargado = ?";
    $params = array($id,$_SESSION['id_empresa']);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $titulo = $data[0]['titulo'];
    $descripcion = $data[0]['descripcion'];
    $remunerado = $data[0]['remunerado'];
}
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$titulo = strip_tags(trim($_POST['titulo']));
    $descripcion = strip_tags(trim($_POST['descripcion']));
    $remunerado = strip_tags(trim($_POST['remunerado']));
    //Se declaran las consultas
    try 
    {
      	if($id == null){
        	$sql = "INSERT INTO proyecto(titulo, descripcion, remunerado, id_empre_encargado) VALUES(?, ?, ?, ?)";
            $params = array($titulo, $descripcion, $remunerado, $_SESSION['id_empresa']);
        }
        else
        {
            $sql = "UPDATE proyecto SET titulo = ?, descripcion = ?, remunerado = ? WHERE id_proyecto = ? AND id_empre_encargado = ?";
            $params = array($titulo, $descripcion, $remunerado, $id, $_SESSION['id_empresa']);
        }
        Database::executeRow($sql, $params);
        header("location: proyecto_index.php");
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
                        <i class='material-icons prefix'>book</i>
                        <input id='titulo' type="text" name='titulo' class='validate' length='30' maxlength='30' value='<?php print(htmlspecialchars($titulo)); ?>'/>
                        <label class="active" for='titulo'>Titulo:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='descripcion' type="text" name='descripcion' class='validate' length='200' maxlength='200' value='<?php print(htmlspecialchars($descripcion)); ?>'/>
                        <label class="active" for='descripcion'>Descripcion de proyecto:</label>
                    </div>
                     <p>
					      <input id='remunerado' type="checkbox" name='remunerado' class="filled-in" id="filled-in-box" checked="checked" value='<?php print(htmlspecialchars($remunerado)); ?>' />
					      <label for="remunerado">Remunerado:</label>
    				</p>
                    </div>
                <div>
                    <a href='proyecto_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button  href='proyecto_index.php'type='submit' class='btn blue'><i class='material-icons right'>check_circle</i>Guardar</button>
                </div>
            </form>
        </div>
        <!-- Finalmente se relacionan los scripts del sitio -->
        <?php include '../inc/scripts.php'; ?>
    </body>
</html>