<html>
  <?php require("../bibliotecas/conexion.php");
  session_start();
   ?>
    <head>
    <?php include("../inc/styles.php"); ?>
    </head>
    <!-- NAV -->
    <?php include("../inc/nav.php"); ?>
    <body class="grey lighten-3">
      <?php
          $sql = "SELECT * FROM registrospp, empresas WHERE registrospp.empresa = empresas.id_empresa AND alumno = ?";
          $params = array($_SESSION['carnet']);
          $data = Database::getRow($sql, $params);
          if($data['empresa'] != null)
          {
          $nombreempre = $data['nombre_empresa'];
          $finalizo = $data['finalizo'];
          $observaciones = $data['observaciones_tecnicas'];
          $acuerdo = $data['acuerdo'];
          $bitacora = $data['bitacora'];
          $carta = $data['carta'];
          $evaluaciones = $data['evaluaciones'];
          $observacion_final = $data['observacion_final'];  
          }
          else{
            $nombreempre = null;
          $finalizo = null;
          $observaciones = null;
          $acuerdo = null;
          $bitacora = null;
          $carta = null;
          $evaluaciones = null;
          $observacion_final = null;
          print("<div class='card-panel red'><i class='material-icons left'>error</i>No has empezado el proceso de practicas profesionales</div>");
          }
      ?>
      <!-- Anuncios -->
      <div class="">
    <form class="white col s12 offset-l1 z-depth-2">
    <br>
      <div class="row">
        <div class="input-field col s12 m6">
          <input disabled id="nombreempre" type="text" class="validate black-text" value="<?php print(htmlspecialchars($nombreempre)); ?>">
          <label for="nombreempre">Empresa</label>
        </div>
        <div class="input-field col s12 m6">
          <input disabled id="observacion" type="text" class="validate black-text" value="<?php print(htmlspecialchars($observaciones)); ?>">
          <label for="observacion">Observacion</label>
        </div>
        <br>
        <div class="file-field input-field col s12 m6">
         <div class="btn blue-grey darken-2">
            <span>Acuerdo</span>
            <input name="acuerdo" id="acuerdo" type="file">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path validate" type="text">
          </div>
        </div>
        <div class="file-field input-field col s12 m6">
         <div class="btn blue-grey darken-2">
            <span>Bitacora</span>
            <input name="bitacora" id="bitacora" type="file">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path validate" type="text">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="file-field input-field col s12 m6">
         <div class="btn blue-grey darken-2">
            <span>Carta</span>
            <input name="carta" id="carta" type="file">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path validate" type="text">
          </div> 
        </div>
        <div class="file-field input-field col s12 m6">
          <div class="btn blue-grey darken-2">
              <span>Evaluaciones</span>
              <input name="evaluaciones" id="evaluaciones" type="file">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path validate" type="text">
          </div>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="input-field col s12 m12">
          <input disabled value="<?php print(htmlspecialchars($observacion_final)); ?>" id="obserfinal" type="text" class="validate black-text">
          <label for="obserfinal">Observacion final</label>
        </div>
      </div>
    </form>
    </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>