  <?php require("../bibliotecas/conexion.php");
  session_start();
  if(isset($_SESSION['id_exalumnos']) || isset($_SESSION['carnet']) || isset($_SESSION['codigo_admin']))
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
    <?php include("../inc/nav.php")?>
    <body class="grey lighten-3">
      <!-- Anuncios -->
      <div class="row">
        <div class="col l10 offset-l1">
          <?php
            $sql = "SELECT titulo_anuncio, contenido_anuncio FROM anuncios";
            $params = null;
            $data = Database::getRows($sql, $params);
            if($data != null)
            {
                foreach($data as $row)
                {
                      $tabla = 	"<div class='z-depth-2'>
                                <div class='card white'>
                                <div class='card-content'>";
                      $tabla .= "<span class='card-title'><h1>".htmlspecialchars($row[titulo_anuncio])."</h1></span>";
                      $tabla .= "<div class='row'>";
        
          
              
              $tabla .= "<p>".htmlspecialchars($row[contenido_anuncio]).".</p>";
              $tabla .= "</div>";
              $tabla .= "
                      </div>
                    </div>
                </div>";
              print($tabla);
            }
            }
            else
            {
              print("<div class='card-panel yellow'><i class='material-icons left'>warning</i>No se encuentra ningun anuncio disponible.</div>");
            }
            ?>
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
   