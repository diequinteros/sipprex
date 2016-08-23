 <!DOCTYPE html>
 <?php
 require("../bibliotecas/conexion.php");
 session_start();
 ?>
  <html>
    <head>
      <?php include '../inc/styles.php' ?>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8"/>
    </head>
    <body class="white">
      <?php include '../inc/nav_mail.php' ?>
      <br>
      <!-- C O N T E N E D O R -->
      <h2 class="center-align">Sesiones abiertas</h2>
      <div class="container white z-depth-5">
      <ul class="collection">
      <?php
      
      //Se seleccionan el id de categoria y su nombre
      $sql = "SELECT id_sesion, fecha, os FROM sesiones WHERE usuario = ?";
      if(isset($_SESSION['id_exalumnos']))
    {
    $params = array($_SESSION['id_exalumnos']);
    }
    if(isset($_SESSION['carnet']))
    {
    $params = array($_SESSION['carnet']);
    }
    if(isset($_SESSION['codigo_admin']))
    {
    $params = array($_SESSION['codigo_admin']);
    }
    if(isset($_SESSION['id_empresa']))
    {
    $params = array($_SESSION['id_empresa']);
    }
      foreach (Database::getRows($sql, $params) as $sesions) {
          $dataE = base64_encode($sesions['id_sesion']);
          //por cada categoria se imprimira su opcion con el nombre y la direccion mas el id de la categoria
          print("<li class='collection-item'><div> Sistema operativo: ".htmlspecialchars($sesions['os'])." Fecha de inicio: ".htmlspecialchars($sesions['fecha'])." <a href='cerrarses.php?id={$dataE}' class='secondary-content'><i class='material-icons'>clear</i></a></div></li>");
      }
      ?>
      </ul>
      <!-- F I N - P R O D U C T O S - M A S - V E N D I D O -->          
      </div>
      <!-- F I N - C O N T E N E D O R -->
      <?php include '../inc/scripts.php' ?>
    </body>
        <?php include '../inc/footer.php' ?>
  </html>