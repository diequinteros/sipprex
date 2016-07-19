<html>
  <?php require("../bibliotecas/conexion.php");
  session_start();
   ?>
    <head>
    </head>
    <!-- NAV -->
    <?php include("../inc/nav.php")?>
    <body class="grey lighten-3">
            <?php
      include("../inc/styles.php");
      $sql = "SELECT nombre_empresa, finalizo, observaciones, acuerdo, bitacora, carta, evaluaciones, observacion_final FROM registrospp, empresas WHERE registrospp.empresa = empresas.id_empresa AND alumno = ?";
    $params = array($_SESSION['carnet']);
    $data = Database::getRows($sql, $params);
    //Se utiliza el segmento [0] debido a que el fetchAll utilizado en la clase getRows, devuelve un arreglo bi-dimensional y
    //al devolver un solo valor, se debe especificar de que fila se tomara, en este caso al haber solo una seria la [0]
    if($data[0]['nombre_empresa'] != null)
    {
    $nombreempre = $data[0]['nombre_empresa'];
    $finalizo = $data[0]['finalizo'];
    $observaciones = $data[0]['observaciones'];
    $acuerdo = $data[0]['acuerdo'];
    $bitacora = $data[0]['bitacora'];
    $carta = $data[0]['carta'];
    $evaluaciones = $data[0]['evaluaciones'];
    $pbservacion_final = $data[0]['observacion_final'];  
    }
      ?>
      <!-- Anuncios -->
      <div class="">
    <form class="white col s12 offset-l1 z-depth-2">
      <div class="row">
        <div class="input-field col s12">
          <input disabled id="nombreempre" type="text" class="validate" value="<?php print($nombreempre); ?>">
          <label for="nombreempre">Empresa</label>
        </div>
        <div class="input-field col s12">
          <input disabled id="observacion" type="text" class="validate" value="<?php print($observaciones); ?>">
          <label for="observacion">observacion</label>
        </div>
        <div class="input-field col s12">
         <p>
           <?php
           if($acuerdo == 1){
            print("<input type='checkbox' class='filled-in' id='acuerdo' checked='checked' disabled='disabled'/>
            <label for='acuerdo'>Acuerdo</label>"); 
           }
           else {
            print("<input type='checkbox' class='filled-in' id='acuerdo' disabled='disabled'/>
            <label for='acuerdo'>Acuerdo</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12">
         <p>
           <?php
           if($carta == 1){
            print("<input type='checkbox' class='filled-in' id='carta' checked='checked' disabled='disabled'/>
            <label for='carta'>Carta</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in' id='carta' disabled='disabled'/>
            <label for='carta'>Carta</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12">
         <p>
           <?php
           if($bitacora == 1){
            print("<input type='checkbox' class='filled-in' id='bita' checked='checked' disabled='disabled'/>
            <label for='bita'>Bitacora</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in' id='bita' disabled='disabled'/>
            <label for='bita'>Bitacora</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12">
         <p>
           <?php
           if($evaluaciones){
            print("<input type='checkbox' class='filled-in' id='eva' checked='checked' disabled='disabled'/>
            <label for='eva'>Evaluacion</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in' id='eva' disabled='disabled'/>
            <label for='eva'>Evaluacion</label>");
           }
            ?>
         </p> 
        </div>
        <div class="input-field col s12">
         <p>
           <?php
           if($finalizo){
            print("<input type='checkbox' class='filled-in' id='final' checked='checked' disabled='disabled'/>
            <label for='final'>Finalizo</label>");
           }
           else {
            print("<input type='checkbox' class='filled-in' id='final' disabled='disabled'/>
            <label for='final'>Finalizo</label>");
           }
            ?>
         </p> 
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input disabled value="<?php print($pbservacion_final); ?>" id="obserfinal" type="text" class="validate">
          <label for="obserfinal">Observacion final</label>
        </div>
      </div>
    </form>
    </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>