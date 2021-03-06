<?php
ob_start();
require("../bibliotecas/conexion.php");
require("../bibliotecas/validator.php");
require("../bibliotecas/functions.php");

session_start();
		if(!isset($_GET['id'])) 
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
                        include('../inc/styles.php');
    $head .= "<meta charset='utf-8'>
                </head>
                <body>";
                include('../inc/nav.php');
    $head .=         "<div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un Proyecto</h3>
                        </div>";
    print $head;
    $id = base64_decode($_GET['id']);
    if(isset($_SESSION['id_empresa']))
    {
		$sql = "SELECT * FROM proyecto WHERE id_proyecto = ? AND id_empre_encargado = ?";
    $params = array($id,$_SESSION['id_empresa']);
	}
	if(isset($_SESSION['id_exalumnos']))
	{
		$sql = "SELECT * FROM proyecto WHERE id_proyecto = ? AND id_exalum_encargado = ?";
    $params = array($id,$_SESSION['id_exalumnos']);
	}
    
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
        if(!is_numeric($titulo) && !is_numeric($descripcion))
        {
            if($id == null){
            if(isset($_SESSION['id_empresa']))
			{
				$sql = "INSERT INTO proyecto(titulo, descripcion, remunerado, id_empre_encargado) VALUES(?, ?, ?, ?)";
            $params = array($titulo, $descripcion, $remunerado, $_SESSION['id_empresa']);
			}
			if(isset($_SESSION['id_exalumnos']))
			{
				$sql = "INSERT INTO proyecto(titulo, descripcion, remunerado, id_exalum_encargado) VALUES(?, ?, ?, ?)";
            $params = array($titulo, $descripcion, $remunerado, $_SESSION['id_exalumnos']);
			}  
        }
        else
        {
            if(isset($_SESSION['id_empresa']))
			{
			$sql = "UPDATE proyecto SET titulo = ?, descripcion = ?, remunerado = ? WHERE id_proyecto = ? AND id_empre_encargado = ?";
            $params = array($titulo, $descripcion, $remunerado, $id, $_SESSION['id_empresa']);
			}
			if(isset($_SESSION['id_exalumnos']))
			{
				$sql = "UPDATE proyecto SET titulo = ?, descripcion = ?, remunerado = ? WHERE id_proyecto = ? AND id_exalum_encargado = ?";
            $params = array($titulo, $descripcion, $remunerado, $id, $_SESSION['id_exalumnos']);
			}
            
        }
        Database::executeRow($sql, $params);

          print("<script>
            alert('Proceso  exitoso.');
            window.location='proyecto_index.php';
            </script>");
           
        

        header("location: proyecto_index.php");
        }
        else
      	{
              print("<div class='card-panel red'><i class='material-icons left'>error</i>El titulo y la descripcion no deben contener solo numeros</div>");
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
                     <?php
                     if(htmlspecialchars($remunerado) == 1)
                     {
                        print("<input id='remunerado' type='checkbox' name='remunerado' class='filled-in' id='filled-in-box' checked='checked' value='1' />
					      <label for='remunerado'>Remunerado:</label>");
                     }
                     else{
                         print("<input id='remunerado' type='checkbox' name='remunerado' class='filled-in' id='filled-in-box' value = '1'/>
					      <label for='remunerado'>Remunerado:</label>");
                     }
                     ?>
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
<?php
ob_end_flush();
?>