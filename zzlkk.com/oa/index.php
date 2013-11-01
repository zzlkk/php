<?php
session_start();
$_SESSION['role']=isset($_SESSION['role'])?$_SESSION['role']:0;//0 readyonly 1 manager

$conn = mysql_connect('127.0.0.1','root','PD06root');
if(!$conn)die('暂时无法连接服务器');
mysql_query("set names utf8");
mysql_select_db('oa',$conn);

if(isset($_SESSION['uid'])){

}else if(isset($_POST['pwd'])&&'kk'==$_POST['uid']&&'chunzong'==$_POST['pwd']){
	$_SESSION['uid']='kk';$_SESSION['role']=1;
	 mysql_query("insert into loginfo(`ip`) values('kk ".$_SERVER['REMOTE_ADDR']."')");
}else if(isset($_POST['pwd'])&&'zj'==$_POST['uid']&&'chunzong'==$_POST['pwd']){
	$_SESSION['uid']='zj';$_SESSION['role']=0;
	 mysql_query("insert into loginfo(`ip`) values('zj ".$_SERVER['REMOTE_ADDR']."')");
}else{
	?><style type="text/css">
	.loginpanel{width:230px;line-height:33px;line-height:33px;margin:15% auto 0 auto;}
	.ltitle{font-size:20px;color:gray;}
	.loginpanel .uid{border:none;border-bottom:1px solid darkgreen;outline:none;width:140px;padding-left:20px;}
	.loginpanel .pwd{border:none;border-bottom:1px solid darkgreen;outline:none;width:140px;padding-left:20px;}
	.loginpanel input[type="submit"]{float:right;}
	</style>
	<div class="loginpanel">
	<form action="/" method="post" autocomplete="off">
	<label class="ltitle">System Login</label><br />
	<label>Username</label> <input type="text" class="uid" name="uid" maxlength="16" size="15" /><br />
	<label>Password</label> <input type="password" class="pwd" name="pwd" maxlength="16" size="15" /><br />
	<input type="submit" value=" Login " />
	</form>
	</div><?php exit();
}

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Mini OA</title>
<meta name="robots" content="nofollow">
<style type="text/css">
body,ul,li{margin:0;padding:0;list-style:none;}

