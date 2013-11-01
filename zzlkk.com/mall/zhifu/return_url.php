<?php
/* * 
 * 功能：支付宝页面跳转同步通知页面
 * 版本：3.3
 * 日期：2012-07-23
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************页面功能说明*************************
 * 该页面可在本机电脑测试
 * 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 * 该页面可以使用PHP开发工具调试，也可以使用写文本函数logResult，该函数已被默认关闭，见alipay_notify_class.php中的函数verifyReturn
 */

require_once("alipay.config.php");
require_once("lib/alipay_notify.class.php");
session_start();
include("../includes/db.conn.php");
include("../includes/conf.class.php");
include("../includes/mail.class.php");
include("../sendEmail.php");
?>
<!DOCTYPE HTML>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
//计算得出通知验证结果
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
$bsiMail = new bsiMail();
$emailContent = $bsiMail->loadEmailContent();
if($verify_result) {//验证成功
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//请在这里加上商户的业务逻辑程序代码
	
	//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

	//商户订单号
	$out_trade_no = $_GET['out_trade_no'];

	//支付宝交易号
	$trade_no = $_GET['trade_no'];

	//交易状态
	$trade_status = $_GET['trade_status'];
	
	//交易金额
	$trade_price = $_GET['total_fee'];
	
	//支付者邮箱
	$buyer_email = $_GET['buyer_email'];

	if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
		//判断该笔订单是否在商户网站中已经做过处理
		//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
		//如果有做过处理，不执行商户的业务程序
	   //*****************************************************************************************
		mysql_query("UPDATE bsi_bookings SET payment_amount='".$trade_price."', payment_success=true, payment_txnid='".$trade_no."', paypal_email='".$buyer_email."' WHERE booking_id='".$out_trade_no."'");

		$invoiceROWS = mysql_fetch_assoc(mysql_query("SELECT client_name, client_email, invoice FROM bsi_invoice WHERE booking_id='".$out_trade_no."'"));
		mysql_query("UPDATE bsi_clients SET existing_client = 1 WHERE email='".$invoiceROWS['client_email']."'");
		
		$invoiceHTML = $invoiceROWS['invoice'];	
			
		$invoiceHTML.= '<br><br><table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; bgcolor:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Option</td><td align="left" style="background:#ffffff">PayPal</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payer E-Mail</td><td align="left" style="background:#ffffff">'.$buyer_email.'</td></tr><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Transaction ID</td><td align="left" style="background:#ffffff">'.$trade_no.'</td></tr></table>';
		
		mysql_query("UPDATE bsi_invoice SET invoice = '$invoiceHTML' WHERE booking_id='".$out_trade_no."'");
		$rowB = mysql_fetch_assoc(mysql_query("select appmt_id from bsi_bookings WHERE booking_id='".$out_trade_no."'"));
		$resultCheck = mysql_query("select user_id from bsi_appmt_user WHERE appmt_id=".$rowB['appmt_id']);
		$emailString = '';

		if(mysql_num_rows($resultCheck)){
			$rowU = mysql_fetch_assoc($resultCheck);
			$rowC = mysql_fetch_assoc(mysql_query("select * from bsi_clients where client_id=".$rowU['user_id']." and user_type=2"));
			$emailString .= $rowC['email'].",";
			//查询商户手机号码
			$rowP = mysql_fetch_assoc(mysql_query("select phone from bsi_clients WHERE client_id='".$rowU['user_id']."'"));
			$smsStatus = false; 
			//发送短信
			if($smsStatus){
				include_once('../includes/HttpClient.class.php');
				$client = new HttpClient('www.72dns.com');
				$client->post('/smsadmin/Sms_Api.aspx',
				array('UserID'=>"4471",
				'PassWord'=>"8d22f8891225cf378e2b8e087e03874e",
				'mobile'=>$rowP['phone'],
				// 'mobile'=>"18084030059",
				// 'message'=>mb_convert_encoding("预定单号 #$orderid 预定成功。欢迎你的入住","gb2312","utf-8"),
				'message'=>"预定单号:$out_trade_no 预定成功。请尽快与租客进行联系",
				'action'=>"SendSms"));
				$pageContents = $client->getContent();
			}
		}
		
		//发送邮件
		$emailString .= $bsiCore->config['conf_notification_email'];
		
		$emailBody  = "Dear ".$invoiceROWS['client_name'].",<br><br>";
		$emailBody .= html_entity_decode($emailContent['body'])."<br><br>";
		$emailBody .= $invoiceHTML;
		$emailBody .= "<br><br>Regards,<br>".$bsiCore->config['conf_apartment_name'].'<br>'.$bsiCore->config['conf_apartment_phone'];
		$emailBody .= "<br><br><font style=\"color:#F00; font-size:10px;\">[ You will need to carry a print out of attcahed voucher and present it to the hotel on arrival and check-in. This e-mail is the confirmation  for your booking. ]</font>";
		$flag = 1;
		// $bsiMail->sendEMail($invoiceROWS['client_email'], $emailContent['subject'], $emailBody, $out_trade_no, $flag);
		smtp_mail($invoiceROWS['client_email'], $emailContent['subject'], $emailBody);   
		/* Notify Email for Hotel about Booking */
		$notifyEmailSubject = "Booking no.".$out_trade_no." - Notification of Apartment Booking by ".$invoiceROWS['client_name'];
		
		// $bsiMail->sendEMail($emailString, $notifyEmailSubject, $invoiceHTML);
		smtp_mail($emailString, $notifyEmailSubject, $invoiceHTML);  
	//*****************************************************************************************
	}else {
       mysql_query("update bsi_bookings set payment_success='0' where invoice=".$out_trade_no);	
    }	
	// echo "验证成功<br />";
	header("location:/../booking-confirm.php?success_code=1");
	//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
else {
    //验证失败
    //如要调试，请看alipay_notify.php页面的verifyReturn函数
    // echo "验证失败";
	header("location:/../booking-failure.php?error_code=28");
}
?>
        <title>支付宝即时到账交易接口</title>
	</head>
    <body>
    </body>
</html>