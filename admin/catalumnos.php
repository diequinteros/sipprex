<html>
  <?php
   require("../bibliotecas/conexion.php");
  session_start();
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
    <!-- NAV -->
    <?php include("../inc/nav.php");?>
    <body class="grey lighten-3">
      <!-- Anuncios -->
      <div id="cont" class="row">
        <div class="col l10">
            <div class="row">
             <h2 class="col l12"> Categoria alumnos </h2>
             <a class="waves-effect waves-light btn col l4 offset-l4">Alumnos</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4">Especialidades</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4">Grado</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4" href="seccion_read.php">Sección</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4" href="grupoaca_read.php">Grupo academico</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4">Grupo técnico</a>
           </div>
        </div>
      </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>