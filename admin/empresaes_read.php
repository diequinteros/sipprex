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
		<a href='empresaes_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = trim($_POST['buscar']);
	$sql = "SELECT * FROM espeempresa WHERE empresa LIKE ? ORDER BY empersa";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM espeempresa ORDER BY empresa";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>ID</th>
				    		<th>Empresa</th>
				    		<th>Especialidad</th>
				    		
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>$row[ID]</td>
	            			<td>$row[Empresa]</td>
	            			<td>$row[Especialidad]</td>
	            			<td>
	            				<a href='empresaes_save.php?id=$row[id_espeempresa]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='empresaes_delete.php?id=$row[id_espeempresa]' class='btn red'><i class='material-icons'>delete</i></a>
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