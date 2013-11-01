<?php
include("access.php");
if(isset($_POST['addedit'])){
	include("../includes/db.conn.php");
	include("../includes/conf.class.php");
	include("../includes/admin.class.php");
	$bsiAdminMain->apartmentDetailsentryform();
	$direc=mysql_real_escape_string($_POST['flag']);
	if($direc != 0){
		header("location:apartment-list.php?client_id=".base64_encode($direc));
	}else{
	   header("location:apartment-list.php");
	}
	exit;	
}
include("header.php"); 
if(isset($_GET['flag'])){
	$flag=mysql_real_escape_string($_GET['flag']);
	
}else{
	$flag=0;
}
if(isset($_GET['id']) && $_GET['id'] != ""){
	$id = $bsiCore->ClearInput(base64_decode($_GET['id']));
	if($id){
		$row = mysql_fetch_assoc(mysql_query($bsiCore->sqlApartment($id)));
		$apmtType = $bsiCore->getApmtTypeCombobox($row['appmt_type_id']);
		// $locationTypeArray=explode(',',$row['locationTypeArray']);
		$locationTypeArray = json_decode($row['locationTypeArray'],true);
		$locationType = $bsiCore->getApmtLocationTypeList($locationTypeArray);
		$featureArr = json_decode($row['features'],true);
		$featureKeysHtml = $bsiCore->getApmtFeatureKeyList($featureArr);
		$rowf = $bsiCore->getApmtFeatures($row['appmt_id']);
		$getfacilityhtml = $bsiAdminMain->showAllFacility($row['appmt_id']); 
	}else{
		$row  = NULL;
		$rowf = NULL;
		$apmtType = $bsiCore->getApmtTypeCombobox();
		$locationType = $bsiCore->getApmtLocationTypeList();
		$featureKeysHtml = $bsiCore->getApmtFeatureKeyList();
		$getfacilityhtml = $bsiAdminMain->showAllFacility(); 
	}
}else{
	header("location:apartment-list.php");	
	exit;
}
?>
<link rel="stylesheet" type="text/css" href="css/jquery.validate.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$('#submitappmt').click(function(){
			if($('#appmt_type_id').val() == ""){
				$('#showmsg').html('<font color="#FF0000">请选择房间类型.</font>');
				$('#appmt_type_id').css({'background-color' : '#FDE3ED'});
				$('#appmt_type_id').focus();
				return false;	
			}
		});
		$('#appmt_type_id').change(function(){
			if($('#appmt_type_id').val() != ""){
				$('#showmsg').html('');
				$('#appmt_type_id').css({'background-color' : ''});
			}else{
				$('#showmsg').html('<font color="#FF0000">请选择房间类型.</font>');
				$('#appmt_type_id').css({'background-color' : '#FDE3ED'});
			}
		});
	});
	function getChildLT(){
		
	}
