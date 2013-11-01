<?php
session_start();
include("includes/db.conn.php");
include("includes/conf.class.php");
$shorting2 = array("asc"=>"价格从低到高", "desc"=>"价格从高到低");//array("asc"=>"Price low to high", "desc"=>"Price high to low");
if(isset($_POST['action'])){
	$condition1="";
	if($_POST['appartment_type']!=""&&$_POST['appartment_type']!="0"){
		$condition1.=" and bam.appmt_type_id=".mysql_real_escape_string($_POST['appartment_type']);
	}
	if($_POST['city']!=""){
		$condition1.=" and bam.city='".mysql_real_escape_string(trim($_POST['city']))."'";
	}
	if(isset($_SESSION['now_city'])&&$_SESSION['now_city']!=""){
		$condition1.=" and bam.city='".$_SESSION['now_city']."'";
	}
	if($_POST['district']!=""){
		$condition1.=" and bam.district='".mysql_real_escape_string(trim($_POST['district']))."'";
	}
	if($_POST['location_type']!=""){
		$condition1.=" and INSTR(bam.locationTypeArray,'".mysql_real_escape_string(trim($_POST['location_type']))."')>0";
	}
	if($_POST['location_child_type']!=""){
		$condition1.=" and INSTR(bam.locationTypeArray,'".mysql_real_escape_string(trim($_POST['location_child_type']))."')>0";
	}
	if($_POST['price_from']!=""){
		$condition1.=" and price>'".mysql_real_escape_string(trim($_POST['price_from']))."'";
		$_POST['price_lower']=$_POST['price_from'];
		if($_POST['price_to']!=""){
			$condition1.=" and price<'".mysql_real_escape_string(trim($_POST['price_to']))."'";
			$_POST['price_upper']=$_POST['price_to'];
		}else{
			$_POST['price_upper']='';
		}
	}
	// $cityList=$bsiCore->getCityList(mysql_real_escape_string(trim($_POST['city'])));
	$districtList=$bsiCore->getDistrictList2($_SESSION['now_city'],mysql_real_escape_string(trim($_POST['district'])));
	$locationTypeHTML = $bsiCore->getLocationTypeListByCD($_SESSION['now_city'],
								  mysql_real_escape_string(trim($_POST['district'])),
								  mysql_real_escape_string($_POST['location_type']),
								  mysql_real_escape_string($_POST['location_child_type']));
	// $locationTypeList=$bsiCore->getLocationTypeList(mysql_real_escape_string($_POST['location_type']));
	// $locationTypeChildList=$bsiCore->getLocationTypeChildList(mysql_real_escape_string($_POST['location_type']),
	// mysql_real_escape_string(trim($_POST['location_child_type'])));
	$typeList=$bsiCore->getApmtTypeList(mysql_real_escape_string($_POST['appartment_type']));
	$priceList = $bsiCore->getApmtPriceList(mysql_real_escape_string(trim($_POST['price_from'])));
}else{
	$condition1="";
	if(isset($_SESSION['now_city'])&&$_SESSION['now_city']!=""){
		$condition1.=" and bam.city='".$_SESSION['now_city']."'";
	}
	// $cityList=$bsiCore->getCityList();
	$districtList=$bsiCore->getDistrictList2($_SESSION['now_city']);
	//$locationTypeList=$bsiCore->getLocationTypeList();
	$typeList=$bsiCore->getApmtTypeList();
	$priceList = $bsiCore->getApmtPriceList();
}
$allappmt_sql="select * from (select  min(bp.price) as price,bam.appmt_name,
			bam.addr1,bam.state,bam.city, bam.zipcode,bam.district,bam.country, bam.short_desc, bam.lat,
			bam.longitude, bam.default_img, bam.appmt_id  from bsi_apartment_master bam,
			bsi_priceplan bp
			where bp.appmt_id=bam.appmt_id 
			and bam.status=true ".$condition1." group by bp.appmt_id) as t1 
			";
