<html>
  <?php 
  session_start();
 require("../bibliotecas/conexion.php"); 
 require("../bibliotecas/Validator.php");
 if(!isset($_SESSION['id_empresa']))
 {
     header("location: login.php");
 } 
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
    <?php
    include("../inc/nav.php");
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
        $ContraActual = strip_tags(trim($_POST['contra']));
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
            if($ContraActual != null)
            {
                $sqlContra = "SELECT * FROM empresas WHERE id_empresa = ?";
                $P = array($_SESSION['id_empresa']);
                $contrabase = Database::getRow($sqlContra, $P);
                if($Contraseña1Empresa != null && $Contraseña2Empresa != null && $ContraActual == $contrabase['contraseña_empre'])
                {
                if($Contraseña1Empresa == $Contraseña2Empresa)
                {
                    $sql = "UPDATE empresas SET contraseña_empre = ?";
                    $params = array($Contraseña1Empresa);
                    Database::executeRow($sql, $params);
                    session_start();
                    $_SESSION['codigo_empresa'] = $CodigoEmpresa;
                    header("location: index_empresa.php");
                }
                else {
                    throw new Exception("Las contraseñas no coinciden");
                    
                }
                }else {
                    throw new Exception("Las contraseñas no coinciden");
                }
            }
            if($Empresas != null && $Rubro != null && $Direccion != null && $Telefono != null && $Contacto != null && $Correo != null && $CodigoEmpresa != null)
            {
                    $sql = "UPDATE empresas SET nombre_empresa=?, rubro=?, direccion=?, telefono=?, contacto=?, correo=?, codigo_empresa=? WHERE id_empresa = ?";
                    $params = array($Empresas, $Rubro, $Direccion, $Telefono, $Contacto, $Correo, $CodigoEmpresa, $_SESSION['id_empresa']);
                    Database::executeRow($sql, $params);
                    header("location: index_empresa.php");
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
    else{
        $sql = "SELECT * FROM empresas WHERE id_empresa = ?";
        $para = array($_SESSION['id_empresa']);
        $datosEmpe = Database::getRow($sql, $para);
    }
    ?>
    <div class="container">
    <h2>Por favor ingrese los datos de su empresa:</h2>
    </div>
    <form method='post' class='row' autocomplete="off" enctype='multipart/form-data'>
        <div class='row'>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='nombre_empresa' type='text' name='nombre_empresa' class='validate' length='50' maxlenght='50' value="<?php print(htmlspecialchars($datosEmpe['nombre_empresa'])); ?>" required/>
                <label for='nombre_empresa'>Empresas</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='rubro' type='text' name='rubro' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['rubro'])); ?>" length='200' maxlenght='200'/>
                <label for='rubro'>Rubro</label>
            </div>
        </div>
        <div class='row'>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='direccion' type='text' name='direccion' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['direccion'])); ?>" length='50' maxlenght='50' required/>
                <label for='direccion'>Direccion</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='telefono' type='text' name='telefono' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['telefono'])); ?>" length='200' maxlenght='200'/>
                <label for='telefono'>Telefono</label>
            </div>
        </div>
        <div class='row'>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='contacto' type='text' name='contacto' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['contacto'])); ?>" length='50' maxlenght='50' required/>
                <label for='contacto'>Contacto</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='correo' type='text' name='correo' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['correo'])); ?>" length='200' maxlenght='200'/>
                <label for='correo'>Correo</label>
            </div>
        </div>
        <div class='row'>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='codigo' type='text' name='codigo' class='validate'  value="<?php print(htmlspecialchars($datosEmpe['codigo_empresa'])); ?>" length='50' maxlenght='50' required/>
                <label for='codigo'>Codigo para inicio de sesion</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='contra' type='text' name='contra' class='validate' length='40' maxlenght='25'/>
                <label for='contra'>Contraseña actual</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='contra1' type='text' name='contra1' class='validate' length='40' maxlenght='25'/>
                <label for='contra1'>Nueva contraseña</label>
            </div>
            <div class='input-field col s12 m6'>
                <i class='material-icons prefix'>add</i>
                <input id='contra2' type='text' name='contra2' class='validate' length='40' maxlenght='25'/>
                <label for='contra2'>Vuelva a introducir su contraseña nueva</label>
            </div>
        </div>
        <a href='index_empresa.php' class='btn  green darken-4'><i class='material-icons right'>cancel</i>Cancelar</a>
        <button type='submit' class='btn  teal darken-3'><i class='material-icons right'>check_circle</i>Actualizar registro</button>
    </form>
    <?php
    include("../inc/scripts.php");
    include("../inc/footer.php");
    ?>
    </body>
</html>