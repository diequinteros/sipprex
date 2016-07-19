      <?php
      ini_set("date.timezone","America/El_Salvador");
      $sesion = false;
      $filename = basename($_SERVER['PHP_SELF']);
      if(isset ($_SESSION['id_usu']))
      {
        
      }
      else {
      print("
      <!-- footer -->
      <footer class='page-footer grey darken-4'>
          <div class='container'>
            <div class='row'>
              <div class='col l6 s12'>
                <h5 class='yellow-text text-accent-4'>Sipprex</h5>
                <img class='responsive-img' width='100' src='../img/iconSipprex.png'>
                <img class='responsive-img' width='100' src='../img/icon.png'>
                <p class='grey-text text-lighten-4'>Sipprex es un sistema de seguimiento de practicas profesionales y ex alumnos del instituto tecnico ricaldone el cual te ayudará llevar tu proceso de practicas profesionales al dia.</p>
              </div>
              <div class='col l4 offset-l2 s12'>
                <!--<h5 class='white-text'>Links</h5>
                <ul>
                  <li><a class='grey-text text-lighten-3' href='#!'>Link 1</a></li>
                  <li><a class='grey-text text-lighten-3' href='#!'>Link 2</a></li>
                  <li><a class='grey-text text-lighten-3' href='#!'>Link 3</a></li>
                  <li><a class='grey-text text-lighten-3' href='#!'>Link 4</a></li>
                </ul>-->
              </div>
            </div>
          </div>
          <div id = 'footer2' class='footer-copyright red darken-1'>
            <div class='container'>
            Instituto Tecnico Ricaldone - 2016
            <a class='grey-text text-lighten-4 right' href='#!'></a>
            </div>
          </div>
    </footer>
    "  
      );
      }
?>