<html>
  <?php
  ob_start();
  session_start();
   require("../bibliotecas/conexion.php");
   require("../bibliotecas/validator.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
      <link rel="stylesheet" type="text/css" href="../css/blue-tabs.css">
    </head>
<body>
	<?php
      include("../inc/nav_mail.php");
      ?>
      <div class="container">
      </div>
<?php
if(empty($_SESSION))
{
	header("location:../publico/login.php");
}
else{
  $isempresa = false;
  $isalumno = false;
  $isadmin = false;
  $isexalumno = false;
  if(isset($_SESSION['codigo_empresa'])){
    $id = $_SESSION['codigo_empresa'];
    $isempresa = true;
  }
  if(isset($_SESSION['codigo_admin'])){
    $id = $_SESSION['codigo_admin'];
    $isadmin = true;
  }
  if(isset($_SESSION['carnet'])){
    $id = $_SESSION['carnet'];
    $isalumno = true;
  }
  if(isset($_SESSION['id_exalumnos'])){
    $id = $_SESSION['id_exalumnos'];
    $isexalumno = true;
  }
}
if(!empty($_POST))
{
    $_POST = Validator::validateForm($_POST);
    $email = strip_tags(trim($_POST['email']));
    $nombre = strip_tags(trim($_POST['nombre']));
    if(trim($email)!="" && $email != null && trim($nombre)!="" && $nombre != null){
        $sql = "INSERT INTO mensajes(id_empre_origen, admin_des, titulo, contenido) VALUES(?,1,?, ?)";
        $sqlNombre = "SELECT nombre_empresa FROM empresas WHERE id_empresa = ?";
        $parametrosNombre = array($id);
        $nombre_empre = Database::getRow($sqlNombre, $parametrosNombre);
        $titulo = "MENSAJE DEL SISTEMA - EMPRESA CON ID: ".$id." Y NOMBRE: ".$nombre_empre['nombre_empresa']." SOLICITA USUARIO Y CONTRASEÑA";
        $conte = "CORREO EMPRESA: ".$email." AL PROPIETARIO: ".$nombre;
        $params = array($id, $titulo, $conte);
        Database::executeRow($sql,$params);
        header("location: mensaje_enviado.php");
    }
}
?>
<div class="container z-depth-5">

<?php
        //<li> class="collection-header"><h5>Mensaje a administrador de empresa </h5></li>
?>
  <h2 class="center-align">Buzon de mensajes <i class="material-icons md-48">markunread_mailbox</i></h2>
  <!-- ESTRUCTURA MODAL NUEVO MENSAJE -->
  <div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
      <form  method='post' enctype='multipart/form-data'>
      <ul class="collection with-header">
              <li class="collection-item">
                  <div class="input-field col s12">
                  <input id="email" name="email" type="text" class="validate">
                  <label for="email" data-error="wrong" data-success="right">Email donde enviar usuario y contraseña</label>
                  </div>
              </li>
              <li class="collection-item">
                  <div class="input-field col s12">
                  <input id="nombre" name="nombre" type="text" class="validate">
                  <label for="nombre">Nombre de propietario de correo</label>
                  </div>
              </li>
              <li>
              <div class="center-align">
                  <button class="btn waves-effect waves-light" type="submit" name="action">Enviar mensaje
                      <i class="material-icons right">send</i>
                  </button>
                  <a class="waves-effect waves-light btn red" href="buscar_empresa.php"><i class="material-icons right">clear</i>cancelar</a>
              </div>
              </li>
            </ul>      
      </form>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
  </div>
  <!-- FIN ESTRUCTURA MODAL -->
  <!-- DIV BANDEJA -->
  <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a class="active blue-text" href="#recibidos">Recibidos</a></li>
        <li class="tab col s3"><a class="blue-text" href="#enviados">Enviados</a></li>
      </ul>
    </div>
    <!-- contenido de recibidos -->
    <div id="recibidos" class="col s12">
      <div class="collection with-header" id="lstMensajes">
      <ul class="collection with-header">
        <li class="collection-header"><h4>Mensajes recibidos</h4></li>
      </ul>
        <?php
        $sqlRecibidos = null;
        //RECIBIDOS Y ENVIADOS DE ADMIN
          if($isadmin)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_origen, id_empre_origen, id_usuario_origen FROM mensajes WHERE admin_des = 1";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos, fecha_leeido FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_origen = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosEx['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."' onclick='abrir(leido.php?id=".htmlspecialchars($datosEx['cod_mensaje']).");'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."<i class='material-icons right'>mail_outline</i></a>");
                }
              }
              if($filas['id_usuario_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet, fecha_leeido FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_origen = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosAlum['nombre1'])." ".$datosAlum['apellido1']."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosAlum['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."<i class='material-icons right'>mail_outline</i></a>");
                }
                  
              }
              if($filas['id_empre_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa, fecha_leeido FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_origen = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosEmpre['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."<i class='material-icons right'>mail_outline</i></a>");
                }
                  
              }
            }
          }
          //Empiezo de USUARIO
          if($isalumno)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_origen, id_empre_origen, admin_ori FROM mensajes WHERE id_usuario_destino IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_origen = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</a>");  
              }
              if($filas['admin_ori'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del administrador</a>");  
              }
              if($filas['id_empre_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_origen = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</a>");  
              }
            }
          }
          //EMPIEZO DE Exalumno
          if($isexalumno)
          {
            $sqlRecibidos = "SELECT cod_mensaje, admin_ori, id_empre_origen, id_usuario_origen FROM mensajes WHERE id_exalum_destino IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['admin_ori'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de administrador</a>");  
              }
              if($filas['id_usuario_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_origen = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</a>");  
              }
              if($filas['id_empre_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_origen = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</a>");  
              }
            }
          }
          //EMPIEZO DE EMPRESA
          if($isempresa)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_origen, id_empre_origen, id_usuario_origen FROM mensajes WHERE id_empre_destino IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_origen = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</a>");  
              }
              if($filas['id_usuario_origen'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_origen = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</a>");  
              }
              if($filas['admin_ori'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de administrador</a>");  
              }
            }
          }
          /*<li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>*/
        ?>
      </div>
    </div>
    <!-- contenido de enviados -->
    <div id="enviados" class="col s12">
      <div class="collection with-header" id="lstMensajes">
      <ul class="collection with-header">
        <li class="collection-header"><h4>Mensajes recibidos</h4></li>
      </ul>
        <?php
        $sqlRecibidos = null;
        //ENVIADOS DE ADMIN
          if($isadmin)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_destino, id_empre_destino, id_usuario_destino FROM mensajes WHERE admin_ori = 1";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos, fecha_leeido FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_destino = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosEx['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."' onclick='abrir(leido.php?id=".htmlspecialchars($datosEx['cod_mensaje']).");'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."<i class='material-icons right'>mail_outline</i></a>");
                }
              }
              if($filas['id_usuario_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet, fecha_leeido FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_destino = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosAlum['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."<i class='material-icons right'>mail_outline</i></a>");
                }
                  
              }
              if($filas['id_empre_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa, fecha_leeido FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_destino = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                if($datosEmpre['fecha_leeido'] != null)
                {
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."<i class='material-icons right'>done</i></a>");  
                }
                else{
                  print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."<i class='material-icons right'>mail_outline</i></a>");
                }
                  
              }
            }
          }
          //Empiezo de USUARIO
          if($isalumno)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_destino, id_empre_destino, admin_des FROM mensajes WHERE id_usuario_origen IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_destino = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</a>");  
              }
              if($filas['admin_des'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del administrador</a>");  
              }
              if($filas['id_empre_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_destino = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</a>");  
              }
            }
          }
          //EMPIEZO DE Exalumno
          if($isexalumno)
          {
            $sqlRecibidos = "SELECT cod_mensaje, admin_des, id_empre_destino, id_usuario_destino FROM mensajes WHERE id_exalum_origen IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['admin_des'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de administrador</a>");  
              }
              if($filas['id_usuario_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_destino = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</a>");  
              }
              if($filas['id_empre_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre_empresa, id_empresa FROM mensajes, empresas WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_empre_destino = empresas.id_empresa";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de la empresa: ".htmlspecialchars($datosEmpre['nombre_empresa'])."</a>");  
              }
            }
          }
          //EMPIEZO DE EMPRESA
          if($isempresa)
          {
            $sqlRecibidos = "SELECT cod_mensaje, id_exalum_destino, admin_des, id_usuario_destino FROM mensajes WHERE id_empre_origen IS NOT NULL";
            $obtenerids = Database::getRows($sqlRecibidos ,null);
            foreach ($obtenerids as $filas) {
              if($filas['id_exalum_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, id_exalumnos FROM mensajes, ex_alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_exalum_destino = ex_alumnos.id_exalumnos";
                $datosEx = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEx['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEx['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>De: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEx['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEx['cod_mensaje'])."'><h5>".htmlspecialchars($datosEx['titulo'])."</h5> Mensaje de ex alumno: ".htmlspecialchars($datosEx['nombre1'])." ".htmlspecialchars($datosEx['apellido1'])."</a>");  
              }
              if($filas['id_usuario_destino'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado, nombre1, apellido1, carnet FROM mensajes, alumnos WHERE cod_mensaje = $filas[cod_mensaje] AND mensajes.id_usuario_destino = alumnos.carnet";
                $datosAlum = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosAlum['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosAlum['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosAlum['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosAlum['cod_mensaje'])."'><h5>".htmlspecialchars($datosAlum['titulo'])."</h5> Mensaje del alumno: ".htmlspecialchars($datosAlum['nombre1'])." ".htmlspecialchars($datosAlum['apellido1'])."</a>");  
              }
              if($filas['admin_des'] != null){
                $sqlRecibidos1 = "SELECT cod_mensaje, titulo, contenido, fecha_enviado FROM mensajes WHERE cod_mensaje = $filas[cod_mensaje]";
                $datosEmpre = Database::getRow($sqlRecibidos1, null);
                $modalEs = "
                 <div id='".htmlspecialchars($datosEmpre['cod_mensaje'])."' class='modal modal-fixed-footer'>
                    <div class='modal-content'>
                      <h4>".htmlspecialchars($datosEmpre['titulo'])."</h4>
                      <div class='divider'></div>
                      <h5>Para: Administrador</h5>
                      <div class='divider'></div>
                      <p>".htmlspecialchars($datosEmpre['contenido'])."</p>
                    </div>
                    <div class='modal-footer'>
                      <a href='#!' class='modal-action modal-close waves-effect waves-green btn-flat '>Cerrar</a>
                    </div>
                 </div>
                ";
                print($modalEs);
                print("<a class='modal-trigger collection-item' href='#".htmlspecialchars($datosEmpre['cod_mensaje'])."'><h5>".htmlspecialchars($datosEmpre['titulo'])."</h5> Mensaje de administrador</a>");  
              }
            }
          }
          /*<li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>
          <li class="collection-item">Alvin</li>*/
        ?>
      </div>
  </div>
  <!-- FIN DIV BANDEJA -->
  <!-- BOTON ESTATICO -->
  <div class="fixed-action-btn" style="bottom: 20%; right: 10%;">
      <!-- Activador del modal1 -->
        <a class="btn-floating btn-large red">
          <i class="large material-icons">add</i>
        </a>
        <ul>
      <?php
      if(!$isadmin)
      {
        print("<li><a class='btn-floating red tooltipped'  href='enviar_mail.php?toadmin=true' data-position='left' data-delay='50' data-tooltip='Nuevo mensaje a administrador'><i class='material-icons'>assignment_ind</i></a></li>");
      }
      if(!$isalumno){
        print("<li><a class='btn-floating green tooltipped'  href='buscar_alum.php' data-position='left' data-delay='50' data-tooltip='Nuevo mensaje para un alumno'><i class='material-icons'>school</i></a></li>");
      }
      if(!$isempresa)
      {
        print("<li><a class='btn-floating yellow darken-1 tooltipped'  href='buscar_empresa.php' data-position='left' data-delay='50' data-tooltip='Nuevo mensaje a empresa'><i class='material-icons'>business</i></a></li>");
      }
      if(!$isexalumno)
      {
        print("<li><a class='btn-floating blue tooltipped'  href='buscar_ex.php' data-position='left' data-delay='50' data-tooltip='Nuevo mensaje para ex alumno'><i class='material-icons'>person</i></a></li>");
      }
      ?>
    </ul>
  </div>
  <!-- FIN BOTON ESTATICO -->
</div>
</div>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
<script type="text/javascript" src="../js/modal.js"></script>
	</body>
</html>
<?php
ob_end_flush();
?>