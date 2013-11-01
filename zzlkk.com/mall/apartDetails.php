<?php
include("includes/db.conn.php");
include("includes/conf.class.php");
if(isset($_GET['id']))
$appmt = mysql_real_escape_string($_GET['id']);
else
header("location:all-apartment.php");
$apartDetails = $bsiCore->getApartmentdetails($appmt);
$dateRange = $bsiCore->getBookingdate($appmt);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <meta http-equiv=Content-Type content="text/html; charset=UTF-8">
 <title>
 <?php echo $bsiCore->config['conf_apartment_name']." :: ".$apartDetails['appmt_name'];?>
 </title>
 <link href="css/style.css" rel="stylesheet" type="text/css" />
 <link href="css/tab.css" rel="stylesheet" type="text/css" />
 <link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
 <link href="css/tab.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="js/slider/coin-slider.js"></script>
 <script type="text/javascript" src="js/tabs.js"></script>
 <script type="text/javascript" src="js/embed.js" async="true" charset="UTF-8"></script>
 <script type="text/javascript">
	$(document).ready(function() {
		$('#coin-slider').coinslider({ hoverPause: false });
		
	});
</script>
 <script type="text/javascript" src="js/menu/superfish.js"></script>
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
    });
 </script>
 <!-- ****************************************************************************************************************** -->
 <style type="text/css">
