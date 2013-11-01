<?php
include("access.php");
if(isset($_POST['addedit'])){
	include("../includes/db.conn.php");
	include("../includes/conf.class.php");
	include("../includes/admin.class.php");
	$bsiAdminMain->addeditDistrictLoc($bsiCore->ClearInput($_POST['addedit']));
	header("location:district-loc.php");
	exit;
}
include("header.php"); 
$id = $bsiCore->ClearInput(base64_decode($_GET['id']));
if($id){
	$row = mysql_fetch_assoc(mysql_query("select id,city,district,locationType from bsi_district_type where id=$id"));
	$locationTypeArray = json_decode($row['locationType'],true);
	$locationType = $bsiCore->getApmtLocationTypeList($locationTypeArray);
}else{
	$row = NULL;	
	$locationType = $bsiCore->getApmtLocationTypeList();
}
?>
<link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
<script type="text/javascript">
	$(function(){
		$("#city").click(function(){
			var city = $(this).val();
			var querystr='actioncode=12&city='+city;
			$.post("../ajax-processor.php", querystr, function(data){
				if(data!=""){
					$("#district").html(data);
				}else{
				}
			}, "html");
		});
	});
</script>
<div id="container-inside"><span style="font-size:16px; font-weight:bold">区域与地理位置类型关系添加/编辑</span>
  <hr />
  <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post" id="form1">
    <table cellpadding="5" cellspacing="5" border="0">
      <tr>
        <td width="120px"><strong>城市:</strong></td>
        <td valign="middle">
			<select	name="city" id="city" class="required" style="width:200px;">
				<?php echo $bsiCore->getCitycombo($row['city']);?>
			</select>
		</td>
      </tr>
	  <tr>
        <td width="120px"><strong>地区:</strong></td>
        <td valign="middle">
			<select	name="district" id="district" class="required" style="width:200px;">
				<?php echo $bsiCore->getDistrictList($row['city'],$row['district']);?>
			</select>
		</td>
      </tr>
	  <tr>
        <td width="120px"><strong>地理位置类型:</strong></td>
        <td valign="middle">
			<div><?php echo $locationType;?></div>
		</td>
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
