<?php
include("access.php");
if(isset($_POST['block'])){
	include("includes/db.conn.php");
	include("includes/conf.class.php");
	$bookingId = time();
	$sql = mysql_query("INSERT INTO bsi_bookings (booking_id, appmt_id, booking_time, checkin_date, checkout_date, client_id, is_block, payment_success, block_name) values (".$bookingId.", '".$bsiCore->ClearInput($_POST['choose'])."', NOW(),'".mysql_real_escape_string($_POST['checkin'])."', '".mysql_real_escape_string($_POST['checkout'])."', '0', 1, 1, '".mysql_real_escape_string($_POST['block_name'])."')");
	header("location:my-apartmentblockList.php");
	exit;
}
include("includes/db.conn.php");
include("includes/conf.class.php");
if(isset($_POST['submit'])){
	include ("includes/search-block.class.php");
	$bsisearch = new bsiSearch();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
	<title><?php echo $bsiCore->config['conf_apartment_name'];?></title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/accordionmenu.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
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
            <td width="77%" valign="top" ><div id="getFormtd"></div>
              <div style="margin-left:155px;" id="btnpro">
                <input type="button" class="btn1" value="Update" name="buttonprofile" id="buttonprofile"/>
              </div>
              <div style="margin-left:175px;" id="btnpss">
                <input type="button" class="btn1"  value="Update" id="buttonpassword"/>
              </div>
              <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post" id="form1">
                <table cellpadding="6" cellspacing="1" width="100%" height="85px">
                  <?php if($bsiCore->config['conf_rental_type']==1){ ?>
                  <tr>
                    <td width="15%">入住时间</td>
                    <td><table width="100%">
                        <tr>
                        <td width="12%"><input id="txtFromDate" name="check_in" style="width:68px" type="text" class="home-input" readonly="readonly" AUTOCOMPLETE=OFF /></td>
                        <td><a id="datepickerImage" href="javascript:;"><img src="images/month.png" height="18px" width="18px" style=" margin-bottom:-4px;" /></a></td>
                      </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap">退房时间</td>
                    <td><table width="100%">
                        <tr>
                        <td width="12%"><input id="txtToDate" name="check_out" style="width:68px" type="text" class="home-input" readonly="readonly" AUTOCOMPLETE=OFF /></td>
                        <td><a id="datepickerImage1" href="javascript:;"><img src="images/month.png" height="18px" width="18px" style=" margin-bottom:-4px;" /></a></td>
                      </tr>
                      </table></td>
                  </tr>
                  <?php } elseif($bsiCore->config['conf_rental_type']==2){ ?>
                  <tr>
                    <td width="15%">入住时间</td>
                    <td><table width="100%">
                        <tr>
                        <td width="14%"><input type="text" name="check_in" id="txtFromDate1" class="home-input" style="width:79px;" readonly="readonly" /></td>
                        <td><a id="datepickerImage" href="javascript:;"><img src="images/month.png" height="18px" width="18px" style=" margin-top:7px;" /></a></td>
                      </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td>Number of Week:</td>
                    <td><select id="weeks" name="weeks" class="home-select">
                        <?php echo $bsiCore->generateWeekMonthddadmin();?>
                      </select></td>
                  </tr>
                  <?php } elseif($bsiCore->config['conf_rental_type']==3){ ?>
                  <tr>
                    <td width="15%">入住月份</td>
                    <td><table width="100%">
                        <tr>
                        <td width="20%"><input type="text" name="txtMonthIn" id="txtMonthIn" class="home-input" style="width:110px;" readonly="readonly" /></td>
                        <td><a id="txtMonthIn1" href="javascript:;"><img src="images/month.png" height="18px" width="18px" style="margin-top:5px;" /></a></td>
                      </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap">Number of Month</td>
                    <td><select id="months" name="months" class="home-select">
                        <?php echo $bsiCore->generateWeekMonthddadmin();?>
                      </select></td>
                  </tr>
                  <?php } ?>
                  <tr>
                    <td></td>
                    <td><input type="submit" value="Search" name="submit" class="btn2" style="ursor:pointer; cursor:hand;"/></td>
                  </tr>
                </table>
              </form>
              <?php if(isset($_POST['submit'])){ echo '<script type="text/javascript" src="../js/apartmentvalidation.js"></script> '; ?>
              <br />
              <form name="adminsearchresult" id="adminsearchresult" method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
                <table cellpadding="6" cellspacing="2" border="0" style="font-family:Helvetica, sans-serif; font-size:12px; border:#999 solid 2px;" width="450px">
                  <input type="hidden" name="checkin" value="<?php echo $bsisearch->mysqlCheckInDate;?>"/>
                  <input type="hidden" name="checkout" value="<?php echo $bsisearch->mysqlCheckOutDate;?>"/>
                  <tr>
                    <th colspan="2" height="22px"><b> 搜索结果
                      ( <?php echo $bsisearch->checkInDate;?> to <?php echo $bsisearch->checkOutDate;?> ) = <?php echo $bsisearch->nightCount;?> Night(s)</b></th>
                  </tr>
                  <tr>
                    <td style="padding-left:10px;">名称/说明</td>
                    <td><input type="text" name="block_name" id="block_name" class="required" style="width:230px !important;"/>
                      <div id="showmsg">
                        <label class="error" for="block_name" style="color:#F00; display:none;"><strong>请输入名称/说明</strong></label>
                      </div></td>
                  </tr>
                  <tr>
                    <td colspan="2"><hr /></td>
                  </tr>
                  <tr>
                    <th align="left" style="padding-left:10px;">房间名</th>
                    <th align="left">可用性</th>
                  </tr>
                  <tr>
                    <td colspan="2"><hr /></td>
                  </tr>
                  <?php
	 			$gotSearchResult = false;		
				$apartment_result = $bsisearch->getAvailableAppartment();
				if(intval($apartment_result['roomcnt']) > 0) {
					$gotSearchResult = true;
					//echo "<pre>";print_r($_SESSION['svars_details']);echo "</pre>";
					foreach($_SESSION['svars_details'] as $key =>  $value){
						$apartmentDetails = $bsiCore->getApartmentdetails($key);								
				 ?>
                  <tr>
                    <td style="padding-left:10px;"><?php echo $apartmentDetails['appmt_name'];?></td>
                    <td><input type="radio" value="<?php echo $apartmentDetails['appmt_id'];?>" name="choose" class="required"/></td>
                  </tr>
                  <?php   
                        }                
                      }  
			if($gotSearchResult){
				echo '<tr>
                    	<td colspan="2"><hr /></td>
                  	  </tr>
				<tr>
				  <td><label class="error" for="choose" style="color:#F00; display:none;"><strong>请选择公寓。</strong></label></td>
				  <td style="padding-bottom:7px;"><input type="submit" id="submitblock" value="Block" name="block" class="btn2" style="cursor:pointer; cursor:hand;"/></td>
				</tr>';
			}else{
				echo '<tr>
				  <td colspan="2" align="center" style="color:red;"><b>很抱歉，没有公寓可作为你的搜索条件。</b></td>
				</tr>';
			}
			?>
                </table>
              </form>
              <? } ?></td>
          </tr>
        </table>
      </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <?php if($bsiCore->config['conf_rental_type']==1){ ?>
    <script type="text/javascript">
$(document).ready(function(){	
 	$.datepicker.setDefaults({ dateFormat: '<?php echo $bsiCore->config['conf_dateformat'];?>' });	
	 	$( "#txtFromDate, #txtToDate" ).datepicker({
            minDate: 0,
            defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            onSelect: function( selectedDate ) {
                if(this.id == 'txtFromDate'){
                  var dateMin = $('#txtFromDate').datepicker("getDate");
                  var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(),dateMin.getDate() + 1);
                  var rMax = new Date(dateMin.getFullYear(), dateMin.getMonth(),dateMin.getDate() + 365);
                  $('#txtToDate').datepicker("option","minDate",rMin);
                  $('#txtToDate').datepicker("option","maxDate",rMax);                    
                }
                
            }
        });

 $("#datepickerImage").click(function() { 
    $("#txtFromDate").datepicker("show");
  });
 $("#datepickerImage1").click(function() { 
    $("#txtToDate").datepicker("show");
  });
});
</script>
    <?php } elseif($bsiCore->config['conf_rental_type']==2){ ?>
    <script type="text/javascript">
 $(function() {
	 $.datepicker.setDefaults({ dateFormat: '<?php echo $bsiCore->config['conf_dateformat'];?>', minDate: new Date(), numberOfMonths: 2 });
        $("#txtFromDate1").datepicker(
		
        { beforeShowDay: function(day) {
            var day = day.getDay();
            if (day == <?php echo $bsiCore->config['conf_week_checkin_day'];?> ) {
                return [true, "somecssclass"]
            } else {
                return [false, "someothercssclass"]
            }
        }
        });
		$("#datepickerImage").click(function() { 
    $("#txtFromDate1").datepicker("show");
  });
    });
</script>
    <?php } elseif($bsiCore->config['conf_rental_type']==3){ ?>
    <script type="text/javascript">
$(document).ready(function() {
    var currentTime = new Date()    
    var minDate1 = new Date(currentTime.getFullYear(),currentTime.getMonth() +2, -1);
   $('#txtMonthIn').datepicker({
     changeMonth: true,
     changeYear: true,
     dateFormat: 'MM yy',
       showButtonPanel: true,
       minDate: minDate1,
       
     onClose: function() {
        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
     },
       
     beforeShow: function() {
       if ((selDate = $(this).val()).length > 0)
       {
          iYear = selDate.substring(selDate.length - 4, selDate.length);
          iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
          $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
           $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
       }
    }
  });
  
   $("#txtMonthIn1").click(function() { 
    $("#txtMonthIn").datepicker("show");
  });
  
});
</script>
    <style>
.ui-datepicker-calendar {
	display: none;
}
.ui-datepicker {
	width: 10em;
	padding: .2em .2em 0;
	display: none;
	font-size:10px;
}
</style>
    <?php } ?>
    <script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
		<?php if(isset($_POST['submit'])){
				  echo '$("#adminsearchresult").validate();';
		      }
		?>
     });     
	</script> 
	<script src="cp/js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/DataTables/jquery.dataTables.js"></script> 
    <script type="text/javascript" src="js/bsi_datatables.js"></script>
    <link href="css/data.table.css" rel="stylesheet" type="text/css" />
    <link href="css/jqueryui.css" rel="stylesheet" type="text/css" />
    <?php include("footer.php"); ?>
</body>
</html>