<?php
//普通虚拟主机通过本文件转发二级域名，动态虚拟主机此文件不生效。
define('APP_DEBUG',TRUE);
switch($_SERVER['HTTP_HOST']){
	case 'admin.zzlkk.com':
		define('APP_NAME','admin');define('APP_PATH','./admin/');break;
	default://主站
		define('APP_NAME','main');define('APP_PATH','./www/');
}
require '/ThinkPHP/ThinkPHP.php';
?>