.disabled span {
	color:black !important;
	background:red !important;
}
.ui-datepicker {
	width: 17em;
	padding: .2em .2em 0;
	display: none;
	font-size:14px;
}
</style>
 <!-- ****************************************************************************************************************** -->
 
 <!-- **************************************************Tab**************************************************** -->
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
});
-->
</script>
 <!-- **************************************************************************************************************** -->
 </head>

 <body  style="font-family: 'MavenProRegular';" >
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
        
       
      <?php echo $apartDetails['appmt_name'];?>
      </h1>
      <p class="listing-para">
        <?php echo $apartDetails['addr1']." , ".$apartDetails['city'].", ".$apartDetails['state']." - ".$apartDetails['zipcode'].", ".$apartDetails['country'];?>
      </p>
      <?php 
	  	if($apartDetails['default_img'] == ""){
			echo '<div id="listing-large-image-div"> <img src="images/no_appmt_photo.jpg" alt="" width="600px" height="340px"/> </div>';
		}else{
	  ?>
      <div id="listing-large-image-div"> <img src="gallery/ApartImage/<?php echo $apartDetails['default_img'];?>" alt="" width="600px" height="340px"/> </div>
      <?php } ?>

	  <h1 class="descH1">简介</h1>
       <div id="appartment-desc">
         <?php echo $apartDetails['long_desc'];?>
       </div>
      <br/>
	  <br/>
       <!--TABS-->
       <div style="width:620px;">
  <ul class="tabs">
    <li class="active"><a href="#tab1">房间详情</a></li>
	<li><a href="#tab2">设施</a></li>
	<li style="display: none;"><a href="#tab3" >平面图</a></li>
	<li><a href="#tab4"  id="showMap">地图</a></li>
	<li><a href="#tab5">交易规则</a></li>
  </ul>
  <!-- Start tab container -->
  <div class="tab_container">
	
	
    <div style="display: block;" id="tab1" class="tab_content">
       <p>
            <?php
				$feature = $bsiCore->getApmtFeatureList($apartDetails['features']);
            ?>
            <table cellpadding="3" width="100%">
				<?php echo $feature;?>
			   <!--
              <tr>
                <td nowrap="nowrap" width="23%"><strong>Apartment Size:</strong></td>
                <td width="27%"><?php if($featuresarr['appmt_size'] == ""){echo "NA";}else{ echo $featuresarr['appmt_size'];?>
                  &nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?>
                  <?php } ?></td>
                <td nowrap="nowrap" width="23%"><strong>Lot size:</strong></td>
                <td width="27%"><?php if($featuresarr['apptmt_lot_size'] == ""){echo "NA";}else{ echo $featuresarr['apptmt_lot_size'];?>
                  &nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><strong>Car Garage:</strong></td>
                <td><?php if($featuresarr['car_garage'] == 0){ echo "NA"; }else{ echo $featuresarr['car_garage']; }?></td>
                <td><strong>Garage size:</strong></td>
                <td><?php if($featuresarr['garage_size'] == ""){ echo "NA"; }else{ echo $featuresarr['garage_size'];?>
                  &nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><strong>Bedrooms:</strong></td>
                <td><?php if($featuresarr['bedroom'] == 0){ echo "NA";}else{ echo $featuresarr['bedroom']; }?></td>
                <td><strong>Bathrooms:</strong></td>
                <td><?php if($featuresarr['bathroom'] == 0){ echo "NA";}else{ echo $featuresarr['bathroom']; }?></td>
              </tr>
              <tr>
                <td><strong>Total Rooms:</strong></td>
                <td><?php if($featuresarr['total_rooms'] == 0){ echo "NA";}else{ echo $featuresarr['total_rooms']; }?></td>
                <td><strong>Basement:</strong></td>
                <td><?php if($featuresarr['basement'] == 0){ echo "NA";}else{ echo $featuresarr['basement']; }?></td>
              </tr>
              <tr>
                <td><strong>Floors:</strong></td>
                <td><?php if($featuresarr['floors'] == 0){ echo "NA";}else{ echo $featuresarr['floors']; }?></td>
                <td><strong>Year Of Build:</strong></td>
                <td><?php if($featuresarr['year_of_build'] == 0){ echo "NA";}else{ echo $featuresarr['year_of_build']; }?></td>
              </tr>
			  -->
            </table>
        </p>
    </div>
    
    
     <div style="display: none;" id="tab2" class="tab_content">
      <p><?php echo $bsiCore->getAmenities($appmt);?></p>
    </div>
    
    
     <div style="display: none;" id="tab3" class="tab_content">
                  
              <p>
              
            <?php
				if($apartDetails['apart_floor_img'] == ""){
				echo '<img src="images/no_floorplan.jpg" style="margin-top:5px; margin-bottom:5px;"/>';	
				}else{
					list($width)=getimagesize("gallery/ApartFloor/".$apartDetails['apart_floor_img']);
					if($width > 585){
						$str='width="585"';
					}else{
						$str='';
					}
			?>
              <img src="gallery/ApartFloor/<?php echo $apartDetails['apart_floor_img'];?>" style="margin-top:5px; margin-bottom:5px;" <?php echo $str;?>/>
               <?php } ?></p>
    </div>
    <div style="display:none;" id="tab4" class="tab_content">
	  <!--
      <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
      <script type="text/javascript" language="javascript">
    //<![CDATA[
    $(document).ready(function() {
    
      function initialize() {
        var myLatlng = new google.maps.LatLng(<?php echo $apartDetails['lat'];?>, <?php echo $apartDetails['longitude'];?>);
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
			var lng = <?php echo $apartDetails['longitude']==""?0:$apartDetails['longitude']; ?>;
			var lat = <?php echo $apartDetails['lat']==""?0:$apartDetails['lat']; ?>;
			map.centerAndZoom(new BMap.Point(lng-0.058,lat+0.012), 15);
			map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
			map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
			var marker1 = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
			map.addOverlay(marker1);              // 将标注添加到地图中
			map.panTo(new BMap.Point(lng,lat));
		</script>
    </div>
	<div style="display: none;" id="tab5" class="tab_content">
      <p>
      <table cellpadding="5" cellspacing="0" border="0" width="100%">
      <tr><th align="left">入住时间</th><th align="left">入住价格 <?php echo $bsiCore->showBooktype();?></th><th align="left">订金比例(%)</th></tr>
      <?php echo $bsiCore->getpriceplanfront($appmt); ?>
      </table>
      </p>
    </div>
  </div>
  
  <!-- End tab container --> 
  
</div>
       <div class="clr1"></div>
       <h1 class="col4">房间图库</h1>
       <div id="appartment-media">
         <?php echo $bsiCore->getApartmentmedia($appmt);?>
       </div>
	   <div class="clr1"></div>
	   <div id="appartment-booking">
			<input value="马上预定" type="button" onclick="javascript:window.location.href='apartment-details.php?appmt_id=<?php echo base64_encode($appmt);?>'" class="btn5" />
       </div>
	   <input type="hidden" id="id_hidden_pmtId" value="<?php echo $appmt;?>">
	   <div id="email_hidden">
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
       <div id="iDate"></div>
       <div class="clr1"></div>
       <div id="top-appartment" style="float:left; margin:30px 0 30px 0;">
         <h1 class="col2">热门房间</h1>
      <?php echo $bsiCore->getTopTenApartmentName();?>
       </div>
       <div class="clr1"></div>
       <h1 class="col2">热门房间 <span class="col3">图库</span></h1>
      
        <?php echo $bsiCore->getTopApartmentPhoto();?>
	   <div class="clr1"></div>
	   <?php $otherAppmt = $bsiCore->getOtherApartmentPhoto($appmt);?>
	   <?php if($otherAppmt!=''){?>
       <h1 class="col2">其它房间 </h1>
	   <?php echo $otherAppmt;?>
	   <div class="clr1"></div>
	   <?php }?>
     </div>
   </div>
   <div class="clr"></div>
 </div>
 <div class="clr"></div>
 <script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
     });     
</script> 
 <script src="cp/js/jquery.validate.js" type="text/javascript"></script>
 <?php include("footer.php"); ?>
</body>
</html>