</script>
<script type='text/javascript'>
	CharacterCount = function(TextArea,FieldToCount){
	var desc_short = document.getElementById(TextArea);
	var myLabel    = document.getElementById(FieldToCount); 
	if(!desc_short || !myLabel){return false}; // catches errors
	var MaxChars   =  desc_short.maxLengh;
	if(!MaxChars){MaxChars =  desc_short.getAttribute('maxlength') ; }; 	if(!MaxChars){return false};
	var remainingChars = MaxChars - desc_short.value.length
	myLabel.innerHTML  = remainingChars+" 剩余字符数 "+MaxChars
}
//SETUP!!
setInterval(function(){CharacterCount('desc_short','CharCountLabel1')},55);
</script>
<div id="container-inside"><span style="font-size:16px; font-weight:bold;">添加编辑房间</span>
  <hr />
  <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" id="form1" enctype="multipart/form-data">
      <input type="hidden" name="flag" value="<?php echo $flag;?>">
    <table cellpadding="5" cellspacing="5" border="0" width="100%">
      <tr>
        <td width="150px"><strong>房间类型:</strong></td>
        <td><select name="appmt_type_id" id="appmt_type_id">
            <?php echo $apmtType;?>
          </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="showmsg"></span></td>
      </tr>
      <tr>
        <td><strong>房间名:</strong></td>
        <td><input type="text" class="required" name="appmt_name" id="appmt_name" value="<?php echo $row['appmt_name'];?>" style="width:200px;"></td>
      </tr>
      <tr>
        <td><strong>地址 :</strong></td>
        <td><input type="text" class="required" name="addr1" id="addr1" value="<?php echo $row['addr1'];?>" style="width:200px;"></td>
      </tr>
      <tr style="display:none;">
        <td><strong>地址 2:</strong></td>
        <td><input type="text" name="addr2" id="addr2" value="<?php echo $row['addr2'];?>" style="width:200px;"></td>
      </tr>
	  <tr>
        <td><strong>省:</strong></td>
        <td><input type="text" class="required" name="state" id="state" value="<?php echo $row['state'];?>" style="width:200px;"></td>
      </tr>
      <tr>
        <td><strong>城市:</strong></td>
        <td><input type="text" class="required" name="city" id="city" value="<?php echo $row['city'];?>" style="width:200px;"></td>
      </tr>
      <tr>
        <td><strong>区/县:</strong></td>
        <td><input type="text" class="required" name="district" id="district" value="<?php echo $row['district'];?>" style="width:200px;"></td>
      </tr>
	  <tr>
        <td><strong>地段:</strong></td>
        <td><input type="text" class="required" name="street" id="street" value="<?php echo $row['street'];?>" style="width:200px;"></td>
      </tr>
	  <tr>
        <td><strong>地理位置:</strong></td>
        <td>
		<div><?php echo $locationType;?></div>
		</td>
      </tr>
      <tr style="display:none;">
        <td><strong>国家:</strong></td>
        <td><input type="text" class="required" name="country" id="country" value="中国" style="width:200px;"></td>
      </tr>
      <tr style="display:none;">
        <td><strong>邮政编码:</strong></td>
        <td><input type="text" class="required" name="zipcode" id="zipcode" value="<?php echo $row['zipcode'];?>" style="width:60px;"></td>
      </tr>
      <tr style="display:none;">
        <td><strong>房间电话:</strong></td>
        <td><input type="text" class="required" name="phone" id="phone" value="4008006320" style="width:90px;" ></td>
      </tr>
      <tr>
        <td valign="top"><strong>短描述:</strong></td>
        <td><textarea name="short_desc" id="desc_short" cols="90" rows="3" class="required" maxlength='300'><?php echo $row['short_desc'];?>
</textarea><div id='CharCountLabel1'></div></td>
      </tr>
      <tr>
        <td valign="top"><strong>长描述:</strong></td>
        <td><textarea name="long_desc" class="ckeditor"><?php echo $row['long_desc'];?>
