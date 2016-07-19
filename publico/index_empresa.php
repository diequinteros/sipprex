 <?php 
 require("../bibliotecas/conexion.php");
  session_start();
  if(isset($_SESSION['id_empresa']))
  {
    ?>
   <html> 
   <head>
      <link href="../img/icons/MaterialIcons-Regular.woff2" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../css/md_icons.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../css/dropdown-width.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../css/css.css"  media="screen,projection"/>   
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <!-- NAV -->
    
    <body class="grey lighten-3">
      <!-- Inicio empresa -->
      <?php
      include("../inc/nav.php");
      $sqlNombreEmpre = "SELECT nombre_empresa FROM empresas WHERE codigo_empresa = $_SESSION[id_empresa]";
      $nombre = Database::getRow($sqlNombreEmpre, null);
      print("<h2 class='center-align'>Bienvenido a SIPPREX - $nombre[nombre_empresa]</h2>");
      ?>
      <div class="row container">
        <div class="card col l3 m3 offset-m3 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/icono_proyectos.png">
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Mis proyectos<i class="material-icons right">more_vert</i></span>
                    <p><a href="proyecto_index.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Mis proyectos<i class="material-icons right">close</i></span>
                    <p>Vea los proyectos que su empresa ha publicado en SIPPREX y cree nuevos proyectos.</p>
                </div>
        </div>
        <div class="card col l3 offset-l1 m3 offset-m3 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/icono_msj.png">
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Bandeja de mensajes<i class="material-icons right">more_vert</i></span>
                    <p><a href="../mail/mail.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Bandeja de mensajes<i class="material-icons right">close</i></span>
                    <p>Vea los mensajes que ha recibido y enviado a los administradores del sistema o alumnos del ITR.</p>
                </div>
        </div>
        <div class="card col l3 offset-l1 m3 offset-m3 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/icono_info.png">
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Informacion de mi empresa<i class="material-icons right">more_vert</i></span>
                    <p><a href="actualizar_info.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Informacion de mi empresa<i class="material-icons right">close</i></span>
                    <p>Visualice la informacion de su empresa y mantengala actualizada.</p>
                </div>
        </div>

      </div>
      <script type="text/javascript" src="../js/jquery-2.2.0.min.js"></script>
      <script type="text/javascript" src="../js/materialize.min.js"></script>
      <script type="text/javascript" src="../js/sidenav.js"></script>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>
  <?php 
  }
  else {
    header("location: login.php");
  } 
   ?>