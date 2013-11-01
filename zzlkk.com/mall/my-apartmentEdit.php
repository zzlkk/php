<?php
include("access.php");
if(isset($_POST['addedit'])){
	include("includes/db.conn.php");
	include("includes/conf.class.php");
	$bsiCore->insertpropertyDetails(mysql_real_escape_string($_POST['addedit']));
	header("location:my-apartList.php"); 
	exit;
}
include("includes/db.conn.php");
include("includes/conf.class.php");
include("includes/admin.class.php");
if(isset($_GET['pageEdit']) && $_GET['pageEdit'] != ""){
	$id = $bsiCore->ClearInput(base64_decode($_GET['pageEdit']));
	if($id){
		$row      = mysql_fetch_assoc(mysql_query($bsiCore->sqlApartment($id)));
		$apmtType = $bsiCore->getApmtTypeCombobox($row['appmt_type_id']);
		$locationTypeArray = json_decode($row['locationTypeArray'],true);
		$locationType = $bsiCore->getApmtLocationTypeList($locationTypeArray);
		$featureArr = json_decode($row['features'],true);
		$featureKeysHtml = $bsiCore->getApmtFeatureKeyList($featureArr);
		$rowf     = $bsiCore->getApmtFeatures($row['appmt_id']);
		$getfacilityhtml = $bsiAdminMain->showAllFacility($row['appmt_id']); 
		$rentType = array(1=>"Night", 2=>"Week", 3=>"Month");
		$rentRow  = mysql_fetch_assoc(mysql_query("select * from bsi_priceplan where appmt_id=".$id));
	}
}else{
	header("location:my-account.php");	
	exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
	<title>
    <?=$bsiCore->config['conf_apartment_name']?>
    </title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/accordionmenu.css" rel="stylesheet" type="text/css" />
	<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-validate.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/menu/superfish.js"></script>
	<script src="cp/ckeditor/ckeditor_basic.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(function(){
			jQuery('ul.sf-menu').superfish();
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
		myLabel.innerHTML  = remainingChars+" Characters Remaining of Maximum "+MaxChars
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
      <div id="container-inside" style="padding-top:0px !important;">
        <?php 
        if(isset($_REQUEST['pageEdit']) && $_REQUEST['pageEdit'] != ""){
    ?>
        <form action="<?=$_SERVER['PHP_SELF']?>" method="post" id="form1" name="form1" enctype="multipart/form-data">
          <table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tr>
              <td width="25%"><strong>房间类型:</strong></td>
              <td nowrap="nowrap"><select name="appmt_type_id" id="appmt_type_id" class="home-select required">
                  <?=$apmtType?>
                </select></td>
            </tr>
            <tr>
              <td><strong>房间名:</strong></td>
              <td><input type="text" class="required home-input" name="appmt_name" id="appmt_name" value="<?=$row['appmt_name']?>" style="width:200px;"></td>
            </tr>
            <tr>
              <td><strong>地址 1:</strong></td>
              <td><input type="text" class="required home-input" name="addr1" id="addr1" value="<?=$row['addr1']?>" style="width:200px;">
              </td>
            </tr>
            <tr style="display:none">
              <td><strong>地址 2:</strong></td>
              <td><input type="text" name="addr2" class="home-input" id="addr2" value="<?=$row['addr2']?>" style="width:200px;">
              </td>
            </tr>
            <tr>
              <td><strong>城市:</strong></td>
              <td><input type="text" class="required home-input" name="acity" id="city" value="<?=$row['city']?>" style="width:200px;">
              </td>
            </tr>
            <tr>
              <td><strong>省:</strong></td>
              <td><input type="text" class="required home-input" name="astate" id="state" value="<?=$row['state']?>" style="width:200px;">
              </td>
            </tr>
			<tr>
				<td><strong>地段:</strong></td>
				<td><input type="text" class="required home-input" name="street" id="street" value="<?php echo $row['street'];?>" style="width:200px;"></td>
			</tr>
			<tr>
				<td><strong>地理位置:</strong></td>
				<td>
				<div><?php echo $locationType;?></div>
				</td>
			</tr>
            <tr style="display:none">
              <td><strong>国家:</strong></td>
              <td><input type="text" class="required home-input" name="acountry" id="country" value="<?=$row['country']?>" style="width:200px;">
              </td>
            </tr>
            <tr style="display:none">
              <td><strong>邮政编码:</strong></td>
              <td><input type="text" class="required home-input" name="azipcode" id="zipcode" value="<?=$row['zipcode']?>" style="width:60px;">
              </td>
            </tr>
            <tr style="display:none">
              <td><strong>房价电话:</strong></td>
              <td><input type="text" class="required home-input" name="aphone" id="phone" value="<?=$row['phone']?>" style="width:90px;" >
              </td>
            </tr>
            <tr>
                <td><strong>房间租金:</strong></td>
                <td><table><tr><td><input type="text" class="required home-input" name="arent" id="arent" value="<?php echo $rentRow['price']; ?>"  style="width:80px;"></td><td>&nbsp;/&nbsp;<?=$rentType[$bsiCore->config['conf_rental_type']]?></td></tr></table></td>
              </tr>
            <tr>
              <td valign="top"><strong>简短描述:</strong></td>
              <td><textarea name="short_desc" id="desc_short" cols="90" rows="3" class="required" maxlength='300'><?=$row['short_desc']?>
</textarea>
                <div id='CharCountLabel1'></div></td>
            </tr>
            <tr>
              <td valign="top"><strong>介绍:</strong></td>
              <td><textarea name="long_desc" class="ckeditor"><?=$row['long_desc']?>
				</textarea></td>
            </tr>
			<tr>
				<td valign="top"><strong>地图经纬度:</strong></td>
				<td>
					<input type="text" class="required" name="latitude" id="latitude" value="<?php echo $row['lat'];?>" style="width:110px;" >
					<input type="text" class="required" name="longitude" id="longitude" value="<?php echo $row['longitude'];?>" style="width:110px;" >
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
				</td>
			</tr>
            <tr>
              <td><strong>房间图片:</strong></td>
              <input type="hidden" name="pre_img" value="<?=$row['default_img']?>" />
              <td><input type="file" name="default_img" id="default_img"/>
                <?php if($row['default_img'] != ""){?>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;<a rel="collection" href="gallery/ApartImage/<?=$row['default_img']?>" target="_blank"><strong>View Image</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;Delete Image?
                <input type="checkbox" name="deldefault" id="deldefault" />
                </span>
                <?php }else{ echo "&nbsp;&nbsp;&nbsp;&nbsp; <b>No Image</b>";} ?></td>
            </tr>
            <tr>
              <td nowrap="nowrap"><strong>房间平面图:</strong></td>
              <input type="hidden" name="pre_floor_img" value="<?=$row['apart_floor_img']?>" />
              <td><input type="file" name="apart_floor_img" id="apart_floor_img"/> 
                <?php if($row['apart_floor_img'] != ""){?>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;<a rel="collection" href="gallery/ApartFloor/<?=$row['apart_floor_img']?>" target="_blank"><strong>View Image</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;Delete Floor Image?
                <input type="checkbox" name="delfloor" id="delfloor" />
                </span>
                <?php }else{ echo "&nbsp;&nbsp;&nbsp;&nbsp; <b>No Image</b>";} ?></td>
            </tr>
          </table>
          <br>
          <table cellpadding="5" cellspacing="5" border="0" width="100%">
            <tr>
              <td style="font-size:16px;"><strong>房间设施:</strong><br />
                <hr style="color:#000;"/></td>
            </tr>
            <tr>
              <td><?=$getfacilityhtml?></td>
            </tr>
          </table>
          <br>
          <table cellpadding="4" cellspacing="1" border="0" width="100%">
            <tr>
              <td colspan="4" style="font-size:16px;"><strong>房间特色</strong><br />
                <hr style="color:#000;"/></td>
            </tr>
			<?php echo $featureKeysHtml;?>
			<!--
            <tr>
              <td><strong>房间大小:</strong></td>
              <td width="220px"><input type="text" name="appmt_size" class="home-input" id="appmt_size" value="<?=$rowf['appmt_size']?>" style="width:40px;" />
                <span style="font-size:12px; color:#FFF;">&nbsp;Sq.ft</span></td>
              <td width="150px"><strong>Apartment Lot Size:</strong></td>
              <td><input type="text" name="apptmt_lot_size" id="apptmt_lot_size" class="home-input" value="<?=$rowf['apptmt_lot_size']?>" style="width:40px;" />
                <span style="font-size:12px; color:#FFF;">&nbsp;Sq.ft</span></td>
            </tr>
            <tr>
              <td><strong>房间床位</strong></td>
              <td><input type="text" name="bedroom" id="bedroom" class="digits home-input" value="<?=$rowf['bedroom']?>" style="width:30px;" ></td>
              <td nowrap="nowrap"><strong>房间浴室:</strong></td>
              <td><input type="text" name="bathroom" id="bathroom" class="digits home-input" value="<?=$rowf['bathroom']?>" style="width:30px;" ></td>
            </tr>
            <tr>
              <td><strong>车库:</strong></td>
              <td><input type="text" name="car_garage" id="car_garage" class="digits home-input" value="<?=$rowf['car_garage']?>" style="width:30px;" ></td>
              <td><strong>车库大小:</strong></td>
              <td><input type="text" name="garage_size" id="garage_size" class="home-input" value="<?=$rowf['garage_size']?>" style="width:40px;" >
                <span style="font-size:12px; color:#FFF;">&nbsp;Sq.ft</span></td>
            </tr>
            <tr>
              <td><strong>房间总数:</strong></td>
              <td><input type="text" name="total_rooms" id="total_rooms" class="digits home-input" value="<?=$rowf['total_rooms']?>" style="width:30px;" ></td>
              <td><strong>地下室:</strong></td>
              <td><input type="text" name="basement" id="basement" class="home-input" value="<?=$rowf['basement']?>" style="width:90px;" ></td>
            </tr>
            <tr>
              <td><strong>楼层:</strong></td>
              <td><input type="text" name="floors" id="floors" class="digits home-input" value="<?=$rowf['floors']?>" style="width:30px;" ></td>
              <td><strong>建造年份:</strong></td>
              <td><input type="text" name="year_of_build" class="digits home-input" id="year_of_build" value="<?=$rowf['year_of_build']?>" style="width:30px;" ></td>
            </tr>
            -->
            <tr>
              <td colspan="4" style="height:2px;" valign="top"><hr style="color:#000;"/></td>
            </tr>
            <tr>
              <td><input type="hidden" name="addedit" value="<?=$id?>"></td>
              <td><input type="submit" value="Submit" id="submitappmt" name="submitCapacity" class="btn1"/></td>
              <td></td>
              <td></td>
            </tr>
			
          </table>
        </form>
        <?php		
			}
		?>
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