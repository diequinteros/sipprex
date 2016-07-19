<html>
  <?php
   require("../bibliotecas/conexion.php");
   require("../bibliotecas/validator.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
	<?php
      //include("../inc/nav.php");
      ?>
      <div class="container">
      <h2>El mensaje se ha enviado con exito, por favor espere a que el administrador se pongo en contacto con usted y envie su usuario y contraseña.</h2>
      <div class="center-align">
      <a class="waves-effect waves-light btn" href="login_empre.php">Regresar al inicio</a>
      </div>
      </div>

<ul class="collection with-header">
<?php
        //<li> class="collection-header"><h5>Mensaje a administrador de empresa </h5></li>
?>

<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
	</body>
</html>