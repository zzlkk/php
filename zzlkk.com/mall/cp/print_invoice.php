<?php  

include ("access.php");

include("../includes/db.conn.php"); 

include("../includes/conf.class.php");

include("../includes/admin.class.php");

if(isset($_REQUEST['bid'])){

 $r_invoice=mysql_fetch_assoc(mysql_query("select * from bsi_invoice where booking_id=".$bsiCore->ClearInput($_REQUEST['bid'])));

 $r_booking=mysql_fetch_assoc(mysql_query("select * from bsi_bookings where booking_id=".$bsiCore->ClearInput($_REQUEST['bid'])));

 $paymentgateway = $bsiAdminMain->getPayment_Gateway($r_booking['payment_type']);

}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>打印预订发票</title>

<script type="text/javascript">

window.print()

</script>

</head>

<body>

<div align="center">

<table cellpadding="3"  border="0" width="700">

<tr><td width="400" align="left" valign="top">

<span style="font-family:Arial, Helvetica, sans-serif; font-size:24px; font-weight:bold;"><?php echo $bsiCore->config['conf_apartment_name'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><?php echo $bsiCore->config['conf_apartment_streetaddr'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><?php echo $bsiCore->config['conf_apartment_city'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><?php echo $bsiCore->config['conf_apartment_state']." ". $bsiCore->config['conf_apartment_zipcode'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><?php echo $bsiCore->config['conf_apartment_country'];?></span><br />

</td>

<td width="200" align="right" valign="top">

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><b>电话:</b> <?php echo $bsiCore->config['conf_apartment_phone'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><b>传真:</b> <?php echo $bsiCore->config['conf_apartment_fax'];?></span><br />

<span style="font-family:Arial, Helvetica, sans-serif; font-size:12px;"><b>Email:</b> <?php echo $bsiCore->config['conf_apartment_email'];?></span><br />

</td></tr>

</table><br />



<?php echo $r_invoice['invoice'];?>



</div>

</body>

</html>

