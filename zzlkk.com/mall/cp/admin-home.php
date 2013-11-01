<?php 
include("access.php");
include("header.php"); 	
?>      
        <div id="container-inside">
        <span style="font-size:16px; font-weight:bold">今天订单列表</span>
     	 <hr />
          <table class="display datatable" border="0">
         <?=$bsiAdminMain->homewidget(1)?>
        </table>
         <br />
         
         <span style="font-size:16px; font-weight:bold">今天入住列表</span>
      	 <hr />
          <table class="display datatable" border="0">
         <?=$bsiAdminMain->homewidget(2)?>
        </table>
         <br />
         
         <span style="font-size:16px; font-weight:bold">今天退房列表</span>
         <hr />
          <table class="display datatable" border="0">
        <?=$bsiAdminMain->homewidget(3)?>
        </table>
         <br />
</div>
<script type="text/javascript" src="js/DataTables/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/bsi_datatables.js"></script>
<link href="css/data.table.css" rel="stylesheet" type="text/css" />
<link href="css/jqueryui.css" rel="stylesheet" type="text/css" />   
<?php include("footer.php"); ?>
