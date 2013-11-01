<?php
 require('includes/application_top.php');
 
 zen_mail("徐鹏",
 "523375882@qq.com", "这是主题哦", "这是内容哦", "卧卧",
 "2196848320@qq.com", "", 'direct_email', 
 array('file' => "", 'name' => basename(""),
 'mime_type'=>"") );
 
 // $to = "523375882@qq.com";
// $subject = "Test mail";
// $message = "Hello! This is a simple email message.";
// $from = "2196848320@qq.com";
// $headers = "From: $from";
// mail($to,$subject,$message,$headers);
// echo "Mail Sent.";
      
?>