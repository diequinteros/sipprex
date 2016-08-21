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
    <?php include("../inc/nav.php") 
    ?>
    <body class="grey lighten-3">
      <!-- Anuncios -->
      <div class="row">
        <div class="col l10 offset-l1">
          <?php
            $page = null;
            //Se toma la variable de paginacion
            if(!empty($_GET['page'])) {
              $page = strip_tags(trim($_GET['page']));
            }
            //Si la variable de paginacion esta vacia se pone como 1
            if($page == null) {
              $page = 1;
            }
            //Si la variable es 1 el limite empezara desde 0
            if($page == "" || $page == "1")
            {
              $page1 = 0;
            }
            else {
            //Se multiplica la pagina por el numero de items que se muestran (24) y se restan 24 para poder empezar desde el siguiente producto 
              $page1 = ($page*20)-20; 
            }
            $sql = "SELECT titulo_anuncio, contenido_anuncio FROM anuncios LIMIT $page1,20";
            $params = null;
            $data = Database::getRows($sql, $params);
            if($data != null)
            {
                foreach($data as $row)
                {
                      $tabla = 	"<div class='z-depth-2'>
                                <div class='card white'>
                                <div class='card-content'>";
                      $tabla .= "<span class='card-title'><h1>".htmlspecialchars($row['titulo_anuncio'])."</h1></span>";
                      $tabla .= "<div class='row'>";
        
          
              
              $tabla .= "<p>".htmlspecialchars($row['contenido_anuncio']).".</p>";
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
            <ul class="pagination center-align">
	<?php
	$cons2 = ("SELECT COUNT(titulo_anuncio) FROM anuncios");
            $parametros = null;
            $filas = Database::getRow($cons2, $parametros);
            $filas = $filas[0]/20;
            $filas = ceil($filas);
            //Si la paginacion es 1, el 1 estara deshabilitado
                if($page == 1)
                {
                    $pagi = "<li class='disabled'><a><i class='material-icons'>chevron_left</i></a></li>";
                }
                //caso contrario esta habilitado
                else {
                    $page2 = $page - 1;
                    $pagi = "<li class='waves-efect'><a href='index.php?page=$page2'><i class='material-icons'>chevron_left</i></a></li>";
                }
                //Se imprime cada pagina, si la pagina que se imprimio concide con el numero de pagina que se imprime se imprimira seleccionado
                for($i = 1; $i<=$filas; $i++) {
                    if($page==$i)
                    {
                     $pagi .= "<li class='active blue'><a href='index.php?page=$i'>$i</a></li>";
                    }
                    //Si no solo se imprimira
                    else{
                        $pagi .= "<li class='waves-effect'><a href='index.php?page=$i'>$i</a></li>";
                    }
                }
                //Al igual que si la pagina es la primera, si es la ultima se vera deshabilitada o no
                if($page == $filas)
                {
                    $pagi .= "<li class='disabled'><a><i class='material-icons'>chevron_right</i></a></li>";
                }
                else {
                    $page2 = $page + 1;
                    $pagi .= "<li class='waves-efect'><a href='index.php?page=$page2'><i class='material-icons'>chevron_right</i></a></li>";
                }
                print($pagi);
	?>
	</ul>
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
   