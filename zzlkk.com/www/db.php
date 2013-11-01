<?php
$conn = mysql_connect('127.0.0.1','root','PD06root');
if(!$conn)die('暂时无法连接服务器');
mysql_query("set names utf8");
mysql_select_db('zzlkk',$conn);
?>