<?php
session_start();
if(isset($_POST['submit'])){
	include("includes/db.conn.php");
	include("includes/conf.class.php");
	include("includes/mail.class.php");
	$msg=$bsiCore->getContact();
	header("location:contacts.php?msg=".$msg);
}
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
<link href="js/slider/coin-slider.css" rel="stylesheet" type="text/css" />
<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slider/coin-slider.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#coin-slider').coinslider({ hoverPause: false });
	});
</script>
<script type="text/javascript" src="js/menu/superfish.js"></script>
<script type="text/javascript">
	jQuery(function(){
		jQuery('ul.sf-menu').superfish();
	}); 
</script>
<script src="cp/js/jquery.validate.js" type="text/javascript"></script> 
<link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
</head>

<body style="font-family: 'MavenProRegular';">
<?php include("header.php"); ?>
<div class="createAcWp">
	<form name="create_account" id="form1" action="http://mall.zzlkk.com/shop/create_account.html?f=wowo" method="post">
		<input type="hidden" name="action" value="process">
		<input type="hidden" name="email_pref_html" value="email_format">
		<div>
		  <div class="cac_form">
			<ul>
			  <li><input type="text" class="text required" placeholder="电子邮件" name="email_address" id="email_address"/></li>
			  <li><input type="password" class="text required" placeholder="密码" name="password" id="password-new"/></li>
			  <li><input type="password" class="text required" placeholder="确认密码" name="confirmation" id="password-confirm"/></li>
			  <li><input type="text" class="text required" placeholder="姓名" name="lastname" id="lastname"/></li>
			  <li><input type="text" class="text required" placeholder="手机号码" name="telephone" id="telephone"/></li>
			</ul>
			<div class="xieyi">
			<input type="checkbox" class="checkbox" id="xieyi" />
			<label for="xieyi">我已阅读并同意</label><a href="" target="_blank">服务协议</a></div>
		  </div>
		  <div class="ac_submit">
			<input type="submit" class="ac_submit_btn" name="submitCapacity" value="创建账户" />
			<span class="ac_to_login">已经是卧卧会员？<a href="">立即登录</a></span>
		  </div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
     });     
</script> 
<?php include("footer.php"); ?>
</body>
</html>
