<?php
	$bsiAdminMain = new bsiAdminMain();
	class bsiAdminMain
	{		
		public function global_setting(){
			global $bsiCore;
			$global_selects=array();
	
			//date format start
			$dt_format_array = array("mm/dd/yy" => "MM/DD/YYYY", "dd/mm/yy" => "DD/MM/YYYY", "mm-dd-yy" => "MM-DD-YYYY", "dd-mm-yy" => "DD-MM-YYYY", "mm.dd.yy" => "MM.DD.YYYY", "dd.mm.yy" => "DD.MM.YYYY", "yy-mm-dd" => "YYYY-MM-DD");
			$select_dt_format = "";
			foreach($dt_format_array as $key => $value){
				if($key == $bsiCore->config['conf_dateformat']){
					$select_dt_format .= '<option value="'.$key.'" selected="selected">'.$value.'</option>';
				}else{
					$select_dt_format .= '<option value="'.$key.'" >'.$value.'</option>';
				}
			}
			$global_selects['select_dt_format'] = $select_dt_format;
			//date format end
		
			$room_lock = array('200' => '2 Minute',
							   '500' => '5 Minute',
							   '1000' => '10 Minute',
							   '2000' => '20 Minute',
							   '3000' => '30 Minute');
				
			$select_room_lock="";
			foreach($room_lock as $key => $value) {
				if($key == $bsiCore->config['conf_booking_exptime']){
					$select_room_lock.='<option value="' . $key . '" selected="selected">' . $value . '</option>' . "\n";
				}else{
					$select_room_lock.='<option value="' . $key . '">' . $value . '</option>' . "\n";
				}
			}
			$global_selects['select_room_lock'] = $select_room_lock;
	
			//timezone_start
			$zonelist = array('Kwajalein' => '(GMT-12:00) International Date Line West',
							  'Pacific/Midway' => '(GMT-11:00) Midway Island',
							  'Pacific/Samoa' => '(GMT-11:00) Samoa',
							  'Pacific/Honolulu' => '(GMT-10:00) Hawaii',
							  'America/Anchorage' => '(GMT-09:00) Alaska',
							  'America/Los_Angeles' => '(GMT-08:00) Pacific Time (US &amp; Canada)',
							  'America/Tijuana' => '(GMT-08:00) Tijuana, Baja California',
							  'America/Denver' => '(GMT-07:00) Mountain Time (US &amp; Canada)',
							  'America/Chihuahua' => '(GMT-07:00) Chihuahua',
							  'America/Mazatlan' => '(GMT-07:00) Mazatlan',
							  'America/Phoenix' => '(GMT-07:00) Arizona',
							  'America/Regina' => '(GMT-06:00) Saskatchewan',
							  'America/Tegucigalpa' => '(GMT-06:00) Central America',
							  'America/Chicago' => '(GMT-06:00) Central Time (US &amp; Canada)',
							  'America/Mexico_City' => '(GMT-06:00) Mexico City',
							  'America/Monterrey' => '(GMT-06:00) Monterrey',
							  'America/New_York' => '(GMT-05:00) Eastern Time (US &amp; Canada)',
							  'America/Bogota' => '(GMT-05:00) Bogota',
							  'America/Lima' => '(GMT-05:00) Lima',
							  'America/Rio_Branco' => '(GMT-05:00) Rio Branco',
							  'America/Indiana/Indianapolis' => '(GMT-05:00) Indiana (East)',
							  'America/Caracas' => '(GMT-04:30) Caracas',
							  'America/Halifax' => '(GMT-04:00) Atlantic Time (Canada)',
							  'America/Manaus' => '(GMT-04:00) Manaus',
							  'America/Santiago' => '(GMT-04:00) Santiago',
							  'America/La_Paz' => '(GMT-04:00) La Paz',
							  'America/St_Johns' => '(GMT-03:30) Newfoundland',
							  'America/Argentina/Buenos_Aires' => '(GMT-03:00) Georgetown',
							  'America/Sao_Paulo' => '(GMT-03:00) Brasilia',
							  'America/Godthab' => '(GMT-03:00) Greenland',
							  'America/Montevideo' => '(GMT-03:00) Montevideo',
							  'Atlantic/South_Georgia' => '(GMT-02:00) Mid-Atlantic',
							  'Atlantic/Azores' => '(GMT-01:00) Azores',
							  'Atlantic/Cape_Verde' => '(GMT-01:00) Cape Verde Is.',
							  'Europe/Dublin' => '(GMT) Dublin',
							  'Europe/Lisbon' => '(GMT) Lisbon',
							  'Europe/London' => '(GMT) London',
							  'Africa/Monrovia' => '(GMT) Monrovia',
							  'Atlantic/Reykjavik' => '(GMT) Reykjavik',
							  'Africa/Casablanca' => '(GMT) Casablanca',
							  'Europe/Belgrade' => '(GMT+01:00) Belgrade',
							  'Europe/Bratislava' => '(GMT+01:00) Bratislava',
							  'Europe/Budapest' => '(GMT+01:00) Budapest',
							  'Europe/Ljubljana' => '(GMT+01:00) Ljubljana',
							  'Europe/Prague' => '(GMT+01:00) Prague',
							  'Europe/Sarajevo' => '(GMT+01:00) Sarajevo',
							  'Europe/Skopje' => '(GMT+01:00) Skopje',
							  'Europe/Warsaw' => '(GMT+01:00) Warsaw',
							  'Europe/Zagreb' => '(GMT+01:00) Zagreb',
							  'Europe/Brussels' => '(GMT+01:00) Brussels',
							  'Europe/Copenhagen' => '(GMT+01:00) Copenhagen',
							  'Europe/Madrid' => '(GMT+01:00) Madrid',
							  'Europe/Paris' => '(GMT+01:00) Paris',
							  'Africa/Algiers' => '(GMT+01:00) West Central Africa',
							  'Europe/Amsterdam' => '(GMT+01:00) Amsterdam',
							  'Europe/Berlin' => '(GMT+01:00) Berlin',
							  'Europe/Rome' => '(GMT+01:00) Rome',
							  'Europe/Stockholm' => '(GMT+01:00) Stockholm',
							  'Europe/Vienna' => '(GMT+01:00) Vienna',
							  'Europe/Minsk' => '(GMT+02:00) Minsk',
							  'Africa/Cairo' => '(GMT+02:00) Cairo',
							  'Europe/Helsinki' => '(GMT+02:00) Helsinki',
							  'Europe/Riga' => '(GMT+02:00) Riga',
							  'Europe/Sofia' => '(GMT+02:00) Sofia',
							  'Europe/Tallinn' => '(GMT+02:00) Tallinn',
							  'Europe/Vilnius' => '(GMT+02:00) Vilnius',
							  'Europe/Athens' => '(GMT+02:00) Athens',
							  'Europe/Bucharest' => '(GMT+02:00) Bucharest',
							  'Europe/Istanbul' => '(GMT+02:00) Istanbul',
							  'Asia/Jerusalem' => '(GMT+02:00) Jerusalem',
							  'Asia/Amman' => '(GMT+02:00) Amman',
							  'Asia/Beirut' => '(GMT+02:00) Beirut',
							  'Africa/Windhoek' => '(GMT+02:00) Windhoek',
							  'Africa/Harare' => '(GMT+02:00) Harare',
							  'Asia/Kuwait' => '(GMT+03:00) Kuwait',
							  'Asia/Riyadh' => '(GMT+03:00) Riyadh',
							  'Asia/Baghdad' => '(GMT+03:00) Baghdad',
							  'Africa/Nairobi' => '(GMT+03:00) Nairobi',
							  'Asia/Tbilisi' => '(GMT+03:00) Tbilisi',
							  'Europe/Moscow' => '(GMT+03:00) Moscow',
							  'Europe/Volgograd' => '(GMT+03:00) Volgograd',
							  'Asia/Tehran' => '(GMT+03:30) Tehran',
							  'Asia/Muscat' => '(GMT+04:00) Muscat',
							  'Asia/Baku' => '(GMT+04:00) Baku',
							  'Asia/Yerevan' => '(GMT+04:00) Yerevan',
							  'Asia/Yekaterinburg' => '(GMT+05:00) Ekaterinburg',
							  'Asia/Karachi' => '(GMT+05:00) Karachi',
							  'Asia/Tashkent' => '(GMT+05:00) Tashkent',
							  'Asia/Calcutta' => '(GMT+05:30) Calcutta',
							  'Asia/Colombo' => '(GMT+05:30) Sri Jayawardenepura',
							  'Asia/Katmandu' => '(GMT+05:45) Kathmandu',
							  'Asia/Dhaka' => '(GMT+06:00) Dhaka',
							  'Asia/Almaty' => '(GMT+06:00) Almaty',
							  'Asia/Novosibirsk' => '(GMT+06:00) Novosibirsk',
							  'Asia/Rangoon' => '(GMT+06:30) Yangon (Rangoon)',
							  'Asia/Krasnoyarsk' => '(GMT+07:00) Krasnoyarsk',
							  'Asia/Bangkok' => '(GMT+07:00) Bangkok',
							  'Asia/Jakarta' => '(GMT+07:00) Jakarta',
							  'Asia/Brunei' => '(GMT+08:00) Beijing',
							  'Asia/Chongqing' => '(GMT+08:00) Chongqing',
							  'Asia/Hong_Kong' => '(GMT+08:00) Hong Kong',
							  'Asia/Urumqi' => '(GMT+08:00) Urumqi',
							  'Asia/Irkutsk' => '(GMT+08:00) Irkutsk',
							  'Asia/Ulaanbaatar' => '(GMT+08:00) Ulaan Bataar',
							  'Asia/Kuala_Lumpur' => '(GMT+08:00) Kuala Lumpur',
							  'Asia/Singapore' => '(GMT+08:00) Singapore',
							  'Asia/Taipei' => '(GMT+08:00) Taipei',
							  'Australia/Perth' => '(GMT+08:00) Perth',
							  'Asia/Seoul' => '(GMT+09:00) Seoul',
							  'Asia/Tokyo' => '(GMT+09:00) Tokyo',
							  'Asia/Yakutsk' => '(GMT+09:00) Yakutsk',
							  'Australia/Darwin' => '(GMT+09:30) Darwin',
							  'Australia/Adelaide' => '(GMT+09:30) Adelaide',
							  'Australia/Canberra' => '(GMT+10:00) Canberra',
							  'Australia/Melbourne' => '(GMT+10:00) Melbourne',
							  'Australia/Sydney' => '(GMT+10:00) Sydney',
							  'Australia/Brisbane' => '(GMT+10:00) Brisbane',
							  'Australia/Hobart' => '(GMT+10:00) Hobart',
							  'Asia/Vladivostok' => '(GMT+10:00) Vladivostok',
							  'Pacific/Guam' => '(GMT+10:00) Guam',
							  'Pacific/Port_Moresby' => '(GMT+10:00) Port Moresby',
							  'Asia/Magadan' => '(GMT+11:00) Magadan',
							  'Pacific/Fiji' => '(GMT+12:00) Fiji',
							  'Asia/Kamchatka' => '(GMT+12:00) Kamchatka',
							  'Pacific/Auckland' => '(GMT+12:00) Auckland',
							  'Pacific/Tongatapu' => '(GMT+13:00) Nukualofa');
				
			$select_timezone="";
			foreach($zonelist as $key => $value) {
				if($key == $bsiCore->config['conf_apartment_timezone']){
					$select_timezone.='		<option value="' . $key . '" selected="selected">' . $value . '</option>' . "\n";
				}else{
					$select_timezone.='		<option value="' . $key . '">' . $value . '</option>' . "\n";
				}
			}
			$global_selects['select_timezone']=$select_timezone;
		 
			 if($bsiCore->config['conf_booking_turn_off']==0){
				 $select_booking_turn  ='<option value="0" selected="selected">Turn On</option>' . "\n";
				 $select_booking_turn .='<option value="1">Turn Off</option>' . "\n";
			 }else{
				 $select_booking_turn  ='<option value="1" selected="selected">Turn Off</option>' . "\n";
				 $select_booking_turn .='<option value="0">Turn On</option>' . "\n";
			 }
			 $global_selects['select_booking_turn']=$select_booking_turn;
		 
			 /*$select_min_booking="";
			 for($k=1; $k<11; $k++){
				if($bsiCore->config['conf_min_night_booking']==$k){
					$select_min_booking.='		<option value="' . $k . '" selected="selected">' . $k . '</option>' . "\n";
				}else{
					$select_min_booking.='		<option value="' . $k . '">' . $k . '</option>' . "\n";
				}
			 }
			$global_selects['select_min_booking'] = $select_min_booking;*/
			return $global_selects;
		}
		
		public function global_setting_post(){
			global $bsiCore;
			$this->configure_update('conf_apartment_name', $bsiCore->ClearInput($_POST['conf_apartment_name']));
			$this->configure_update('conf_apartment_streetaddr', $bsiCore->ClearInput($_POST['conf_apartment_streetaddr']));
			$this->configure_update('conf_apartment_city', $bsiCore->ClearInput($_POST['conf_apartment_city']));
			$this->configure_update('conf_apartment_state', $bsiCore->ClearInput($_POST['conf_apartment_state']));
			$this->configure_update('conf_apartment_country', $bsiCore->ClearInput($_POST['conf_apartment_country']));
			$this->configure_update('conf_apartment_zipcode', $bsiCore->ClearInput($_POST['conf_apartment_zipcode']));
			$this->configure_update('conf_apartment_phone', $bsiCore->ClearInput($_POST['conf_apartment_phone']));
			$this->configure_update('conf_apartment_fax', $bsiCore->ClearInput($_POST['conf_apartment_fax']));
			$this->configure_update('conf_apartment_email', $bsiCore->ClearInput($_POST['conf_apartment_email'])); 	
		   $this->configure_update('conf_currency_symbol', htmlentities($bsiCore->ClearInput($_POST['conf_currency_symbol']),ENT_COMPAT,'utf-8'));
			$this->configure_update('conf_currency_code', $bsiCore->ClearInput($_POST['conf_currency_code']));
			$this->configure_update('conf_tax_amount', $bsiCore->ClearInput($_POST['conf_tax_amount']));
			$this->configure_update('conf_dateformat', $bsiCore->ClearInput($_POST['conf_dateformat']));
			$this->configure_update('conf_booking_exptime', $bsiCore->ClearInput($_POST['conf_booking_exptime']));
			$this->configure_update('conf_mesurment_unit', $bsiCore->ClearInput($_POST['conf_mesurment_unit']));
			$this->configure_update('conf_apartment_timezone', $bsiCore->ClearInput($_POST['conf_apartment_timezone']));
			//$this->configure_update('conf_booking_turn_off', $bsiCore->ClearInput($_POST['conf_booking_turn_off']));
			$this->configure_update('conf_server_os', $bsiCore->ClearInput($_POST['conf_server_os']));
			$this->configure_update('conf_notification_email', $bsiCore->ClearInput($_POST['conf_notification_email']));
			$this->configure_update('conf_advance_payment', $bsiCore->ClearInput($_POST['conf_advance_payment']));
		}
	
	
		private function configure_update($key, $value){
			mysql_query("update bsi_configure set conf_value='".$value."' where conf_key='".$key."'");
		}
		
		public function generateOption($val=0){
			$htmlOption = '';
			$arr = array(0 => "No", 1 => "Yes");
			foreach($arr as $key => $value){
				if($val == $key){
					$htmlOption .= '<option value="'.$key.'" selected="selected">'.$value.'</option>';
				}else{
					$htmlOption .= '<option value="'.$key.'">'.$value.'</option>';	
				}
			}
			return $htmlOption;
		}
		
		public function modulevaluepost(){
			global $bsiCore;			
			$conf_booking_turn_off = isset($_POST['conf_booking_turn_off']) ? 1 : 0;
			$conf_property_submission = isset($_POST['conf_property_submission']) ? 1 : 0;
			$autoapprove = isset($_POST['autoapprove']) ? 1 : 0;
			if(isset($_POST['listingtype'])){
				$listingtype = $bsiCore->ClearInput($_POST['listingtype']);
				$this->configure_update('conf_apppmt_listing_type', $listingtype);
			}
			if(isset($_POST['price'])){
				$price = $bsiCore->ClearInput($_POST['price']);
				$this->configure_update('conf_appmt_listing_price', $price);
			}
			$this->configure_update('conf_booking_turn_off', $conf_booking_turn_off);
			$this->configure_update('conf_property_submission', $conf_property_submission);
			$this->configure_update('conf_appmt_auto_approve', $autoapprove);
		}
		
		public function payment_gateway(){
			$gateway_value=array();
			$pp_row  = mysql_fetch_assoc(mysql_query("select * from bsi_payment_gateway where gateway_code='pp'"));
			$ap_row = mysql_fetch_assoc(mysql_query("select * from bsi_payment_gateway where gateway_code='ap'"));
			$poa_row = mysql_fetch_assoc(mysql_query("select * from bsi_payment_gateway where gateway_code='poa'"));
			$gateway_value['pp_enabled'] = $pp_row['enabled'];
			$gateway_value['pp_gateway_name'] =$pp_row['gateway_name'];
			$gateway_value['pp_account'] = $pp_row['account'];
			$gateway_value['ap_enabled'] = $ap_row['enabled'];
			$gateway_value['ap_gateway_name'] =$ap_row['gateway_name'];
			$gateway_value['ap_partner'] = $ap_row['partner'];
			$gateway_value['ap_key'] = $ap_row['geteway_key'];
			$gateway_value['poa_enabled']=$poa_row['enabled'];
			$gateway_value['poa_gateway_name']=$poa_row['gateway_name'];		
			return $gateway_value;
		}
	
		public function payment_gateway_post(){
			global $bsiCore;
			$pp = ((isset($_POST['pp'])) ? 1 : 0);
			$pp_title  = mysql_real_escape_string($_POST['pp_title']);
			$paypal_id = mysql_real_escape_string($_POST['paypal_id']);
			$ap = ((isset($_POST['ap'])) ? 1 : 0);
			$ap_title  = mysql_real_escape_string($_POST['ap_title']);
			$ap_partner = mysql_real_escape_string($_POST['ap_partner']);
			$ap_key = mysql_real_escape_string($_POST['ap_key']);
			$poa = ((isset($_POST['poa'])) ? 1 : 0);
			$poa_title = mysql_real_escape_string($_POST['poa_title']);		
			mysql_query("update bsi_payment_gateway set gateway_name='$pp_title', account='$paypal_id', enabled=$pp where gateway_code='pp'");
			$sql = "update bsi_payment_gateway set gateway_name='$ap_title', partner='$ap_partner',geteway_key='$ap_key', enabled=$ap where gateway_code='ap'";
			echo $sql;
			mysql_query("update bsi_payment_gateway set gateway_name='$ap_title', partner='$ap_partner',geteway_key='$ap_key', enabled=$ap where gateway_code='ap'");
			mysql_query("update bsi_payment_gateway set gateway_name='$poa_title',  enabled=$poa where gateway_code='poa'");
		}
		
		public function getEmailContents(){
			global $bsiCore;
			$dropList='<option value="0" selected="selected">---- Select Email Type ----</option>';
			$sql=mysql_query("select * from bsi_email_contents");
			while($rowemailinfo=mysql_fetch_assoc($sql)){
				$dropList.='<option value="'.$rowemailinfo['id'].'">'.$rowemailinfo['email_name'].'</option>';
			}
			return $dropList;
		}
		
		public function updateEmailContent(){	
		   global $bsiCore;
		   $emailsub=$bsiCore->ClearInput($_POST['email_sub']);
		   $emailcon=$bsiCore->ClearInput($_POST['email_con']);
		   $mailid=$bsiCore->ClearInput($_POST['c_update']);
		   mysql_query("update bsi_email_contents set email_subject='".$emailsub."',email_text='".$emailcon."' where id='".$mailid."'");	
		}
		
		
		public function addeditApmtType($id=0){
			global $bsiCore;
			if($id){
				mysql_query("update bsi_apartment_type set appartment_type='".$bsiCore->ClearInput($_POST['appartment_type'])."' where id=".$bsiCore->ClearInput($_POST['addedit']));
			}else{
				mysql_query("insert into bsi_apartment_type (appartment_type) values ('".$bsiCore->ClearInput($_POST['appartment_type'])."')");
			}
		}
		
		public function deleteApmtType($id){
			mysql_query("delete from bsi_apartment_type where id=".$id);
			$result = mysql_query("select appmt_id, default_img, apart_floor_img from bsi_apartment_master where appmt_type_id=".$id);
			if(mysql_num_rows($result)){
				while($row = mysql_fetch_assoc($result)){
					mysql_query("delete from bsi_appmt_facilities where appmt_id=".$row['appmt_id']);
					mysql_query("delete from bsi_appmt_features where appmt_id=".$row['appmt_id']);
					$galleryResult = mysql_query("select img_path from bsi_appmt_gallery where appmt_id=".$row['appmt_id']);
					if(mysql_num_rows($galleryResult)){
						while($rowg = mysql_fetch_assoc($galleryResult)){
							if($rowg['img_path'] != ""){
								unlink("../gallery/ApartImage/".$rowg['img_path']);
								unlink("../gallery/ApartImage/thumb_".$rowg['img_path']);	
							}
						}
					}
					if($row['default_img'] != ""){
						unlink("../gallery/ApartImage/".$row['default_img']);
						unlink("../gallery/ApartImage/thumb_".$row['default_img']);	
					}
					if($row['apart_floor_img'] != ""){
						unlink("../gallery/ApartFloor/".$row['apart_floor_img']);	
					}					
					mysql_query("delete from bsi_appmt_gallery where appmt_id=".$row['appmt_id']);
					$bookResult = mysql_query("select booking_id from bsi_bookings where appmt_id=".$row['appmt_id']);
					if(mysql_num_rows($bookResult)){
						while($rowb = mysql_fetch_assoc($bookResult)){
							mysql_query("delete from bsi_invoice where booking_id=".$rowb['booking_id']);
						}
					}
					mysql_query("delete from bsi_bookings where appmt_id=".$row['appmt_id']);
					mysql_query("delete from bsi_priceplan where appmt_id=".$row['appmt_id']);
					mysql_query("delete from bsi_appmt_user where appmt_id=".$row['appmt_id']);
				}
			}
			mysql_query("delete from bsi_apartment_master where appmt_type_id=".$id);	
		}
		public function deleteLocationType($id){
			mysql_query("delete from bsi_location_type where id=".$id);
		}
		public function deleteDistrictLoc($id){
			mysql_query("delete from bsi_district_type where id=".$id);
		}
		public function deleteFeatureKey($id){
			mysql_query("delete from bsi_features_key where id=".$id);
		}
		public function deleteMessage($id){
			mysql_query("delete from bsi_message where id=".$id);
		}
		public function deleteApmt($id, $front=0){
			mysql_query("delete from bsi_appmt_facilities where appmt_id=".$id);
			mysql_query("delete from bsi_appmt_features where appmt_id=".$id);
			$galleryResult = mysql_query("select img_path from bsi_appmt_gallery where appmt_id=".$id);
			if(mysql_num_rows($galleryResult)){
				while($rowg = mysql_fetch_assoc($galleryResult)){
					if($rowg['img_path'] != ""){
						if($front){
							unlink("gallery/ApartImage/".$rowg['img_path']);
							unlink("gallery/ApartImage/thumb_".$rowg['img_path']);
						}else{
							unlink("../gallery/ApartImage/".$rowg['img_path']);
							unlink("../gallery/ApartImage/thumb_".$rowg['img_path']);	
						}
					}
				}
			}
			mysql_query("delete from bsi_appmt_gallery where appmt_id=".$id);
			$bookResult = mysql_query("select booking_id from bsi_bookings where appmt_id=".$id);
			if(mysql_num_rows($bookResult)){
				while($rowb = mysql_fetch_assoc($bookResult)){
					mysql_query("delete from bsi_invoice where booking_id=".$rowb['booking_id']);
				}
			}
			mysql_query("delete from bsi_bookings where appmt_id=".$id);
			mysql_query("delete from bsi_priceplan where appmt_id=".$id);
			$row = mysql_fetch_assoc(mysql_query("select default_img, apart_floor_img from bsi_apartment_master where appmt_id=".$id));
			if($row['default_img'] != ""){
				if($front){
					unlink("gallery/ApartImage/".$row['default_img']);
					unlink("gallery/ApartImage/thumb_".$row['default_img']);	
				}else{
					unlink("../gallery/ApartImage/".$row['default_img']);
					unlink("../gallery/ApartImage/thumb_".$row['default_img']);	
				}
			}
			if($row['apart_floor_img'] != ""){
				if($front){
					unlink("gallery/ApartFloor/".$row['apart_floor_img']);
				}else{
					unlink("../gallery/ApartFloor/".$row['apart_floor_img']);	
				}
			}	
			mysql_query("delete from bsi_apartment_master where appmt_id=".$id);
			mysql_query("delete from bsi_appmt_user where appmt_id=".$id);	
		}
		
		public function getApartmentTypeListHtml(){
			global $bsiCore;
			$htmlatl = '<tbody>';
			$result = mysql_query($bsiCore->sqlApartmenttype());
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlatl .= '<tr><td>'.$i.'</td><td>'.$row['appartment_type'].'</td><td align="right"><a href="add_edit_apartmentType.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlatl .= '</tbody>';
			return $htmlatl;
		}
		//地理位置类型管理
		public function addeditLocationType($id=0){
			global $bsiCore;
			if($id){
				mysql_query("update bsi_location_type set location_type='".$bsiCore->ClearInput($_POST['location_type'])."',parent_id='".$bsiCore->ClearInput($_POST['parent_id'])."' where id=".$id);
			}else{
				mysql_query("insert into bsi_location_type (location_type,parent_id) values ('".$bsiCore->ClearInput($_POST['location_type'])."','".$bsiCore->ClearInput($_POST['parent_id'])."')");
			}
		}
		//区域与地理位置类型关系管理
		public function addeditDistrictLoc($id=0){
			global $bsiCore;
			//添加地理位置类型字段
			$parentLT = $_POST['locationTypeArray'];
			$pLen = count($parentLT);
			$locationTypeArr = array();
			for($i=0;$i<$pLen;$i++){
				$parentArr = explode("@",$parentLT[$i]);
				$childKey = 'locationChildTypeArray'.$parentArr[0];
				$childStr = "{";
				if(isset($_POST[$childKey])){
					$childLT =  $_POST[$childKey];
					$cLen = count($childLT);
					$childArr = array();
					for($j=0;$j<$cLen;$j++){
						$childArr[$j] = '"'.$j.'":"'.$childLT[$j].'"';
					}
					$childStr .= implode(",",$childArr);
				}
				$childStr .= "}";
				$locationTypeArr[$i] = '{"parent":"'.$parentArr[1].'","child":'.$childStr.'}';
			}
			$locationType = "[".implode(",",$locationTypeArr)."]";
			if($id){
				mysql_query("update bsi_district_type set city='".$bsiCore->ClearInput($_POST['city'])."',district='".$bsiCore->ClearInput($_POST['district'])."',locationType='$locationType' where id=".$id);
			}else{
				mysql_query("insert into bsi_district_type (city,district,locationType) values ('".$bsiCore->ClearInput($_POST['city'])."','".$bsiCore->ClearInput($_POST['district'])."','$locationType')");
			}
		}
		public function getLocationTypeListHtml(){
			global $bsiCore;
			$htmlatl = '<tbody>';
			$result = mysql_query("select a.id,a.location_type,IFNULL(b.location_type,'根类型') as parent_name 
								  from  bsi_location_type a
								  LEFT JOIN bsi_location_type b
								  on a.parent_id = b.id");
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlatl .= '<tr><td>'.$i.'</td><td>'.$row['location_type'].'</td><td>'.$row['parent_name'].'</td><td align="right"><a href="add_edit_locationType.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlatl .= '</tbody>';
			return $htmlatl;
		}
		//获取区域和地理位置关系列表
		public function getDistrictLocListHtml(){
			global $bsiCore;
			$htmlatl = '<tbody>';
			$result = mysql_query("select id,city,district,locationType from  bsi_district_type");
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlatl .= '<tr><td>'.$i.'</td><td>'.$row['city'].'</td><td>'.$row['district'].'</td><td>'.$row['locationType'].'</td><td align="right"><a href="add_edit_districtLoc.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlatl .= '</tbody>';
			return $htmlatl;
		}
		//房间特色键管理
		public function addeditFeatureKey($id=0){
			global $bsiCore;
			if($id){
				mysql_query("update bsi_features_key set feature_key='".$bsiCore->ClearInput($_POST['feature_key'])."' where id=".$id);
			}else{
				mysql_query("insert into bsi_features_key (feature_key) values ('".$bsiCore->ClearInput($_POST['feature_key'])."')");
			}
		}
		//系统消息管理
		public function addeditMessage($id=0){
			global $bsiCore;
			if($id){
				mysql_query("update bsi_message set title='".$bsiCore->ClearInput($_POST['title'])."',content='".$bsiCore->ClearInput($_POST['content'])."' where id=".$id);
			}else{
				mysql_query("insert into bsi_message (title,content) values ('".$bsiCore->ClearInput($_POST['title'])."','".$bsiCore->ClearInput($_POST['content'])."')");
			}
		}
		public function getFeatureKeyListHtml(){
			global $bsiCore;
			$htmlatl = '<tbody>';
			$result = mysql_query($bsiCore->sqlFeatureKey());
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlatl .= '<tr><td>'.$i.'</td><td>'.$row['feature_key'].'</td><td align="right"><a href="add_edit_featureKey.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlatl .= '</tbody>';
			return $htmlatl;
		}
		public function getMessageListHtml(){
			global $bsiCore;
			$htmlatl = '<tbody>';
			$result = mysql_query("select id,title,content from bsi_message");
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlatl .= '<tr><td>'.$i.'</td><td>'.$row['title'].'</td><td align="right"><a href="add_edit_message.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlatl .= '</tbody>';
			return $htmlatl;
		}
		public function getApartmentListHtml($client_id){
			global $bsiCore;
			$appmt_id=array();
			$htmlal = '<tbody>';
			if($client_id != 0){
				$result=mysql_query("select * from bsi_appmt_user where user_id=".$client_id);
				if(mysql_num_rows($result)){
				while($row=mysql_fetch_assoc($result)){
					   array_push($appmt_id,$row['appmt_id']);
					 }
				}
			}else{
			     $result = mysql_query($bsiCore->sqlApartment());
			}
			
			if(!empty($appmt_id)){
				$i=1;
				foreach($appmt_id as $val){//foreach start
					$result=mysql_query("select * from  bsi_apartment_master where appmt_id=".$val);
								if(mysql_num_rows($result)){//check if start
								//$i=1;
								while($row = mysql_fetch_assoc($result)){
								//if(!empty($row)){	
										if($row['status'] == true){
										   $status = '<font color="#00CC00"><strong>Active</strong></font>';
										}else{
										   $status = '<font color="#FF0000"><strong>Disabled</strong></font>';
										}
								$text = $client_id." ".$row['appmt_id'];
								$text = $text;
								$htmlal .= '<tr><td>'.$i.'</td><td>'.$row['appmt_name'].'</td><td>'.$row['addr1'].",".$row['city'].",".$row['country'].'</td><td>'.$row['phone'].'</td><td>'.$status.'</td><td align="right"><a href="add_edit_apartment.php?id='.base64_encode($row['appmt_id']).'&flag='.$client_id.'">Edit</a> | <a href="javascript:;" onClick="javascript:delType(\''.$text.'\');">Delete</a></td></tr>';
								    
								  // }
								    $i++;
								
							}
						//$htmlal .= '</tbody>';
			
					}//check if end
				}//foreach end
				
			}else{
			    if(mysql_num_rows($result)){
				  $i=1;
				  while($row = mysql_fetch_assoc($result)){
					if($row['status'] == true){
						  $status = '<font color="#00CC00"><strong>Active</strong></font>';
					  }else{
						  $status = '<font color="#FF0000"><strong>Disabled</strong></font>';
					   }
					$htmlal .= '<tr><td>'.$i.'</td><td>'.$row['appmt_name'].'</td><td>'.$row['addr1'].",".$row['city'].",".$row['country'].'</td><td>'.$row['phone'].'</td><td>'.$status.'</td><td align="right"><a href="add_edit_apartment.php?id='.base64_encode($row['appmt_id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteType(\''.$row['appmt_id'].'\');">Delete</a></td></tr>';
					$i++;
				  }
			    }
			
			  }
			$htmlal .= '</tbody>';
			return $htmlal;
		}
		
		public function apartmentDetailsentryform(){
			global $bsiCore;
			$id         = $bsiCore->ClearInput($_POST['addedit']);
			$type       = $bsiCore->ClearInput($_POST['appmt_type_id']);
			$apart_name = $bsiCore->ClearInput($_POST['appmt_name']);
			$address1   = $bsiCore->ClearInput($_POST['addr1']);
			$address2   = $bsiCore->ClearInput($_POST['addr2']);
			//添加区县字段
			$district   = $bsiCore->ClearInput($_POST['district']);
			$city_name  = $bsiCore->ClearInput($_POST['city']);
			$state      = $bsiCore->ClearInput($_POST['state']);
			$zip_code   = $bsiCore->ClearInput($_POST['zipcode']);
			$country    = $bsiCore->ClearInput($_POST['country']);
			$phone_number = $bsiCore->ClearInput($_POST['phone']);
			//添加地段字段
			$street = $bsiCore->ClearInput($_POST['street']);
			//添加地理位置类型字段
			$parentLT = $_POST['locationTypeArray'];
			$pLen = count($parentLT);
			$locationTypeArr = array();
			for($i=0;$i<$pLen;$i++){
				$parentArr = explode("@",$parentLT[$i]);
				$childKey = 'locationChildTypeArray'.$parentArr[0];
				$childStr = "{";
				if(isset($_POST[$childKey])){
					$childLT =  $_POST[$childKey];
					$cLen = count($childLT);
					$childArr = array();
					for($j=0;$j<$cLen;$j++){
						$childArr[$j] = '"'.$j.'":"'.$childLT[$j].'"';
					}
					$childStr .= implode(",",$childArr);
				}
				$childStr .= "}";
				$locationTypeArr[$i] = '{"parent":"'.$parentArr[1].'","child":'.$childStr.'}';
			}
			$locationType = "[".implode(",",$locationTypeArr)."]";
			
			$desc_short = $bsiCore->ClearInput($_POST['short_desc']);
			$desc_long  = $bsiCore->ClearInput($_POST['long_desc']);
			//获取房间特色键数组
			$featureKeyArr = $_POST['featureKey'];
			//获取房间特色值数组
			$featureValArr = $_POST['featureVal'];
			$fLen  = count($featureKeyArr);
			$featureArr = array();
			for($i=0;$i<$fLen;$i++){
				// $featureArr[$featureKeyArr[$i]] = $featureValArr[$i];
				$featureArr[$i] = '"'.$featureKeyArr[$i].'":"'.$featureValArr[$i].'"';
			}
			$featureStr = "{".implode(",",$featureArr)."}";
			// $featureStr = json_encode($featureArr);
			// echo $featureStr;
			// $temp = json_decode($featureStr);
			// print_r($temp);
			// exit;
			$feature = $featureStr;
			//Apartment feature
			/* $appmt_size    = $bsiCore->ClearInput($_POST['appmt_size']) ? $bsiCore->ClearInput($_POST['appmt_size']) : '';
			$apptmtLotsize = $bsiCore->ClearInput($_POST['apptmt_lot_size']) ? $bsiCore->ClearInput($_POST['apptmt_lot_size']) : '';
			$bedroom       = $bsiCore->ClearInput($_POST['bedroom']) ? $bsiCore->ClearInput($_POST['bedroom']) : '';
			$bathroom      = $bsiCore->ClearInput($_POST['bathroom']) ? $bsiCore->ClearInput($_POST['bathroom']) : '';
			$car_garage    = $bsiCore->ClearInput($_POST['car_garage']) ? $bsiCore->ClearInput($_POST['car_garage']) : '';
			$garage_size   = $bsiCore->ClearInput($_POST['garage_size']) ? $bsiCore->ClearInput($_POST['garage_size']) : '';
			$total_rooms   = $bsiCore->ClearInput($_POST['total_rooms']) ? $bsiCore->ClearInput($_POST['total_rooms']) : '';
			$basement      = $bsiCore->ClearInput($_POST['basement']) ? $bsiCore->ClearInput($_POST['basement']) : '';
			$floors        = $bsiCore->ClearInput($_POST['floors']) ? $bsiCore->ClearInput($_POST['floors']) : '';
			$year_of_build = $bsiCore->ClearInput($_POST['year_of_build']) ? $bsiCore->ClearInput($_POST['year_of_build']) : ''; */
			//Apartment Feature
			$facilityArr = array();
			if(isset($_POST['facility'])){
				$facilityArr = $_POST['facility'];
			}else{
				$facilityArr = array();	
			}
				
			/**********************************************************************
			$address    = "";
			$address   .= mysql_real_escape_string($_POST['addr1'])." ";
			$address   .= mysql_real_escape_string($_POST['addr2'])." ";
			$address   .= mysql_real_escape_string($_POST['city'])." ";
			$address   .= mysql_real_escape_string($_POST['zipcode'])." ";
			$address   .= $country; 
			$address3 = urlencode($address);
			$url = "http://maps.google.com/maps/api/geocode/json?address=$address3&sensor=false";
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
			$response = curl_exec($ch);
			curl_close($ch);
			$response_a = json_decode($response);
			$lat = $response_a->results[0]->geometry->location->lat;
			
			$long = $response_a->results[0]->geometry->location->lng;
			//***********************************************************************/
			/**************************百度地图获取经纬度***************************
			$addr1 = mysql_real_escape_string($_POST['addr1']);
			$city = mysql_real_escape_string($_POST['city']);
			$url = "http://api.map.baidu.com/geocoder/v2/?ak=1bd2776e1c14f18c281b31e3fa285f50"
				  ."&output=json&address=$addr1&city=$city";
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch,CURLOPT_HEADER,0 );  
			curl_setopt($ch,CURLOPT_RETURNTRANSFER,1 ); 
			$response = curl_exec($ch);
			curl_close($ch);
			$response_a = json_decode($response,true);
			$lat = $response_a['result']['location']['lat'];
			
			$long = $response_a['result']['location']['lng'];
			// $temp =file_get_contents($url); 
			// echo $temp;
			//***********************************************************************/
			$lat = $bsiCore->ClearInput($_POST['latitude']);;
			
			$long = $bsiCore->ClearInput($_POST['longitude']);;
			if(!isset($_POST['status'])){
				$status = 0;
			}else{
				$status = 1;
			}
			if($id == 0){
				$enable_thumbnails	= 1 ;
				$max_image_size		= 1024000 ;
				$upload_dir			= "../gallery/ApartImage/";
				$upload_dir2		= "../gallery/ApartFloor/";
				$img_rname = "";
				
				$insert_sql = "insert into  bsi_apartment_master (`appmt_type_id`, `appmt_name`, `addr1`, `addr2`,`district`, `city`, `state`, `country`, `zipcode`, `phone`,
				`street`,`locationTypeArray`,`short_desc`, `long_desc`,`features`, `default_img`, `apart_floor_img`, `lat`, `longitude`, `status`) 
				values ('".$type."', '".$apart_name."', '".$address1."', '".$address2."', '".$district."','".$city_name."', '".$state."', '".$country."', '".$zip_code."',
				'".$phone_number."','".$street."','".$locationType."','".$desc_short."', '".$desc_long."','".$feature."', '', '', '".$lat."', '".$long."', '".$status."')";
				mysql_query($insert_sql);
				$id = mysql_insert_id();
				
			  	if((isset($_FILES['default_img'])) || ($_FILES['apart_floor_img'] != "")){
					foreach($_FILES as $k => $v){ 	
						$img_type = "";
						if( !$_FILES[$k]['error'] && preg_match("#^image/#i", $_FILES[$k]['type']) && $_FILES[$k]['size'] < $max_image_size ){
							$img_type = ($_FILES[$k]['type'] == "image/jpeg") ? ".jpg" : $img_type ;
							$img_type = ($_FILES[$k]['type'] == "image/gif") ? ".gif" : $img_type ;
							$img_type = ($_FILES[$k]['type'] == "image/png") ? ".png" : $img_type ;
							$img_rname = time().'_'.$_FILES[$k]['name']; 
							$img_path = $upload_dir.$img_rname;
							$img_path2 = $upload_dir2.$img_rname;
							if($k != 'apart_floor_img'){
								copy($_FILES[$k]['tmp_name'], $img_path); 
								if($enable_thumbnails) $this->make_thumbnails($upload_dir, $img_rname, 120, 120);
							}else{
								copy($_FILES[$k]['tmp_name'], $img_path2);
							}
							mysql_query("update bsi_apartment_master set ".$k."='".$img_rname."' where appmt_id=".$id); 
						}
					}
				}
				//房间特色不用单独的表
				//mysql_query("insert into  bsi_appmt_features (appmt_id, appmt_size, apptmt_lot_size, bedroom, bathroom, car_garage, garage_size, total_rooms, basement, floors, year_of_build) values (".$id.", '".$appmt_size."', '".$apptmtLotsize."', '".$bedroom."', '".$bathroom."', '".$car_garage."', '".$garage_size."', '".$total_rooms."', '".$basement."', '".$floors."', '".$year_of_build."')");
				
				mysql_query("INSERT INTO `bsi_priceplan` (`appmt_id`, `price`, `stay_from`, `stay_to`, `deposit_percent`, `default_pp`)
							VALUES ($id, '0', '', '', '0', '1')");	
				
			}else{
				if(isset($_POST['deldefault'])){
					if($_POST['pre_img'] != ""){
						unlink("../gallery/ApartImage/".$_POST['pre_img']);
						unlink("../gallery/ApartImage/thumb_".$_POST['pre_img']);
						unset($_POST['pre_img']);
					}
					mysql_query("UPDATE bsi_apartment_master SET default_img='' WHERE appmt_id=".$id);
				}
				
				if(isset($_POST['delfloor'])){
					if($_POST['pre_floor_img'] != ""){
						unlink("../gallery/ApartFloor/".$_POST['pre_floor_img']);
						unset($_POST['pre_floor_img']);
					}
					mysql_query("UPDATE bsi_apartment_master SET apart_floor_img='' WHERE appmt_id=".$id);
				}
				
				$enable_thumbnails	= 1;
				$max_image_size		= 1024000 ;
				$upload_dir			= "../gallery/ApartImage/";
				$upload_dir2		= "../gallery/ApartFloor/";
				$img_rname = "";
				foreach($_FILES as $k => $v){ 	
					$img_type = "";
					if( !$_FILES[$k]['error'] && preg_match("#^image/#i", $_FILES[$k]['type']) && $_FILES[$k]['size'] < $max_image_size ){
						$img_type = ($_FILES[$k]['type'] == "image/jpeg") ? ".jpg" : $img_type ;
						$img_type = ($_FILES[$k]['type'] == "image/gif") ? ".gif" : $img_type ;
						$img_type = ($_FILES[$k]['type'] == "image/png") ? ".png" : $img_type ;
						$img_rname = time().'_'.$_FILES[$k]['name']; 
						$img_path = $upload_dir.$img_rname;
						$img_path2 = $upload_dir2.$img_rname;
						if(!empty($_POST['pre_img']) && $k == 'default_img'){ 
							unlink("../gallery/ApartImage/".$_POST['pre_img']);
							unlink("../gallery/ApartImage/thumb_".$_POST['pre_img']); 	
					    }
						if(!empty($_POST['pre_floor_img']) && $k=='apart_floor_img'){ 
							unlink("../gallery/ApartFloor/".$_POST['pre_floor_img']);						
						}  
                        if($k != 'apart_floor_img'){
							copy($_FILES[$k]['tmp_name'], $img_path );
							if($enable_thumbnails) $this->make_thumbnails($upload_dir, $img_rname, 120, 120);
							mysql_query("UPDATE bsi_apartment_master SET default_img='".$img_rname."' WHERE appmt_id =".$id);
						}else{
							copy($_FILES[$k]['tmp_name'], $img_path2 );
						  	mysql_query("UPDATE bsi_apartment_master SET apart_floor_img='".$img_rname."' WHERE appmt_id =".$id);
						}
					}	
				}
								
				mysql_query("UPDATE bsi_apartment_master SET appmt_type_id = '".$type."', appmt_name = '".$apart_name."', addr1 = '".$address1."', addr2 = '".$address2."', district = '".$district."', city = '".$city_name."', state = '".$state."', country = '".$country."', zipcode = '".$zip_code."', phone = '".$phone_number."',street = '".$street."',locationTypeArray = '".$locationType."',short_desc = '".$desc_short."', long_desc = '".$desc_long."', features = '".$feature."',lat = '".$lat."', longitude = '".$long."', status = '".$status."' WHERE appmt_id =".$id);
				
				mysql_query("delete from bsi_appmt_facilities where appmt_id=".$id);
				//房间特色不用单独的表
				//mysql_query("update bsi_appmt_features set appmt_size='".$appmt_size."', apptmt_lot_size='".$apptmtLotsize."', bedroom=".$bedroom.", bathroom=".$bathroom.", car_garage=".$car_garage.", garage_size='".$garage_size."', total_rooms=".$total_rooms.", basement='".$basement."', floors=".$floors.", year_of_build=".$year_of_build." where appmt_id=$id");
			} 
			foreach($facilityArr as $key => $facilityid){
				mysql_query("insert into bsi_appmt_facilities (`appmt_id`, `facility_id`) values (".$id.", ".$facilityid.")");
			}
		}
		
		private function make_thumbnails($updir, $img, $w, $h){
			$thumbnail_width	= $w;
			$thumbnail_height	= $h;
			$thumb_preword		= "thumb_";
			$arr_image_details	= GetImageSize("$updir"."$img");
			$original_width		= $arr_image_details[0];
			$original_height	= $arr_image_details[1];
			if($original_width > $original_height ){
				$new_width	= $thumbnail_width;
				$new_height	= intval($original_height*$new_width/$original_width);
			} else {
				$new_height	= $thumbnail_height;
				$new_width	= intval($original_width*$new_height/$original_height);
			}
			$dest_x = intval(($thumbnail_width - $new_width) / 2);
			$dest_y = intval(($thumbnail_height - $new_height) / 2);
			if($arr_image_details[2]==1) { $imgt = "ImageGIF"; $imgcreatefrom = "ImageCreateFromGIF";  }
			if($arr_image_details[2]==2) { $imgt = "ImageJPEG"; $imgcreatefrom = "ImageCreateFromJPEG";  }
			if($arr_image_details[2]==3) { $imgt = "ImagePNG"; $imgcreatefrom = "ImageCreateFromPNG";  }
			if( $imgt ) { 
				$old_image	= $imgcreatefrom("$updir"."$img");
				$new_image	= imagecreatetruecolor($thumbnail_width, $thumbnail_height);
				imageCopyResized($new_image,$old_image,0, 0,0,0,$w,$h,$original_width,$original_height);
				$imgt($new_image,"$updir"."$thumb_preword"."$img");
			}
		}
		
		public function showAllFacility($appmt_id=0){
			$str = '';
			$html = '<table width="100%"><tr>';
			$result = mysql_query("select * from bsi_all_facilities");
			if(mysql_num_rows($result)){
				$i = 0;			
				while($row = mysql_fetch_assoc($result)){
					$resultfac = mysql_query("select facility_id from bsi_appmt_facilities where appmt_id=".$appmt_id." and facility_id=".$row['id']);
					if(mysql_num_rows($resultfac)){
						$rowfac = mysql_fetch_assoc($resultfac);
							if($rowfac['facility_id'] == $row['id']){
								$str='checked="checked"';
								$html .= '<td><input type="checkbox" name="facility[]" value="'.$row['id'].'" '.$str.' /><span> '.$row['facilities'].'</span></td>';
							}
					}else{
						$str='';
						$html .= '<td><input type="checkbox" name="facility[]" value="'.$row['id'].'" '.$str.' /><span> '.$row['facilities'].'</span></td>';
					}
					
					$i++;
					if($i == 2){
						$html .= '</tr><tr>';
						$i = 0;
					}	
				  }
			}
			$html .= '</tr></table>';
			return $html;
		}
		
		public function getApartmentFaciltyHtml(){
			global $bsiCore;
			$htmlf = '<tbody>';
			$result = mysql_query("select * from bsi_all_facilities");
			if(mysql_num_rows($result)){
				$i=1;
				while($row = mysql_fetch_assoc($result)){
					$htmlf .= '<tr><td>'.$i.'</td><td>'.$row['facilities'].'</td><td align="right"><a href="add_edit_facilities.php?id='.base64_encode($row['id']).'">Edit</a> | <a href="javascript:;" onClick="javascript:deleteFacilty(\''.$row['id'].'\');">Delete</a></td></tr>';
					$i++;
				}
			}
			$htmlf .= '</tbody>';
			return $htmlf;
		}
		
		public function addeditFacilty($id){
			global $bsiCore;
			if($id){
				mysql_query("update bsi_all_facilities set facilities='".$bsiCore->ClearInput($_POST['facilities'])."' where id=".$bsiCore->ClearInput($id));
			}else{
				mysql_query("insert into bsi_all_facilities (facilities) values ('".$bsiCore->ClearInput($_POST['facilities'])."')");
			}
		}
		
		public function apartmentFacilityDelete($id){
			mysql_query("delete from bsi_appmt_facilities where facility_id=".$id);
			mysql_query("delete from bsi_all_facilities where id=".$id);
		}
		
		public function getApmtcombo($apmt=0){
			$html = '<option value="">--- Select Apartment --</option>';
			$result = mysql_query("select * from bsi_apartment_master");
			if(mysql_num_rows($result)){
				while($row = mysql_fetch_assoc($result)){
					if($apmt == $row['appmt_id']){
						$html .= '<option value="'.$row['appmt_id'].'" selected="selected">'.$row['appmt_name'].'</option>';
					}else{
						$html .= '<option value="'.$row['appmt_id'].'">'.$row['appmt_name'].'</option>';
					}
				}
			}
			return $html;
		}
		
		public function addgallery(){
			global $bsiCore;
			$enable_thumbnails	= 1 ;
			$max_image_size		= 1024000 ;
			$upload_dir			= "../gallery/ApartImage/";
			$img_rname = "";
			foreach($_FILES as $k => $v){ 	
				$img_type = "";
				if( !$_FILES[$k]['error'] && preg_match("#^image/#i", $_FILES[$k]['type']) && $_FILES[$k]['size'] < $max_image_size ){
					$img_type = ($_FILES[$k]['type'] == "image/jpeg") ? ".jpg" : $img_type ;
					$img_type = ($_FILES[$k]['type'] == "image/gif") ? ".gif" : $img_type ;
					$img_type = ($_FILES[$k]['type'] == "image/png") ? ".png" : $img_type ;
					$img_rname = time().'_'.$_FILES[$k]['name']; 
					$img_path = $upload_dir.$img_rname;
					copy($_FILES[$k]['tmp_name'], $img_path); 
					if($enable_thumbnails) $this->make_thumbnails($upload_dir, $img_rname, 180, 125);
					mysql_query("insert into bsi_appmt_gallery (appmt_id, img_path) values (".$bsiCore->ClearInput($_POST['apartmentid']).", '".$img_rname."')");
				}
				$_SESSION['appmtgal'] = $bsiCore->ClearInput($_POST['apartmentid']);
			}
		}
		
		public function deletegallery(){
			global $bsiCore;
			unlink("../gallery/ApartImage/".$bsiCore->ClearInput($_GET['delimg']));	
			unlink("../gallery/ApartImage/thumb_".$bsiCore->ClearInput($_GET['delimg']));	
			mysql_query("delete from bsi_appmt_gallery where appmt_id=".$bsiCore->ClearInput($_GET['appmtid'])." and img_path='".$bsiCore->ClearInput($_GET['delimg'])."'");
			$_SESSION['appmtgal'] = $bsiCore->ClearInput($_GET['appmtid']);
		}
		
		public function addeditPriceplan($id){ 
			global $bsiCore;
			if($id){
				$row = mysql_fetch_assoc(mysql_query("SELECT * FROM bsi_priceplan WHERE pp_id != $id"));
				if($row['default_pp'] == 1){
					mysql_query("update bsi_priceplan set price='".$bsiCore->ClearInput($_POST['price'])."', deposit_percent='".$bsiCore->ClearInput($_POST['deposit_percent'])."' where pp_id=".$id);
				}else{
					$check_res = mysql_query("SELECT * FROM bsi_priceplan WHERE (('".$bsiCore->ClearInput($_POST['stay_from'])."' BETWEEN `stay_from` AND `stay_to`) or ('".$bsiCore->ClearInput($_POST['stay_to'])."' BETWEEN `stay_from` AND `stay_to`)) and pp_id != $id");
					if(!mysql_num_rows($check_res)){
						mysql_query("update bsi_priceplan set price='".$bsiCore->ClearInput($_POST['price'])."', stay_from='".$bsiCore->ClearInput($_POST['stay_from'])."', stay_to='".$bsiCore->ClearInput($_POST['stay_to'])."', deposit_percent='".$bsiCore->ClearInput($_POST['deposit_percent'])."' where pp_id=".$id);
					}else{
						$_SESSION['msg_err'] = 'Already Exists.';
					}
				}
			}else{
				$check_res = mysql_query("SELECT * FROM bsi_priceplan WHERE (('".$bsiCore->ClearInput($_POST['stay_from'])."' BETWEEN `stay_from` AND `stay_to`) or ('".$bsiCore->ClearInput($_POST['stay_to'])."' BETWEEN `stay_from` AND `stay_to`)) and appmt_id=".$bsiCore->ClearInput($_POST['apartmentid']));
				if(!mysql_num_rows($check_res)){
					mysql_query("INSERT INTO `bsi_priceplan` (`appmt_id`, `price`, `stay_from`, `stay_to`, `deposit_percent`, `default_pp`)
VALUES (".$bsiCore->ClearInput($_POST['apartmentid']).", '".$bsiCore->ClearInput($_POST['price'])."', '".$bsiCore->ClearInput($_POST['stay_from'])."', '".$bsiCore->ClearInput($_POST['stay_to'])."', '".$bsiCore->ClearInput($_POST['deposit_percent'])."', '0')");
					$_SESSION['appmtpp'] = $bsiCore->ClearInput($_POST['apartmentid']);
				}else{
					$_SESSION['msg_err'] = 'Already Exists.';
				}
			}
		}
		
public function getApartmentBlockDetails(){
		global $bsiCore;
		$getHtml='<tbody>';
		$result=mysql_query("SELECT booking_id,appmt_id, block_name, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS StartDate, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS EndDate from bsi_bookings where is_block=1");
		if(mysql_num_rows($result)){
			while($row=mysql_fetch_assoc($result)){
				$getApartmentname=mysql_fetch_assoc(mysql_query("select appmt_name from bsi_apartment_master where appmt_id=".$row['appmt_id']));
				$getHtml.='<tr><td align="left">'.$row['block_name'].'</td><td align="left">'.$row['StartDate']."-".$row['EndDate'].'</td><td align="left" >'.$getApartmentname['appmt_name'].'</td><td align="right"><a href="'.$_SERVER['PHP_SELF'].'?action=unblock&bid='.$row['booking_id'].'">Un-Block</a></td></tr>';
			}
		}
		$getHtml .= '<tbody>';
		return $getHtml;
	}
	
public function getViewBookingList($type, $appmt_id){
	global $bsiCore;
		if($type == 1){
			$html = '<thead>
						  <tr>
							<th width="10%" nowrap>预定编号</th>
							<th width="10%" nowrap>姓名</th>
							<th width="10%" nowrap>入住日期</th>
							<th width="10%" nowrap>退房日期</th>
							<th width="10%" nowrap>金额</th>
							<th width="10%" nowrap>预定时间</th>
							<th width="10%" nowrap>预定状态</th>
							<th width="30%" nowrap>&nbsp;</th>
						   </tr>
					  </thead>
					  <tbody>';		  
$result = mysql_query("SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, client_id,is_deleted  FROM bsi_bookings where appmt_id=".$appmt_id." and payment_success=true and CURDATE() <= checkout_date and is_deleted=false and is_block=false  order by start_date");
while($row = mysql_fetch_assoc($result)){
				 $clientinfo=mysql_fetch_assoc(mysql_query("select title,first_name,surname from bsi_clients where client_id=".$bsiCore->ClearInput($row['client_id'])));
				 $status='';
				 $statusHtml='';
				 $curdate=date('Y-m-d');
				if($row['is_deleted'] == 0 && $row['end_date']<$curdate ){
					$status='已过期';
					$statusHtml='<strong style="color:blue;">'.$status.'</strong>';	
				}else if($row['is_deleted']==0 && $row['end_date']>$curdate){
					$status='成功';
					$statusHtml='<strong style="color:green;">'.$status.'</strong>';	
				}else if($row['is_deleted']==1){
					$status='已取消';
					$statusHtml='<strong  style="color:red;">'.$status.'</strong>';	
				}
				$html .= '<tr>
							<td width="10%" nowrap>'.$row['booking_id'].'</td>
							<td width="10%" nowrap>'.$clientinfo['title']." ".$clientinfo['first_name']." ".$clientinfo['surname'].'</td>
							<td width="10%" nowrap>'.$row['start_date'].'</td>
							<td width="10%" nowrap>'.$row['end_date'].'</td>
							<td width="10%" nowrap>'.$bsiCore->config['conf_currency_symbol'].$row['total_cost'].'</td>
							<td width="10%" nowrap>'.$row['booking_time'].'</td>
							<td width="10%" nowrap>'.$statusHtml.'</td>
							<td width="30%" style="text-align:right; padding:0px 6px 0px 0px" nowrap="nowrap">
								<a href="viewdetails.php?booking_id='.$row['booking_id'].'&book_type='.base64_encode($type).'&appmt_id='.base64_encode($appmt_id).'">View Details</a> | 
								<a href="javascript:;" onClick="javscript:myPopup2(\''.$row['booking_id'].'\');">Print Voucher</a> |  
								<a href="javascript:;" onClick="return cancel(\''.$row['booking_id'].'\');">Cancel</a>
							</td>
						  </tr>';
			}
			$html .= '</tbody>';
		}
		
	if($type == 2){
		$html = '<thead>
					  <tr>
						<th width="10%" nowrap>预定编号</th>
						<th width="10%" nowrap>姓名</th>
						<th width="10%" nowrap>入住日期</th>
						<th width="10%" nowrap>退房日期</th>
						<th width="10%" nowrap>金额</th>
						<th width="10%" nowrap>预定时间</th>
						<th width="10%" nowrap>预定状态</th>
						<th width="30%" nowrap>&nbsp;</th>
					   </tr>
				  </thead>
				  <tbody>';
		$result = mysql_query("SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, client_id, is_deleted,is_apply  FROM bsi_bookings where appmt_id=".$appmt_id." and payment_success=true and (CURDATE() > checkout_date OR is_deleted=true)  and is_block=false order by start_date");
		if(mysql_num_rows($result)){
			while($row = mysql_fetch_assoc($result)){
					$clientinfo=mysql_fetch_assoc(mysql_query("select title,first_name,surname from bsi_clients where client_id=".$bsiCore->ClearInput($row['client_id'])));
					$status='';
					$statusHtml='';
					$curdate=date('Y-m-d');
					if($row['is_deleted']==0 && $row['end_date']>$curdate){
						$status='成功';
						$statusHtml='<strong style="color:green;">'.$status.'</strong>';	
					}else if($row['is_deleted']==0 && $row['is_apply']==1){
						$status='申请退款中';
						$statusHtml='<strong  style="color:red;">'.$status.'</strong>';	
					}else if($row['is_deleted'] == 0 && $row['end_date']<$curdate ){
						$status='已过期';
						$statusHtml='<strong style="color:blue;">'.$status.'</strong>';	
					}else if($row['is_deleted']==1){
						$status='已取消';
						$statusHtml='<strong  style="color:red;">'.$status.'</strong>';	
					}
					$html .= '<tr>
								<td width="10%" nowrap>'.$row['booking_id'].'</td>
								<td width="20%" nowrap>'.$clientinfo['title']." ".$clientinfo['first_name']." ".$clientinfo['surname'].'</td>
								<td width="10%" nowrap>'.$row['start_date'].'</td>
								<td width="10%" nowrap>'.$row['end_date'].'</td>
								<td width="10%" nowrap>'.$bsiCore->config['conf_currency_symbol'].$row['total_cost'].'</td>
								<td width="10%" nowrap>'.$row['booking_time'].'</td>
								<td width="10%" nowrap>'.$statusHtml.'</td>
								<td style="text-align:right; padding:0px 6px 0px 0px" nowrap="nowrap">
									<a href="viewdetails.php?booking_id='.$row['booking_id'].'&book_type='.base64_encode($type).'&appmt_id='.base64_encode($appmt_id).'">View Details</a> | 
									<a href="javascript:;" onClick="javascript:myPopup2(\''.$row['booking_id'].'\');">Print Voucher</a> |  
									<a href="javascript:;" onClick="return deleteBooking(\''.$row['booking_id'].'\');">Delete</a>
								</td>
							  </tr>';
				}
			}
			$html .= '</tbody>';
		}
		 

		
		 
		return $html;
	}
	 
	 public function paymentDetails($gateway, $bookingid){
		global $bsiCore;
		$paymentgateway = $this->getPayment_Gateway($gateway);
		 $invoice=mysql_fetch_assoc(mysql_query("select * from bsi_invoice where booking_id=".$bookingid)); 
         $htmlPD=$invoice['invoice'];
	      return $htmlPD;
	}
	
	public function getPayment_Gateway($pg){
		$row = mysql_fetch_assoc(mysql_query("select gateway_name from bsi_payment_gateway where gateway_code='".$pg."'"));	
		return $row['gateway_name'];
	}
	
	public function getPaypalDetails($bid){
		$row = mysql_fetch_assoc(mysql_query("select payment_txnid, paypal_email from bsi_bookings where booking_id=$bid"));
		return $row;
	}
	
	public function booking_cencel_delete($type){
		global $bsiCore;
		global $bsiMail;
		switch($type){
			case 1:
				$bsiMail = new bsiMail();
				$is_cancel = mysql_query("update bsi_bookings set is_deleted=true where booking_id=".$bsiCore->ClearInput($_GET['cancel']));
				if($is_cancel){
				$cust_details = mysql_fetch_assoc(mysql_query("select * from bsi_invoice where booking_id=".$bsiCore->ClearInput($_GET['cancel'])));
				$email_details    = mysql_fetch_assoc(mysql_query("select * from bsi_email_contents where id=2"));
				$cancel_emailBody = "Dear ".$cust_details['client_name']."<br>";
				$cancel_emailBody .= html_entity_decode($email_details['email_text'])."<br>";
				$cancel_emailBody .= "<b>Your Booking Details:</b><br>".$cust_details['invoice']."<br>";
				$cancel_emailBody .= "<b>Regards</b><br>".$bsiCore->config['conf_hotel_name']."<BR>".$bsiCore->config['conf_hotel_phone']."<br>";
				$bsiMail->sendEMail($cust_details['client_email'], $email_details['email_subject'], $cancel_emailBody);
				}
			break;
			
			case 2:
				mysql_query("delete from  bsi_bookings where booking_id=".$bsiCore->ClearInput($_REQUEST['delete']));
				mysql_query("delete from  bsi_invoice where booking_id=".$bsiCore->ClearInput($_REQUEST['delete']));
			break;
		
		}	
	}
		
	public function getCustomerHtml($type_id){
		$html = '';
		$action='';
		$type_id=mysql_real_escape_string($type_id);
		if($type_id == 1){
		    $result = mysql_query("select * from bsi_clients where user_type=1");
			while($row = mysql_fetch_assoc($result)){
			$html .= '<tr><td width="20%" nowrap="nowrap">'.$row['title']." ".$row['first_name']." ".$row['surname'].'</td><td width="30%">'.$row['street_addr'].",".$row['city'].",".$row['country']." - ".$row['zip'].'</td><td width="10%">'.$row['phone'].'</td><td width="25%">'.$row['email'].'</td><td width="15%" align="right" nowrap="nowrap"><a href="customer-booking.php?client='.base64_encode($row['client_id']).'">View Bookings</a>&nbsp;&nbsp;<a href="customer-lookupEdit.php?update='.base64_encode($row['client_id']).'">Edit</a></td></tr>';
		  }
		}else{
			 $result = mysql_query("select * from bsi_clients where user_type=2");
			 while($row = mysql_fetch_assoc($result)){
			$html .= '<tr><td width="20%" nowrap="nowrap">'.$row['title']." ".$row['first_name']." ".$row['surname'].'</td><td width="30%">'.$row['street_addr'].",".$row['city'].",".$row['country']." - ".$row['zip'].'</td><td width="10%">'.$row['phone'].'</td><td width="25%">'.$row['email'].'</td><td width="15%" align="right" nowrap="nowrap"><a href="apartment-list.php?client_id='.base64_encode($row['client_id']).'">View Listing</a>&nbsp;&nbsp;<a href="customer-lookupEdit.php?update='.base64_encode($row['client_id']).'&vid=1'.'">View Details</a></td></tr>';
		}
		}
		
		return $html;
	}
	
	public function getCustomerLookup($cid){
		global $bsiCore;
		$result = mysql_query("select * from bsi_clients where client_id=".$bsiCore->ClearInput($cid));
		$customerarray=mysql_fetch_assoc($result);
		return $customerarray;
		
	}
	
	public function getTitle($title){
		$html  = '<select name="titled" id="titled">';
		$titleArray =array("Mr" => "Mr.", "Mrs" => "Mrs.", "Ms" => "Ms.", "Dr" => "Dr.", "Miss" => "Miss.", "Prof" => "Prof.");
		foreach($titleArray as $key => $value){
			if($title == $key){
				$html .= '<option value="'.$key.'" selected="selected">'.$value.'</option>';
			}else{
				$html .= '<option value="'.$key.'">'.$value.'</option>';
			}
		}
		$html .= '</select>'; 
		return $html; 
	}
	
	public function updateCustomerLookup(){
		$title = mysql_real_escape_string($_POST['titled']);
		$fname = mysql_real_escape_string($_POST['fname']);
		$sname = mysql_real_escape_string($_POST['sname']);
		$sadd = mysql_real_escape_string($_POST['sadd']);
		$city = mysql_real_escape_string($_POST['city']);
		$province = mysql_real_escape_string($_POST['province']);
		$zip = mysql_real_escape_string($_POST['zip']);
		$country = mysql_real_escape_string($_POST['country']);
		$phone = mysql_real_escape_string($_POST['phone']);
		$email = mysql_real_escape_string($_POST['email']);
		$cid = mysql_real_escape_string($_POST['cid']);
		
		mysql_query("update bsi_clients set first_name='".$fname."',surname='".$sname."',title='".$title."',street_addr='".$sadd."',city='".$city."',province='".$province."',zip='".$zip."',country='".$country."',phone='".$phone."',email='".$email."' where client_id=".$cid);	
		
		$_SESSION['httpRefferer'] = $_POST['httpreffer'];
	}
	
	public function fetchClientBookingDetails($clientid){
		global $bsiCore;
		$arr=array();
		$clienname='';
		$html = '<tbody>';
	  	$result = $this->getBookingInfo(1, $clientid);
		$res = mysql_query($result);
      	while($row =  mysql_fetch_assoc($res)){
			$client_info=mysql_fetch_assoc(mysql_query("select * from bsi_clients where client_id=".$clientid));
			$clienname=$client_info['title']." ". $client_info['first_name']." ".$client_info['surname'];
			if($row['checkout'] >= date('Y-m-d') && $row['is_deleted'] == 0 && $row['is_block'] == 0){
				$status = '<font color="#00CC00"><b>Active</b></font>';	
				$action = '<a href="javascript:;" onClick="return cancel(\''.$row['booking_id'].'\');">Cancel</a>';
			}elseif($row['checkout'] < date('Y-m-d') && $row['is_deleted'] == 0 && $row['is_block'] == 0){
				$status = '<font color="#0033FF"><b>Completed</b></font>';	
				$action = '<a href="javascript:;" onclick="javascript:booking_delete('.$row['booking_id'].');" class="bodytext">Delete Forever</a>';
			}else{
				$status = '<font color="#FF0000"><b>Cancelled</b></font>';
				$action = '<a href="javascript:;" onclick="javascript:booking_delete('.$row['booking_id'].');" class="bodytext">Delete Forever</a>';
			}
			  $html .= '<tr class="gradeX">
				<td align="right">'.$row['booking_id'].'</td>
				<td align="right"  nowrap="nowrap">'.$client_info['title']." ". $client_info['first_name']." ".$client_info['surname'].'</td>
				<td align="right">'.$row['start_date'].'</td>
				<td align="right">'.$row['end_date'].'</td>
				<td align="right">'.$bsiCore->config['conf_currency_symbol'].$row['total_cost'].'</td>
				<td align="right">'.$row['booking_time'].'</td>
				<td align="right">'.$status.'</td>
				<td align="left" nowrap="nowrap"><a href="viewdetails.php?booking_id='.$row['booking_id'].'&client='.base64_encode($clientid).'" class="bodytext">View Details</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a  href="javascript:;" onclick="javascript:myPopup2('.$row['booking_id'].');" class="bodytext">Print Voucher</a>&nbsp;&nbsp;|&nbsp;&nbsp;'.$action.'</td>
			  </tr>';
       }
	   $html .= '</tbody>';	
	   $arr[0]=$html;
	   $arr[1]=$clienname;
	   return $arr;
	}
	
	public function getBookingInfo($info , $clientid=0){
		global $bsiCore;
		switch($info){
			case 1:
			$sql = "SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, checkout_date as checkout, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, is_deleted, is_block  FROM bsi_bookings where  payment_success=true and client_id=".$clientid;
			break;
		
		}
		return $sql;
	 }
	 
	 public function getYearcombo($yearselected){
		$year = '<select name="year" id="year">';
		$time = time();
		$current_year = date("Y", $time);
		
		for($i = $current_year; $i <= ($current_year+5); $i++){
			if($i == $yearselected){
				$year .= '<option value="'.$i.'" selected="selected">'.$i.'</option>';
			}else{
				$year .= '<option value="'.$i.'">'.$i.'</option>';
			}
		}
		$year .= '</select>';
		return $year;
	}
	
	public function getdaysName(){	
			$html = '';
		for($i=0; $i<5; $i++){
			$html .= '<td align="center" bgcolor="#ffbc5b" style="color:#040404"><strong>Su</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>Mo</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>Tu</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>We</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>Th</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>Fr</strong></td>
					  <td align="center" bgcolor="#ffbc5b" style="color:#040404"><strong>Sa</strong></td>';
		}
		
			$html .= '<td align="center" bgcolor="#ffbc5b" style="color:#040404"><strong>Su</strong></td>
					  <td align="center" bgcolor="#cfcfcf" style="color:#040404"><strong>Mo</strong></td>';   

		return $html;
	}
		public function getBookingtype(){
		 global $bsiCore;
		 $typestr='';
		 $booktypearr=array(1=>'Nightly',2=>'Weekly',3=>'Monthly');
		 foreach($booktypearr as $key=>$value){
			 if($key == $bsiCore->config['conf_rental_type']){
				 $typestr.='<option value="'.$key.'" selected="selected">'.$value.'</option>';
				 
			 }else{
				$typestr.='<option value="'.$key.'">'.$value.'</option>'; 
			 }
			 
		 }
		 return $typestr;
		 
		}
		
		public function updateBookingtype(){
			  global $bsiCore;
			 
			  $booktype_id=mysql_real_escape_string($_POST['booking_type_id']);
			  $min_booking=mysql_real_escape_string($_POST['min_booking']);
			  $max_booking=mysql_real_escape_string($_POST['max_booking']);
			 
			  if($_POST['checkin_day'] !=''){
				$day=mysql_real_escape_string($_POST['checkin_day']);  
			  }else{
				 $day=$bsiCore->config['conf_week_checkin_day']; 
			  }
			 if($booktype_id != $bsiCore->config['conf_rental_type']){
				  mysql_query("update bsi_priceplan set price=0.00,deposit_percent=0.00 where default_pp=1");
				  mysql_query("delete from bsi_priceplan where default_pp=0");
				  
				  
			  }
			  $this->configure_update('conf_minimum_stay',  $min_booking);
			  $this->configure_update('conf_maximum_stay',  $max_booking);
			  $this->configure_update('conf_rental_type', $booktype_id);
			  $this->configure_update('conf_week_checkin_day', $day);
			 
		 
		}
		
	public function adddiscountPriceControl(){
		 global $bsiCore;
		 $Start_date=mysql_real_escape_string($_POST['Start_date']);
		 $End_date=mysql_real_escape_string($_POST['End_date']);
		 $price=mysql_real_escape_string($_POST['price']);
		 $exist=mysql_query("select * from bsi_price_control where ('".$bsiCore->getMySqlDate($Start_date)."' between start_date and end_date) or ('".$bsiCore->getMySqlDate($End_date)."' between start_date and end_date)");
		 if(mysql_num_rows($exist)){
			header("location:add_discount_price.php?err=1");
		 }else{
			  mysql_query("insert into bsi_price_control(start_date,end_date,price_control)values('".$bsiCore->getMySqlDate($Start_date)."','".$bsiCore->getMySqlDate($End_date)."','".$price."')");
			   header("location:price_control.php");
			 
		 }
		
			
	}
		
		public function showPricecontrol(){
		 global $bsiCore;
		 $pricecontrollist='';
		 $result=mysql_query("SELECT id, DATE_FORMAT(start_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(end_date, '".$bsiCore->userDateFormat."') AS end_date,price_control FROM bsi_price_control"); 
		 if(mysql_num_rows($result)){
			 while($row=mysql_fetch_assoc($result)){
				$pricecontrollist.='<tr><td align="left">'.$row['start_date'].'</td><td align="left">'.$row['end_date'].'</td><td align="left">'.$row['price_control'].'</td></tr>';		 
			 } 
		 }
		 return  $pricecontrollist;	
		}
		
		public function changePassword(){
			global $bsiCore;
			$oldpass = $_POST['old_pass'];
			$newpass = $_POST['new_pass'];  
			$adminid = $_SESSION['cpuidBSI'];
			$result  = mysql_query("select * from bsi_admin where pass=\"" . md5($oldpass) . "\" and id=".$adminid);
			if(@mysql_num_rows($result)){
				mysql_query("update bsi_admin set pass='".md5($newpass)."' where id=".$adminid);
				$_SESSION['chngmsg'] = 'Password changed successfuly';
			}else{
				$_SESSION['chngmsg'] = 'Password do not matched.';
			}	
		}
		
		public function homewidget($type){
			global $bsiCore;
			if($type==1){
				$sql = "SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, client_id  FROM bsi_bookings where payment_success=true and is_block=false and DATE_FORMAT(booking_time, '%Y-%m-%d')=CURDATE()";
			}else if($type==2){
				$sql = "SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, client_id  FROM bsi_bookings where payment_success=true and is_block=false and DATE_FORMAT(checkin_date, '%Y-%m-%d')=CURDATE()";
			}else if($type==3){
				$sql = "SELECT booking_id, DATE_FORMAT(checkin_date, '".$bsiCore->userDateFormat."') AS start_date, DATE_FORMAT(checkout_date, '".$bsiCore->userDateFormat."') AS end_date, total_cost, DATE_FORMAT(booking_time, '".$bsiCore->userDateFormat."') AS booking_time, payment_type, client_id  FROM bsi_bookings where payment_success=true and is_block=false  and DATE_FORMAT(checkout_date, '%Y-%m-%d')=CURDATE()";
			}
			
			$html = '<thead>
						  <tr>
							<th width="10%" nowrap>Booking ID</th>
							<th width="15%" nowrap>Name</th>
							<th width="10%" nowrap>Check-in Date</th>
							<th width="10%" nowrap>Check-out Date</th>
							<th width="10%" nowrap>Amount</th>
							<th width="10%" nowrap>Booking Date</th>
							<th width="30%" nowrap>&nbsp;</th>
						   </tr>
					  </thead>
					  <tbody>';
			$result = mysql_query($sql);
			while($row = mysql_fetch_assoc($result)){
				$clientArr = $this->getClientInfo($row['client_id']);
				$html .= '<tr>
							<td width="10%" nowrap>'.$row['booking_id'].'</td>
							<td width="15%" nowrap>'.$clientArr['title']." ".$clientArr['first_name']." ".$clientArr['surname'].'</td>
							<td width="10%" nowrap>'.$row['start_date'].'</td>
							<td width="10%" nowrap>'.$row['end_date'].'</td>
							<td width="10%" nowrap>'.$bsiCore->config['conf_currency_symbol'].$row['total_cost'].'</td>
							<td width="10%" nowrap>'.$row['booking_time'].'</td>
							<td style="text-align:right; padding:0px 6px 0px 0px" nowrap="nowrap">
								<a href="viewdetails.php?booking_id='.$row['booking_id'].'&book_type=1">View Details</a>  
								
							</td>
						  </tr>';
				}
		
		 return $html;	
		}
		
		public function getClientInfo($client_id){
		$row=mysql_fetch_assoc(mysql_query("select * from bsi_clients where client_id=".$client_id));
		return $row;
	 } 
	
	
	}
?>