.tabbar{height:55px;background-color:darkgreen;color:white;font-size:22px;font-family:"Microsoft YaHei UI",Arial;}
.tasks{width:30%;height:45px;padding:5px 0 5px 1%;background-color:green;float:left;cursor:pointer;}
.ebays{width:30%;height:45px;padding:5px 0 5px 1%;background-color:purple;float:left;cursor:pointer;}
.dvds{width:30%;height:45px;padding:5px 0 5px 1%;background-color:orange;float:left;cursor:pointer;}
.refresh{width:7%;height:55px;line-height:55px;text-align:center;font-size:22px;float:right;font-weight:bold;background-color:gray;cursor:pointer;}
.group{font-size:16px;font-weight:normal;}
.ebay{float:left;width:168px;height:178px;margin:5px 0 0 5px;padding:5px;border:1px solid green;position:relative;font-family:Verdana;font-size:11px;white-space:nowrap;overflow:hidden;}
.ebay .country{float:left;width:25px;font-weight:bold;color:orange;}
.ebay .status{position:absolute;right:5px;display:block;width:14px;height:14px;-moz-border-radius:7px;-webkit-border-radius:7px;border-radius:7px;cursor:pointer;}
.sslist{position:absolute;top:0px;right:0px;}
.sslist span,.css{display:block;width:14px;height:14px;-moz-border-radius:7px;-webkit-border-radius:7px;border-radius:7px;}
.ss0{background-color:lightgrey;}
.ss1{background-color:green;}
.ss2{background-color:orange;}
.ss3{background-color:red;}
.mini3{height:22px;}
.ebay .einfo{width:97%;height:36px;resize:none;border:none;color:darkgreen;}
.ebay .enote{width:97%;height:36px;resize:none;border:none;color:darkorange;border-top:1px dotted lightgreen;}
.ebay .time{font-size:11px;color:gray;}
.ebay.add{line-height:160px;font-size:32px;font-weight:bold;text-align:center;color:#cee;cursor:pointer;}
.ebayedit{width:37%;min-width:521px;padding:20px 3% 20px 3%;margin-top:10px;height:330px;border:5px solid blueviolet;position:fixed;left:28%;background-color:white;}
#einfo{width:440px;height:120px;color:darkgreen;}
#enote{width:440px;height:40px;color:darkorange;}
.ebayedit label{font-size:13px;color:gray;display:inline-block;width:32px;}
#esave{float:right;}
.eclose{display:block;float:right;width:44px;height:20px;border:1px solid red;color:red;text-align:center;cursor:pointer;}
.vpwd,.epwd,.mpwd{padding-left:20px;color:gray;}
.eedit{position:relative;right:15px;display:block;float:right;width:20px;height:18px;color:gray;cursor:pointer;}

.taskpanel{overflow:hidden;height:auto;padding:5px;}
.tasklist{width:75%;float:left;}
.taskbar{width:23%;padding-left:1%;border-left:1px dashed #666;float:right;}
.tcontent{color:darkgreen;}
.tcontent,.tprice,.tremark{border:none;border-bottom:1px solid #ccc;}

.dvdpanel{overflow:hidden;height:auto;padding:5px;}
.dvd{float:left;width:168px;height:88px;margin:5px 0 0 5px;padding:5;border:1px solid green;position:relative;}

.ebaypanel{overflow:hidden;height:auto;padding:5px;}
.center{text-align:center;}
.hide{display:none;}
</style>
<script src="jquery.min.js"></script>
<script src="jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	var strcookie=document.cookie;
	var arrcookie=strcookie.split("; ");
	var ctab="";
	for(var i=0;i<arrcookie.length;i++){
		var arr=arrcookie[i].split("=");
		if("ctab"==arr[0]){ctab=arr[1];break;}
	}
	ctab=ctab.length<1?'taskpanel':ctab;
	$("#"+ctab).removeClass("hide");

	$(".tasks").click(function(){$("#ebaypanel").addClass("hide");$("#dvdpanel").addClass("hide");$("#taskpanel").removeClass("hide");document.cookie="ctab=taskpanel";});
	$(".dvds").click(function(){$("#ebaypanel").addClass("hide");$("#dvdpanel").removeClass("hide");$("#taskpanel").addClass("hide");document.cookie="ctab=dvdpanel";});
	$(".ebays").click(function(){$("#ebaypanel").removeClass("hide");$("#dvdpanel").addClass("hide");$("#taskpanel").addClass("hide");document.cookie="ctab=ebaypanel";});
	$(".refresh").click(function(){window.location.reload();});
	var note;
	<?php if($_SESSION['role']==1){//role ?>
	$(".enote").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"note",id:$(this).parent().parent().find(".css").attr("id"),note:$(this).val()});
			$(this).css("outline","");
		}
	});
	$(".einfo").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"info",id:$(this).parent().parent().find(".css").attr("id"),note:$(this).val()});
			$(this).css("outline","");
		}
	});
	$(".css").click(function(){
		$(this).parent().find(".sslist").removeClass("hide");
	});
	$(".sslist").mouseleave(function(){
		$(this).addClass("hide");
	});
	$(".sss").click(function(){
		if($(this).parent().parent().find(".css").attr("name")!=$(this).attr("name")){
			$.post("/server.php",{op:"status",id:$(this).parent().parent().find(".css").attr("id"),status:$(this).attr("name")});
			$(this).parent().parent().find(".css").attr("name",$(this).attr("name")).attr("class","css ss"+$(this).attr("name"));
		}
		$(this).parent().addClass("hide");
	});
	$(".ebay.add").click(function(){
		$(".ebayedit").removeClass('hide');$(this).addClass("hide");
		$("#eid").val("0");$("#ecountry").val("AU");$("#estatus").val("0");
		$("#eip").val("");$("#vpwd").val("");$("#ename").val("");$("#epwd").val("");
		$("#email").val("@outlook.com");$("#mpwd").val("");$("#einfo").val("Paypal \nVcard  \n");
		$("#enote").val("等待注册 \n");$("#etime").val("<?php echo date("Y-m-d"); ?>");$("#eip").removeAttr("style");
	});
	$(".eclose").click(function(){$(".ebayedit").addClass('hide');$(".ebay.add").removeClass("hide");});
	$("#esave").click(function(){
		if($("#eip").val().length>0){
			$("#esave").attr("disabled","disabled");
			$.post("/server.php",{op:"ebaysave",id:$("#eid").val(),country:$("#ecountry").val(),status:$("#estatus").val(),ip:$("#eip").val(),vpwd:$("#vpwd").val(),ename:$("#ename").val(),epwd:$("#epwd").val(),mail:$("#email").val(),mpwd:$("#mpwd").val(),info:$("#einfo").val(),note:$("#enote").val(),time:$("#etime").val()},function(data){
				window.location.reload();
			});
		}else{
			$("#eip").css("border","1px solid red");$("#eip").effect("pulsate");
		}
	});
	$(".ebayedit input[type='text']").focus(function(){$(this).select();});
	$(".eedit").click(function(){
		$(".ebayedit").removeClass('hide');$("#eip").removeAttr("style");
		$("#eid").val($(this).parent().parent().find(".css").attr("id"));
		$("#ecountry").val($(this).parent().parent().find(".country").text());
		$("#estatus").val($(this).parent().parent().find(".css").attr("name"));
		$("#eip").val($(this).parent().parent().find(".eip").text());
		$("#vpwd").val($(this).parent().parent().find(".vpwd").text());
		$("#email").val($(this).parent().parent().find(".email").text());
		$("#mpwd").val($(this).parent().parent().find(".mpwd").text());
		$("#ename").val($(this).parent().parent().find(".ename").text());
		$("#epwd").val($(this).parent().parent().find(".epwd").text());
		$("#einfo").val($(this).parent().parent().find(".einfo").val());
		$("#enote").val($(this).parent().parent().find(".enote").val());
		$("#etime").val($(this).parent().parent().find(".etime").text());
	});
	$(".ecountry").change(function(){
		if($(this).prop('checked')){
			$('.'+$(this).attr("name")).removeClass("hide");
		}else{
			$('.'+$(this).attr("name")).addClass("hide");
		}
	});
	$(".mini3").click(function(){
		$(this).css("height","178px");
	}).dblclick(function(){
		$(this).css("height","22px");
	});
	<?php } ?>

	$("#taskorder").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"taskexists",id:$(this).val()},function(data){
				if(data>0){
					$("#taskorder").css("color","red");$("#taskorder").effect("pulsate");$("#taskorder").focus();$("#taskadd").attr("disabled","disabled");
				}else{
					$("#taskorder").css("color","");$("#taskadd").removeAttr("disabled");
				}
			});
			$(this).css("outline","");
		}
	});
	$(".taskr").change(function(){
		if($(this).prop('checked')){
			$('.'+$(this).attr("name")).removeClass("hide");
		}else{
			$('.'+$(this).attr("name")).addClass("hide");
		}
	});
	$("#taskadd").click(function(){
		if($("#taskorder").val().length<5){$("#taskorder").effect("pulsate");$("#taskorder").focus();return;}
		if($("#taskcontent").val().length<5){$("#taskcontent").effect("pulsate");$("#taskcontent").focus();return;}
		$("#taskadd").attr("disabled","disabled");
		$.post("/server.php",{op:"tasksave",id:$("#taskid").val(),order:$("#taskorder").val(),content:$("#taskcontent").val(),time:$("#tasktime").val(),price:$("#taskprice").val(),type:$("#tasktype").val(),res:$("#taskres").val(),status:$("#taskstatus").val(),remark:$("#taskremark").val()},function(data){
			window.location.reload();
		});
	});
	$(".tstatus").change(function(){
		$.post("/server.php",{op:"tstatus",id:$(this).parent().parent().find(".tid").val(),status:$(this).val()});
	});
	$(".tres").change(function(){
		$.post("/server.php",{op:"tres",id:$(this).parent().parent().find(".tid").val(),res:$(this).val()});
	});
	$(".tcontent").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"tcontent",id:$(this).parent().parent().find(".tid").val(),content:$(this).val()});
			$(this).css("outline","");
		}
	});
	$(".tprice").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"tprice",id:$(this).parent().parent().find(".tid").val(),price:$(this).val()});
			$(this).css("outline","");
		}
	});
	$(".tremark").focus(function(){
		note=$(this).val();
	}).blur(function(){
		if(note!=$(this).val()){
			$(this).css("outline","dotted thin");
			$.post("/server.php",{op:"tremark",id:$(this).parent().parent().find(".tid").val(),remark:$(this).val()});
			$(this).css("outline","");
		}
	});

});
</script>
</head>
<body>
<div class="tabbar">
	<div class="refresh">Refresh</div>
	<div class="tasks"><label>Tasks</label>
		<div class="group">
		<?php
			$ress = array('qq','kk','xp','xc','lc');
			foreach ($ress as $res){
				echo '<input type="checkbox" checked="checked" class="taskr" name="'.$res.'" id="r'.$res.'" /><label for="r'.$res.'">'.$res.'</label>';
			}
		?>
		</div>
	</div>
	<?php if($_SESSION['role']==1){//role ?>
	<div class="dvds"><label>DVD</label>
		<div class="group"><input type="checkbox" checked="checked" />Server1 <input type="checkbox" checked="checked" />Server2 <input type="checkbox" checked="checked" />Server3 <input type="checkbox" checked="checked" />Server4 <input type="checkbox" checked="checked" />Server5</div>
	</div>
	<div class="ebays"><label id="etitle">eBay</label>
		<div class="group"><input type="checkbox" id="eau" name="AU" class="ecountry" checked="checked" /><label for="eau">AU</label> <input type="checkbox" id="eca" name="CA" class="ecountry" checked="checked" /><label for="eca">CA</label> <input type="checkbox" id="eus" name="US" class="ecountry" checked="checked" /><label for="eus">US</label></div>
	</div>
	<?php } ?>
