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
      <div id="cont" class = "card-panel paneles z-depth-3">
        <div>
            <div class="row">
             <h2 class="col l12 center-align"> Categoria empresas </h2>
             <a class="waves-effect waves-light btn col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de empresas' href="empresa_read.php">Empresa</a>
            </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de visitas' href="visitas_read.php">Visitas</a>
             </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de especialidades por empresa' href="empresaes_read.php">Especialidades de empresa</a>
             </div>
           </div>
        </div>
      </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>