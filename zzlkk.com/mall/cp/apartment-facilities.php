<?php 
include("access.php");
if(isset($_GET['delid'])){
	include("../includes/db.conn.php");
	include("../includes/admin.class.php");
    include("../includes/conf.class.php");
	$bsiAdminMain->apartmentFacilityDelete($bsiCore->ClearInput($_GET['delid']));
	header("location:apartment-facilities.php");
	exit;
}
include("header.php"); 
?>
<script type="text/javascript">
	function deleteFacilty(delid){
		var answer = confirm ("你确定要删除这个设施?");
		if (answer)
		window.location="<?php echo $_SERVER['PHP_SELF'];?>?delid="+delid;
	}	
</script>
<div id="container-inside">
<span style="font-size:16px; font-weight:bold">设备/设施列表</span>
	<input type="button" value="添加新设施" onClick="window.location.href='add_edit_facilities.php?id=<?php echo base64_encode(0);?>'" style="background: #EFEFEF; float:right"/>
 <hr />
  <table class="display datatable" border="0">
    <thead>
      <tr>
        <th width="5%">Id#</th>
        <th width="25%">设备名</th>
        <th width="30%">&nbsp;</th>
      </tr>
    </thead>
    <?php echo $bsiAdminMain->getApartmentFaciltyHtml();?>
  </table>
</div>
<script type="text/javascript" src="js/DataTables/jquery.dataTables.js"></script> 
<script type="text/javascript" src="js/bsi_datatables.js"></script>
<link href="css/data.table.css" rel="stylesheet" type="text/css" />
<link href="css/jqueryui.css" rel="stylesheet" type="text/css" />
<?php include("footer.php"); ?>
