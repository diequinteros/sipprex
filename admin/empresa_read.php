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
<form method='post'  autocomplete="off" class='row'>
	<div class='input-field col s6 m4'>
      	<i class='material-icons prefix'>search</i>
      	<input id='buscar' type='text' name='buscar' class='validate'/>
      	<label for='buscar'>Búsqueda</label>
    </div>
    <div class='input-field col s6 m4'>
    	<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Aceptar</button> 	
  	</div>
  	<div class='input-field col s12 m4'>
		<a href='empresa_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = strip_tags(trim($_POST['buscar']));
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
				    		<th>rubro</th>
				    		<th>direccion</th>
				    		<th>telefono</th>
				    		<th>contacto</th>
				    		<th>correo</th>
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>".htmlspecialchars($row['nombre_empresa'])."</td>
	            			<td><p class='truncate'>".htmlspecialchars($row['rubro'])."</p></td>
	            			<td>".htmlspecialchars($row['direccion'])."</td>
	            			<td>".htmlspecialchars($row['telefono'])."</td>
	            			<td>".htmlspecialchars($row['contacto'])."</td>
	            			<td>".htmlspecialchars($row['correo'])."</td>
	            			<td>
	            				<a href='empresa_save.php?id=$row[id_empresa]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='empresa_delete.php?id=".base64_encode(htmlspecialchars($row['id_empresa']))."' class='btn red'><i class='material-icons'>delete</i></a>
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