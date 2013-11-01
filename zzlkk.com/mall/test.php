<?php 
	$url = "http://api.map.baidu.com/geocoder/v2/?ak=1bd2776e1c14f18c281b31e3fa285f50"
		  ."&output=json&address=百度大厦&city=北京市";
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_HEADER,0 );  
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1 ); 
	$response = curl_exec($ch);
	curl_close($ch);
	$response_a = json_decode($response,true);
	$lat = $response_a['result']['location']['lat'];
	
	$long = $response_a['result']['location']['lng'];
	echo $lat.$long; 
	$temp =file_get_contents($url); 
	echo $temp;
?>