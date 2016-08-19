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
		<a href='seccion_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = strip_tags(trim($_POST['buscar']));
	$sql = "SELECT * FROM secciones WHERE seccion LIKE ? ORDER BY seccion";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM secciones ORDER BY seccion";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>id_seccion</th>
				    		<th>seccion</th>
				    		
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>".htmlspecialchars($row['id_seccion'])."</td>
	            			<td>".htmlspecialchars($row['seccion'])."</td>
	            			<td>
	            				<a href='seccion_save.php?id=$row[id_seccion]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='seccion_delete.php?id=$row[id_seccion]' class='btn red'><i class='material-icons'>delete</i></a>
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