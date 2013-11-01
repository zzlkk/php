<?php
session_start();
include("includes/db.conn.php");
include("includes/conf.class.php");
date_default_timezone_set('Asia/Chongqing');
$pos2 = strpos($_SERVER['HTTP_REFERER'],$_SERVER['SERVER_NAME']);
if(!$pos2){
	header('Location: booking-failure.php?error_code=9');
}

$appmt = $bsiCore->ClearInput(base64_decode($_REQUEST['appmt_id']));
$_SESSION['appmtid_12'] = $appmt;

$apartmentDetails = $bsiCore->getApartmentdetails($appmt);

//判断session中参数是否存在
$checkindate = "";
if(!isset($_SESSION['sv_checkindate'])){
	$checkindate = date("Y-m-d");
	$_SESSION['sv_checkindate'] = $checkindate;
}else{
	$checkindate = $_SESSION['sv_checkindate'];
}

$checkoutdate = "";
if(!isset($_SESSION['sv_checkoutdate'])){
	$checkoutdate = date('Y-m-d',time()+86400);
	$_SESSION['sv_checkoutdate'] = $checkoutdate;
}else{
	$checkoutdate = $_SESSION['sv_checkoutdate'];
}
if(isset($_POST["check_in"])){
	$checkindate = $_POST["check_in"];
	$_SESSION['sv_checkindate'] = $checkindate;
}
if(isset($_POST["check_out"])){
	$checkoutdate = $_POST["check_out"];
	$_SESSION['sv_checkoutdate'] = $checkoutdate;
	
}
$_SESSION['sv_mcheckindate'] = $bsiCore->getMySqlDate($checkindate);
$_SESSION['sv_mcheckoutdate'] = $bsiCore->getMySqlDate($checkoutdate);
$nightcount = 0;
$checkin_date = getdate(strtotime($checkindate));
$checkout_date = getdate(strtotime($checkoutdate));
$checkin_date_new = mktime( 12, 0, 0, $checkin_date['mon'], $checkin_date['mday'], $checkin_date['year']);
$checkout_date_new = mktime( 12, 0, 0, $checkout_date['mon'], $checkout_date['mday'], $checkout_date['year']);
$nightcount = round(abs($checkin_date_new - $checkout_date_new) / 86400);
$_SESSION['sv_nightcount'] = $nightcount;
if(!isset($_SESSION['appmt_type'])){
	$_SESSION['appmt_type'] = $apartmentDetails['appmt_type_id'];
}
if($bsiCore->config['conf_rental_type'] == 1){
	$stayduration = $nightcount." 天";
	$priceDetails = $bsiCore->getApartmentPrice($appmt, $nightcount);
}else if($bsiCore->config['conf_rental_type'] == 2){
	$stayduration = $_SESSION['rentaltype']." 周";
	$priceDetails = $bsiCore->getApartmentPrice($appmt, $_SESSION['rentaltype']);
}else if($bsiCore->config['conf_rental_type'] == 3){
	$stayduration = $_SESSION['rentaltype']." 月";
	$priceDetails = $bsiCore->getApartmentPrice($appmt, $_SESSION['rentaltype']);
}

if(isset($_SESSION['svars_details'])){
	$appartmentArr = $_SESSION['svars_details'];
	$array = $appartmentArr[$appmt];
}else{
	$priceArr = $bsiCore->getApartmentPrice($appmt,$nightcount);
	$array = array('appartmentPrice' => $priceArr['totalprice'], 'priceperday' => $priceArr['priceperday']);
}
$_SESSION['reservationdata'] = $array;
$_SESSION['tax'] = 0;
$_SESSION['grandtotal'] = 0;
$_SESSION['deposit'] = 0;
$dateRange = $bsiCore->getBookingdate($appmt);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
<title>
<?php echo $bsiCore->config['conf_apartment_name'];?>
</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/tab.css" rel="stylesheet" type="text/css" />
<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/menu/superfish.js"></script>
 <script type="text/javascript" src="js/embed.js" async="true" charset="UTF-8"></script>