</div>
<div id="taskpanel" class="taskpanel hide">
	<?php if($_SESSION['role']==1){//role ?>
	<div class="taskbar">
		<input type="hidden" id="taskid" value="0" />
		订单<input type="text" id="taskorder" value=""/><br />
		内容<textarea id="taskcontent"></textarea><br />
		金额<input type="text" id="taskprice" value="0"/><br />
		时间<input type="text" id="tasktime" value="<?php echo date("Y-m-d"); ?>"/><br />
		备注<textarea id="taskremark"></textarea><br />
		类型<select id="tasktype"><option value="计划">计划</option><option value="普通" selected="selected">普通</option><option value="紧急">紧急</option></select>
		资源<?php
			$taskres='<select class="taskres">';
			foreach ($ress as $res){
				$taskres.="<option value='$res'".($task['task_res']==$res?' selected="selected"':'').">$res</option>";
			}
			$taskres.='</select>';
			echo $taskres;
			?>
		进度<select id="taskstatus"><option>意向客户</option><option>洽谈中</option><option>开发中</option><option>已完成</option></select><input type="button" id="taskadd" value="发布" />
	</div>
	<?php } ?>
	<div class="tasklist">
		<table width="100%"><tr><th>业务</th><th>时间</th><th>内容</th><th>金额</th><th>进度</th><th>备注</th><th>资源</th></tr>
		<?php
		$tasks = mysql_query("select * from taskinfo order by task_status asc,task_time desc");
		$etprice=0;$ttprice=0;
		while($task=mysql_fetch_array($tasks)){
			$status = array('意向客户','洽谈中','开发中','已完成','死单');
			$task_status='<select class="tstatus" style="color:';$ttprice+=$task['task_price'];
			if('意向客户'!=$task['task_status']&&'死单'!=$task['task_status'])$etprice+=$task['task_price'];
			$scolor='color="';
			switch($task['task_status']){
				case '意向客户':$task_status.='gold;">';break;
				case '洽谈中':$task_status.='red;">';break;
				case '开发中':$task_status.='green;">';break;
				default:$task_status.='black;">';
			}
			foreach ($status as $state){
				$task_status.="<option value='$state'".($task['task_status']==$state?' selected="selected"':'').">$state</option>";
			}
			$task_res='<select class="tres">';
			foreach ($ress as $res){
				$task_res.="<option value='$res'".($task['task_res']==$res?' selected="selected"':'').">$res</option>";
			}
			echo '<tr class="'.$task['task_res'].'"><td><input type="hidden" class="tid" value="'.$task['task_id'].'" />'.$task['task_order'].'</td>
			<td>'.substr($task['task_time'],5,5).'</td>
			<td><input type="text" size="50" class="tcontent" value="'.$task['task_content'].'" '.($_SESSION['role']==1?'':'readonly="readonly"').' /></td>
			<td><input type="text" size="3" class="tprice" value="'.$task['task_price'].'" /></td><td>'.$task_status.'</select></td>
			<td><input type="text" class="tremark" value="'.$task['task_remark'].'" /></td>
			<td class="center">'.$task_res.'</select></td></tr>';
		}
		echo "<script type='text/javascript'>$(\"#etitle\").text(\"eBay ($$etprice/$$ttprice)\");</script>"; ?>
		</table>
	</div>
