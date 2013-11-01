<?php 
include("access.php");
include("header.php");
$bookingid = $bsiCore->ClearInput($_GET['booking_id']);
if(!isset($bookingid)){
	  header("location:admin-home.php");	
}
$viewdetailsquery = mysql_query("select DATE_FORMAT(bb.checkin_date, '".$bsiCore->userDateFormat."') AS start_date, checkout_date, DATE_FORMAT(bb.checkout_date, '".$bsiCore->userDateFormat."') AS end_date, DATE_FORMAT(bb.booking_time, '".$bsiCore->userDateFormat."') AS booking_time, bc.title, bc.first_name, bc.surname, bc.street_addr, bc.phone, bc.zip,bc.city,bc.province,bc.email, bc.country, bb.total_cost, bb.payment_type, bb.is_deleted from bsi_bookings as bb, bsi_clients as bc where  bb.client_id=bc.client_id and booking_id=".$bookingid."");
$rowviewdetails = mysql_fetch_assoc($viewdetailsquery);	 
?>
<link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
<div id="container-inside"> <span style="font-size:16px; font-weight:bold">预定详情 : <?php echo $bookingid;?> </span>
<?php
if(isset($_GET['client'])){
?>
 <input type="submit" value="Back" style="background:#e5f9bb; cursor:pointer; cursor:hand; float:right" onClick="window.location.href='<?php echo$_SERVER['HTTP_REFERER'];?>'"/>
<?php
}else{
?>
  <input type="submit" value="Back" style="background:#e5f9bb; cursor:pointer; cursor:hand; float:right" onClick="javascript:window.location.href='view_active_or_archieve_bookings.php?book_type=<?php echo $_GET['book_type'];?>&appmt_id=<?php echo $_GET['appmt_id'];?>'"/>
  <?php
  }
  ?>
  <hr style="margin-top:10px;" />
  <table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1">
    <tr>
      <td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="2"><b>客户信息</b></td>
    </tr>
    <tr>
      <td align="left" style="background:#ffffff;" width="150px">名字</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['title'];?>
        <?php echo $rowviewdetails['first_name'];?>
        <?php echo $rowviewdetails['surname'];?></td>
    </tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;display:none;">电话</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['phone'];?></td>
    </tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;">地址</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['street_addr'];?></td>
    </tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;">城市</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['city'];?></td>
    </tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;">省/州</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['province'];?></td>
    </tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;">国家</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['country'];?></td>
    </tr>
    <tr>
    <tr style="display:none;">
      <td align="left" style="background:#ffffff;">邮编</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['zip'];?></td>
    </tr>
    <tr>
      <td align="left" style="background:#ffffff;">手机</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['phone'];?></td>
    </tr>
    <tr>
      <td align="left" style="background:#ffffff;">电子邮件</td>
      <td align="left" style="background:#ffffff;"><?php echo $rowviewdetails['email'];?></td>
    </tr>
  </table>
  <?php echo $bsiAdminMain->paymentDetails($rowviewdetails['payment_type'], $bookingid);?>
  <table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1">
    <tr>
      <td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="2"><b>预定状态</b></td>
    </tr>
    <tr>
      <?php
		 $status='';
		 $curdate=date('Y-m-d');
		 $rowviewdetails['is_deleted'];
		if($rowviewdetails['is_deleted'] == 0 && $rowviewdetails['checkout_date']<$curdate ){
			$status='已过期';
			echo '<td align="left" style="background:#ffffff;color:blue;"><strong>'.$status.'</strong></td>';	
		}else if($rowviewdetails['is_deleted']==0 && $rowviewdetails['checkout_date']>$curdate){
			$status='有限';
			echo '<td align="left" style="background:#ffffff;color:green;"><strong>'.$status.'</strong></td>';	
		}else if($rowviewdetails['is_deleted']==1){
			$status='已取消';
			echo '<td align="left" style="background:#ffffff;color:red;"><strong>'.$status.'</strong></td>';	
		}
		?>
    </tr>
  </table>
</div>
<?php include("footer.php"); ?>
