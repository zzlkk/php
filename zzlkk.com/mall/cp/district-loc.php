<?php
include("access.php");
if(isset($_GET['del'])){
	include("../includes/db.conn.php");
	include("../includes/conf.class.php");
	include("../includes/admin.class.php");
	$bsiAdminMain->deleteDistrictLoc($bsiCore->ClearInput($_GET['del']));
	header("location:district-loc.php");
	exit; 
}
include("header.php"); 
?>
<script type="text/javascript">
function deleteType(delid){
	var ans=confirm("温馨提示，你确定删除此条数据吗？");
	if(ans){
		window.location='<?php echo $_SERVER['PHP_SELF'];?>?del='+delid;
		return true;
	}else{
		return false;
	}
}
</script>
<div id="container-inside"> <span style="font-size:16px; font-weight:bold">区域与地理位置关系列表</span>
  <input type="button" value="添加区域与地理位置关系" onClick="window.location.href='add_edit_districtLoc.php?id=<?php echo base64_encode(0);?>'" style="background: #EFEFEF; float:right"/>
  <hr />
  <table class="display datatable" border="0">
    <thead>
      <tr>
        <th width="10%">Id#</th>
        <th width="10%">城市</th>
        <th width="10%">区域</th>
        <th width="45%">地理位置</th>
        <th width="25%">&nbsp;</th>
      </tr>
    </thead>
    <?php echo $bsiAdminMain->getDistrictLocListHtml();?>
  </table>
</div> 
<script type="text/javascript" src="js/DataTables/jquery.dataTables.js"></script> 
<script type="text/javascript" src="js/bsi_datatables.js"></script>
<link href="css/data.table.css" rel="stylesheet" type="text/css" />
<link href="css/jqueryui.css" rel="stylesheet" type="text/css" />
<?php include("footer.php"); ?>
