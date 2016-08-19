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
    $id = null;
    $Empresas= null;
    $Rubro = null;
    $Direccion = null;
    $Telefono = null;
    $Contacto = null;
    $Correo = null;
    $CodigoEmpresa = null;
    $Contraseña1Empresa = null;
    $Contraseña2Empresa = null;
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	 $Empresas = strip_tags(trim($_POST['nombre_empresa']));
    $Rubro = strip_tags(trim($_POST['rubro']));
    $Direccion = strip_tags(trim($_POST['direccion']));
    $Telefono = strip_tags(trim($_POST['telefono']));
    $Contacto = strip_tags(trim($_POST['contacto']));
    $Correo = strip_tags(trim($_POST['correo']));
    $CodigoEmpresa = strip_tags(trim($_POST['codigo']));
    $Contraseña1Empresa = strip_tags(trim($_POST['contra1']));
    $Contraseña2Empresa = strip_tags(trim($_POST['contra2']));
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
    if($CodigoEmpresa == "")
    {
        $CodigoEmpresa = null;
    }
    if($Contraseña1Empresa == "")
    {
        $Contraseña1Empresa = null;
    }
    if($Contraseña2Empresa == "")
    {
        $Contraseña2Empresa = null;
    }
    if($Empresas == "")
        {
            $Empresas = "";
        }
    try 
    {
      	if($Empresas != null && $Rubro != null && $Direccion != null && $Telefono != null && $Contacto != null && $Correo != null && $CodigoEmpresa != null && $Contraseña1Empresa != null && $Contraseña2Empresa != null)
          {
              if($Contraseña1Empresa == $Contraseña2Empresa)
              {
                $sql = "INSERT INTO empresas(nombre_empresa, rubro, direccion, telefono, contacto, correo, codigo_empresa, contraseña_empre) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $CodigoEmpresa, $Contraseña1Empresa);
                Database::executeRow($sql, $params);
                session_start();
                $sql = "SELECT * FROM empresas WHERE codigo_empresa = ?";
                $p = array($CodigoEmpresa);
                $id_empre = Database::getRow($sql,$p);
                $_SESSION['id_empresa'] = $id_empre['id_empresa'];
                header("location: index_empresa.php");
              }
              else {
                  throw new Exception("Las contraseñas no coinciden");
                  
              }
          }
        	else {
                throw new Exception("Debe llenar todos los datos");
            }
    }
    catch (Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<div class="container">
<h2>Por favor ingrese los datos de su empresa:</h2>
</div>
<form action="capt.php" method='POST'  autocomplete="off" class='row' enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='nombre_empresa' type='text' name='nombre_empresa' class='validate' length='50' maxlenght='50' required/>
          	<label for='nombre_empresa'>Empresas</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='rubro' type='text' name='rubro' class='validate' length='200' maxlenght='200'/>
          	<label for='rubro'>Rubro</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='direccion' type='text' name='direccion' class='validate' length='50' maxlenght='50' required/>
            <label for='direccion'>Direccion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='telefono' type='text' name='telefono' class='validate' length='200' maxlenght='200'/>
            <label for='telefono'>Telefono</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contacto' type='text' name='contacto' class='validate' length='50' maxlenght='50' required/>
            <label for='contacto'>Contacto</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='correo' type='text' name='correo' class='validate' length='200' maxlenght='200'/>
            <label for='correo'>Correo</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='codigo' type='text' name='codigo' class='validate' length='50' maxlenght='50' required/>
            <label for='codigo'>Codigo para inicio de sesion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contra1' type='text' name='contra1' class='validate' length='40' maxlenght='25'/>
            <label for='contra1'>Contraseña</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contra2' type='text' name='contra2' class='validate' length='40' maxlenght='25'/>
            <label for='contra2'>Vuelva a introducir su contraseña</label>
             <BR>
                <div class="g-recaptcha" data-theme="dark" data-sitekey="6Lf9QiYTAAAAAG93eoZBNCZG0FVGOPevW3bhugra"></div>
        </div>
    </div>
    <a href='login_empre.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Crear registro</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="js/jquery.min"></script>
    </body>
</html>