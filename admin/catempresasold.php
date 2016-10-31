<html>
  <?php require("../bibliotecas/conexion.php");
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
      <!-- Botones cat empresa -->
      <div id="cont" class="row">
        <div class="col l10">
            <div class="row">
             <h2 class="col l12"> Categoria alumnos </h2>
             <a class="waves-effect waves-light btn col l4 offset-l4" href="empresa_read.php">Empresa</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4" href="visitas_read.php">Visitas</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
             <a class="waves-effect waves-light btn col l4 offset-l4" href="empresaes_read.php">Especialidades de empresa</a>
             <div class="divider col l4 offset-l4"></div>
             <br>
           </div>
        </div>
      </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>