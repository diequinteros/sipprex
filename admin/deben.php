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
                        <title>Registrospp</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body>
                <?php include('../inc/nav.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Reportes Por Especialidad</h3>
                        </div>";
    print $head;
    $esp = null;
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
                <body>
                <?php include('../inc/nav.php'); ?>
                    <div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Modificar un departamento</h3>
                        </div>";
    print $head;
    $esp = $data[0]['Especialidad'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	
    $esp = strip_tags(trim($_POST['Especialidad']));
}
?>
<!-- Se crea nuestro formulario general ya sea de creacion o modificacion -->
            <form method='post' action ='finalizo2.php' class='row' autocomplete="off" enctype='multipart/form-data'>
                    <div class='input-field col s12 m6'>
                        <!-- Mediante las siguientes sentencias se llena el comboBox con los datos de Empresas -->
                        <?php
                        $sql = "SELECT id_especialidad, especialidad FROM especialidades";
                        $data = Database::getRows($sql, null);
                        $combo = "<br><select class='browser-default' name='Especialidad' required>";
                        if($esp == null)
                        {
                            $combo .= "<option value='' disabled selected>Seleccione una Especialidad</option>";
                        }
                        foreach($data as $row)
                        {
                            $combo .= "<option value='$row[0]'";
                            if(isset($_POST['Especialidad']) == $row[0] || $esp == $row[0])
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
                <div class='titulo'>
                    <a href='registrospp_index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
                    <button type='submit' href='finalizo2.php' class='btn blue'><i class='material-icons right'>description</i>Reporte</button>
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