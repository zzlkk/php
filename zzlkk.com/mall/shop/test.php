<?php
require('includes/application_top.php');

?>
<div id="booking">
  <h2 class="col6">订单确认</h2>
  <dl class="list-dl" id="id_dl_userInfo">
	<dt>
	  <label for="ln">姓名:</label>
	</dt>
	<dd>
	  <input type="text" value="<?php echo $_SESSION['customer_last_name'];?>" id="surname" name="surname" class="list-input required">
	</dd>
	<dt>
	  <label for="ph">手机:</label>
	</dt>
	<dd>
	  <input type="text" value="<?php echo $_SESSION['customer_telephone'];?>" id="phone" name="phone" class="list-input required phone">
	</dd>
	<dt>
	  <label for="em">电子邮箱:</label>
	</dt>
	<dd>
	  <input type="text" value="<?php echo $_SESSION['customer_email'];?>" id="email" name="email" class="list-input required email">
	</dd>
  </dl>
</div>
<span id="welcome">
	<?php if(isset($_SESSION['customer_last_name'])){?>
	<span>
	您好 <a href="user-account.php?email=<?php echo $_SESSION['customer_email'];?>"><?php echo $_SESSION['customer_last_name'];?></a>
	&nbsp;<a href="/shop/index.php?main_page=logoff&f=wowo">退出</a>
	<input  type="hidden" id="customer_email" value="<?php echo $_SESSION['customer_email'];?>">
	</span>
	<?php }else{ ///shop/create_account.html?f=wowo?>
		  <a href="/register.php">注册</a>&nbsp;&nbsp;&nbsp;<a href="javascript:;" id="user-login" >登录</a> 
	<?php }?>
</span>
<input type="hidden" id="id_hidden_email" value="<?php echo $_SESSION['customer_email'];?>">

<div id="mngProfile" style="margin-left:50px;">
	<h1>修改资料</h1><br><br>
	<form name="account_edit" action="http://mall.zzlkk.com/shop/index.php?main_page=account_edit&f=wowo" method="post">
		<input type="hidden" name="action" value="process">
		<span id="msg_country"></span><table cellpadding="5" cellspacing="0" border="0" style="font-family: 'MavenProRegular';">
		<tbody><tr>
			<td align="left"><strong>电子邮箱:</strong></td>
			<td><input type="text" class="home-input required email" name="email_address" id="email_address" value="<?php echo $_SESSION['customer_email'];?>" readonly="readonly" style="width:250px;">
			<span id="msg_email"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>First Name:</strong></td>
			<td><input type="text" class="home-input required" style="width:250px;" name="first_name" value=" " id="username">
			<span id="msg_username"></span></td>
		  </tr>
		<tr>
			<td align="left"><strong>姓名:</strong></td>
			<td><input type="text" class="home-input required" style="width:250px;" name="lastname" value="<?php echo $_SESSION['customer_last_name'];?>" id="lastname">
			<span id="msg_sname"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>Street Address:</strong></td>
			<td><input type="text" class="home-input required" style="width:250px;" name="street_addr" value=" " id="sadd">
			<span id="msg_sadd"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>Street Address:</strong></td>
			<td><input type="text" class="home-input" style="width:250px;" name="street_addr2" value=" " id="sadd2">
			<span id="msg_sadd2"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>City:</strong></td>
			<td><input type="text" class="home-input required" style="width:250px;" name="city" value=" " id="city">
			<span id="msg_city"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>Province:</strong></td>
			<td><input type="text" class="home-input required" style="width:250px;" name="province" value=" " id="province">
			<span id="msg_province"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>Zip / Post code:</strong></td>
			<td><input type="text" class="home-input" style="width:250px;" name="zip" value=" " id="zip">
			<span id="msg_zip"></span></td>
		  </tr>
		<tr style="display:none">
			<td align="left"><strong>Country:</strong></td>
			<td><input type="text" class="home-input" style="width:250px;" value=" " name="country" id="country"></td>
			
		  </tr>
		<tr>
			<td align="left"><strong>手机:</strong></td>
			<td><input type="text" class="home-input" style="width:250px;" value="<?php echo $_SESSION['customer_telephone'];?>" name="telephone" id="telephone">
			<span id="msg_phone"></span></td>
		</tr>
		<tr>
			<td align="left"></td>
			<td><input type="submit" class="btn1" value="修改" name="buttonprofile" id="buttonprofile"></td>
		</tr>
	</tbody></table>
	</form>
</div>