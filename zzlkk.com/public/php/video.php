<html>
<head>
<meta charset="UTF-8" />
</head>
<body><?php
$html = file_get_contents('http://www.kugou.com/mvweb/html');
$start = strpos($html,'ul class="clearfix"')-1;
$end = strpos($html,'.page a { margin')-7;
$html = substr($html,$start,$end-$start);

preg_match_all('/href="(.*?)" title="(.*?)"/i',$html,$arr);
$sql='';
$player='<video id="video">';
for($i=0;$i<count($arr[0]);$i++){
	$mv = file_get_contents("http://www.kugou.com".$arr[1][$i]);
	$name = $arr[2][$i];
	$mstart = strpos($mv,'()+\'&url=')+9;
	$mend = strpos($mv,'&autoplay=true');
	$url = substr($mv,$mstart,$mend-$mstart);
	//$sql.= "INSERT INTO mv(`name`,`url`) SELECT '$name','$url' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM mv WHERE `name`='$name');";
	$player.= "<source src=\"$url\" type=\"video/mp4\" />";
}

echo $player.'</video>';

/*
 * $conn = mysql_connect('127.0.0.1','root','123456');
if(!$conn)die('暂时无法连接服务器');
mysql_query("set names utf8");
mysql_select_db('zzlkk',$conn);
mysql_query($sql);
$mvs = mysql_query("select * from mv");
while($mv=mysql_fetch_array($mvs)){
	echo $mv['name'].$mv['url'];
}
*/
?>
<script type="text/javascript">
var video=document.getElementById("video");
function playPause(){ 
if (video.paused) 
	video.play(); 
else 
	video.pause(); 
}

function makeBig(){
	video.height=432; 
} 

function makeSmall(){
	video.height=216; 
} 
</script> 
<button onclick="playPause()">播放/暂停</button> 
<button onclick="makeBig()">大</button>
<button onclick="makeSmall()">小</button>
</body></html>