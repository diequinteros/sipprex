<html>
  <?php
  session_start(); 
  require("../bibliotecas/conexion.php");
  ("../bibliotecas/Validator.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php
include("../inc/nav.php");
?>
<form method='post' class='row'>
	<div class='input-field col s6 m4'>
      	<i class='material-icons prefix'>search</i>
      	<input id='buscar' type='text' name='buscar' class='validate'/>
      	<label for='buscar'>Búsqueda</label>
    </div>
    <div class='input-field col s6 m4'>
    	<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Aceptar</button> 	
  	</div>
  	<div class='input-field col s12 m4'>
		<a href='ocupaciones_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = trim($_POST['buscar']);
	$sql = "SELECT * FROM ocupaciones WHERE ocupacion LIKE ? ORDER BY ocupacion";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM ocupaciones ORDER BY ocupacion";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>id_ocupacion</th>
				    		<th>ocupacion</th>
				    		
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>$row[id_ocupacion]</td>
	            			<td>$row[ocupaciones]</td>
	            			<td>
	            				<a href='ocupaciones_save.php?id=$row[id_ocupacion]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='ocupaciones_delete.php?id=$row[id_ocupacion]' class='btn red'><i class='material-icons'>delete</i></a>
							</td>
	        			</tr>";
		}
		$tabla .= 	"</tbody>
    			</table>";
	print($tabla);
}
else
{
	print("<div class='card-panel red'><i class='material-icons left'>warning</i>No hay registros de especialidades.</div>");
}
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>