</div>
	<?php if($_SESSION['role']==1){//role ?>
<div id="ebaypanel" class="ebaypanel hide">
<?php
$ebays = mysql_query("select * from ebayinfo order by ebay_status asc,ebay_country asc,ebay_time desc");
while($ebay=mysql_fetch_array($ebays)){
	echo '<div class="ebay '.$ebay['ebay_country'].' mini'.$ebay['ebay_status'].'">
		<div><a class="eedit">edit</a><div class="status"><span id="'.$ebay['ebay_id'].'" name="'.$ebay['ebay_status'].'" class="css ss'.$ebay['ebay_status'].'"></span><div class="sslist hide"><span class="ss0 sss" name="0"></span><span class="ss1 sss" name="1"></span><span class="ss2 sss" name="2"></span><span class="ss3 sss" name="3"></span></div></div>
		<div class="country">'.$ebay['ebay_country'].'</div><label class="eip">'.$ebay['ebay_ip'].'</label></div>
		<div class="vpwd">'.$ebay['ebay_vpwd'].'</div>
		<div>ebay <label class="ename">'.$ebay['ebay_name'].'</label></div>
		<div class="epwd">'.$ebay['ebay_epwd'].'</div>
		<div>mail <label class="email">'.$ebay['ebay_mail'].'</label></div>
		<div class="mpwd">'.$ebay['ebay_mpwd'].'</div>
		<div><textarea class="einfo">'.$ebay['ebay_info'].'</textarea></div>
		<div><textarea class="enote">'.$ebay['ebay_note'].'</textarea></div>
		<div class="time"><label class="etime">'.$ebay['ebay_time'].'</label></div>
	</div>';
}
?>
	<div class="ebay add">Add</div>
	<div class="ebayedit hide"><span class="eclose">Close</span>
		<input type="hidden" id="eid" value="0" />
		<label>国家</label><select name="country" id="ecountry"><option value="AU">AU</option><option value="CA">CA</option><option value="US">US</option></select>
		<label>状态</label><select name="status" id="estatus"><option value="0">准备</option><option value="1">运行</option><option value="2">问题</option><option value="3">关闭</option></select><br />
		<label>管理</label><input type="text" id="eip" /><label>密码</label><input type="text" id="vpwd" /><br />
		<label>邮箱</label><input type="text" id="email" /><label>密码</label><input type="text" id="mpwd" /><br />
		<label>Ebay</label><input type="text" id="ename" /><label>密码</label><input type="text" id="epwd" /><br />
		<label>资料</label><textarea id="einfo"></textarea><br />
		<label>备注</label><textarea id="enote"></textarea><br />
		<input type="button" id="esave" value=" Save " />
		<label>时间</label><input type="text" id="etime" value="" />
	</div>
</div>
<div id="dvdpanel" class="dvdpanel hide">
	<div class="dvd">
		<ul><li>www.luvdvd.com</li>
			<li>新订单 5</li>
			<li>IP 5 UV 5 PV 5</li>
		<ul>
	</div>
</div>
	<?php } ?>
</body>
</html>