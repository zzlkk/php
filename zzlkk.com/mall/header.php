<style type="text/css">


#login-panel{
    position: absolute;
    top: 30px;
    right: 150px;
    width: 190px;
    padding: 10px 15px 15px 15px;
    background: #a3a0a0;
    font-size: 8pt;
    font-weight: bold;
    color: #FFF;
    display: none;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 10px;
}
#user-login-panel{
    position: absolute;
    top: 30px;
    right: 150px;
    width: 190px;
    padding: 10px 15px 15px 15px;
    background: #a3a0a0;
    font-size: 8pt;
    font-weight: bold;
    color: #FFF;
    display: none;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
    $("#login-link").click(function(){
        $("#login-panel").slideToggle(1000);
    });
	
})
$(document).keydown(function(e) {
    if (e.keyCode == 27) {
        $("#login-panel").hide(1000);
        $("#user-login-panel").hide(1000);
    }
});

</script>
<script type="text/javascript">
	function changeCity(city){
		$("#id_a_city").text(city);
		$('.othercity').toggle("slow");
		$("#id_hidden_city").val(city);
		$("#cityForm").submit();
	}
	$(document).ready(function(){	
		$('#frmpss').hide();
		$('#loginSubmit').click(function(){
			var querystr='actioncode=2&emailid='+$('#emailid').val()+'&passid='+$('#passid').val();
			$.post("ajax-processor.php", querystr, function(data){						 
				if(data.errorcode == 0){
					$('#login-panel').html('<p> 登陆成功，正在跳转...</p>');
					$(location).attr('href', 'my-account.php?submenuheader=0');
				}else{
					alert('EMAIL ID或密码不匹配.');	
				}
			}, "json");
		});
		$('#user-loginSubmit1').click(function(){
			$.post("/shop/login.html?action=process&f=wowo",
			{
				email_address:$("#user-emailid").val(),
				password:$('#user-passid').val()
			},
			function(data){	
				if(data.errorcode == 0){
					$('#user-login-panel').html('<p> 登陆成功，正在跳转...</p>');
					$(location).attr('href', 'user-account.php?submenuheader=0');
				}else{
					alert('EMAIL ID或密码不匹配.');	
				}
			},"json");
		});
		$("#user-icon-div").load("http://mall.zzlkk.com/shop/test.php #welcome",function(){
			$("#user-login").click(function(){
				$("#user-login-panel").slideToggle(1000);
			});
		});
		$("#id_a_city").click(function(){
			$('.othercity').toggle(300);;
		});
		$('#forgotpss').click(function(){
			$('#frmlog').hide();
			$('#frmpss').show();
		});
		
		$('#frgpssSubmit').click(function(){
			if($('#emailidfrgt').val() != ""){				
				var querystr='actioncode=8&emailid='+$('#emailidfrgt').val();
				$('#login-panel').html('<p> 请稍等...</p>');
				$.post("ajax-processor.php", querystr, function(data){						 
					if(data.errorcode == 0){
						$('#login-panel').html('<p> 密码已成功重置. 请检查你的Email...</p>');
					}else{
						$('#login-panel').html('<p> 电子邮件ID不存在。</p>');
					}
				}, "json");
			}else{
				alert('Please enter your Email id.');	
			}
		});
	});
</script>
<?php 
	if(isset($_POST['city'])){
		$_SESSION['now_city'] = $_POST['city'];
	}
?>
<div id="login-panel">
<p id="frmlog">
<label style="font-family: 'MavenProRegular';">&nbsp;Email:
<input name="username" id="emailid" type="text" class="home-select"/>
</label> <br />
<label style="font-family: 'MavenProRegular';">&nbsp;密码:
<input name="password" id="passid" type="password" value="" class="home-select" />
</label><br /><br />
<input type="submit" id="loginSubmit" name="submit" value="登录" class="btn1" />
&nbsp;&nbsp;<small style="font-family: 'MavenProRegular';">按ESC退出关闭</small><br /><br />&nbsp;&nbsp;<small style="font-family: 'MavenProRegular'; font-size:10px"><a id="forgotpss" style="color:#FFF; cursor:pointer;">忘记密码?</a></small>
</p>
<p id="frmpss">
<label style="font-family: 'MavenProRegular';">&nbsp;Email:
<input name="emailidfrgt" id="emailidfrgt" type="text" class="home-select"/>
</label> <br />
<br />
<input type="submit" id="frgpssSubmit" value="Reset" class="btn1" />
</p>
</div>

