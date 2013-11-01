<?php
session_start();
if(isset($_POST['issubmit'])){
	include("includes/db.conn.php");
	include("includes/conf.class.php");
	include("includes/mail.class.php");
	$bsiCore->insertpropertyDetails();
	if(isset($_POST['payment_gateway']) && $_POST['payment_gateway'] == "pp"){
		echo "<script language=\"JavaScript\">";
		echo "document.write('<form action=\"paypal-submission.php\" method=\"post\" name=\"formpaypal\">');";
		echo "document.write('<input type=\"hidden\" name=\"amount\"  value=\"".number_format($bsicore->config['conf_appmt_listing_price'], 2, '.', '')."\">');";
		echo "document.write('<input type=\"hidden\" name=\"invoice\"  value=\"".$_SESSION['apmt_appmtid']."\">');";
		echo "document.write('<input type=\"hidden\" name=\"appmtName\"  value=\"".$_SESSION['apmt_appmtname']."\">');";
		echo "document.write('</form>');";
		echo "setTimeout(\"document.formpaypal.submit()\",500);";
		echo "</script>";	
	}else{
		header("location:property_submit_complete.php"); 
		exit;
	}
}else{
include("includes/db.conn.php");
include("includes/conf.class.php");
include("includes/admin.class.php");
$apmtType = $bsiCore->getApmtTypeCombobox();
$locationType = $bsiCore->getApmtLocationTypeList();
$featureKeysHtml = $bsiCore->getApmtFeatureKeyList();
$getfacilityhtml = $bsiAdminMain->showAllFacility(); 
$rentType = array(1=>"Night", 2=>"Week", 3=>"Month");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
<title>
<?php echo $bsiCore->config['conf_apartment_name'];?>
</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/menu/superfish.js"></script>
<script type="text/javascript">
	jQuery(function(){
		jQuery('ul.sf-menu').superfish();
	}); 
</script>
<link href="css/smart_wizard.css" rel="stylesheet" type="text/css">
<script src="cp/ckeditor/ckeditor_basic.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.smartWizard-2.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	// Smart Wizard     	
  		$('#wizard').smartWizard({transitionEffect:'slideleft',onLeaveStep:leaveAStepCallback,onFinish:onFinishCallback,enableFinishButton:true});
		  function leaveAStepCallback(obj){
			 var step_num= obj.attr('rel');
			 return validateSteps(step_num);
		  }
      
		  function onFinishCallback(){
			 if(validateAllSteps()){
				$('form').submit();
			 }
		  }
	});
	   
	function validateAllSteps(){
	   var isStepValid = true;
	   if(validateStep1() == false){
		 isStepValid = false;
		 $('#wizard').smartWizard('setError',{stepnum:1,iserror:true});         
	   }else{
		 isStepValid = true;
		 $('#wizard').smartWizard('setError',{stepnum:1,iserror:false});
	   }
	   
	   if(validateStep2() == false){
		 isStepValid = false;
		 $('#wizard').smartWizard('setError',{stepnum:2,iserror:true}); 
	   }else{
		 isStepValid = true;
		 $('#wizard').smartWizard('setError',{stepnum:2,iserror:false});
	   }
	   
	   if(validateStep3() == false){
		 isStepValid = false;
		 $('#wizard').smartWizard('setError',{stepnum:3,iserror:true}); 
	   }else{
		 isStepValid = true;
		 $('#wizard').smartWizard('setError',{stepnum:3,iserror:false});
	   }
	   
	   if(!isStepValid){
		  $('#wizard').smartWizard('showMessage','请纠正错误的步骤，并继续');
	   } else{
		  $('#wizard').smartWizard('showMessage','');
	   }
	   return isStepValid;
	} 	
		
		
	function validateSteps(step){
	  var isStepValid = true;
	  // validate step 1
	  if(step == 1){
		 if(validateStep1() == false ){
			isStepValid = false; 
			$('#wizard').smartWizard('showMessage','<font style="color:#F00;">请纠正错误步骤'+step+ ' 在进行下一步.</font>');
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:true});         
		 }else{
			isStepValid = true;
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
		 }
	  } 
	  
	  if(step == 2){
		 if (validateStep2() == false){
			isStepValid = false; 
			$('#wizard').smartWizard('showMessage','<font style="color:#F00;">请纠正错误步骤'+step+ ' 在进行下一步.</font>');
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:true});  
		 } else{
			isStepValid = true; 
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
		 } 
	  }
	  
	  if(step == 3){
		 if (validateStep3() == false){
			isStepValid = false; 
			$('#wizard').smartWizard('showMessage','<font style="color:#F00;">请纠正错误步骤'+step+ ' 在进行下一步.</font>');
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:true});  
		 } else{
			isStepValid = true; 
			$('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
		 } 
	  }
	  return isStepValid;
   }
      function validateStep2(){
		  var isValid = true; 
		  
		  // Validate Apartment Type
	      var appmt_type_id = $('#appmt_type_id').val();
		  if(!appmt_type_id && appmt_type_id == ""){
			 isValid = false;
			 $('#msg_appmt_type_id').html('<font style="color:#F00;">&nbsp;&nbsp;请选择公寓类型.</font>').show();
		  }else{
			 $('#msg_appmt_type_id').html('').show();
			 isValid = true;
		  } 
		  
		  // Validate Apartment Name
	      var appmt_name = $('#appmt_name').val();
		  if(!appmt_name && appmt_name.length <= 0){
			 isValid = false;
			 $('#msg_appmt_name').html('<font style="color:#F00;">&nbsp;&nbsp;请输入公寓名称.</font>').show();
		  }else{
			 $('#msg_appmt_name').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment Address
	      var addr1 = $('#addr1').val();
		  if(!appmt_type_id && appmt_type_id <= 0){
			 isValid = false;
			 $('#msg_addr1').html('<font style="color:#F00;">&nbsp;&nbsp;请输入公寓地址.</font>').show();
		  }else{
			 $('#msg_addr1').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment City
	      var acity = $('#acity').val();
		  if(!acity && acity.length <= 0){
			 isValid = false;
			 $('#msg_acity').html('<font style="color:#F00;">&nbsp;&nbsp;请输入城市.</font>').show();
		  }else{
			 $('#msg_acity').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment State
	      var astate = $('#astate').val();
		  if(!astate && astate.length <= 0){
			 isValid = false;
			 $('#msg_astate').html('<font style="color:#F00;">&nbsp;&nbsp;请输入省.</font>').show();
		  }else{
			 $('#msg_astate').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment Country
	      var acountry = $('#acountry').val();
		  if(!acountry && acountry.length <= 0){
			 isValid = false;
			 $('#msg_acountry').html('<font style="color:#F00;">&nbsp;&nbsp;请输入国家名称.</font>').show();
		  }else{
			 $('#msg_acountry').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment Zip/Postal Code
	      var azipcode = $('#azipcode').val();
		  if(!azipcode && azipcode.length <= 0){
			 isValid = false;
			 $('#msg_azipcode').html('<font style="color:#F00;">&nbsp;&nbsp;请输入邮政编码.</font>').show();
		  }else{
			 $('#msg_azipcode').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment Phone
	      var aphone = $('#aphone').val();
		  if(!aphone && aphone.length <= 0){
			 isValid = false;
			 $('#msg_aphone').html('<font style="color:#F00;">&nbsp;&nbsp;请输入电话号码.</font>').show();
		  }else{
			 $('#msg_aphone').html('').show();
			 isValid = true;
		  }
		  
		  // Validate Apartment Rent Amount
	      var arent = $('#arent').val();
		  if(!arent && arent <= 0){
			 isValid = false;
			 $('#msg_arent').html('<font style="color:#F00;">&nbsp;&nbsp;请输入租金金额。</font>').show();
		  }else{
			 $('#msg_arent').html('').show();
			 isValid = true;
		  }
		  
		  return isValid;
	  }
		
	  function validateStep1(){
       	  var isValid = true; 
	   // Validate Email
	      var emai = $('#email').val();
		  if(!emai && emai.length <= 0){
			 isValid = false;
			 $('#msg_email').html('<font style="color:#F00;">请填写 Email Id</font>').show();
		  }else{
			 if( !isValidEmailAddress(emai) ){
				 isValid = false; 
				 $('#msg_email').html('<font style="color:#F00;">请填写有效 Email Id</font>').show();
			 } else{
				 isValid = true;
			 }
		  }        
       // validate password
       	   var pw = $('#password').val();
		   if(!pw && pw.length <= 0){
			 isValid = false;
			 $('#msg_password').html('<font style="color:#F00;">请填写密码</font>').show();         
		   }else{
			 $('#msg_password').html('').hide();
			 isValid = true;
		   }
       
       // validate confirm password
       		var cpw = $('#cpassword').val();
       		if(!cpw && cpw.length <= 0){
         		isValid = false;
         		$('#msg_cpassword').html('<font style="color:#F00;">请填写确认密码</font>').show();         
		   }else{
			 $('#msg_cpassword').html('').hide();
		   }  
       
       // validate password match
       		if(pw && pw.length > 0 && cpw && cpw.length > 0){
				if(pw != cpw){
					isValid = false;
					$('#msg_cpassword').html('<font style="color:#F00;">密码不匹配</font>').show();            
				}else{
					$('#msg_cpassword').html('').hide();
				}
       		}
		// Validate Username
		   var un = $('#username').val();
		   if(!un && un.length <= 0){
			 isValid = false;
			 $('#msg_username').html('<font style="color:#F00;">请填名字</font>').show();
		   }else{
			 $('#msg_username').html('').hide();
		   }
			
		// validate Last Name
       	   var sname = $('#sname').val();
		   if(!sname && sname.length <= 0){
			 isValid = false;
			 $('#msg_lastname').html('<font style="color:#F00;">请填写姓名</font>').show();
		   }else{
			 $('#msg_lastname').html('').hide();
		   }
		// validate Street Address
       	   var sadd = $('#sadd').val();
		   if(!sadd && sadd.length <= 0){
			 isValid = false;
			 $('#msg_sadd').html('<font style="color:#F00;">请填写街道地址</font>').show();
		   }else{
			 $('#msg_sadd').html('').hide();
		   }
		
		// validate City
       	   var city = $('#city').val();
		   if(!city && city.length <= 0){
			 isValid = false;
			 $('#msg_city').html('<font style="color:#F00;">请填写市</font>').show();
		   }else{
			 $('#msg_city').html('').hide();
		   }
		
		// validate State
       	   var province = $('#province').val();
		   if(!province && province.length <= 0){
			 isValid = false;
			 $('#msg_province').html('<font style="color:#F00;">请填写州/省</font>').show();
		   }else{
			 $('#msg_province').html('').hide();
		   }
		   
		// validate Postal
       	   var zip = $('#zip').val();
		   if(!zip && zip.length <= 0){
			 isValid = false;
			 $('#msg_zip').html('<font style="color:#F00;">请填写邮政编码</font>').show();
		   }else{
			 $('#msg_zip').html('').hide();
		   }
		   
		// validate Country
       	   var country = $('#country').val();
		   if(!country && country.length <= 0){
			 isValid = false;
			 $('#msg_country').html('<font style="color:#F00;">请填写国家</font>').show();
		   }else{
			 $('#msg_country').html('').hide();
		   }
		   
		// validate Country
       	   var phone = $('#phone').val();
		   if(!phone && phone.length <= 0){
			 isValid = false;
			 $('#msg_phone').html('<font style="color:#F00;">请填写电话号码</font>').show();
		   }else{
			 $('#msg_phone').html('').hide();
		   }   
       	  return isValid;
    	}
		
		// Email Validation
		function isValidEmailAddress(emailAddress) {
		   var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
		  return pattern.test(emailAddress);
		} 
		function validateStep3(){
		  var isValid = true; 
		  
		  if($("#tos1").attr("checked")==true){
    		  isValid = true;
		  }else{
			  isValid = false;
			  $('#msg_tos1').html('<font style="color:#F00;">请接受条款及条件</font>').show();
		  }
		  
		  return isValid;
		}
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#email').blur(function(){
			var querystr='actioncode=1&email='+$('#email').val();
			$.post("ajax-processor.php", querystr, function(data){						 
				if(data.errorcode == 1){
					$('#msg_email').html('<font style="color:#F00;">&nbsp;已经存在请登录</font>');
					$('#email').focus();
				}else{
					$('#msg_email').html('');
				}
			}, "json");	
		});
	});
</script>
<script type='text/javascript'>
	CharacterCount = function(TextArea,FieldToCount){
	var desc_short = document.getElementById(TextArea);
	var myLabel    = document.getElementById(FieldToCount); 
	if(!desc_short || !myLabel){return false}; // catches errors
	var MaxChars   =  desc_short.maxLengh;
	if(!MaxChars){MaxChars =  desc_short.getAttribute('maxlength') ; }; 	if(!MaxChars){return false};
	var remainingChars = MaxChars - desc_short.value.length
	myLabel.innerHTML  = remainingChars+" 剩余字符数为"+MaxChars
}
//SETUP!!
setInterval(function(){CharacterCount('desc_short','CharCountLabel1')},55);
</script>
</head>

<body style="font-family: 'MavenProRegular';">
<?php include("header.php"); ?>
<div id="shadow">
  <div id="shadow-inside">
    <div id="shadow-left"></div>
    <div id="shadow-right"></div>
  </div>
</div>
<div id="container-div">
  <div id="container-inside">
    <h1 class="col2">房间发布</h1>
    <table align="left" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><form id="formSubmit" action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
            <input type='hidden' name="issubmit" value="1">
            <!-- Tabs -->
            <div id="wizard" class="swMain">
              <ul>
                <li><a href="#step-1">
                  <label class="stepNumber">1</label>
                  <span class="stepDesc"> 帐户明细<br />
                  <small>填写您的帐户信息</small> </span> </a></li>
                <li><a href="#step-2">
                  <label class="stepNumber">2</label>
                  <span class="stepDesc"> 房源信息<br />
                  <small>填写你的房间详情</small> </span> </a></li>
                <?php if($bsiCore->config['conf_apppmt_listing_type']==0){	 ?>
                <li><a href="#step-3">
                  <label class="stepNumber">3</label>
                  <span class="stepDesc"> 确认<br />
                  <small>填写完成</small> </span> </a></li>
                <?php }else{ ?>
                <li><a href="#step-3">
                  <label class="stepNumber">3</label>
                  <span class="stepDesc"> Payment<br />
                  <small>填写完成</small> </span> </a></li>
                <?php } ?>
              </ul>
              <div id="step-1">
                <h2 class="StepTitle">步骤 1: 帐户明细</h2>
                <table cellpadding="5" cellspacing="2" border="0">
                  <tr>
                    <td align="left"><strong>电子邮箱:</strong></td>
                    <td><input type="text" class="txtBox" name="email" id="email" style="width:250px;" />
                      <span id="msg_email"></span></td>
                  </tr>
                  <tr>
                    <td align="left"><strong>密码:</strong></td>
                    <td><input type="password"  class="txtBox" name="password" id="password" style="width:250px;" />
                      <span id="msg_password"></span></td>
                  </tr>
                  <tr>
                    <td align="left"><strong>确认密码:</strong></td>
                    <td><input type="password" class="txtBox" name="cpassword" id="cpassword" style="width:250px;" />
                      <span id="msg_cpassword"></span></td>
                  </tr>
                  <tr style="display:none">
                    <td align="left"><strong>名字:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" value=" " name="first_name" id="username"/>
                      <span id="msg_username"></span></td>
                  </tr>
                  <tr>
                    <td align="left"><strong>姓名:</strong></td>
                    <td><input type="text" class="txtBox" style="width:250px;"  name="surname" id="sname" />
                    	<span id="msg_lastname"></span></td>
                  </tr>
				  <tr style="display:none">
                    <td align="left"><strong>省:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" value=" "  name="province" id="province" />
                    	<span id="msg_province"></span></td>
                  </tr>
				  <tr style="display:none">
                    <td align="left"><strong>市:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" value=" "  name="city" id="city"  />
                    	<span id="msg_city"></span></td>
                  </tr>
                  <tr  style="display:none">
                    <td align="left"><strong>Country:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" value=" "  name="country" id="country" />
                    	<span id="msg_country"></span></td>
                  </tr>
                  <tr style="display:none">
                    <td align="left"><strong>详细地址:</strong></td>
                    <td><input type="text" class="txtBox" style="width:250px;" value=" "  name="street_addr" id="sadd"  />
                    	<span id="msg_sadd"></span></td>
                  </tr>
                  <tr  style="display:none">
                    <td align="left"><strong>Street Address2:</strong></td>
                    <td><input type="text" class="txtBox" style="width:250px;" value=" " name="street_addr2" id="sadd2" /></td>
                  </tr>
                  <tr   style="display:none">
                    <td align="left"><strong>邮编:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" value=" " name="zip" id="zip" />
                    	<span id="msg_zip"></span></td>
                  </tr>
                  <tr>
                    <td align="left"><strong>手机:</strong></td>
                    <td><input type="text" class="txtBox"  style="width:250px;" name="phone" id="phone" />
                    	<span id="msg_phone"></span>
                    </td>
                  </tr>
                </table>
              </div>
              <div id="step-2">
                <h2 class="StepTitle">第二步: 财产详情</h2>
                <!--*****************************************************************************************************************-->
                
                <table cellpadding="5" cellspacing="5" border="0" width="100%">
                  <tr>
                    <td width="150px"><strong>房间类型:</strong></td>
                    <td><select name="appmt_type_id" id="appmt_type_id">
                        <?php echo $apmtType;?>
                      </select>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="msg_appmt_type_id"></span></td>
                  </tr>
                  <tr>
                    <td><strong>房间名称:</strong></td>
                    <td><input type="text" class="txtBox"  name="appmt_name" id="appmt_name"  style="width:200px;"><span id="msg_appmt_name"></span></td>
                  </tr>
                  <tr>
                    <td><strong>地址:</strong></td>
                    <td><input type="text" class="txtBox"  name="addr1" id="addr1"  style="width:200px;"><span id="msg_addr1"></span></td>
                  </tr>
                  <tr style="display:none">
                    <td><strong>Address 2:</strong></td>
                    <td><input type="text" name="addr2" id="addr2" class="txtBox"   style="width:200px;"></td>
                  </tr>
                  <tr>
                    <td><strong>城市:</strong></td>
                    <td><input type="text" class="txtBox"  name="acity" id="acity" style="width:200px;"><span id="msg_acity"></span></td>
                  </tr>
                  <tr>
                    <td><strong>省:</strong></td>
                    <td><input type="text" class="txtBox"  name="astate" id="astate" style="width:200px;"><span id="msg_astate"></span></td>
                  </tr>
				  <tr>
					<td><strong>地段:</strong></td>
					<td><input type="text" class="required" name="street" id="street" style="width:200px;"></td>
				  </tr>
				  <tr>
					<td><strong>地理位置:</strong></td>
					<td>
					<div><?php echo $locationType;?></div>
					</td>
				  </tr>
                  <tr  style="display:none">
                    <td><strong>Country:</strong></td>
                    <td><input type="text" class="txtBox" name="acountry" id="acountry"  style="width:200px;"><span id="msg_acountry"></span></td>
                  </tr>
                  <tr   style="display:none">
                    <td><strong>Postal Code:</strong></td>
                    <td><input type="text" class="txtBox" name="azipcode" id="azipcode"  style="width:200px;"><span id="msg_azipcode"></span></td>
                  </tr>
                  <tr   style="display:none">
                    <td><strong>Apartment Phone:</strong></td>
                    <td><input type="text" class="txtBox" name="aphone" id="aphone"  style="width:200px;"><span id="msg_aphone"></span></td>
                  </tr>
                  <tr>
                    <td><strong>房间租金:</strong></td>
                    <td><input type="text" class="txtBox" name="arent" id="arent"  style="width:80px;">
                      &nbsp;/&nbsp;
                      <?php echo $rentType[$bsiCore->config['conf_rental_type']];?><span id="msg_arent"></span></td>
                  </tr>
                  <tr>
                    <td valign="top"><strong>短描述:</strong></td>
                    <td><textarea name="short_desc" id="desc_short"  style="width:600px; height:100px;" class="required" maxlength='300'>
</textarea>
                      <div id='CharCountLabel1'></div></td>
                  </tr>
                  <tr>
                    <td valign="top"><strong>长描述:</strong></td>
                    <td><textarea name="long_desc" id="editor1"></textarea></td>
                  </tr>
				  <tr>
					<td valign="top"><strong>地图经纬度:</strong></td>
					<td>
						<input type="text" class="required" name="latitude" id="latitude" value="<?php echo $row['lat'];?>" style="width:110px;" >
						<input type="text" class="required" name="longitude" id="longitude" value="<?php echo $row['longitude'];?>" style="width:110px;" >
						<div id="map-canvas" style="width:575px;height:400px;">
						<!--
						<script src="http://maps.google.com/maps/api/js?v=3.exp&sensor=false&hl=zh-CN"></script>
						<script>
						var map;
						function initialize() {
						  var mapOptions = {
							zoom: 12,
							center: new google.maps.LatLng(29.554364, 106.571998),
							mapTypeId: google.maps.MapTypeId.ROADMAP
						  };
						  map = new google.maps.Map(document.getElementById('map-canvas'),
							  mapOptions);
						  google.maps.event.addListener(map, 'click', function(e) {
								if (e != undefined) {
									// $("#latitude_id").html("<"+e.latLng+">");
									// $("#hdlatitude_id").val("@"+e.latLng);、
									var point=  e.latLng;
									// map.addOverlay(new google.maps.Marker({position:new google.maps.LatLng(29.554364, 106.571998),map:map,title:"title"}));
									map.panTo(point);
									var temp = map.getCenter();
									$("#latitude").val(temp.lat());
									$("#longitude").val(temp.lng());
									// var marker = new google.maps.Marker({
										// position: new google.maps.LatLng(temp.lat(),temp.lng()),
										// map: map
									// });
									 var myHtml = "GPoint 为： "+map.getCenter() ;
									 map.openInfoWindow(latlng, myHtml);
								}	
					
							});
						}
						google.maps.event.addDomListener(window, 'load', initialize);
						</script>
						-->
						<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1bd2776e1c14f18c281b31e3fa285f50"></script>
						<script type="text/javascript">

						// 百度地图API功能
						var map = new BMap.Map("map-canvas");            // 创建Map实例
						var point = new BMap.Point(116.404, 39.915);    // 创建点坐标
						map.centerAndZoom("重庆",14);                     // 初始化地图,设置中心点坐标和地图级别。
						map.enableScrollWheelZoom();                            //启用滚轮放大缩小
						map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
						map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件 
						map.addEventListener("click",function(e){
							$("#latitude").val(e.point.lat);
							$("#longitude").val(e.point.lng);
						});
						</script>
					</td>
				  </tr>
                </table>
                <br>
                <table cellpadding="5" cellspacing="5" border="0" width="100%">
                  <tr>
                    <td style="font-size:16px;"><strong>房间设施:</strong><br />
                      <hr style="color:#000;"/></td>
                  </tr>
                  <tr>
                    <td><?php echo $getfacilityhtml;?></td>
                  </tr>
                </table>
                <br>
                <table cellpadding="5" cellspacing="5" border="0" width="100%">
                  <tr>
                    <td colspan="4" style="font-size:16px;"><strong>房间特色</strong><br />
                      <hr style="color:#000;"/></td>
                  </tr>
				  <?php echo $featureKeysHtml;?>
				  <!--
                  <tr>
                    <td width="150px"><strong>Apartment Size:</strong></td>
                    <td width="230px"><input type="text" name="appmt_size" class="txtBox" id="appmt_size"  style="width:100px;" >
                      <?php echo $bsiCore->config['conf_mesurment_unit'];?></td>
                    <td width="150px"><strong>Apartment Lot Size:</strong></td>
                    <td><input type="text" name="apptmt_lot_size" id="apptmt_lot_size" class="txtBox"  style="width:100px;" >
                      <?php echo $bsiCore->config['conf_mesurment_unit'];?></td>
                  </tr>
                  <tr>
                    <td><strong>Apartment Bed Room:</strong></td>
                    <td><input type="text" name="bedroom" id="bedroom" class="txtBox"  style="width:100px;" ></td>
                    <td><strong>Apartment Bath Room:</strong></td>
                    <td><input type="text" name="bathroom" id="bathroom" class="txtBox"  style="width:100px;" ></td>
                  </tr>
                  <tr>
                    <td><strong>Garage:</strong></td>
                    <td><input type="text" name="car_garage" id="car_garage" class="txtBox"  style="width:100px;" ></td>
                    <td><strong>Garage Size:</strong></td>
                    <td><input type="text" name="garage_size" id="garage_size" class="txtBox"  style="width:100px;" >
                      <?php echo $bsiCore->config['conf_mesurment_unit'];?> </td>
                  </tr>
                  <tr>
                    <td><strong>Total Rooms:</strong></td>
                    <td><input type="text" name="total_rooms" id="total_rooms" class="txtBox"  style="width:100px;" ></td>
                    <td><strong>Basement:</strong></td>
                    <td><input type="text" name="basement" id="basement" class="txtBox"  style="width:100px;" ></td>
                  </tr>
                  <tr>
                    <td><strong>Floor:</strong></td>
                    <td><input type="text" name="floors" id="floors" class="txtBox" style="width:100px;" ></td>
                    <td><strong>Year of Build:</strong></td>
                    <td><input type="text" name="year_of_build" class="txtBox" id="year_of_build"  style="width:100px;" ></td>
                  </tr>
				  -->
                </table>
                
                <!--*****************************************************************************************************************--> 
                
              </div>
              <div id="step-3">
                <?php if($bsiCore->config['conf_apppmt_listing_type']==0){	 ?>
                <h2 class="StepTitle">Step 3: Confirmation</h2>
                <table cellspacing="3" cellpadding="3" align="left" width="100%">
                  <tr>
                    <td align="left"><textarea class="txtBox" rows="3" style="width:100%; height:300px;" readonly="readonly">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
          </textarea></td>
                  </tr>
                  <tr>
                    <td align="left"><input type="checkbox" name="tos" id="tos1" />
                      Please accept upper terms and conditions.&nbsp;&nbsp;<span id="msg_tos1"></span></td>
                  </tr>
                </table>
                <?php }else{ ?>
                <h2 class="StepTitle">Step 3: Payment &amp; Confirmation</h2>
                <table cellspacing="3" cellpadding="3" align="left" width="100%">
                  <tr>
                    <td width="15%"><strong>Payment methode:</strong></td>
                    <td width="85%" align="left">
                    	<select id="payment_gateway" name="payment_gateway" >
                        <?php 
						$result = mysql_query("select * from bsi_payment_gateway where gateway_code='pp' and enabled=true");
						while($row = mysql_fetch_assoc($result)){
							 echo '<option value="'.$row['gateway_code'].'">'.$row['gateway_name'].'</option>';
		    			}
		  				?>
                      </select></td>
                  </tr>
                  <tr>
                    <td ><strong>Listing Price:</strong></td>
                    <td ><?php echo $bsiCore->config['conf_currency_symbol'].$bsiCore->config['conf_appmt_listing_price'].' '.$bsiCore->config['conf_currency_code']; ?></td>
                  </tr>
                  <tr>
                    <td align="left" colspan="2"><textarea name="address" id="address" class="txtBox" rows="3" style="width:100%; height:300px;" readonly="readonly">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia Alok
          </textarea></td>
                  </tr>
                  <tr>
                    <td align="left" colspan="2"><input type="checkbox" name="tos" id="tos1"  />
                      Please accept upper terms and conditions.&nbsp;&nbsp;<span id="msg_tos1"></span></td>
                  </tr>
                </table>
                <?php } ?>
              </div>
            </div>
            <!-- End SmartWizard Content -->
          </form></td>
      </tr>
    </table>
  </div>
  <div class="clr"></div>
</div>
<div class="clr"></div>
<script type="text/javascript">
	CKEDITOR.replace( 'editor1',
	{
		 toolbar : 'Basic'
	});
</script>
<?php include("footer.php"); ?>
</body>
</html>
<?php } ?>