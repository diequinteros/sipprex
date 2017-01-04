<html>
  <?php
  ob_start();
   require("../bibliotecas/conexion.php");  
  session_start();
   ?>
    <head>
      <?php include("../inc/styles.php"); ?>   
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <!-- NAV -->
    <?php include("../inc/nav.php")?>
    <body class="grey lighten-3">
      <!-- Categorias -->
      <div id="cont" class="row">
      <?php
      $sql = "SELECT carnet FROM alumnos";
      $params = null;
      $data = Database::getRows($sql, $params);
        if($data != null)
        {
            $codigos = null;
            
            foreach($data as $row)
            {
                $sql2 = "SELECT * FROM ex_alumnos WHERE id_exalumnos = ?";
                $params2 = array($row['carnet']);
                $ex = null;
                $ex = Database::getRow($sql2, $params2);
                if($ex != null){
                        if($codigos == null){
                            $codigos = $row['carnet'];
                        }
                        else{
                            $codigos .= ", ".$row['carnet'];
                        }
                    }
            }
            if($codigos != null)
            {
                print("<div class='card-panel red'><i class='material-icons left'>error</i>Los codigos de carnet: ".$codigos." estan repetidos en la tabla alumnos y ex alumnos, esto puede generar errores, por favor verifique los datos.</div>");
            }
            
        }
      ?>
        <div class="col l10">
        
            <div class="row">
             <div class="card col l3 offset-l3 m3 offset-m3 s12 z-depth-3">
                <div class="card-image waves-effect waves-block waves-light">
                    <a href="catalumnos.php"><img class="responsive-img"  src="../img/AlumnosN.png"></a>
                </div>
                <div class="card-content">  
                    <span class="card-title activator grey-text text-darken-4">Alumnos<i class="material-icons right">more_vert</i></span>
                    <p><a href="catalumnos.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Alumnos<i class="material-icons right">close</i></span>
                    <p>Esta categoria le permitira visualizar, agregar, modificar o eliminar registros de los alumnos.</p>
                </div>
             </div>
             <div class="card col l3 offset-l2 m3 offset-m2 s12 z-depth-3">
                <div class="card-image waves-effect waves-block waves-light">
                    <a href="catexalumnos.php"><img class="responsive-img" src="../img/ExAlumnosN.png"></a>
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Ex alumnos<i class="material-icons right">more_vert</i></span>
                    <p><a href="catexalumnos.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Ex alumnos<i class="material-icons right">close</i></span>
                    <p>Esta categoria le permitira visualizar, agregar, modificar o eliminar registros de los ex alumnos.</p>
                </div>
             </div>
             <div class="card col l3 offset-l3 m3 offset-m3 s12 z-depth-3">
                <div class="card-image waves-effect waves-block waves-light">
                    <a href="catempresas.php"><img class="responsive-img" src="../img/EmpresaN.png"></a>
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Empresas<i class="material-icons right">more_vert</i></span>
                    <p><a href="catempresas.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Empresas<i class="material-icons right">close</i></span>
                    <p>Esta categoria contiene la informacion de las empresas, le permitira visualizar, agregar, modificar o eliminar registros.</p>
                </div>
             </div>
             <div class="card col l3 offset-l2 m3 offset-m2 s12 z-depth-3">
                <div class="card-image waves-effect waves-block waves-light">
                    <a href="registrospp_index.php"><img class="responsive-img" src="../img/PracticasProfesionalesN.png"></a>
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Pcas profesionales<i class="material-icons right">more_vert</i></span>
                    <p><a href="registrospp_index.php">Entrar</a></p>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Practicas profesionales<i class="material-icons right">close</i></span>
                    <p>Esta categoria le permitira visualizar, agregar, modificar o eliminar registros de practicas profesionales.</p>
                </div>
             </div>
           </div>
        </div>
      </div>
      <?php include("../inc/scripts.php"); ?>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>
  <?php
    ob_end_flush();
  ?>