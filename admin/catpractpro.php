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
             <h2 class="col l12 center-align"> Categoria alumnos </h2>
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de alumnos' href="alumnos_index.php">Alumnos</a>
            </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de especialidades' href="espe_read.php">Especialidades</a>
             </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de grados' href="grado_read.php">Grado</a>
             </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de secciones' href="seccion_read.php">Sección</a>
             </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de grupos académicos' href="grupoaca_read.php">Grupo academico</a>
             </div>
             
             <br>
             <div class="row">
             <a class="waves-effect waves-light btn-large col l4 offset-l4 tooltipped" data-position='right' data-delay='10' data-tooltip='Datos de grupos técnicos' href="grupotec_index.php">Grupo técnico</a>
             </div>
           </div>
        </div>
      </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>