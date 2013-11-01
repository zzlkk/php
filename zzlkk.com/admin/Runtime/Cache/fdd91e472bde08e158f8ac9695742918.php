<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link type="text/css" rel="stylesheet" href="http://public.zzlkk.com/css/common.css" />
<style type="text/css">
html,body{margin:0;padding:0;height:100%;}
.top{height:15%;position:relative;background-color:#191919;color:white;}
.top a{color:white;}
.logo{position:absolute;left:8px;bottom:12px;font-size:36px;font-weight:bold;font-family:微软雅黑;}
.content{width:80%;height:85%;border:0;float:right;background-color:#eee;}
.left{width:20%;height:85%;float:left;background-color:#e3e5e7;}
.lnav li{border-bottom:1px solid #ccc;border-right:1px solid #ccc;line-height:33px;}
.lnav .head{height:29px;border:1px solid #ccc;border-radius:3px;float:left;margin:1px 10px 0 0;}
.lnav li a{margin-left:20px;display:block;}
.cnav{background-color:#353535;display:none;}
.cnav a{padding-left:20px;color:#e5e5e5;}
.ctn{cursor:pointer;}
#search{position:absolute;right:5%;bottom:2vh;}
.text8{width:200px;height:25px;border:1px solid #666;}
.btn4{width:88px;height:25px;border:1px solid #666;}
</style>
<script type="text/javascript" src="http://public.zzlkk.com/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://public.zzlkk.com/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$(".lnav li a").hover(function(){
		$(this).stop().animate({marginLeft:"25px"},100);
	},function(){
		$(this).stop().animate({marginLeft:"20px"},200);
	});
	$(".ctn").click(function(){
		$(this).next().slideToggle(200);
	});
});
</script>
</head>
<body>
<div class="top"><a class="logo" href="/">助手</a>
<form action="" method="post" id="search"><input type="search" placeholder="请输入关键字" class="text8" /> <span>高级</span> <input type="button" value="搜 索" class="btn4" /></form>
</div>
<div class="content">
<div class="border">
安全  HTTPS、AES-256、SHA-256算法配合完善密钥周期管理
性能  先进技术配合标准代码
评估  细致的性能评估报告、严谨的安全评估报告

</div>
</div>
<div class="left" id="left">
<ul class="lnav">
	<li><a href="<?php echo U('/Finance/index');?>"><img class="head" src="<?php echo ($_SESSION['user']['head']); ?>" alt="<?php echo ($_SESSION['user']['nick']); ?>" /> <?php echo ($_SESSION['user']['nick']); ?></a></li>
	<li><a href="<?php echo U('/User/index');?>">用户管理</a></li>
	<li><a href="<?php echo U('/Role/index');?>">权限管理</a></li>
	<li><a href="<?php echo U('/AGroup/index');?>">权限角色</a></li>
	<li><a href="<?php echo U('/Auth/index');?>">授权管理</a></li>
	<li><a class="ctn">系统设置</a>
		<div class="cnav"><a href="#">安全设置</a><a href="#">习惯设置</a></div>
	</li>
	<li><a href="<?php echo U('/Index/logout');?>">退出登录</a></li>
</ul>
</div>
<?php echo sessionMsg();?>
</body>
</html>