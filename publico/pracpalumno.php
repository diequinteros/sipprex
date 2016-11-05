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
        <div class="input-field col s12 m4">
          <input disabled id="nombreempre" type="text" class="validate black-text" value="<?php print(htmlspecialchars($nombreempre)); ?>">
          <label for="nombreempre">Empresa</label>
        </div>
        <div class="input-field col s12 m4">
          <input disabled id="observacion" type="text" class="validate black-text" value="<?php print(htmlspecialchars($observaciones)); ?>">
          <label for="observacion">Observacion</label>
        </div>
        <div class="input-field col s12 m4">
          <input disabled value="<?php print(htmlspecialchars($observacion_final)); ?>" id="obserfinal" type="text" class="validate black-text">
          <label for="obserfinal">Observacion final</label>
        </div>
      </div>
      <div class='row'>
        <div class='input-field col s12 m6 '>
            <label class="active">¿Finalizó?</label>
            <input disabled id='f_si' type='radio' name='finalizo' class='with-gap black-text' value='1' <?php print(($finalizo == 1)?"checked":""); ?>/>
            <label for='f_si'><i class='material-icons'>check</i></label>
            <input disabled id='f_no' type='radio' name='finalizo' class='with-gap black-text' <?php print(($finalizo == 0)?"checked":""); ?>/>
            <label for='f_no'><i class='material-icons'>cancel</i></label>
        </div>
        <div class='col s12 m6 '>
            <i class='material-icons prefix'>add</i>
            <!--<input type="date" class="datepicker">-->
            <input disabled id='fecha_ultima_visita' type='date' name='fecha' class='datepicker black-text' value='<?php if($Fecha != null){print($Fecha);} ?>'/>
            <!--<label for='fecha_ultima_visita'>Fecha</label>-->
        </div>
        <div class='input-field col s12 m6 '>
            <i class='material-icons prefix'>visibility</i>
            <input disabled id='observaciones' type="text" name='observaciones' class='validate black-text' length='200' maxlength='200' value='<?php print(htmlspecialchars($observaciones)); ?>'/>
            <label class="active" for='observaciones'>Observaciones</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m3 '>
            <label class="active">¿Entrego Acuerdo?</label>
            <input disabled id='a_si' type='radio' name='acuerdo' class='with-gap black-text' value='1' <?php print(($acuerdo == 1)?"checked":""); ?>/>
            <label for='a_si'><i class='material-icons'>check</i></label>
            <input disabled id='a_no' type='radio' name='acuerdo' class='with-gap black-text' value='0' <?php print(($acuerdo == 0)?"checked":""); ?>/>
            <label for='a_no'><i class='material-icons'>cancel</i></label>
        </div>
        <div class='input-field col s12 m3 '>
            <label class="active">¿Entrego Bitácora?</label>
            <input disabled id='b_si' type='radio' name='bitacora' class='with-gap black-text' value='1' <?php print(($bitacora == 1)?"checked":""); ?>/>
            <label for='b_si'><i class='material-icons'>check</i></label>
            <input disabled id='b_no' type='radio' name='bitacora' class='with-gap black-text' value='0' <?php print(($bitacora == 0)?"checked":""); ?>/>
            <label for='b_no'><i class='material-icons'>cancel</i></label>
        </div>
        <div class='input-field col s12 m3 '>
            <label class="active">¿Entrego Carta?</label>
            <input disabled id='c_si' type='radio' name='carta' class='with-gap black-text' value='1' <?php print(($carta == 1)?"checked":""); ?>/>
            <label for='c_si'><i class='material-icons'>check</i></label>
            <input disabled id='c_no' type='radio' name='carta' class='with-gap black-text' value='0' <?php print(($carta == 0)?"checked":""); ?>/>
            <label for='c_no'><i class='material-icons'>cancel</i></label>
        </div>
        <div class='input-field col s12 m3 '>
            <label class="active">¿Entrego Evaluaciones?</label>
            <input disabled id='e_si' type='radio' name='evaluaciones' class='with-gap black-text' value='1' <?php print(($evaluaciones == 1)?"checked":""); ?>/>
            <label for='e_si'><i class='material-icons'>check</i></label>
            <input disabled id='e_no' type='radio' name='evaluaciones' class='with-gap black-text' value='0' <?php print(($evaluaciones == 0)?"checked":""); ?>/>
            <label for='e_no'><i class='material-icons'>cancel</i></label>
        </div>
    </div>
    <br>
    </form>
    </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>