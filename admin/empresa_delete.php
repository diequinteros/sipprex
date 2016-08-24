<html>
  <?php
  ob_start();
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
if(!empty($_GET['id'])) 
{
    $id = base64_decode($_GET['id']);
}
else
{
    header("location: empresa_read.php");
}

if(!empty($_POST))
{
	$id = strip_tags(trim($_POST['id']));
	try 
	{
		$sql = "DELETE FROM empresas WHERE id_empresa = ?";
	    $params = array($id);
	    Database::executeRow($sql, $params);
	    header("location: empresa_read.php");
	} 
	catch (Exception $error) 
	{
		print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
	}
}
?>
<form method='post' class='row'>
	<input type='hidden' name='id' value='<?php print(htmlspecialchars($id)); ?>'/>
	<button type='submit' class='btn red'><i class='material-icons right'>check_circle</i>Si</button>
	<a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
</form>
<?php
include("../inc/scripts.php");
include("../inc/footer.php");
?>
 	</body>
</html>
<?php
ob_end_flush();
?>