</textarea></td>
      </tr>
	  <tr>
		<td valign="top"><strong>地图经纬度:</strong></td>
		<td>
			<input type="text" class="required" name="latitude" id="latitude" value="<?php echo $row['lat'];?>" style="width:110px;" >
			<input type="text" class="required" name="longitude" id="longitude" value="<?php echo $row['longitude'];?>" style="width:110px;" >
			
			<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1bd2776e1c14f18c281b31e3fa285f50"></script>
			<div id="allmap" style="width:575px;height:400px;overflow: hidden;margin:0;"></div> 
            <script type="text/javascript">

			// 百度地图API功能
			var map = new BMap.Map("allmap");            // 创建Map实例
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
			
			<!--
			<div id="map-canvas" style="width:575px;height:400px;">
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
		</td>
	  </tr>
      <tr>
        <td><strong>房间图片:</strong></td>
        <input type="hidden" name="pre_img" value="<?php echo $row['default_img'];?>" />
        <td><input type="file" name="default_img" id="default_img"/>
          <?php if($row['default_img'] != ""){?>
          <span>&nbsp;&nbsp;&nbsp;&nbsp;<a rel="collection" href="../gallery/ApartImage/<?php echo $row['default_img'];?>" target="_blank"><strong>查看图片</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;删除图片?<input type="checkbox" name="deldefault" id="deldefault" /></span><?php }else{ echo "&nbsp;&nbsp;&nbsp;&nbsp; <b>没有图片</b>";} ?></td>
      </tr>
      <tr>
        <td><strong>房间平面图片:</strong></td>
        <input type="hidden" name="pre_floor_img" value="<?php echo $row['apart_floor_img'];?>" />
        <td><input type="file" name="apart_floor_img" id="apart_floor_img"/>
          <?php if($row['apart_floor_img'] != ""){?>
          <span>&nbsp;&nbsp;&nbsp;&nbsp;<a rel="collection" href="../gallery/ApartFloor/<?php echo $row['apart_floor_img'];?>" target="_blank"><strong>查看图片</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;删除平面图?<input type="checkbox" name="delfloor" id="delfloor" /></span><?php }else{ echo "&nbsp;&nbsp;&nbsp;&nbsp; <b>没有图片</b>";} ?></td>
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
        <td colspan="4"  style="font-size:16px;"><strong>房间特色</strong><br />
          <hr style="color:#000;"/></td>
      </tr>
	  <?php echo $featureKeysHtml;?>
	  <!--
      <tr>
        <td width="150px"><strong>房间大小:</strong></td>
        <td width="230px"><input type="text" name="appmt_size" class="" id="appmt_size" value="<?php echo $rowf['appmt_size'];?>" style="width:40px;" >
          <span style="font-size:12px; color:#FFF;">&nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?></span></td>
        <td width="150px"><strong>房间数量:</strong></td>
        <td><input type="text" name="apptmt_lot_size" id="apptmt_lot_size" class="" value="<?php echo $rowf['apptmt_lot_size'];?>" style="width:40px;" >
          <span style="font-size:12px; color:#FFF;">&nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?></span></td>
      </tr>
      <tr>
        <td><strong>房间床位:</strong></td>
        <td><input type="text" name="bedroom" id="bedroom" class="digits" value="<?php echo $rowf['bedroom'];?>" style="width:30px;" ></td>
        <td><strong>房间浴室:</strong></td>
        <td><input type="text" name="bathroom" id="bathroom" class="digits" value="<?php echo $rowf['bathroom'];?>" style="width:30px;" ></td>
      </tr>
      <tr>
        <td><strong>车库:</strong></td>
        <td><input type="text" name="car_garage" id="car_garage" class="digits" value="<?php echo $rowf['car_garage'];?>" style="width:30px;" ></td>
        <td><strong>车库大小:</strong></td>
        <td><input type="text" name="garage_size" id="garage_size" class="" value="<?php echo $rowf['garage_size'];?>" style="width:40px;" >
          <span style="font-size:12px; color:#FFF;">&nbsp;<?php echo $bsiCore->config['conf_mesurment_unit'];?></span></td>
      </tr>
      <tr>
        <td><strong>房间总数:</strong></td>
        <td><input type="text" name="total_rooms" id="total_rooms" class="digits" value="<?php echo $rowf['total_rooms'];?>" style="width:30px;" ></td>
        <td><strong>地下室:</strong></td>
        <td><input type="text" name="basement" id="basement" class="" value="<?php echo $rowf['basement'];?>" style="width:90px;" ></td>
      </tr>
      <tr>
        <td><strong>楼层:</strong></td>
        <td><input type="text" name="floors" id="floors" class="digits" value="<?php echo $rowf['floors'];?>" style="width:30px;" ></td>
        <td><strong>建造年份:</strong></td>
        <td><input type="text" name="year_of_build" class="digits" id="year_of_build" value="<?php echo $rowf['year_of_build'];?>" style="width:30px;" ></td>
      </tr>
	  -->
      
      <tr><td colspan="4" style="height:2px;" valign="top"><hr style="color:#000;"/></td></tr>
	  <tr>
        <td width="80px"><strong>状态:</strong></td>
		<td>
        <?php
               if($row['status'] == 1){
	         ?>
          <input type="checkbox" name="status" id="status" checked="checked" />
          <?php
               }else{
            ?>
          <input type="checkbox" name="status" id="status" />
          <?php
               }
           ?></td>
      </tr>
      <tr>
        <td>
		<input type="hidden" name="addedit" value="<?php echo $id;?>"></td>
		<td><input type="submit" value="Submit" id="submitappmt" name="submitCapacity" style="background:#e5f9bb; cursor:pointer; cursor:hand;"/>
		</td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript">
	$().ready(function() {
		$("#form1").validate();
     });     
</script> 
<script src="ckeditor/ckeditor_basic.js" type="text/javascript"></script> 
<script src="js/jquery.validate.js" type="text/javascript"></script>
<?php include("footer.php"); ?>
