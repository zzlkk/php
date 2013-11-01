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
<tr><th>编号</th><th>名称</th><th>状态</th><th>排序</th><th>操作 <a class="button" href="<?php echo U('/AGroup/index');?>">刷新</a>
<a class="button" href="javascript:add(0)">添加</a></th></tr>
<?php if(is_array($agroup)): foreach($agroup as $key=>$c): ?><tr id="cr<?php echo ($c["id"]); ?>"><td><?php echo ($c["id"]); ?></td><td><?php echo ($c["indent"]); echo ($c["title"]); ?></td><td><?php echo ($c["status"]); ?></td><td><?php echo ($c["sort"]); ?></td>
	<td><a class="button" href="<?php echo U('/AGroup/save?status='.(1-$c['status']).'&id='.$c['id']);?>"><?php echo ($c['status']?'禁用':'启用'); ?></a>
		<a class="button" href="javascript:edit(<?php echo ($c['id']); ?>)">编辑</a>
		<a class="button" onclick="return confirm('所有子项也将一并删除！确定删除[<?php echo ($c['title']); ?>]？')" href="javascript:del(<?php echo ($c['id']); ?>)">删除</a>
		<a class="button" href="javascript:add(<?php echo ($c['id']); ?>)">添加子项</a>
	</td></tr><?php endforeach; endif; ?>
</table>
</div>
<!-- 添加/编辑 -->
<div id="cwin" style="display:none;width:400px;height:168px;background:#fff;padding-top:20px;border:10px solid #eee;">
	<form action="<?php echo U('/AGroup/save');?>" method="post"><div style="margin:0 20px 0 90px;">
		<label id="clo" style="float:right;cursor:pointer;color:#f00;">关闭</label><br/>
		<input type="hidden" id="rid" name="id" value="" />
		<input type="hidden" id="rpid" name="pid" value="" />
		<label>名称</label><input type="text" id="rtitle" name="title" value="" /><br/>
		<label>排序</label><input type="text" id="rsort" name="sort" value="" size="3" />
		<label>状态</label><input type="checkbox" id="rstatus" name="status" checked="checked" /><br/>
		<input type="submit" value="保存" style="margin-left:138px" />
	</div></form>
</div>
<script type="text/javascript">
$(function(){
	$("table").find("tr:odd").addClass("odd");
});
function add(pid){
	fillData(0,pid,'',99,1);
	popup('cwin','clo');
}
function del(id){
	if(!isNaN(id)&&id>0){
		$.post("<?php echo U('/AGroup/delete');?>",{id:id},function(data){
			if(data){$('#cr'+id).fadeOut(function(){$('#cr'+id).remove();});}
		});
	}else{
		xalert('错误请求',2);
	}
}
function edit(id){
	if(!isNaN(id)){
		$.post("<?php echo U('/AGroup/edit');?>",{id:id},function(data){
			if(data){
				fillData(data.id,data.pid,data.title,data.sort,data.status);
				popup('cwin','clo');
			}else{
				xalert('错误请求',4);
			}
		});
	}else{
		xalert('错误请求',3);
	}
}
function fillData(id,pid,title,sort,status){
	$("#rid").val(id);
	$("#rpid").val(pid);
	$("#rtitle").val(title);
	$("#rsort").val(sort);
	if(1==status){
		$("#rstatus").attr("checked","checked");
	}else{
		$("#rstatus").removeAttr("checked");
	}
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