<script type="text/javascript">
	jQuery(function(){
		jQuery('ul.sf-menu').superfish();
	}); 
</script>
<script type="text/javascript" src="js/lightbox/jquery.lightbox-0.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/lightbox/jquery.lightbox-0.5.css" media="screen" />
<script type="text/javascript">
    $(function() {
        $('#appartment-media a').lightBox();
    });
</script>
<link rel="stylesheet" type="text/css" href="css/custom-theme/jquery-ui-1.8.22.custom.css" />
 <script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function() {
		$.datepicker.regional['zh-CN'] = {  
		  clearText: '清除',  
		  clearStatus: '清除已选日期',  
		  closeText: '关闭',  
		  closeStatus: '不改变当前选择',  
		  prevText: '<上月',  
		  prevStatus: '显示上月',  
		  prevBigText: '<<',  
		  prevBigStatus: '显示上一年',  
		  nextText: '下月>',  
		  nextStatus: '显示下月',  
		  nextBigText: '>>',  
		  nextBigStatus: '显示下一年',  
		  currentText: '今天',  
		  currentStatus: '显示本月',  
		  monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'],  
		  monthNamesShort: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'],  
		  monthStatus: '选择月份',  
		  yearStatus: '选择年份',  
		  weekHeader: '周',  
		  weekStatus: '年内周次',  
		  dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],  
		  dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],  
		  dayNamesMin: ['日','一','二','三','四','五','六'],  
		  dayStatus: '设置 DD 为一周起始',  
		  dateStatus: '选择 m月 d日, DD',  
		  dateFormat: 'yy-mm-dd',  
		  firstDay: 1,  
		  initStatus: '请选择日期',  
		  isRTL: false  
		};  
		$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
      	var unavailableDates = [<?php echo substr($dateRange, 0, -1);?>]; // yyyy/MM/dd
		
		function unavailable(date) {
			ymd = date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
			day = new Date(ymd).getDay();
			if ($.inArray(ymd, unavailableDates) < 0 ) {
				return [true, "enabled", "Available"];
			} else {
				return [false,"disabled","Booked Out"];
			}
		}
		
		$('#iDate').datepicker({ beforeShowDay: unavailable, minDate:0 });
		
		$( "#txtFromDate, #txtToDate" ).datepicker({
            minDate: 0,
			dateFormat: '<?php echo $bsiCore->config['conf_dateformat'];?>',
            defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            onSelect: function( selectedDate ) {
                if(this.id == 'txtFromDate'){
                  var dateMin = $('#txtFromDate').datepicker("getDate");
                  var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(),dateMin.getDate() + <?php echo $bsiCore->config['conf_minimum_stay'];?>);
                  var rMax = new Date(dateMin.getFullYear(), dateMin.getMonth(),dateMin.getDate() + <?php echo $bsiCore->config['conf_maximum_stay'];?>);
                  $('#txtToDate').datepicker("option","minDate",rMin);
                  $('#txtToDate').datepicker("option","maxDate",rMax);
                }
				$("#id_form_detail").submit();
            }
        });
		$("#datepickerImage").click(function() { 
			$("#txtFromDate").datepicker("show");
		});
		$("#datepickerImage1").click(function() { 
			$("#txtToDate").datepicker("show");
		});
    });
	
