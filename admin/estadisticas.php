<html>
  <?php
  ob_start();
   require("../bibliotecas/conexion.php");  
  session_start();
   ?>
    <head>
      <?php
       include("../inc/styles.php"); 
       ?>   
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <!-- NAV -->
    <?php
     include("../inc/nav.php")
     ?>
    <body class="grey lighten-3">
      <!-- Categorias -->
      <div id="cont" class="container">

      <div id="espesoli" style="width: 900px;"></div>
      <br>
      <div id="ocupaex" style="width: 900px;"></div>
      <br>
        <div id="practpro"></div>
        <br>
        <div id="empreesta"></div>
        <br>
      <div id="espedepar" style="width: 900px;"></div>
      </div>
      </div>
      <?php
       include("../inc/scripts.php"); 
       ?>
<!-- INICIO DE GRAFICOS -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
      
      // Se carga la api de visualizacion y el paquete corecharts de google
      google.charts.load('current', {'packages':['corechart','bar']});

      // Se hace un callback para que corra cuando el visualizador este cargado
      google.charts.setOnLoadCallback(drawChart);

      // Callback que crea y llena la tabla de datos
      // Se crea el grafico y se le pasan los datos y se dibuja
      function drawChart() {

        // Se crea la tabla de datos
        var data = new google.visualization.DataTable();
        //Se agrega la columna de tipo string  con titulo Topping
        data.addColumn('string', 'Titulo');
        //Se agrega la columna de tipo numero con titulo Slices
        data.addColumn('number', 'Alumnos');
        //Se agregan las filas
        <?php
        $sql1 = "SELECT COUNT(alumno) FROM registrospp WHERE finalizo = 1 GROUP BY alumno";
        $alumfi = Database::getRow($sql1, null);
        $sql2 = "SELECT COUNT(alumno) FROM registrospp WHERE finalizo = 0 GROUP BY alumno";
        $alumsi = Database::getRow($sql2, null);
        $sql3 = "SELECT COUNT(carnet) FROM alumnos";
        $alumno = Database::getRow($sql3, null);
        $alumno3 = $alumno[0] - $alumsi[0];
        if($alumfi[0] == null)
        {
            $alumfi[0] = 0;
        }
        if($alumsi[0] == null)
        {
            $alumsi[0] = 0;
        }
        if($alumno3 == null)
        {
            $alumno3 = 0;
        }
        print("data.addRows([
          ['Alumnos que han terminado practicas profesionales', ".$alumfi[0]."],
          ['Alumnos que estan en proceso de practicas profesionales', ".$alumsi[0]."],
          ['Alumnos que no han empezado aun', ".$alumno3."],
        ]);");
        ?>
        // Se definen las opciones del grafico
        var options = {'title':'Grafico de alumnos en practicas profesionales',
                       'width':900,
                       'height':250};

        // Se instancia y dibuja nuestro grafico, ademas se pasan las opciones.
        var chart = new google.visualization.PieChart(document.getElementById('practpro'));
        chart.draw(data, options);
      }
  </script>
      <script type="text/javascript">
      //google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Ocupación', 'Ex alumnos'],
          <?php
          $HEx = 0;
          $sqlOE = "SELECT id_ocupacion, ocupacion FROM ocupaciones";
          $ocup = Database::getRows($sqlOE, null);
          foreach($ocup as $ocupa)
          {
            $sqlExO = "SELECT COUNT(id_exalumnos) FROM ex_alumnos WHERE ocupacion = ?";
            $par = array($ocupa['id_ocupacion']);
            $CEO = Database::getRow($sqlExO, $par);
            if($CEO[0] == null)
            {
              $CEO[0] = 0;
            }
            print("['".$ocupa['ocupacion']."', ".$CEO[0]."],");
            $HEx = $HEx + 95;
          }
          ?>
          
        ]);

        var options = {
          title: 'Chess opening moves',
          width: 900,
          height: <?php print($HEx); ?>,
          legend: { position: 'none' },
          chart: { title: 'Grafico de oupaciones de ex alumnos' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Ex alumnos'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('ocupaex'));
        chart.draw(data, options);
      };
    </script>
      <script type="text/javascript">
      //google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff2);
      function drawStuff2() {
        var data2 = new google.visualization.arrayToDataTable([
          ['Especialidad', 'Departamentos de empresas que admiten esta especialidad'],
          <?php
          $hES = 0;
          $sqlED = "SELECT id_especialidad, especialidad FROM especialidades";
          $espe = Database::getRows($sqlED, null);
          foreach($espe as $espec)
          {
            $sqlDE = "SELECT COUNT(id_espeempresa) FROM espeempresa WHERE especialidad = ?";
            $parDE = array($espec['id_especialidad']);
            $CEE = Database::getRow($sqlDE, $parDE);
            if($CEE[0] == null)
            {
              $CEE[0] = 0;
            }
            print("['".$espec['especialidad']."', ".$CEE[0]."],");
            $hES = $hES + 95;
          }
          ?>
          
        ]);

        var options2 = {
          title: 'Chess opening moves',
          width: 900,
          height: <?php print($hES) ?>,
          legend: { position: 'none' },
          chart: { title: 'Especialidades en departamentos de empresas', subtitle: 'Vista de especialidades mas solicitadas' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Departamentos de empresas que necesitan la especialidad'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('espesoli'));
        chart.draw(data2, options2);
      };
    </script>
    <script type="text/javascript">
    // Se hace un callback para que corra cuando el visualizador este cargado
      google.charts.setOnLoadCallback(drawChartEmp);

      // Callback que crea y llena la tabla de datos
      // Se crea el grafico y se le pasan los datos y se dibuja
      function drawChartEmp() {

        // Se crea la tabla de datos
        var data3 = new google.visualization.DataTable();
        //Se agrega la columna de tipo string  con titulo titulo
        data3.addColumn('string', 'Titulo');
        //Se agrega la columna de tipo numero con titulo empresas
        data3.addColumn('number', 'Empresas');
        //Se agregan las filas
        <?php
        $sqlE1 = "SELECT COUNT(id_empresa) FROM empresas WHERE codigo_empresa IS NULL AND contraseña_empre IS NULL";
        $empreN = Database::getRow($sqlE1, null);
        $sqlE2 = "SELECT COUNT(id_empresa) FROM empresas WHERE codigo_empresa IS NOT NULL AND contraseña_empre IS NOT NULL";
        $empreS = Database::getRow($sqlE2, null);
        if($empreN[0] == null)
        {
            $empreN[0] = 0;
        }
        if($empreS == null)
        {
            $empreS[0] = 0;
        }
        print("data3.addRows([
          ['Empresas que aun no pueden iniciar sesion en el sistema', ".$empreN[0]."],
          ['Empresas que pueden iniciar sesion en el sistema', ".$empreS[0]."],
        ]);");
        ?>
        // Se definen las opciones del grafico
        var options3 = {'title':'Grafico de empresas y su estado en el sistema',
                       'width':900,
                       'height':250};

        // Se instancia y dibuja nuestro grafico, ademas se pasan las opciones.
        var chart = new google.visualization.PieChart(document.getElementById('empreesta'));
        chart.draw(data3, options3);
      }
  </script>
        <script type="text/javascript">
      //google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff3);
      function drawStuff3() {
        var data4 = new google.visualization.arrayToDataTable([
          ['Documentos', 'Alumnos que lo han entregado'],
          <?php
          $sqlADA = "SELECT COUNT(id_registropp) FROM registrospp WHERE acuerdo = 1";
          $acuerdo = Database::getRow($sqlADA, null);
          $sqlADB = "SELECT COUNT(id_registropp) FROM registrospp WHERE bitacora = 1";
          $bitacora = Database::getRow($sqlADB, null);
          $sqlADC = "SELECT COUNT(id_registropp) FROM registrospp WHERE carta = 1";
          $carta = Database::getRow($sqlADC, null);
            print("['Acuerdo', ".$acuerdo[0]."],");
            print("['Bitacora', ".$bitacora[0]."],");
            print("['Carta', ".$carta[0]."],");
          ?>
        ]);

        var options4 = {
          title: 'Chess opening moves',
          width: 900,
          height: 500,
          legend: { position: 'none' },
          chart: { title: 'Especialidades en departamentos de empresas', subtitle: 'Vista de especialidades mas solicitadas' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Departamentos de empresas que necesitan la especialidad'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('espedepar'));
        chart.draw(data4, options4);
      };
    </script>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>
  <?php
    ob_end_flush();
  ?>