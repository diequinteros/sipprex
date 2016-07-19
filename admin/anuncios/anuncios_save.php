<!-- Se llaman los diferentes archivos que contienen nuestras clases de conexion y consultas -->
<?php
require("../../bibliotecas/conexion.php");
require("../../bibliotecas/validator.php");
session_start();

//Se realizan los procesos necesarios para modificar e insertar
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Anuncios</title>";
                        include '../../inc/styles2.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../../inc/nav.1.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar un Anuncio</h3>
                        </div>";
    print $head;
    $id = null;
    $titulo_anuncio = null;
    $contenido_anuncio = null;
}
else{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Anuncios</title>";
                        include '../../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                include('../../inc/nav.1.php');
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Anuncio</h3>
                        </div>";
    print $head;
    $id = $_GET['id'];
    $sql = "SELECT * FROM anuncios WHERE id_anuncio = ?";
    $params = array($id);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    $titulo_anuncio = $data[0]['titulo_anuncio'];
    $contenido_anuncio = $data[0]['contenido_anuncio'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$titulo_anuncio = $_POST['titulo_anuncio'];
    $contenido_anuncio = $_POST['contenido_anuncio'];
    //Se declaran las consultas
    try 
    {
      	if($id == null){
        	$sql = "INSERT INTO anuncios(titulo_anuncio, contenido_anuncio) VALUES(?, ?)";
            $params = array($titulo_anuncio, $contenido_anuncio);
        }
        else
        {
            $sql = "UPDATE anuncios SET titulo_anuncio = ?, contenido_anuncio = ? WHERE id_anuncio = ?";
            $params = array($titulo_anuncio, $contenido_anuncio, $id);
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
                        <i class='material-icons prefix'>book</i>
                        <input id='titulo_anuncio' type="text" name='titulo_anuncio' class='validate' length='100' maxlength='100' value='<?php print($titulo_anuncio); ?>'/>
                        <label class="active" for='titulo_anuncio'>Titulo del Anuncio:</label>
                    </div>
                    <div class='input-field col s12 m6'>
                        <i class='material-icons prefix'>edit</i>
                        <input id='contenido_anuncio' type="text" name='contenido_anuncio' class='validate' length='200' maxlength='200' value='<?php print($contenido_anuncio); ?>'/>
                        <label class="active" for='contenido_anuncio'>Contenido del Anuncio:</label>
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
    </body>
</html>