</script>
<style type="text/css">
.disabled span {
	color:black !important;
	background:#D21F3D !important;
}
.enabled span{
	color:black !important;
	background:#EAEEED !important;
}
.enabled a{
	color:black !important;
	background:#67F86B !important;
}
.ui-datepicker-today a{
	color:black !important;
	background:#36A5ED !important;
}
.ui-datepicker {
	width: 17em;
	padding: .2em .2em 0;
	display: none;
	font-size:14px;
}
#allmap {width:575px;height:400px;overflow: hidden;margin:0;}
</style>
<!-- **************************************************************************************************************** -->
<script type="text/javascript" language="javascript">
<!--
$(document).ready(function() {
// If your site is large with many images use window.load instead
//$(window).load(function() {
	//Default Action
	$(".tab_content").hide();
	$("ul.tabs li:first").addClass("active").show(); 
	$(".tab_content:first").show(); 
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active"); 
		$(".tab_content").hide(); 
		var activeTab = $(this).find("a").attr("href"); 
		$(activeTab).fadeIn();
		if(activeTab == '#tab2') {      
			$(window).resize(function(){
			//$("#tab2").css({'display':'block'});
			//$("#map_canvas").css({'width':'630px', 'height':'400px'});
			//initialize();
			//alert('Changed!');
			}); 
    		}	
		return false;
	});
	$("#id_dl_userInfo").load("http://mall.zzlkk.com/shop/test.php #id_dl_userInfo");
});
-->
</script>

<!-- **************************************************************************************************************** -->
</head>

<body  style="font-family: 'MavenProRegular';">
<?php include("header.php"); ?>
<div id="shadow">
  <div id="shadow-inside">
    <div id="shadow-left"></div>
    <div id="shadow-right"></div>
  </div>
