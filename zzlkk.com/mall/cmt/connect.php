<?php
header('Content-Type: text/html; charset=utf-8');
/* Database config */

$db_host		= '127.0.0.1';
$db_user		= 'root';
$db_pass		= 'PD06root';
$db_database	= 'vovor'; 

/* End config */


$link = @mysql_connect($db_host,$db_user,$db_pass) or die('Unable to establish a DB connection');

mysql_query("SET NAMES 'utf8'");
mysql_select_db($db_database,$link);

?>