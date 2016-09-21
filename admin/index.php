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
        <div class="col l10">
            <div class="row">
             <div class="card col l3 offset-l3 m3 offset-m3 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/Alumnos.png">
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
             <div class="card col l3 offset-l2 m3 offset-m2 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/ExAlumnos.png">
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
             <div class="card col l3 offset-l3 m3 offset-m3 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/Empresa.png">
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
             <div class="card col l3 offset-l2 m3 offset-m2 s12">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator responsive-img" src="../img/PracticasProfesionales.png">
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">Registros practicas profesionales<i class="material-icons right">more_vert</i></span>
                    <p><a href="pracpro_read.php">Entrar</a></p>
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

      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':600,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
      // Define the chart to be drawn.
      var data2 = new google.visualization.DataTable();
      data2.addColumn('string', 'Element');
      data2.addColumn('number', 'Percentage');
      data2.addRows([
        ['Nitrogen', 0.78],
        ['Oxygen', 0.21],
        ['Other', 0.01]
      ]);

      // Instantiate and draw the chart.
      var chart2 = new google.visualization.PieChart(document.getElementById('myPieChart'));
      chart2.draw(data2, null);
    }
  </script>
    <div id="chart_div"></div>
    <div id="myPieChart"></div>
      <?php include("../inc/footer.php"); ?>
    </body>
  </html>
  <?php
    ob_end_flush();
  ?>