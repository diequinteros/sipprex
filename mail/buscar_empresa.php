<html>
  <?php
   require("../bibliotecas/conexion.php");
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
      <h2>Antes de crear una cuenta, verifique que su empresa no exista en la base de datos, si existe por favor mande un mensaje al administrador con sus datos para obtener su codigo de usuario y contraseña.</h2>
      </div>
<form method='post' class='row'>
	<div class='input-field col s6 m4'>
      	<i class='material-icons prefix'>search</i>
      	<input id='buscar' type='text' name='buscar' class='validate'/>
      	<label for='buscar'>Búsqueda</label>
    </div>
    <div class='input-field col s6 m4'>
    	<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Aceptar</button> 	
  	</div>
  	<div class='input-field col l6 s12 m4'>
		<a href='crear_empresa.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Mi empresa no esta, registrarla</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = trim($_POST['buscar']);
	$sql = "SELECT * FROM empresas WHERE nombre_empresa LIKE ? ORDER BY nombre_empresa";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM empresas ORDER BY nombre_empresa";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped conteiner'>
					<thead>
			    		<tr>
				    		<th>nombre_empresa</th>
				    		<th>direccion</th>
				    		<th>correo</th>
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>$row[nombre_empresa]</td>
	            			<td>$row[direccion]</td>
	            			<td>$row[correo]</td>
	            			<td>
								<a href='enviar_mail.php?$toempresa=true&&$id=$row[id_empresas]' class='btn blue'><i class='material-icons'>message</i></a>
							</td>
	        			</tr>";
		}
		$tabla .= 	"</tbody>
    			</table>";
	print($tabla);
}
else
{
	print("<div class='card-panel red'><i class='material-icons left'>warning</i>No hay registros de empresas.</div>");
}
include("../inc/scripts.php");
include("../inc/footer.php");
?>
	</body>
</html>