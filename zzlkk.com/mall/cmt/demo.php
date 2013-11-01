<?php
error_reporting(E_ALL^E_NOTICE);
include "connect.php";
include "comment.class.php";

$comments = array();
$result = mysql_query("SELECT * FROM comments ORDER BY id ASC");

while($row = mysql_fetch_assoc($result))
{
	$comments[] = new Comment($row);
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AJAX评论系统-Simple AJAX Commenting System</title>
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body>
<h1>AJAX评论系统</h1>
<div id="main">

<?php
foreach($comments as $c){
	echo $c->markup();
}

?>

<div id="addCommentContainer">
	<form id="addCommentForm" method="post" action="">
    	<div>
        	<label for="name">昵称</label>
        	<input type="text" name="name" id="name" />
            
            <label for="email">Email</label>
            <input type="text" name="email" id="email" />
            
            <label for="url">网站</label>
            <input type="text" name="url" id="url" />
            
            <label for="body">评论内容</label>
            <textarea name="body" id="body" cols="20" rows="5"></textarea>
            
            <input type="submit" id="submit" value="Submit" />
        </div>
    </form>
</div>

</div>

<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="script.js"></script>

</body>
</html>
