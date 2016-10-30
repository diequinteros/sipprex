<html>
  <?php 
  ob_start();
  session_start();
 require("../bibliotecas/conexion.php"); 
 require("../bibliotecas/validator.php");
 require("../bibliotecas/functions.php");
 require("../bibliotecas/verios.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
      <script src='https://www.google.com/recaptcha/api.js'></script>
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
      	if($Empresas != null && $Rubro !=null && $Direccion != null && $Telefono != null && $Contacto != null && $Correo != null && $CodigoEmpresa != null && $Contraseña1Empresa != null && $Contraseña2Empresa != null && filter_var($Correo, FILTER_VALIDATE_EMAIL) && !is_numeric($Empresas) && !is_numeric($Contacto) && !is_numeric($Rubro) && !is_numeric($Direccion))
          {
              if($Contraseña1Empresa == $Contraseña2Empresa)
              {
                if(isset($_POST["g-recaptcha-response"]) && $_POST["g-recaptcha-response"])
                {
                    //var_dump($_POST);
                    $secret ="6Lff-CcTAAAAAJjQHKT4BcSGTPtEoQGn4lz_lE4f";
                    $id = $_SERVER["REMOTE_ADDR"];

                    $capt = $_POST["g-recaptcha-response"];

                    $res = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secret&response=$capt&remoteid=$id");

                    //echo "<br>";
                    //var_dump($res);

                    $array = json_decode($res, TRUE);
                    echo "<br>";
                    if($array["success"])
                    {
                        $sql = "INSERT INTO empresas(nombre_empresa, rubro, direccion, telefono, contacto, correo, codigo_empresa, contraseña_empre) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                        $pas = password_hash($Contraseña1Empresa, PASSWORD_DEFAULT);
                        $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $CodigoEmpresa, $pas);
                        Database::executeRow($sql, $params);
                        $sql = "SELECT * FROM empresas WHERE codigo_empresa = ?";
                        $p = array($CodigoEmpresa);
                        $id_empre = Database::getRow($sql,$p);
                        $_SESSION['id_empresa'] = $id_empre['id_empresa'];
                        $sesU = uniqid().'_ses';
					$_SESSION['ses'] = $sesU;
					$sqlSes = "INSERT INTO sesiones_empre(unisesion, usuario, os) VALUES(?, ?, ?)";
					$parametros = array($sesU, $id_empre['id_empresa'], os_info($uagent));
					Database::executeRow($sqlSes, $parametros);
					$ahora = date("Y-n-j H:i:s");
					$_SESSION["ultimoAcceso"] = $ahora;
                    print("<script>
            alert('Porceso  exitoso.');
            window.location=' index_empresa.php';
            </script>");
                             
                    }     
                    else{
                        print("<div class='card-panel red'><i class='material-icons left'>Eres un spamer</i></div>");
                    }
                }
                else 
                {
                    throw new Exception("No se resolvio el reCaptcha");                    
                }
            }
            else 
            {
                throw new Exception("Las contraseñas son diferentes.");
            }
        }
        else 
        {
            throw new Exception("Debe ingresar todos los datos y verificar que el nombre de su empresa, contacto, rubro y direccion no sean solo numeros.");
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
<form  method = "post"  class='row' autocomplete="off" enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='nombre_empresa' type='text' name='nombre_empresa' class='validate' length='25' maxlength='25' value='<?php print(htmlspecialchars($Empresas)); ?>'required/>
          	<label for='nombre_empresa'>Empresas</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='rubro' type='text' name='rubro' class='validate' length='70' maxlenght='70'value='<?php print(htmlspecialchars($Empresas)); ?>'/>
          	<label for='rubro'>Rubro</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='direccion' type='text' name='direccion' class='validate' length='25' maxlength='25' value='<?php print(htmlspecialchars($Empresas)); ?>'required/>
            <label for='direccion'>Direccion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='telefono' type='text' name='telefono' class='validate' length='12' maxlength='12' value='<?php print(htmlspecialchars($Telefono)); ?>'required/>
            <label for='telefono'>Telefono</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contacto' type='text' name='contacto' class='validate' length='15' maxlength='15' value='<?php print(htmlspecialchars($Contacto)); ?>'/>
            <label for='contacto'>Contacto</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='correo' type='text' name='correo' class='validate' length='49' maxlenght='49'  value='<?php print(htmlspecialchars($Correo)); ?>'/>
            <label for='correo'>Correo</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='codigo'  type='number' name='codigo' class='validate' length='4' maxlength='4' value='<?php print(htmlspecialchars($CodigoEmpresa)); ?>'/>
            <label for='codigo'>Codigo para inicio de sesion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contra1' type='password' name='contra1' class='validate' length='8' maxlength='8' value='<?php print(htmlspecialchars($Contraseña1Empresa)); ?>'/>
            <label for='contra1'>Contraseña</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>add</i>
            <input id='contra2' type='password' name='contra2' class='validate' length='8' maxlength='8' value='<?php print(htmlspecialchars($Contraseña2Empresa)); ?>' required/>
            <label for='contra2'>Vuelva a introducir su contraseña</label>
              <BR>     
        </div>
        <div class="g-recaptcha col s12 m6" data-theme="dark" data-sitekey="6Lff-CcTAAAAAJt_H1WxWdBYR81AHYkQ0pEa1yNR"></div>
                
    </div>
    <a href='login_empre.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Crear registro</button>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>

    </body>
</html>
<?php
ob_end_flush();
?>

