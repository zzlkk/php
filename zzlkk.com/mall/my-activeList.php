<?php
include("access.php");
include("includes/db.conn.php");
include("includes/conf.class.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
	<title>
    <?php echo $bsiCore->config['conf_apartment_name'];?>
    </title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/accordionmenu.css" rel="stylesheet" type="text/css" />
	<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/menu/superfish.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			jQuery('ul.sf-menu').superfish();
		}); 
	</script>
	</head>
	<body >
    <?php include("header.php"); ?>
    <?php include("left.php"); ?>
            <td width="77%" valign="top" >
			<div id="getFormtd"></div>
              <div style="margin-left:200px;" id="btnpro">
                <input type="button" class="btn1" value="Update" name="buttonprofile" id="buttonprofile"/>
              </div>
              <div style="margin-left:220px;" id="btnpss">
                <input type="button" class="btn1"  value="Update" id="buttonpassword"/>
              </div>
			<?php
			$html = '<div  id="activelistDiv">
					 <h1 style="margin-left:10px;">活动预订名单</h1><br /><br />
			         <table class="display datatable" border="0" style="font-family:Verdana, Geneva, sans-serif; font-size:11px;">
                				<thead>
									<tr>
										<th width="15%">预定 Id</th>
										<th width="35%">房间名</th>
										<th width="15%">入住</th>
										<th width="15%">退房</th>
										<th>&nbsp;</th> 
									 </tr>
              					</thead>
								<tbody>'; 			
					$result = mysql_query("select * from bsi_appmt_user where user_id=".$_SESSION['apmt_clientid']);			
					if(mysql_num_rows($result)){					
						while($row = mysql_fetch_assoc($result)){
							$result2 = mysql_query("SELECT booking_id, appmt_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') as checkin, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') as checkout from bsi_bookings where appmt_id=".$row['appmt_id']." and payment_success=true and CURDATE() <= checkout_date and is_deleted=false and is_block=false order by checkin_date");						
							if(mysql_num_rows($result2)){								
								while($rowAp = mysql_fetch_assoc($result2)){
									$rowApmt = mysql_fetch_assoc(mysql_query("select appmt_name from bsi_apartment_master where appmt_id=".$rowAp['appmt_id']));
									$html .= '<tr>
												<td align="center">'.$rowAp['booking_id'].'</td>
												<td align="center">'.$rowApmt['appmt_name'].'</td>
												<td align="center">'.$rowAp['checkin'].'</td>
												<td align="center">'.$rowAp['checkout'].'</td>
												<td align="right"><a href="viewdetails.php?booking_id='.$rowAp['booking_id'].'">View Details</a></td>
											</tr>';	
								}
							}
						}
					}
				    echo $html .= '</tbody>
						</table>
					    </div>';
			?></td>
          </tr>
        </table>
      </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
    <script type="text/javascript" src="js/DataTables/jquery.dataTables.js"></script> 
    <script type="text/javascript" src="js/bsi_datatables.js"></script>
    <link href="css/data.table.css" rel="stylesheet" type="text/css" />
    <link href="css/jqueryui.css" rel="stylesheet" type="text/css" />
    <?php include("footer.php"); ?>
</body>
</html>