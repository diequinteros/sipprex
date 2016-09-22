  <?php
  ob_start(); 
  session_start();
 require("../bibliotecas/conexion.php"); 
 require("../bibliotecas/Validator.php"); 
if(empty($_GET['id'])) 
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Empresas</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar una empresa</h3>
                        </div>";
    print $head;
    $id = null;
    $Empresas= null;
    $Rubro = null;
    $Direccion = null;
    $Telefono = null;
    $Contacto = null;
    $Correo = null;
    $Codigo = null;
    $Contraseña1 = null;
    $contraseña2 = null;
}
else
{
    $head = "";
    $head .= "<!DOCTYPE html>
                <html lang='es'>
                    <head>
                        <title>Empresas</title>";
                        include '../inc/styles.php';
    $head .= "<meta charset='utf-8'>
                </head>
                <body class='grey lighten-3'>";
                include('../inc/nav.php');
    $head .=     "<div class='card-panel paneles'>
                        <div class='titulo'>
                            <h3>Agregar una empresa</h3>
                        </div>";
    print $head;
    $id = base64_decode($_GET['id']);
    $sql = "SELECT * FROM empresas WHERE id_empresa = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $codE = $data['nombre_empresa'];
    $contra = "";
    $Empresas = $data['nombre_empresa'];
    $Rubro = $data['rubro'];
    $Direccion = $data['direccion'];
    $Telefono = $data['telefono'];
    $Contacto = $data['contacto'];
    $Correo = $data['correo'];
    $Codigo = $data['codigo_empresa'];
}

if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
  	$Empresas = strip_tags(trim($_POST['nombre_empresa']));
    $Rubro = strip_tags(trim($_POST['rubro']));
    $Direccion = strip_tags(trim($_POST['direccion']));
    $Telefono = strip_tags(trim($_POST['telefono']));
    $Contacto = strip_tags(trim($_POST['contacto']));
    $Correo = strip_tags(trim($_POST['correo']));
    $Codigo = strip_tags(trim($_POST['codigo_empresa']));
    $Contraseña1 = strip_tags(trim($_POST['contraseña1']));
    $Contraseña2 = strip_tags(trim($_POST['contraseña2']));

    try 
    {

      	if($Empresas == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$sql = "INSERT INTO empresas(codigo_empresa, contraseña_empre,nombre_empresa, rubro, direccion, telefono, contacto, correo) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            $contra = password_hash($contra, PASSWORD_DEFAULT);
            $params = array($codE, $contra, $Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo);
        }
        else
        {
            $sql = "UPDATE empresas SET contraseña_empre = ?, nombre_empresa = ?, rubro = ?, direccion = ?, telefono = ?, contacto = ?, correo = ? WHERE id_empresa = ?";
            $contra = password_hash($contra, PASSWORD_DEFAULT);
            $params = array($contra, $Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $id);
        if($id == null){
            if($Contraseña1 = ""){
                $Contraseña1 = null;
                $Verif = true;
            }
            else{
                if($Contraseña1 >= 8 && $Contraseña1 <= 25){
                    $Verif = true;
                }
                else{
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de la contraseña es inválido</div>");
                }
            }
            if($Contraseña2 = ""){
                $Contraseña2 = null;
                $Verif2 = true;
            }
            else{
                if($Contraseña2 >= 8 && $Contraseña2 <= 25){
                    $Verif2 = true;
                }
                else{
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de la confirmación de contraseña es inválido</div>");
                }
            }
            if($Codigo = ""){
                $Codigo = null;
                $Verif3 = true;
            }
            else{
                if($Codigo >= 8 && $Codigo <= 30){
                    $Verif3 = true;
                }
                else{
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato del código es inválido</div>");
                }
            }
            if($Verif == true && $Verif2 == true && Verif3 == true){
                if($Contraseña1 == $Contraseña2){
                    if($Contraseña1 != $Codigo){
                        $hash = password_hash($Contraseña1, PASSWORD_DEFAULT);
                        $sql = "INSERT INTO empresas(nombre_empresa, rubro, direccion, telefono, contacto, correo, codigo_empresa, contraseña_empre) VALUES(?,?,?,?,?,?,?,?)";
                        $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $Codigo, $hash);
                    }
                    else{
                        print("<div class='card-panel red'><i class='material-icons left'>error</i>La contraseña y el c´dogio de la empresa no pueden ser iguales.</div>");
                    }
                }
                else{
                    print("<div class='card-panel red'><i class='material-icons left'>error</i>Las contraseñas no coinciden</div>");
                }
            }
            else{
                print("<div class='card-panel red'><i class='material-icons left'>error</i>El formato de los datos es inválido</div>");
            }
        }
        else{
            
            $sql = "UPDATE empresas SET nombre_empresa = ?, rubro = ?, direccion = ?, telefono = ?, contacto = ?, correo = ? WHERE id_empresa = ?";
            $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $id);
        }
        Database::executeRow($sql, $params);
        header("location: empresa_read.php");
    }
    }
    catch(Exception $error)
    {
        print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
    }
}
?>
<form method='post' autocomplete="off" enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6 l6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='cod_empre' type='text' name='cod_empre' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($Empresas)); ?>' required/>
          	<label for='cod_empre'>Codigo de empresa</label>
        </div>
        <div class='input-field col s12 m6 l6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='contra' type='text' name='contra' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Rubro)); ?>'/>
          	<label for='contra'>Contraseña</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6 l6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='nombre_empresa' type='text' name='nombre_empresa' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($Empresas)); ?>' required/>
          	<label for='nombre_empresa'>Empresas</label>
        </div>
        <div class='input-field col s12 m6 l6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='rubro' type='text' name='rubro' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Rubro)); ?>'/>
          	<label for='rubro'>Rubro</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6 l6'>
            <i class='material-icons prefix'>add</i>
            <input id='direccion' type='text' name='direccion' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($Direccion)); ?>' required/>
            <label for='direccion'>Direccion</label>
        </div>
        <div class='input-field col s12 m6 l6'>
            <i class='material-icons prefix'>add</i>
            <input id='telefono' type='text' name='telefono' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Telefono)); ?>'/>
            <label for='telefono'>Telefono</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6 l6'>
            <i class='material-icons prefix'>add</i>
            <input id='contacto' type='text' name='contacto' class='validate' length='50' maxlenght='50' value='<?php print(htmlspecialchars($Contacto)); ?>' required/>
            <label for='contacto'>Contacto</label>
        </div>
        <div class='input-field col s12 m6 l6'>
            <i class='material-icons prefix'>add</i>
            <input id='correo' type='text' name='correo' class='validate' length='200' maxlenght='200' value='<?php print(htmlspecialchars($Correo)); ?>'/>
            <label for='correo'>Correo</label>
        </div>
    </div>
    <a href='empresa_read.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Guardar</button>
</form>
</div>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
    </body>
</html>
<?php
ob_end_flush();
?>