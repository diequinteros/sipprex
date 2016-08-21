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
		<a href='visitas_save.php' class='btn  green darken-4'><i class='material-icons right'>add_circle</i>Nuevo</a>
  	</div>
</form>
<?php
$page = null;
		//Se toma la variable de paginacion
		if(!empty($_GET['page'])) {
			$page = strip_tags(trim($_GET['page']));
		}
		//Si la variable de paginacion esta vacia se pone como 1
		if($page == null) {
			$page = 1;
		}
		//Si la variable es 1 el limite empezara desde 0
		if($page == "" || $page == "1")
		{
			$page1 = 0;
		}
		else {
		//Se multiplica la pagina por el numero de items que se muestran (24) y se restan 24 para poder empezar desde el siguiente producto 
			$page1 = ($page*20)-20; 
		}
if(!empty($_POST))
{
	$search = strip_tags(trim($_POST['buscar']));
	$sql = "SELECT * FROM visitas WHERE empresa LIKE ? ORDER BY empresa LIMIT $page1,20";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM visitas, empresas WHERE visitas.empresa = empresas.id_empresa ORDER BY nombre_empresa LIMIT $page1,20";
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
	            			<td>".htmlspecialchars($row['nombre_empresa'])."</td>
	            			<td>".htmlspecialchars($row['fecha_ultima_visita'])."</td>
	            			<td><p class='truncate'>".htmlspecialchars($row['observaciones'])."</p></td>
	            			<td>
	            				<a href='visitas_save.php?id=$row[id_visita]' class='btn  yellow lighten-2'><i class='material-icons'>edit</i></a>
								<a href='visitas_delete.php?id=".base64_encode(htmlspecialchars($row['id_visita']))."' class='btn red'><i class='material-icons'>delete</i></a>
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
?>
<ul class="pagination center-align">
	<?php
	$cons2 = ("SELECT COUNT(id_visita) FROM visitas");
            $parametros = null;
            $filas = Database::getRow($cons2, $parametros);
            $filas = $filas[0]/20;
            $filas = ceil($filas);
            //Si la paginacion es 1, el 1 estara deshabilitado
                if($page == 1)
                {
                    $pagi = "<li class='disabled'><a><i class='material-icons'>chevron_left</i></a></li>";
                }
                //caso contrario esta habilitado
                else {
                    $page2 = $page - 1;
                    $pagi = "<li class='waves-efect'><a href='visitas_read.php?page=$page2'><i class='material-icons'>chevron_left</i></a></li>";
                }
                //Se imprime cada pagina, si la pagina que se imprimio concide con el numero de pagina que se imprime se imprimira seleccionado
                for($i = 1; $i<=$filas; $i++) {
                    if($page==$i)
                    {
                     $pagi .= "<li class='active blue'><a href='visitas_read.php?page=$i'>$i</a></li>";
                    }
                    //Si no solo se imprimira
                    else{
                        $pagi .= "<li class='waves-effect'><a href='visitas_read.php?page=$i'>$i</a></li>";
                    }
                }
                //Al igual que si la pagina es la primera, si es la ultima se vera deshabilitada o no
                if($page == $filas)
                {
                    $pagi .= "<li class='disabled'><a><i class='material-icons'>chevron_right</i></a></li>";
                }
                else {
                    $page2 = $page + 1;
                    $pagi .= "<li class='waves-efect'><a href='visitas_read.php?page=$page2'><i class='material-icons'>chevron_right</i></a></li>";
                }
                print($pagi);
	?>
	</ul>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>