// echo $allappmt_sql;
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
 <link href="css/pagination.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1bd2776e1c14f18c281b31e3fa285f50"></script>
 <script type="text/javascript" src="js/menu/superfish.js"></script>
 <script type="text/javascript">
	jQuery(function(){
		jQuery('ul.sf-menu').superfish();
		$("#allmap").hide();
		$("#mapshowhide").click(function () {
		$("#allmap").toggle(function(){
		$("#map").css({'width':'100%', 'height':'500px'});
        initMap();
		});
		});
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
 <script type="text/javascript">

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
     <h1 class="col2">所有房间列表</h1>
     <form name="apmtForm" id="apmtForm" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
	 <input type="hidden" name="action" value="search">
	 <!--
	 <div class="filterarea">
		<b>城市：</b>
		<input type="hidden" name="city" id="id_hidden_city" value="<?php echo $_POST['city'];?>">
		<div class="content">
			<?php echo $cityList;?>
		</div>
	 </div>-->
	 <div class="filterarea">
		<b>行政区域：</b>
		<input type="hidden" name="district" id="id_hidden_district" value="<?php echo $_POST['district'];?>">
		<div class="content">
			<?php echo $districtList;?>
		</div>
	 </div>
	 <div id="id_div_locationType">
		 <?php echo $locationTypeHTML;?>
	 </div>
	 <div class="filterarea">
		<b>房间类型：</b>
		<input type="hidden" name="appartment_type" id="id_hidden_type" value="<?php echo $_POST['appartment_type'];?>">
		<div class="content">
			<?php echo $typeList;?>
		</div>
	 </div>
	 <div class="filterarea">
        <b>租　　金：</b>
		<input type="hidden" name="price_from" id="id_hidden_priceFrom" value="<?php echo $_POST['price_from'];?>">
		<input type="hidden" name="price_to" id="id_hidden_priceTo" value="<?php echo $_POST['price_to'];?>">
		<div class="content">
			<?php echo $priceList;?>                          	
			<span>
			<input name="price_lower" id="id_input_priceLower" type="text" class="smallinput" value="<?php echo $_POST['price_lower'];?>"> 到
			<input name="price_upper" id="id_input_priceUpper" type="text" class="smallinput" value="<?php echo $_POST['price_upper'];?>"> 元
				<input name="price_submit" type="button" class="filterbtn" onclick="submit_price()" value="确定">
			</span>
		</div>
	</div>
    </form>
    
      <hr style="width:100%; height:1px; float:left;"/>
<div class="list-div_all" id="allmap">
<div id="map"></div>
</div>
    <div id="paginationdemo">
    <div id="p1" class=" _current">   
    <?php
	$m1=1;
	$appt_cn=0;
	$page_cn=1;
	$allappmt_result=mysql_query($allappmt_sql);
	while($rowappt=mysql_fetch_assoc($allappmt_result)){
			if($appt_cn==5){
				$appt_cn=0;
				$page_cn++;
				echo '</div><div id="p'.$page_cn.'"  style="display:none;">';
			}
	?> 
    
     <div class="list-div_all">
      <div class="list-text">
       <h2><a href="<?php echo str_replace(" ","-",strtolower(trim($rowappt['appmt_name'])))."-".$rowappt['appmt_id'].".html"; ?>"><?php echo $rowappt['appmt_name']; ?></a></h2>
       <label><?php echo $rowappt['addr1']; ?> ,<?php echo $rowappt['district']; ?>, <?php echo $rowappt['city']; ?>, <?php echo $rowappt['state']; ?></label>
       <p><?php echo $rowappt['short_desc']; ?> </p>
       <p class="link"><a href="<?php echo str_replace(" ","-",strtolower(trim($rowappt['appmt_name'])))."-".$rowappt['appmt_id'].".html"; ?>"><?php echo $bsiCore->config['conf_currency_symbol'].$rowappt['price']; ?>/<?php echo $bsiCore->showBooktype(); ?></a></p>
      </div>
      <div class="list-map"> 
      <!--*************************************************************************************-->
	  <div id="map_canvas_<?php echo $rowappt['appmt_id']; ?>" style="width:280px;height:200px;"></div>
      <!--***************************************************************************************-->
      <script type="text/javascript">

		// 百度地图API功能
		var map = new BMap.Map("map_canvas_<?php echo $rowappt['appmt_id']; ?>");
		var lng = <?php echo $rowappt['longitude']==""?0:$rowappt['longitude']; ?>;
		var lat = <?php echo $rowappt['lat']==""?0:$rowappt['lat']; ?>;
		map.centerAndZoom(new BMap.Point(lng, lat), 14);
		map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
		var marker1 = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
		map.addOverlay(marker1);              // 将标注添加到地图中
		</script>
       </div>
       <div class="list-image"> <a href="<?php echo str_replace(" ","-",strtolower(trim($rowappt['appmt_name'])))."-".$rowappt['appmt_id'].".html"; ?>"><img src="<?php echo ($rowappt['default_img']=="")? "images/no_photo2.jpg":"gallery/ApartImage/".$rowappt['default_img']; ?>" alt="" height="180px" width="260px"></a> </div>
     </div>
     <?php 
	 $m1++;
	 $appt_cn++;
	 } ?>
   </div>
   </div>
   
    <div class="listing">
    <div id="apartment_paginate"></div>
   </div>
     
   </div>
   <div class="clr"></div>
 </div>
 <div class="clr"></div>
 <script src="js/jquery.paginate.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(function() {
	
			$("#apartment_paginate").paginate({
				count 		: <?php echo $page_cn; ?>,
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
