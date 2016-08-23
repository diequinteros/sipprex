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
          $observaciones = $data['observaciones'];
          $acuerdo = $data['acuerdo'];
          $bitacora = $data['bitacora'];
          $carta = $data['carta'];
          $evaluaciones = $data['evaluaciones'];
          $observacion_final = $data['observacion_final'];  
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
        <div class="input-field col s12 m2">
         <p>
           <?php
           if($acuerdo == 1){
            print("<input type='checkbox' class='filled-in black-text' id='acuerdo' checked='checked' disabled='disabled'/>
            <label for='acuerdo'>Acuerdo</label>"); 
           }
           else {
            print("<input type='checkbox' class='filled-in black-text' id='acuerdo' disabled='disabled'/>
            <label for='acuerdo'>Acuerdo</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12 m2">
         <p>
           <?php
           if($carta == 1){
            print("<input type='checkbox' class='filled-in black-text' id='carta' checked='checked' disabled='disabled'/>
            <label for='carta'>Carta</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in black-text' id='carta' disabled='disabled'/>
            <label for='carta'>Carta</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12 m2">
         <p>
           <?php
           if($bitacora == 1){
            print("<input type='checkbox' class='filled-in black-text' id='bita' checked='checked' disabled='disabled'/>
            <label for='bita'>Bitacora</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in black-text' id='bita' disabled='disabled'/>
            <label for='bita'>Bitacora</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12 m2">
         <p>
           <?php
           if($evaluaciones){
            print("<input type='checkbox' class='filled-in black-text' id='eva' checked='checked' disabled='disabled'/>
            <label for='eva'>Evaluacion</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in black-text' id='eva' disabled='disabled'/>
            <label for='eva'>Evaluacion</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12 m2">
         <p>
           <?php
           if($finalizo){
            print("<input type='checkbox' class='filled-in black-text' id='final' checked='checked' disabled='disabled'/>
            <label for='final'>Finalizo</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in black-text' id='final' disabled='disabled'/>
            <label for='final'>Finalizo</label>");
           }
            ?>
         </p> 
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