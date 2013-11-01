<?php
	require_once('mail/class.phpmailer.php');
	function smtp_mail( $sendto_email, $subject, $body){
		$mail = new PHPMailer();    
		$mail->IsSMTP();                  // send via SMTP    
		$mail->Host = "smtp.qq.com";   // SMTP servers    
		$mail->SMTPAuth = true;           // turn on SMTP authentication    
		$mail->Username = "2196848320";     // SMTP username  注意：普通邮件认证不需要加 @域名    
		$mail->Password = "peidi666"; // SMTP password    
		$mail->From = "2196848320@qq.com";      // 发件人邮箱    
		$mail->FromName =  "卧卧";  // 发件人    
	  
		$mail->CharSet = "UTF-8";   // 这里指定字符集！    
		$mail->Encoding = "base64";    
		$mail->AddAddress($sendto_email,"username");  // 收件人邮箱和姓名    
		// $mail->AddReplyTo("yourmail@yourdomain.com","yourdomain.com");    
		//$mail->WordWrap = 50; // set word wrap 换行字数    
		//$mail->AddAttachment("/var/tmp/file.tar.gz"); // attachment 附件    
		//$mail->AddAttachment("/tmp/image.jpg", "new.jpg");    
		$mail->IsHTML(true);  // send as HTML    
		// 邮件主题    
		$mail->Subject = $subject;    
		// 邮件内容    
		$mail->Body = $body;                                                                         
		$mail->AltBody ="text/html";    
		if(!$mail->Send())    
		{    
			echo "邮件发送有误 <p>";    
			echo "邮件错误信息: " . $mail->ErrorInfo;    
			exit;    
		}    
		else {    
			echo "$user_name 邮件发送成功!<br />";    
		}
	}
	// 参数说明(发送到, 邮件主题, 邮件内容, 附加信息, 用户名)    
	// smtp_mail("523375882@qq.com", "欢迎使用phpmailer！", "恭喜你");    
?>