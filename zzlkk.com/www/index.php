<?php session_start(); ?><!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>查资料、看电影、找图片、搜商品 在这里看看</title>
<style type="text/css">
body{margin:0;}
.bar{height:25px;line-height:25px;background-color:#eee;border-bottom:1px solid #ddd;}
.bar .user{display:inline-block;line-height:25px;}
.bar .user img{margin-top:4px;}
.bar .user .head{position:absolute;width:66px;height:55px;overflow:hidden;border:8px solid #eee;}
.bar .user .head img{width:66px;position:absolute;bottom:0;}
.emthead{display:inline-block;width:82px;}
.body{width:1000px;height:auto;margin:0 auto;overflow:hidden;}
.search{text-align:center;padding:10px 0 20px 0;}
a#logo{font-family:'Alfa Slab One',Arial;font-size:16px;color:#08B12A;text-shadow: 2px 3px 2px #D8D8D8;display:block;padding-top:10px;cursor:pointer;}
a#logo:hover{text-shadow: 2px 3px 1px #D8D8D8;}
.keywords{width:333px;height:24px;line-height:24px;padding:1px 5px;border:1px solid #ddd;}
.go{width:111px;height:28px;margin-left:5px;border:1px solid #ddd;}
.sites{width:300px;min-height:380px;float:right;}
.sites a:hover{text-decoration:underline;}
.csite{height:171px;overflow:hidden;}
.site{padding-top:15px;}
.content{width:666px;min-height:380px;float:left;}
.copyright{padding:30px 0 10px 0;text-align:center;font-family:arial;font-size:12px;color:#666;}
.copyright label{color:#999;}

<!-- engine -->
#results_container{font-family:Arial, Helvetica, sans-serif;font-size:16px;}
#results_container a{color:#04c;}
a:visited, a.sb_link:visited, .sb_link a:visited, .sb_h3 a:visited {color: #639;}
.sb_h3.cttl{font-size:16px;}
h2 a{font-weight:normal;line-height:28px;}
h3{font-weight:normal;}
h3 a{text-decoration:underline;}
.sa_wr{margin-top:12px;}
.sa_wr p{padding-top:3px;}
strong{font-weight:normal;color:red;}
.vthv {display:none;}
cite,.sb_cite {color:green;padding-right:10px;}
.sb_meta{color:#777;}
.vtv2,.vidr,.vidrc{display:inline-block;}
.vtv2,.vidr,.vidrc{*display:inline;}
.vtv2 {padding: 0 8px 0 0;position:relative;}
.vt_text{position:absolute;bottom:1px;left:0;color:#fff;padding:0 5px 0 5px;font-size:11px;background-color:#000;}
.qscolumn {margin-right: 30px;float: left;}
.crch {margin-top: 10px;height: auto;overflow: hidden;}
#sa_bop{margin-top:10px;}
.sb_pag li {float: left;margin-left: 5px;}
.sb_pag li a{padding:8px 10px;line-height:25px;}
.sb_pag li a:hover{background-color:#eee;}
.sb_rc_btm,.sb_rc_btm_p{margin:10px 0;color:#777;}
#results_container a.sb_pagS{color:#777;}
#results_container a.sb_pagS:hover{background-color:#fff;cursor:auto;}
.sp_pss li{display:inline-block;margin-left:4px;}
.sp_pss li{*display:inline;}
</style>
<link href="calendar.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jQuery.1.8.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="common.js" charset="utf-8"></script>
</head>
<body>
<div class="bar">
	<div class="user">
	<?php
	if(isset($_SESSION['user'])){
		$user = $_SESSION['user'];
		echo "<div class=\"head\"><img src=\"$user[head]\" alt=\"$user[nick]\" /></div> <label class=\"emthead\"></label> <label>$user[nick]</label>，欢迎回来 <a style=\"color:#777;\" href=\"/login.php?logout\">退出</a>";
	}else{
		echo '<a href="/login.php?qqlogin"><img src="/images/qq.png" alt="使用QQ登录"/>登录</a>';
	}
	?>
	</div>
</div>
<div class="body">
	<div class="search"><a href="http://www.zzlkk.com" id="logo">查资料、看电影、找图片、搜商品 在这里看看</a><br /><input type="text" class="keywords" value="<?php echo $_REQUEST['q']; ?>" maxlength="32" /><input type="button" value=" 查询 " class="go" /></div>
	<div class="sites">
		<div class="site">
			<strong>常用链接</strong><br />
			<a href="http://pc.qq.com/all.html" target="_blank">QQ</a> <a href="http://dl.xunlei.com/mini.html" target="_blank">迅雷</a> <a href="http://down.360safe.com/setup.exe" target="_blank">360</a> <a href="http://notepad-plus-plus.org/download" target="_blank">notepad++</a> <a href="http://www.rarlab.com/download.htm" target="_blank">WinRAR</a> <a href="http://pinyin.sogou.com" target="_blank">搜狗拼音</a> <a href="http://wubi.sogou.com" target="_blank">搜狗五笔</a> <a href="http://www.drivergenius.com" target="_blank">驱动精灵</a>
			<a href="http://www.weiyun.com/disk" target="_blank">微云</a> <a href="http://baofeng.com" target="_blank">暴风</a> <a href="http://mbox.kuwo.cn" target="_blank">酷我</a> <a href="http://winmerge.org/downloads" target="_blank">WinMerge</a>
			<br /><br /><strong>影视网站</strong><br />
			<a href="http://hd.baofeng.com" target="_blank">暴风影院</a> <a href="http://video.sina.com.cn/movie/category/movie" target="_blank">新浪视频</a> <a href="http://tv.sohu.com/movie" target="_blank">搜狐视频</a> <a href="http://www.kankan.com" target="_blank">迅雷看看</a> <a href="http://v.qq.com/movie" target="_blank">腾迅视频</a>
			<a href="http://movie.pptv.com" target="_blank">PPTV</a> <a href="http://v.pps.tv/movie-index.html" target="_blank">PPS</a> | <a href="http://fun.tudou.com" target="_blank">土豆</a> <a href="http://fun.youku.com" target="_blank">优酷</a>
		</div>
<div class="csite" id="csite">
		<div class="site">
			<a href="http://www.zzlkk.com?shandao">重庆善道广告有限公司</a>
			<label>http://www.zzlkk.com</label>
			<label>企业形象设计，校园文化建设，园林景观设计。</label>
		</div>
		<div class="site">
			<a href="http://www.peidi100.com">重庆九龙坡区培迪科技</a>
			<label>http://www.peidi100.com</label>
			<label>网站建设，系统定制，解决方案，安全设计。</label>
		</div>
		<div class="site">
			<a href="http://www.rj028.com">荣军木门-四川荣军家具厂</a>
			<label>http://www.rj028.com</label>
			<label>荣军木门。</label>
		</div>
		<div class="site">
			<a href="http://www.darlingmall.com">达令商城</a>
			<label>http://www.darlingmall.com</label>
			<label>重庆数码产品特别供应商，手机电脑更放心实惠。</label>
		</div>
		<div class="site">
			<a href="http://www.nuoya360.com">诺亚商城</a>
			<label>http://www.nuoya360.com</label>
			<label>各种添加剂供应。</label>
		</div>
		<div class="site">
			<a href="http://www.manweiwenhua.com">漫维文化</a>
			<label>http://www.manweiwenhua.com</label>
			<label>专业餐饮一条龙服务。</label>
		</div>
</div>
	</div>
	<div class="content">
<?php //Bing Engine
	if(isset($_REQUEST['q'])){
		$engine = 'http://cn.bing.com';
		$q=urlencode($_REQUEST['q']);
		$p=isset($_GET['first'])?$_GET['first']:'';
		$f=isset($_GET['FORM'])?$_GET['FORM']:'';
		$url="$engine/search?q=$q&first=$p&FORM=$f";
		$html = file_get_contents($url);
		$start = strpos($html,'div id="results_container"')-1;
		$end = strpos($html,'div id="sidebar"')-7;
		$html = substr($html,$start,$end-$start);
		$html = str_replace('href="/search?','href="http://www.zzlkk.com/?',$html);
		$html = str_replace('href="/',"href=\"http://engine.zzlkk.com/",$html);
		$html = str_replace('src="/',"src=\"http://engine.zzlkk.com/",$html);
		
		echo $html;
	}else{
?>
		<div class="calendar">
			<div class="calendar_ctrl e_clear">
				<div class="time">00:00:00</div>
				<div class="ctrl_year e_clear">
					<a class="left_arrow" method="prev" href="javascript:;">&lt;</a>
					<div class="ctrl_year_box">
						<div class="dropselectbox">
							<h4 val=""></h4>
							<ul class="none" style="display:none;"></ul>
						</div>
					</div>
					<a class="right_arrow" method="next" href="javascript:;">&gt;</a>
				</div>
				<div class="ctrl_month e_clear">
					<a class="left_arrow" method="prev" href="javascript:;">&lt;</a>
					<div class="ctrl_month_box">
						<div class="dropselectbox">
							<h4 val=""></h4>
							<ul class="none" style="display:none;"></ul>
						</div>
					</div>
					<a class="right_arrow" method="next" href="javascript:;">&gt;</a>
				</div>
				<div class="ctrl_day">
					<div class="dropselectbox">
						<h4 val=""></h4>
						<ul class="none" style="display:none;"></ul>
					</div>
				</div>
				<a href="javascript:;" class="return_today_btn">返回今天</a>
			</div>
			<div class="calendar_week">
				<ul class="e_clear">
					<li class="week">星期日</li>
					<li>星期一</li>
					<li>星期二</li>
					<li>星期三</li>
					<li>星期四</li>
					<li>星期五</li>
					<li class="week">星期六</li>
				</ul>
			</div>
			<div class="calendar_list">
				<ul class="e_clear js-cld-panel"><li class="nextbefor weekend work" date=""></li></ul>
			</div>
		</div>
<script type="text/javascript" src="jquery-ui-1.8.23.custom.min.js" charset="utf-8"></script>
<script type="text/javascript" src="lunar.js" charset="utf-8"></script>
<script type="text/javascript" src="calendar.js" charset="utf-8"></script>
<?php } ?>
	</div>
</div>
<div class="copyright"><label>搜索技术由微软提供</label> © zzlkk 2013 渝ICP备13000453号</div>
<form id="engine" action="/" method="post"><input type="hidden" id="engineq" name="q" value=""></input></form>
</body>
<script type="text/javascript">
$(function(){
	$(".keywords").focus().select();
	$(".go").click(function(){
		if($(".keywords").val().length>0){
			$("#engineq").val($(".keywords").val());
			$("#engine").submit();
		}
	});
	$(".keywords").keyup(function(e){
        if(13==e.keyCode){$(".go").click();}
	});
	
	window.setInterval(function(){cutscroll("csite")},5000);
});
</script>
</html>