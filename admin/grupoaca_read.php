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
<form method='post' autocomplete="off" class='row'>
	<div class='input-field col s6 m4'>
      	<i class='material-icons prefix'>search</i>
      	<input id='buscar' type='text' name='buscar' class='validate'/>
      	<label for='buscar'>Búsqueda</label>
    </div>
    <div class='input-field col s6 m4'>
    	<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Aceptar</button> 	
  	</div>
  	<div class='input-field col s12 m4'>
		<a href='grupoaca_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = strip_tags(trim($_POST['buscar']));
	$sql = "SELECT * FROM grupo_academico WHERE grupo_aca LIKE ? ORDER BY grupo_aca";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM grupo_academico ORDER BY grupo_aca";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>id_grupo_aca</th>
				    		<th>grupo_aca</th>
				    		
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>".htmlspecialchars($row['id_grupo_aca'])."</td>
	            			<td>".htmlspecialchars($row['grupo_aca'])."</td>
	            			<td>
	            				<a href='grupoaca_save.php?id=$row[id_grupo_aca]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='grupoaca_delete.php?id=$row[id_grupo_aca]' class='btn red'><i class='material-icons'>delete</i></a>
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