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
<div class="border"><table>
<tr><th colspan="6"><form action="<?php echo U('/Finance/save');?>" id="fsave" method="post" onsubmit="return saveCheck()"><input type="hidden" id="id" name="id" value="0" /><input type="text" id="title" name="title" placeholder="项目" /> <input type="text" id="price" name="price" placeholder="金额" /> <input type="text" id="remark" name="remark" placeholder="备注" /> <input type="date" id="time" name="time" /> <input type="submit" id="btnadd" class="btnadd" value="添加" /> <a id="btncal" style="color:red;cursor:pointer;display:none;">取消</a></form></th></tr>
<tr><th width="10%">编号</th><th width="30%">项目</th><th width="10%">金额</th><th width="25%">备注</th><th width="10%">时间</th><th width="15%">操作</th></tr>
<?php if(is_array($finances)): foreach($finances as $key=>$c): ?><tr id="cr<?php echo ($c["id"]); ?>"><td><?php echo ($c["id"]); ?></td><td><?php echo ($c["title"]); ?></td><td><?php echo ($c["price"]); ?></td><td><?php echo ($c["remark"]); ?></td><td><?php echo (substr($c["time"],0,10)); ?></td>
	<td>
		<a class="button" href="javascript:fly('cr<?php echo ($c['id']); ?>','btnadd')">编辑</a>
		<a class="button" onclick="return confirm('确定删除[<?php echo ($c['title']); ?>]？')" href="<?php echo U('/Finance/delete/id/'.$c['id']);?>">删除</a>
	</td></tr><?php endforeach; endif; ?>
<tr><th colspan="6"><?php echo ($pager); ?><label style="float:left">收入：<?php echo ($in); ?> 支出：<?php echo ($out); ?> 结余：<?php echo ($in+$out); ?></label></th></tr>
</table>
</div>
<table id="flytb"></table>
<script type="text/javascript">
$(function(){
	$("table").find("tr:odd").addClass("odd");
	initDate();
	
	$("#btncal").click(function(){
		$("#id").val("");
		$("#title").val("");
		$("#price").val("");
		$("#remark").val("");
		initDate();
		$("#btnadd").val("添加");
		$(this).hide();
		$(".button").show();
	});
	$("#title,#remark").blur(function(){
		var color = $("#title").val().length<1&&$("#remark").val().length<1?"pink":"";
		$("#title").css("background-color",color);
		$("#remark").css("background-color",color);
	});
	$("#price").blur(function(){
		$(this).val(eval($(this).val()));
		$(this).css("background-color",($(this).val().length<1||isNaN($(this).val())?"pink":""));
	});
});
function initDate(){
	var td = new Date();
	$("#time").val(td.getFullYear()+"-"+(td.getMonth()<9?"0"+(td.getMonth()+1):td.getMonth()+1)+"-"+(td.getDate()<10?"0"+td.getDate():td.getDate()));
}
function fly(from,to){
	$(".button").hide();
	var clone = $('#'+from).clone();
	$('#flytb').append(clone).css({position:"absolute",width:$('#'+from).width()+"px",top:$('#'+from).offset().top+"px",left:$('#'+from).offset().left+"px",opacity:"1"}).show().animate({top:$('#'+to).offset().top+"px",opacity:"0.5"},800,function(){
		$(this).hide();clone.remove();
		$("#id").val($('#'+from).children().first().text());
		$("#title").val($('#'+from).children().first().next().text());
		$("#price").val($('#'+from).children().first().next().next().text());
		$("#remark").val($('#'+from).children().first().next().next().next().text());
		$("#time").val($('#'+from).children().first().next().next().next().next().text());
		$("#btnadd").val("更新");
		$("#btncal").show();
		$("#title,#remark,#price").blur();
	});
}
function saveCheck(){
	if($("#title").val().length<1&&$("#remark").val().length<1){
		$("#title").css("background-color","pink").focus();
		$("#remark").css("background-color","pink");
		return false;
	}
	if($("#price").val().length<1||isNaN($("#price").val())){
		$("#price").css("background-color","pink").focus();
		return false;
	}
	return true;
}
</script></div>
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