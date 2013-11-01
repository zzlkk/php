<?php
include("access.php");
if(isset($_POST['addedit'])){
	include("../includes/db.conn.php");
	include("../includes/conf.class.php");
	include("../includes/admin.class.php");
	$bsiAdminMain->addeditFeatureKey($bsiCore->ClearInput($_POST['addedit']));
	header("location:feature-keys.php");
	exit;
}
include("header.php"); 
$id = $bsiCore->ClearInput(base64_decode($_GET['id']));
if($id){
	$row = mysql_fetch_assoc(mysql_query($bsiCore->sqlFeatureKey($id)));
}else{
	$row = NULL;	
}
?>
<link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
<div id="container-inside"><span style="font-size:16px; font-weight:bold">房间特色键添加/编辑</span>
  <hr />
  <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post" id="form1">
    <table cellpadding="5" cellspacing="5" border="0">
      <tr>
        <td width="120px"><strong>房间特色键:</strong></td>
        <td valign="middle"><input type="text" name="feature_key" id="feature_key" class="required" value="<?php echo $row['feature_key'];?>" style="width:250px;" /></td>
      </tr>
      <tr>
        <td><input type="hidden" name="addedit" value="<?php echo $id;?>"></td>
        <td><input type="submit" value="Submit" name="submitCapacity" style="background:#e5f9bb; cursor:pointer; cursor:hand;"/></td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
     });     
</script> 
<script src="js/jquery.validate.js" type="text/javascript"></script> 
<?php include("footer.php"); ?>
