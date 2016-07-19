<html>
  <?php 
  session_start();
 require("../bibliotecas/conexion.php"); 
 require("../bibliotecas/Validator.php"); 
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php


if(empty($_GET['id'])) 
{
    $id = null;
    $Empresas= null;
    $Rubro = null;
    $Direccion = null;
    $Telefono = null;
    $Contacto = null;
    $Correo = null;
}
else
{
    
    $id = $_GET['id'];
    $sql = "SELECT * FROM empresas WHERE id_empresa = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $Empresas = $data['nombre_empresa'];
    $Rubro = $data['rubro'];
    $Direccion = $data['direccion'];
    $Telefono = $data['telefono'];
    $Contacto = $data['contacto'];
    $Correo = $data['correo'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $Empresas = $_POST['nombre_empresa'];
    $Rubro = $_POST['rubro'];
    $Direccion = $_POST['direccion'];
    $Telefono = $_POST['telefono'];
    $Contacto = $_POST['contacto'];
    $Correo = $_POST['correo'];

    if($Rubro == "")
    {
        $Rubro = null;
    }
      if($Direccion == "")
    {
        $Direccion = null;
    }
      if($Telefono == "")
    {
        $Telefono = null;
    }
      if($Contacto == "")
    {
        $Contacto = null;
    }
      if($Correo == "")
    {
        $Correo = null;
    }

    try 
    {
      	if($Empresas == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO empresas(nombre_empresa, rubro, direccion, telefono, contacto, correo) VALUES(?, ?, ?, ?, ?, ?)";
            $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo);
        }
        else
        {
            $sql = "UPDATE empresas SET nombre_empresa = ?, rubro = ?, direccion = ?, telefono = ?, contacto = ?, correo = ? WHERE id_empresa = ?";
            $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $id);
        }
        Database::executeRow($sql, $params);
        header("location: empresa_read.php");
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' class='row' enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='nombre_empresa' type='text' name='nombre_empresa' class='validate' length='50' maxlenght='50' value='<?php print($Empresas); ?>' required/>
          	<label for='nombre_empresa'>Empresas</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='rubro' type='text' name='rubro' class='validate' length='200' maxlenght='200' value='<?php print($Rubro); ?>'/>
          	<label for='rubro'>Rubro</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='direccion' type='text' name='direccion' class='validate' length='50' maxlenght='50' value='<?php print($Direccion); ?>' required/>
            <label for='direccion'>Direccion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='telefono' type='text' name='telefono' class='validate' length='200' maxlenght='200' value='<?php print($Telefono); ?>'/>
            <label for='telefono'>Telefono</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contacto' type='text' name='contacto' class='validate' length='50' maxlenght='50' value='<?php print($Contacto); ?>' required/>
            <label for='contacto'>Contacto</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='correo' type='text' name='correo' class='validate' length='200' maxlenght='200' value='<?php print($Correo); ?>'/>
            <label for='correo'>Correo</label>
        </div>
    </div>
    <a href='empresa_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
    </body>
</html>