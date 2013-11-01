<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台登录</title>
<link type="text/css" rel="stylesheet" href="http://public.zzlkk.com/css/common.css" />
<style type="text/css">
label{font-size:32px;}
form{width:555px;margin:100px auto;}
input[type="text"],input[type="password"]{width:456px;height:55px;padding:2px 10px 2px 10px;margin:0 0 10px 10px;font-size:48px;}
input[type="submit"]{width:200px;height:55px;font-size:32px;float:right;}
</style>
</head>
<body>
<form action="<?php echo U('/Index/login');?>" method="post">
	<label>用户</label><input type="text" name="name" /><br />
	<label>密码</label><input type="password" name="pwd" /><br />
	<input type="submit" value="登录"/>
</form>
</body>
<script type="text/javascript" src="http://public.zzlkk.com/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://public.zzlkk.com/js/common.js"></script>
<?php echo sessionMsg();?>
</html>