</div>
<div id="container-div">
  <div id="container-inside">
    <div id="leftside-div">
      <h1 class="col2">
        <?php echo $apartmentDetails['appmt_name'];?>
      </h1>
      <p class="listing-para">
        <?php echo $apartmentDetails['addr1']." , ".$apartmentDetails['city'].", ".$apartmentDetails['state']."  - ".$apartmentDetails['zipcode'].", ".$apartmentDetails['country'];?>
      </p>
      <?php 
	  	if($apartmentDetails['default_img'] == ""){
			echo '<div id="listing-large-image-div"> <img src="images/no_appmt_photo.jpg" alt="" width="600px" height="340px"/> </div>';
		}else{
	  ?>
      <div id="listing-large-image-div"> <img src="gallery/ApartImage/<?php echo $apartmentDetails['default_img'];?>" alt="" width="600px" height="340px"/> </div>
      <?php } ?>
	  <h1 class="descH1">简介</h1>
       <div id="appartment-desc">
         <?php echo $apartmentDetails['long_desc'];?>
       </div>
      <br/>
      <br/>
      
      <!-- ******************************************************************************************************* -->
      <div style="width:620px;">
        <ul class="tabs">
          <li class="active"><a href="#tab1">房间详情</a></li>
          <li><a href="#tab2">设施</a></li>
          <li style="display: none;"><a href="#tab3">平面图</a></li>
          <li><a href="#tab4"  id="showMap">地图</a></li>
          <li><a href="#tab5">交易规则</a></li>
        </ul>
        <!-- Start tab container -->
        <div class="tab_container">
          <div style="display: block;" id="tab1" class="tab_content">
            <p>
              <?php
				  $feature = $bsiCore->getApmtFeatureList($apartmentDetails['features']);
              ?>
            <table cellpadding="3" width="100%">
			  <?php echo $feature;?>
			  <!--
              <tr>
                <td nowrap="nowrap" width="23%"><strong>公寓面积:</strong></td>
                <td width="27%"><?php if($featuresarr['appmt_size'] == ""){echo "NA";}else{ echo $featuresarr['appmt_size'];?>
                  &nbsp;Sqft
                  <?php } ?></td>
                <td nowrap="nowrap" width="23%"><strong>Lot size:</strong></td>
                <td width="27%"><?php if($featuresarr['apptmt_lot_size'] == ""){echo "NA";}else{ echo $featuresarr['apptmt_lot_size']?>
                  &nbsp;Sqft
                  <?php } ?></td>
              </tr>
              <tr>
                <td><strong>车位车库:</strong></td>
                <td><?php if($featuresarr['car_garage'] == 0){ echo "NA"; }else{ echo $featuresarr['car_garage']; }?></td>
                <td><strong>车库大小:</strong></td>
                <td><?php if($featuresarr['garage_size'] == ""){ echo "NA"; }else{ echo $featuresarr['garage_size'];?>
                  &nbsp;Sqft
                  <?php } ?></td>
              </tr>
              <tr>
                <td><strong>卧室:</strong></td>
                <td><?php if($featuresarr['bedroom'] == 0){ echo "NA";}else{ echo $featuresarr['bedroom']; }?></td>
                <td><strong>浴室:</strong></td>
                <td><?php if($featuresarr['bathroom'] == 0){ echo "NA";}else{ echo $featuresarr['bathroom']; }?></td>
              </tr>
              <tr>
                <td><strong>房间总数:</strong></td>
                <td><?php if($featuresarr['total_rooms'] == 0){ echo "NA";}else{ echo $featuresarr['total_rooms']; }?></td>
                <td><strong>地下室:</strong></td>
                <td><?php if($featuresarr['basement'] == 0){ echo "NA";}else{ echo $featuresarr['basement']; }?></td>
              </tr>
              <tr>
                <td><strong>楼层:</strong></td>
                <td><?php if($featuresarr['floors'] == 0){ echo "NA";}else{ echo $featuresarr['floors']; }?></td>
                <td><strong>建造年份:</strong></td>
                <td><?php if($featuresarr['year_of_build'] == 0){ echo "NA";}else{ echo $featuresarr['year_of_build']; }?></td>
              </tr>
			  -->
            </table>
            </p>
          </div>
          <div style="display: none;" id="tab2" class="tab_content">
            <p>
              <?php echo $bsiCore->getAmenities($appmt);?>
            </p>
          </div>
          <div style="display: none;" id="tab3" class="tab_content">
            <p>
              
            <?php
				if($apartmentDetails['apart_floor_img'] == ""){
				echo '<img src="images/no_floorplan.jpg" style="margin-top:5px; margin-bottom:5px;"/>';	
				}else{
					list($width)=getimagesize("gallery/ApartFloor/".$apartmentDetails['apart_floor_img']);
					if($width > 585){
						$str='width="585"';
					}else{
						$str='';
					}
			?>
              <img src="gallery/ApartFloor/<?php echo $apartmentDetails['apart_floor_img'];?>" style="margin-top:5px; margin-bottom:5px;" <?php echo $str;?>/>
               <?php } ?></p>
          </div>
          <div style="display: none;" id="tab4" class="tab_content"> 
		  <!--
		  <!--
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
      <script type="text/javascript" language="javascript">
    //<![CDATA[
    $(document).ready(function() {
    
      function initialize() {
        var myLatlng = new google.maps.LatLng(<?php echo $apartmentDetails['lat'];?>, <?php echo $apartmentDetails['longitude'];?>);
        var myOptions = {
          zoom: 14,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        
        var contentString = '<div id="content">'+
            '<h6><?php echo $apartDetails['appmt_name']."<br> ".$apartDetails['addr1'].", ".$apartDetails['city'].", ".$apartDetails['country'];?></h6>';
    
        var infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 300
        });
    
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Perth, Western Australia'
        });
        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
        });
    
      }
    	// Function added to help reset map and container boundaries
        $("#showMap").click(function() {
        $("#tab4").css({'display':'block'});
        $("#map_canvas").css({'width':'575px', 'height':'400px'});
        initialize();
        //alert('showMap Clicked!');
        });
        
     initialize(); 

    });
    //]]>
    </script>
	-->
      <div id="map_canvas" style="width:575px;height:400px;"></div>
	  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1bd2776e1c14f18c281b31e3fa285f50"></script>
		<script type="text/javascript">

			// 百度地图API功能
			var map = new BMap.Map("map_canvas");
			var lng = <?php echo $apartmentDetails['longitude']==""?0:$apartmentDetails['longitude']; ?>;
			var lat = <?php echo $apartmentDetails['lat']==""?0:$apartmentDetails['lat']; ?>;
			//map.centerAndZoom(new BMap.Point(lng,lat), 15);
			map.centerAndZoom(new BMap.Point(lng-0.018,lat+0.012), 15);
			map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
			map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
			//alert("当前地图中心点：,"+lng+"," + map.getCenter().lng + ","+lat+"," + map.getCenter().lat);
			var marker1 = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
			map.addOverlay(marker1);              // 将标注添加到地图中
		</script>
     </div>
          
           <div style="display: none;" id="tab5" class="tab_content">
      <p>
      <table cellpadding="5" cellspacing="0" border="0" width="100%">
      <tr><th align="left">入住时间</th><th align="left">单价 <?php echo $bsiCore->showBooktype();?></th><th align="left">订金比例(%)</th></tr>
      <?php echo $bsiCore->getpriceplanfront($appmt); ?>
      </table>
      </p>
    </div>
        </div>
        <!-- End tab container --> 
        
      </div>
      <!-- ******************************************************************************************************* -->
      <div class="clr1"></div>
      <h1 class="col4">房间相册</h1>
      <div id="appartment-media">
        <?php echo $bsiCore->getApartmentmedia($appmt);?>
      </div>
	  <!-- Duoshuo Comment BEGIN -->
		<div class="ds-thread"></div>
		<script type="text/javascript">
		var duoshuoQuery = {short_name:"vovor"};
		function flagComment(){
			$("#email_hidden").load("/shop/test.php #id_hidden_email",function(){
				var querystr='actioncode=10&email='+$('#id_hidden_email').val()+'&appmt_id='+$('#id_hidden_pmtId').val();
				$.post("ajax-processor.php", querystr, function(data){		
					if(data.count != 0){
						alert(data.count);
						$(".ds-replybox").removeClass("hide");
					}else{
					}
				}, "json");
			});
		}
		setTimeout(function(){flagComment();},1000);
		</script>
		<!-- Duoshuo Comment END<script type="text/javascript">
		var duoshuoQuery = {short_name:"vovor"};
			(function() {
				var ds = document.createElement('script');
				ds.type = 'text/javascript';ds.async = false;
				ds.src = 'http://static.duoshuo.com/embed.js';
				ds.charset = 'UTF-8';
				(document.getElementsByTagName('head')[0] 
				|| document.getElementsByTagName('body')[0]).appendChild(ds);
			})();
			$('.ds-replybox').addClass("hide");
			</script> -->
    </div>
    <div class="clr"></div>
    <div id="rightside-div">
      <h1 class="col2">基本参数</h1>
	  <div id="iDate"></div>
	  <div id="id_div_dateTip"><span class="cls_span_now">&nbsp;</span>当前日期&nbsp;&nbsp;<span class="cls_span_old">&nbsp;</span>过去日期&nbsp;&nbsp;
	  <span class="cls_span_able">&nbsp;</span>可预订&nbsp;&nbsp;<span class="cls_span_unable">&nbsp;</span>已预定</div>
	  <form action="" method="post" id="id_form_detail">
      <div class="search-text"><strong>入住日期:</strong>
		<input type="text" name="check_in" id="txtFromDate" class="zfdateText" value="<?php echo $checkindate;?>" style="width:70px;" readonly="readonly" />
      </div>
      <div class="search-text"><strong>退房日期:</strong>
		<input type="text" name="check_out" id="txtToDate" class="zfdateText" value="<?php echo $checkoutdate;?>" style="width:70px;" readonly="readonly" />
      </div>
	  </form>
      <div class="search-text"><strong>入住天数
        <?php //echo $bsiCore->showBooktype();?>
        :</strong>
        <?php echo $stayduration;?>
      </div>
	  
      <h2 class="col5">价格明细</h2>
      <div class="price-text">
        <?php echo $stayduration;?>
        x
        <?php echo $bsiCore->config['conf_currency_symbol'].number_format($array['priceperday'], 2);?>
        : <span>
        <?php echo $bsiCore->config['conf_currency_symbol'].number_format($array['appartmentPrice'], 2);?>
        </span></div>
      <?php
	    $_SESSION['dv_subtotal'] = $array['appartmentPrice'];
	   	if($bsiCore->config['conf_tax_amount'] > 0 && $bsiCore->config['conf_tax_amount'] < 100){
	   		$tax = ($array['appartmentPrice']*$bsiCore->config['conf_tax_amount']/100);
			$amount = $array['appartmentPrice']+$tax;
	   ?>
      <div class="price-text bod">Tax: <span>
        <?php echo $bsiCore->config['conf_currency_symbol'].number_format($tax, 2);?>
        </span></div>
      <?php
	    }else{
			$amount = $array['appartmentPrice'];
		}
	   ?>
      <div class="price-text">总计: <span>
        <?php echo $bsiCore->config['conf_currency_symbol'].number_format($amount, 2);?>
        </span></div>
      <?php
			$_SESSION['tax']+= $tax;
			$_SESSION['grandtotal'] = $amount;
	   		if($priceDetails['pricepercent'] > 0){
				$advancePayment = $amount*$priceDetails['pricepercent']/100;
				$_SESSION['deposit'] = $advancePayment;
				echo '<div class="price-text">预付款: <span>'.$bsiCore->config['conf_currency_symbol'].number_format($advancePayment, 2).'</span></div>';	
			}
	   ?>
      <div class="clr1"></div>
      <?php
	   	if(!$bsiCore->config['conf_booking_turn_off']){
	   ?>
      <form action="booking-process.php" method="post" id="form1">
		<input type="hidden" name="ip" id="ip" value="<?php echo $_SERVER['REMOTE_ADDR'];?>" />
        <div class="booking" id="id_div_booking">
		  <div>
			<h2 class="col6" style="width:90px">订单确认</h2>
			<div style="width:102px;height:32px;float: right;margin:10px 10px 0px 0px;">
				<a id="ibangkf" href="http://www.ibangkf.com">在线客服</a>
				<script type="text/javascript" src="http://c.ibangkf.com/i/c-vovor.js"></script>
			</div>
		  </div><div style="clear:both;"></div>
		  <div id="id_dl_userInfo">
			  <dl class="list-dl" >
				<dt>
				  <label for=ln>姓名:</label>
				</dt>
				<dd>
				  <input type="text" value="" id="surname" name="surname" class="list-input required"/>
				</dd>
				<dt>
				  <label for=ph>手机:</label>
				</dt>
				<dd>
				  <input type="text" value="" id="phone" name="phone" class="list-input required phone"/>
				</dd>
				<dt>
				  <label for=em>电子邮箱:</label>
				</dt>
				<dd>
				  <input type="text" value="" id="email" name="email" class="list-input required email"/>
				</dd>
			  </dl>
		  </div>
		  <dl class="list-dl">
			<dt>
              <label for=pm>支付方式:</label>
            </dt>
            <dd>
			  <select id="payment_gateway" name="payment_gateway" class="list-select required">
              <?php 
				$result = mysql_query("select * from bsi_payment_gateway where enabled=true order by ord asc");
				while($row = mysql_fetch_assoc($result)){
					 echo '<option value="'.$row['gateway_code'].'">'.$row['gateway_name'].'</option>';
				}
			  ?>
              </select>
            </dd>
			<dt>
				&nbsp;
            </dt>
            <dd>
              <input name="submit" value="立即预定" type="submit" class="btn2" />
            </dd>
            <div class="clr1"></div>
          </dl>
        </div>
      </form>
      <?php
		}else{
			echo '<div><h4 style="color:#F30; padding-top:20px;">抱歉，在线预订尚不可用，请稍后再试！</h4></div>';		
		}
	   ?>
	   
    </div>
    <div class="clr"></div>
    <div class="clr"></div>
	
  </div>
  <div class="clr"></div>
</div>
<div class="clr"></div>
<style>
 input.error {

    border-color: #D00;

    color: #D00;

    background: #FFFFFE;

}



label.error {

    display: inline-block;

    font-size: 12px;

    color: #D00;

    padding-left: 10px;

    font-style: italic;
	

}


 </style>
<script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
     });     
</script> 
<script src="cp/js/jquery.validate.js" type="text/javascript"></script>
<?php include("footer.php"); ?>
</body>
</html>
