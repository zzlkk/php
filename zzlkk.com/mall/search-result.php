<?php
session_start();
include("includes/db.conn.php");
include("includes/conf.class.php");
$pos2 = strpos($_SERVER['HTTP_REFERER'],$_SERVER['SERVER_NAME']);
if(!$pos2){
	header('Location: booking-failure.php?error_code=9');
}
$bsiCore->clearExpiredBookings();
include("includes/search.class.php");
$bsiSearch     = new bsiSearch();
$appArr        = $bsiSearch->getAvailableAppartment();	
if(isset($_SESSION['svars_details']))
$appartmentArr = $_SESSION['svars_details'];
//echo "<pre>";print_r($appartmentArr);echo "</pre>";
if(isset($_POST['action'])){
	
	// $cityList=$bsiCore->getCityList(mysql_real_escape_string(trim($_POST['city'])));
	$districtList=$bsiCore->getDistrictList2($_SESSION['now_city'],mysql_real_escape_string(trim($_POST['district'])));
	$locationTypeHTML = $bsiCore->getLocationTypeListByCD2($_SESSION['now_city'],
								  mysql_real_escape_string(trim($_POST['district'])),
								  mysql_real_escape_string($_POST['location_type']),
								  mysql_real_escape_string($_POST['location_child_type']));
	// $locationTypeList=$bsiCore->getLocationTypeList(mysql_real_escape_string($_POST['locationType']));
	// $locationTypeChildList=$bsiCore->getLocationTypeChildList(mysql_real_escape_string($_POST['locationType']),
	// mysql_real_escape_string(trim($_POST['location_child_type'])));
	$typeList=$bsiCore->getApmtTypeList(mysql_real_escape_string($_POST['appartment_type']));
	$priceList = $bsiCore->getApmtPriceList(mysql_real_escape_string(trim($_POST['price_from'])));
}else{
	if(isset($_SESSION['now_city'])&&$_SESSION['now_city']!=""){
		$condition1.=" and bam.city='".$_SESSION['now_city']."'";
	}
	// $cityList=$bsiCore->getCityList();
	$districtList=$bsiCore->getDistrictList2($_SESSION['now_city']);
	//$locationTypeList=$bsiCore->getLocationTypeList();
	$typeList=$bsiCore->getApmtTypeList();
	$priceList = $bsiCore->getApmtPriceList();
}
if($bsiCore->config['conf_rental_type'] == 1){
	$stayduration=$bsiSearch->nightCount." Night(s)";;
}else if($bsiCore->config['conf_rental_type'] == 2){
	$stayduration= mysql_real_escape_string($_POST['weeks'])." Week(s)";
}else if($bsiCore->config['conf_rental_type'] == 3){
	$stayduration= mysql_real_escape_string($_POST['months'])." Month(s)";
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
<title><?php echo $bsiCore->config['conf_apartment_name'];?></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/pagination.css" rel="stylesheet" type="text/css" />
<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1bd2776e1c14f18c281b31e3fa285f50"></script>
<script type="text/javascript" src="js/menu/superfish.js"></script>

<script type="text/javascript">
	jQuery(function(){
		jQuery('ul.sf-menu').superfish();
		$("#id_div_locType a").hover(function(){
			var pIndex = $(this).index();
			$("#id_div_child"+pIndex).show();
			$("#id_div_child"+pIndex).siblings().hide();
			var parentType = $(this).text();
			$("#id_hidden_locationType").val(parentType);
			// $(this).addClass("areanow");
			// $(this).siblings().removeClass("areanow");
			// var querystr='actioncode=11&parentType='+parentType;
			// $.post("ajax-processor.php", querystr, function(data){
				// if(data!=""){
					// $("#id_div_childType").show();
					// $("#id_div_childType").html(data);
					// $("#id_hidden_locationType").val(parentType);
				// }else{
					// $("#id_div_childType").hide();
				// }
			// }, "html");
		},function(){
			//$("#id_div_childType").hide();
		});
	}); 
	
	function citySearch(city){
		$("#id_hidden_city").val(city);
		$("#apmtForm").submit();
	}
	function districtSearch(district){
		$("#id_hidden_district").val(district);
		$("#apmtForm").submit();
	}
	function locationTypeSearch(locationType){
		$("#id_hidden_locationType").val(locationType);
		$("#id_hidden_locationChildType").val("");
		$("#apmtForm").submit();
	}
	function locationChildTypeSearch(locationChildType){
		$("#id_hidden_locationChildType").val(locationChildType);
		$("#apmtForm").submit();
	}
	function typeSearch(type){
		$("#id_hidden_type").val(type);
		$("#apmtForm").submit();
	}
	function priceSearch(priceFrom,priceTo){
		$("#id_hidden_priceFrom").val(priceFrom);
		$("#id_hidden_priceTo").val(priceTo);
		$("#apmtForm").submit();
	}
	function submit_price(){
		$("#id_hidden_priceFrom").val($("#id_input_priceLower").val());
		$("#id_hidden_priceTo").val($("#id_input_priceUpper").val());
		$("#apmtForm").submit();
	}
</script>
</head>

<body>
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
      <h1 class="col2">搜索结果</h1>
	  <form name="apmtForm" id="apmtForm" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
	 <input type="hidden" name="action" value="search">
	 <div class="filterarea">
		<b>行政区域：</b>
		<input type="hidden" name="district" id="id_hidden_district" value="<?php echo $_POST['district'];?>">
		<div class="content1">
			<?php echo $districtList;?>
		</div>
	 </div>
	 <div id="id_div_locationType">
		 <?php echo $locationTypeHTML;?>
	 </div>
	 <div class="filterarea">
		<b>房间类型：</b>
		<input type="hidden" name="appartment_type" id="id_hidden_type" value="<?php echo $_POST['appartment_type'];?>">
		<div class="content1">
			<?php echo $typeList;?>
		</div>
	 </div>
	 <div class="filterarea" style="margin-bottom:15px;">
        <b>租　　金：</b>
		<input type="hidden" name="price_from" id="id_hidden_priceFrom" value="<?php echo $_POST['price_from'];?>">
		<input type="hidden" name="price_to" id="id_hidden_priceTo" value="<?php echo $_POST['price_to'];?>">
		<div class="content1">
			<?php echo $priceList;?>                          	
			<span>
			<input name="price_lower" id="id_input_priceLower" type="text" class="smallinput" value="<?php echo $_POST['price_lower'];?>"> 到
			<input name="price_upper" id="id_input_priceUpper" type="text" class="smallinput" value="<?php echo $_POST['price_upper'];?>"> 元
				<input name="price_submit" type="button" class="filterbtn" onclick="submit_price()" value="确定">
			</span>
		</div>
	</div>
    </form>
      <span style="float:left; font-family: 'MavenProRegular';">找到<?php echo $appArr['appmt_cn'];?> 房间!</span> <span style="float:right; font-family: 'MavenProRegular';">排序方式: <?php echo (mysql_real_escape_string($_POST['sorting'])=='asc')? '价格从低到高':'价格从低到高' ;?></span>
      <hr style="width:100%; height:1px; float:left;"/>
      <div id="paginationdemo">
        <?php
	if($appArr['roomcnt'] > 0){
		$m1=1;
		$appt_cn=0;
		$page_cn=1;
		echo '<div id="p'.$page_cn.'" class=" _current">';
		foreach($appartmentArr as $key => $appartmentAr){
			$apartmentDetails = $bsiCore->getApartmentdetails($key);
			$apartmentFeature = $bsiCore->getApmtFeatures($key);
			if($appt_cn==5){
				$appt_cn=0;
				$page_cn++;
				echo '</div><div id="p'.$page_cn.'"  style="display:none;">';
			}
			echo '<style>			
					.overlay'.$key.' {
						background-color: rgba(0, 0, 0, 0.6);
						bottom: 0;
						cursor: default;
						left: 0;
						opacity: 0;
						position: fixed;
						right: 0;
						top: 0;
						visibility: hidden;
						z-index: 1;
					
						-webkit-transition: opacity .5s;
						-moz-transition: opacity .5s;
						-ms-transition: opacity .5s;
						-o-transition: opacity .5s;
						transition: opacity .5s;
					}
					.overlay'.$key.':target {
						visibility: visible;
						opacity: 1;
					}
					.popup'.$key.' {
						background-color: #fff;
						border: 3px solid #fff;
						display: inline-block;
						left: 50%;
						opacity: 0;
						padding: 15px;
						position: fixed;
						text-align: justify;
						top: 40%;
						visibility: hidden;
						z-index: 100000;
					
						-webkit-transform: translate(-50%, -50%);
						-moz-transform: translate(-50%, -50%);
						-ms-transform: translate(-50%, -50%);
						-o-transform: translate(-50%, -50%);
						transform: translate(-50%, -50%);
					
						-webkit-border-radius: 10px;
						-moz-border-radius: 10px;
						-ms-border-radius: 10px;
						-o-border-radius: 10px;
						border-radius: 10px;
					
						-webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
						-moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
						-ms-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
						-o-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
						box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
					
						-webkit-transition: opacity .5s, top .5s;
						-moz-transition: opacity .5s, top .5s;
						-ms-transition: opacity .5s, top .5s;
						-o-transition: opacity .5s, top .5s;
						transition: opacity .5s, top .5s;
					}
					.overlay'.$key.':target+.popup'.$key.' {
						top: 50%;
						opacity: 1;
						visibility: visible;
					}
					.close'.$key.' {
						background-color: rgba(0, 0, 0, 0.8);
						height: 30px;
						line-height: 30px;
						position: absolute;
						right: 0;
						text-align: center;
						text-decoration: none;
						top: -15px;
						width: 30px;
					
						-webkit-border-radius: 15px;
						-moz-border-radius: 15px;
						-ms-border-radius: 15px;
						-o-border-radius: 15px;
						border-radius: 15px;
					}
					.close'.$key.':before {
						color: rgba(255, 255, 255, 0.9);
						content: "X";
						font-size: 24px;
						text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
					}
					.close'.$key.':hover {
						background-color: rgba(64, 128, 128, 0.8);
					}
					.popup'.$key.' p, .popup'.$key.' div {
						margin-bottom: 10px;
					}
				</style>';
	?>
		
        <div class="list-div">
          <div class="list-text">
            <h2><a href="apartment-details.php?appmt_id=<?php echo base64_encode($key);?>"><?php echo $apartmentDetails['appmt_name'];?></a></h2>
            <label><?php echo $apartmentDetails['addr1']." , ".$apartmentDetails['city'].", ".$apartmentDetails['state'];?></label>
            <p><?php echo $apartmentDetails['short_desc'];?></p>
            <p class="link"><a href="apartment-details.php?appmt_id=<?php echo base64_encode($key); ?>"><?php echo $bsiCore->config['conf_currency_symbol'].$appartmentAr['appartmentPrice']." for ".$stayduration;?></a></p>
          </div>
          <div class="list-image"> <a href="apartment-details.php?appmt_id=<?php echo base64_encode($key);?>"><img src="<?php echo ($apartmentDetails['default_img']=="")? "images/no_photo2.jpg":"gallery/ApartImage/".$apartmentDetails['default_img']; ?>" alt="" height="180px" width="260px"></a>
            <div align="center"><a href="#login_form<?php echo $key; ?>" style="font-weight:bold;font-family: 'MavenProRegular';" id="login_pop">View Map</a> <a href="#x" class="overlay<?php echo $key; ?>" id="login_form<?php echo $key; ?>"></a>
              <div class="popup<?php echo $key; ?>"><div id="map_canvas_<?php echo $key; ?>" style="width:750px;height:550px;"></div> <a class="close<?php echo $key; ?>" href="#close<?php echo $key; ?>"></a> </div>
            </div>
          </div>
        </div>
		<script type="text/javascript">
		//<![CDATA[
		// 百度地图API功能
		var map = new BMap.Map("map_canvas_<?php echo $key; ?>");
		var lng = <?php echo $apartmentDetails['longitude']==""?0:$apartmentDetails['longitude']; ?>;
		var lat = <?php echo $apartmentDetails['lat']==""?0:$apartmentDetails['lat']; ?>;
		map.centerAndZoom(new BMap.Point(lng, lat), 14);
		map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
		var marker1 = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
		map.addOverlay(marker1);              // 将标注添加到地图中
		//]]>
		</script>
        <?php
	  $m1++;
	  $appt_cn++;
		}
	}else{
		$page_cn=1;
		echo '<div class="list-div"><h2>Sorry! 没有找到结果. 请试试其他时间日期!</h2></div>';
	}
	
	if($appArr['roomcnt'] > 0){
		echo '</div>';
		$pagination='<div class="listing"><div id="apartment_paginate"></div></div>';
	}else{
		$pagination="";
	}
	?>
      </div>
      <?php echo $pagination;?> </div>
    <div class="clr"></div>
    <div id="rightside-div">
      <h1 class="col2">搜索输入</h1>
      <div class="search-text"><strong>入住日期:</strong> <?php echo $_SESSION['sv_checkindate'];?> </div>
      <div class="search-text"><strong>退房日期:</strong> <?php echo $bsiSearch->checkOutDate;?> </div>
      <div class="search-text"><strong>总 <?php echo $bsiCore->showBooktype();?>:</strong> <?php echo $stayduration;?> </div>
      <div class="clr1"></div>
      <div id="top-appartment" style="float:left; margin:10px 0 10px 0;">
        <h1 class="col2">热门房间</h1>
        <?php echo $bsiCore->getTopTenApartmentName();?> </div>
      <div class="clr1"></div>
      <h1 class="col2">热门房间 <span class="col3">图片</span></h1>
      <?php echo $bsiCore->getTopApartmentPhoto();?> </div>
    <div class="clr"></div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>
<div class="clr"></div>
<script src="js/jquery.paginate.js" type="text/javascript"></script> 
<script type="text/javascript">
		$(function() {
	
			$("#apartment_paginate").paginate({
				count 		: <?php echo $page_cn;?>,
				start 		: 1,
				display     : 3,
				border					: true,
				border_color			: '#BEF8B8',
				text_color  			: '#68BA64',
				background_color    	: '#E3F2E1',	
				border_hover_color		: '#68BA64',
				text_hover_color  		: 'black',
				background_hover_color	: '#CAE6C6', 
				rotate      : false,
				images		: false,
				mouse		: 'press',
				onChange     			: function(page){
											$('._current','#paginationdemo').removeClass('_current').hide();
											$('#p'+page).addClass('_current').show();
										  }
			});
		});
		</script>
<?php include("footer.php"); ?>
</body>
</html>
