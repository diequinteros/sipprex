<html>
  <?php
  session_start(); 
  require("../bibliotecas/conexion.php");
   ?>
    <head>
      <?php
      include("../inc/styles.php");
      ?>
    </head>
<body>
<?php
include("../inc/nav.php")
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
		<a href='visitas_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = strip_tags(trim($_POST['buscar']));
	$sql = "SELECT * FROM visitas WHERE empresa LIKE ? ORDER BY empresa";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM visitas ORDER BY empresa";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>empresa</th>
				    		<th>fecha_ultima_visita</th>
				    		<th>observacion</th>
				    		
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>".htmlspecialchars($row[empresa])."</td>
	            			<td>".$row[fecha_ultima_visita]."</td>
	            			<td><p class='truncate'>".htmlspecialchars($row[observacion])."</p></td>
	            			<td>
	            				<a href='visitas_save.php?id=$row[id_visita]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='visitas_delete.php?id=$row[id_visita]' class='btn red'><i class='material-icons'>delete</i></a>
							</td>
	        			</tr>";
		}
		$tabla .= 	"</tbody>
    			</table>";
	print($tabla);
}
else
{
	print("<div class='card-panel red'><i class='material-icons left'>warning</i>No hay registros de visitas.</div>");
}
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>