<div id="user-login-panel" style="display:none;">
<p id="user-frmlog">
<label style="font-family: 'MavenProRegular';">&nbsp;帐号:
<input name="email_address" id="user-emailid" type="text" class="home-select"/>
</label> <br />
<label style="font-family: 'MavenProRegular';">&nbsp;密码:
<input name="password" id="user-passid" type="password" value="" class="home-select" />
</label><br /><br />
<input type="button" id="user-loginSubmit1" name="submit" value="登录" class="btn1" />
&nbsp;&nbsp;<small style="font-family: 'MavenProRegular';">按ESC退出关闭</small>
<br /><br />&nbsp;&nbsp;
</p>
</div>

<form action="/" method="post" id="cityForm">
	<input name="city" id="id_hidden_city" type="hidden" />
</form>
<div id="header">
 <div id="header-inside">
  <div id="header-top">
   <div id="h-l">
    <div class="header_firmLogin"> 
		<div class="firmLogin">
	<?php if($bsiCore->config['conf_property_submission']){ if(!isset($_SESSION['apmt_password'])){ ?><a href="property_submit.php">发布房间</a><span>|</span> <a href="javascript:;" id="login-link" >商家登录</a> <?php }else{ ?><a href="property-submit.php">发布房间</a><span>|</span><a href="my-account.php?submenuheader=0">我的账户</a><span>|</span><a href="logout.php">退出</a> <?php } }else{ echo "&nbsp;"; } ?></div>
		</div>
	<div id="user-icon-div"></div>
    <div id="call-now">电话 - <?php echo $bsiCore->config['conf_apartment_phone'];?></div>
   </div>
   <div id="header-logo">
		<img src="images/vovor.png" title="<?php echo $bsiCore->config['conf_apartment_name'];?>" height="88"/>
   </div>
   <div id="id_div_city">
	   <div id="header-city-location">
			<a href="javascript:;" id="id_a_city"><?php echo isset($_SESSION['now_city'])?$_SESSION['now_city']:"重庆";?></a>
	   </div>
	   <div class="othercity" style="display: none;">
			<?php echo $bsiCore->getAllCityList();?>
	   </div>
   </div>
  </div>
  <div class="menu-sociable">
   <div class="menu" id="dropdown">
    <ul class="sf-menu">
     <?php
$menu1_sql=mysql_query("select * from bsi_site_contents where parent_id=0 order by ord");
while($menu1_row=mysql_fetch_assoc($menu1_sql)){
	$menu2_sql=mysql_query("select * from bsi_site_contents where parent_id=".$menu1_row['id']." order by ord");	 
	 
	 if($menu1_row['content_type']==1){
		 $bsiurl=$menu1_row['url'];
	 }elseif($menu1_row['content_type']==2){
		 $bsiurl="index1.php?cid=".$menu1_row['id'];
	 }elseif($menu1_row['content_type']==3){
		 $bsiurl=$menu1_row['url'];
		 $urlcn=pathinfo($_SERVER['PHP_SELF']);
		 $fixedurlcn=mysql_fetch_assoc(mysql_query("select * from bsi_site_contents where url='".$urlcn['basename']."'"));
		 $fixedurl_content=$fixedurlcn['contents'];
	 }
	 
	 if(mysql_num_rows($menu2_sql)){
		 echo '<li> <a href="'.$bsiurl.'" >'.$menu1_row['cont_title'].'</a><ul>';
	
		  while($menu2_row=mysql_fetch_assoc($menu2_sql)){
				if($menu2_row['content_type']==1){
					$bsiur2=$menu2_row['url'];
				}elseif($menu2_row['content_type']==2){
					$bsiur2="index1.php?cid=".$menu2_row['id'];
				}elseif($menu2_row['content_type']==3){
					$bsiur2=$menu2_row['url'];
					$fixedur_content=$menu2_row['contents'];
				}
				
				echo '<li><a href="'.$bsiur2.'">'.$menu2_row['cont_title'].'</a></li>';
		  }
	  	  echo '</ul></li>';	
	 }else{ 
	    echo '<li> <a href="'.$bsiurl.'" >'.$menu1_row['cont_title'].'</a></li>'; 
	 } 
} 
?>
      
  
    </ul>
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
	<div id="weibo">
		<wb:follow-button uid="2343383191" type="red_2" width="110" height="24" ></wb:follow-button>
	</div>
   </div>
  </div>
 </div>
</div>
