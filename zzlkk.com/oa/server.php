<?php
$conn = mysql_connect('127.0.0.1','root','PD06root');
if(!$conn)die('暂时无法连接服务器');
mysql_query("set names utf8");
mysql_select_db('oa',$conn);
if(isset($_POST["op"])&&isset($_POST["id"])&&strlen($_POST["op"])>0&&is_numeric($_POST["id"])){
	if('info'==$_POST["op"]&&isset($_POST["info"])){
		mysql_query('update ebayinfo set ebay_info=\''.addslashes($_POST["info"]).'\' where ebay_id='.$_POST["id"]);
	}else if('note'==$_POST["op"]&&isset($_POST["note"])){
		mysql_query('update ebayinfo set ebay_note=\''.addslashes($_POST["note"]).'\' where ebay_id='.$_POST["id"]);
	}else if('status'==$_POST["op"]&&isset($_POST["status"])){
		mysql_query('update ebayinfo set ebay_status=\''.((int)$_POST["status"]).'\' where ebay_id='.$_POST["id"]);
	}else if('ebaysave'==$_POST["op"]){
		if($_POST["id"]>0){
			mysql_query('update ebayinfo set ebay_country=\''.addslashes($_POST["country"]).'\',ebay_ip=\''.addslashes($_POST["ip"]).'\',ebay_vpwd=\''.addslashes($_POST["vpwd"]).'\',ebay_name=\''.addslashes($_POST["ename"]).'\',ebay_epwd=\''.addslashes($_POST["epwd"]).'\',ebay_mail=\''.addslashes($_POST["mail"]).'\',ebay_mpwd=\''.addslashes($_POST["mpwd"]).'\',ebay_info=\''.addslashes($_POST["info"]).'\',ebay_note=\''.addslashes($_POST["note"]).'\',ebay_time=\''.addslashes($_POST["time"]).'\',ebay_status=\''.((int)$_POST["status"]).'\' where ebay_id='.$_POST["id"]);
		}else{
			mysql_query('insert into ebayinfo(ebay_country,ebay_ip,ebay_vpwd,ebay_name,ebay_epwd,ebay_mail,ebay_mpwd,ebay_info,ebay_note,ebay_time,ebay_status) values(\''.addslashes($_POST["country"]).'\',\''.addslashes($_POST["ip"]).'\',\''.addslashes($_POST["vpwd"]).'\',\''.addslashes($_POST["ename"]).'\',\''.addslashes($_POST["epwd"]).'\',\''.addslashes($_POST["mail"]).'\',\''.addslashes($_POST["mpwd"]).'\',\''.addslashes($_POST["info"]).'\',\''.addslashes($_POST["note"]).'\',\''.addslashes($_POST["time"]).'\','.((int)$_POST["status"]).')');
		}
	}else if('tasksave'==$_POST["op"]){
		if($_POST["id"]>0){
			mysql_query('update taskinfo set task_time=\''.addslashes($_POST["time"]).'\',task_order=\''.addslashes($_POST["order"]).'\',task_content=\''.addslashes($_POST["content"]).'\',task_price=\''.addslashes($_POST["price"]).'\',task_type=\''.addslashes($_POST["type"]).'\',task_res=\''.addslashes($_POST["res"]).'\',task_status=\''.addslashes($_POST["status"]).'\',task_remark=\''.addslashes($_POST["remark"]).'\' where task_id='.$_POST["id"]);
		}else{
			mysql_query('insert into taskinfo(task_time,task_order,task_content,task_price,task_type,task_res,task_status,task_remark) values(\''.addslashes($_POST["time"]).'\',\''.addslashes($_POST["order"]).'\',\''.addslashes($_POST["content"]).'\',\''.addslashes($_POST["price"]).'\',\''.addslashes($_POST["type"]).'\',\''.addslashes($_POST["res"]).'\',\''.addslashes($_POST["status"]).'\',\''.addslashes($_POST["remark"]).'\')');
		}
	}else if('tstatus'==$_POST["op"]&&isset($_POST["status"])){
		mysql_query('update taskinfo set task_status=\''.addslashes($_POST["status"]).'\' where task_id='.$_POST["id"]);
	}else if('tres'==$_POST["op"]&&isset($_POST["res"])){
		mysql_query('update taskinfo set task_res=\''.addslashes($_POST["res"]).'\' where task_id='.$_POST["id"]);
	}else if('tcontent'==$_POST["op"]&&isset($_POST["content"])){
		mysql_query('update taskinfo set task_content=\''.addslashes($_POST["content"]).'\' where task_id='.$_POST["id"]);
	}else if('tprice'==$_POST["op"]&&isset($_POST["price"])){
		mysql_query('update taskinfo set task_price=\''.addslashes($_POST["price"]).'\' where task_id='.$_POST["id"]);
	}else if('tremark'==$_POST["op"]&&isset($_POST["remark"])){
		mysql_query('update taskinfo set task_remark=\''.addslashes($_POST["remark"]).'\' where task_id='.$_POST["id"]);
	}else if('taskexists'==$_POST["op"]){
		$task=mysql_fetch_array(mysql_query('select count(1) from taskinfo where task_order='.$_POST["id"]));
		echo $task[0];
	}
}
?>