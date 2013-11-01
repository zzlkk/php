<?php
session_start();
include("includes/db.conn.php");
include("includes/conf.class.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">      
<title>
<?php echo $bsiCore->config['conf_apartment_name'];?>
</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/craftyslide.css" />
<link href="js/menu/superfish.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="gd/js/jquery.kinMaxShow-1.1.src.js"></script>
<script type="text/javascript">
$(function(){
	
    $("#kinMaxShow").kinMaxShow({
	//设置焦点图高度(单位:像素) 必须设置 否则使用默认值 500    
        height:300,
	//设置焦点图 按钮效果
        button:{
	    //设置焦点图切换方式为mouseover 鼠标经过按钮切换图片, 默认为 click， 可选 click[鼠标点击切换]或mouseover[鼠标滑过切换]        
            switchEvent:'mouseover',
	    //设置显示 索引数字  true 显示， 默认为 false 不显示            
            showIndex:true,
            //按钮常规下 样式设置 ，css写法，类似jQuery的 $('xxx').css({key:value,……})中css写法。            
            //【友情提示：可以设置透明度哦 不用区分浏览器 统一为 opacity，CSS3属性也支持哦 如：设置按钮圆角、投影等，只不过IE8及以下不支持】            
            normal:{width:'18px',height:'18px',lineHeight:'18px',left:'16px',bottom:'16px',fontSize:'12px',opacity:0.8,background:"#666666",border:"1px solid #999999",color:"#CCCCCC",marginRight:'6px'},
            //当前焦点图按钮样式 设置，写法同上            
            focus:{background:"#CC0000",border:"1px solid #FF0000",color:"#000000"}
            }			
    });
});

</script>
<style type="text/css">
     /* 设置焦点图父级宽度 */    
    #show{width:600px; margin:0 auto;}
    #kinMaxShow{display:none;}
     /* 设置焦点图标题位置、样式等。标题位置、样式完全可以自定义哦 */    	
    #kinMaxShow p.title{ position:absolute; left:0; bottom:0; text-indent:10px; line-height:30px;font-family:Verdana; color:#FFF; display:block;width:100%; height:30px; font-family:14px;filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#aa000000,endcolorstr=#aa000000);background:rgba(0,0,0,0.5);}
</style>
<script src="js/craftyslide.min.js"></script>
<script>
$(document).ready(function(){	
       $("#slideshow").craftyslide({
		  'width': 600,
		  'height': 350,
		  'pagination': false,
		  'fadetime': 1000,
		  'delay': 5000
		});
});
</script> 
<script type="text/javascript" src="js/menu/superfish.js"></script>

<link rel="stylesheet" type="text/css" href="css/custom-theme/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<?php if($bsiCore->config['conf_rental_type']==1){ ?>
<script type="text/javascript">

$(document).ready(function(){	
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
		$( "#txtFromDate, #txtToDate" ).datepicker({
            minDate: 0,
			dateFormat: '<?php echo $bsiCore->config['conf_dateformat'];?>',
            defaultDate: "+1d",
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
            }
        });


 $("#datepickerImage").click(function() { 
    $("#txtFromDate").datepicker("show");
  });
 $("#datepickerImage1").click(function() { 
    $("#txtToDate").datepicker("show");
  });
  
  $('#btn_appmt_search').click(function() { 		
	  	if($('#txtFromDate').val()==""){
	  		alert('请选择入住日期.');
	  		return false;
	 	}else if($('#txtToDate').val()==""){
	  		alert('请选择退房日期.');
	  		return false;
	  	} else {
	  		return true;
	 	}	  
  });	
});
</script>
<?php } elseif($bsiCore->config['conf_rental_type']==2){ ?>
<script type="text/javascript">
 $(function() {
	 $.datepicker.setDefaults({ dateFormat: '<?php echo $bsiCore->config['conf_dateformat'];?>', minDate: new Date(), numberOfMonths: 2 });
        $("#txtFromDate1").datepicker(
		
        { beforeShowDay: function(day) {
            var day = day.getDay();
            if (day == <?php echo $bsiCore->config['conf_week_checkin_day'];?> ) {
                return [true, "somecssclass"]
            } else {
                return [false, "someothercssclass"]
            }
        }
        });
		$("#datepickerImage").click(function() { 
    		$("#txtFromDate1").datepicker("show");
  		});
		
		$('#btn_appmt_search').click(function() { 		
			if($('#txtFromDate1').val()==""){
				alert('请选择入住日期.');
				return false;
			} else {
				return true;
			}	  
  		});
    });
</script>
<?php } elseif($bsiCore->config['conf_rental_type']==3){ ?>
<script type="text/javascript">
$(document).ready(function() {
    var currentTime = new Date()    
    var minDate1 = new Date(currentTime.getFullYear(),currentTime.getMonth() +2, -1);
   $('#txtMonthIn').datepicker({
     changeMonth: true,
     changeYear: true,
     dateFormat: 'MM yy',
       showButtonPanel: true,
       minDate: minDate1,
       
     onClose: function() {
        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
     },
       
     beforeShow: function() {
       if ((selDate = $(this).val()).length > 0)
       {
          iYear = selDate.substring(selDate.length - 4, selDate.length);
          iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
          $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
           $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
       }
    }
  });
  
   $("#txtMonthIn1").click(function() { 
    $("#txtMonthIn").datepicker("show");
  });
  
     $('#btn_appmt_search').click(function() { 		
	  	if($('#txtMonthIn').val()==""){
	  		alert('请选择入住月份.');
	  		return false;
	 	} else {
	  		return true;
	 	}	  
	});	
  
});
</script>
<style>
.ui-datepicker-calendar {
	display: none;
}
.ui-datepicker {
	width: 17em;
	padding: .2em .2em 0;
	display: none;
	font-size:14px;
}
</style>
<?php } ?>
</head>
</head>

<body style="font-family: 'MavenProRegular';">
<?php include("header.php"); ?>
<div id="banner-div">
  <div id="banner-inside">
    <div id="slider-div">
       <div id="slideshow">
        <?php echo $bsiCore->showAllApartImage(); ?>
      </div>   
    </div>
    <form action="search-result.php" method="post" name="form1" id="form1">
      <div id="find-property">
        <h1 class="col1">找房间</h1>
        <dl>
          <dt style="width:110px;">
            <label for=sc2 >房间类型:</label>
          </dt>
          <dd>
            <select id="appartment_type" name="appartment_type" class="home-select">
              <?php echo $bsiCore->getApmtTypeCombobox();?>
            </select>
          </dd>
          <?php if($bsiCore->config['conf_rental_type']==1){ ?>
          <input type="hidden" id="datediff1" value="" />
          <dt style="width:106px;">
            <label for=cin>入住日期:</label>
          </dt>
          <dd>
            <table>
              <tr>
                <td><input type="text" name="check_in" id="txtFromDate" class="home-input" style="width:79px;" readonly="readonly" /></td>
                <td><a id="datepickerImage" href="javascript:;"><img src="images/month.png" width="18px" height="18px" style=" margin-bottom:-1;" /></a></td>
              </tr>
            </table>
          </dd>
          <dt style="width:106px;">
            <label for=cout>退房日期:</label>
          </dt>
          <dd>
            <table>
              <tr>
                <td><input type="text" name="check_out" id="txtToDate" class="home-input" style="width:79px;" readonly="readonly" /></td>
                <td><a id="datepickerImage1" href="javascript:;"><img src="images/month.png" width="18px" height="18px" style=" margin-bottom:-1;" /></a></td>
              </tr>
            </table>
          </dd>
          <?php } elseif($bsiCore->config['conf_rental_type']==2){ ?>
          <dt style="width:110px;">
            <label for=cout style="width:200px;">入住日期:</label>
          </dt>
          <dd>
            <table><tr><td valign="top"><input type="text" name="check_in" id="txtFromDate1" class="home-input" style="width:79px;" readonly="readonly" /></td><td valign="top"><a id="datepickerImage" href="javascript:;"><img src="images/month.png" width="22px" height="22px" style=" margin-bottom:-1;" /></a></td></tr></table></dd>
          <dt style="width:110px;">
            <label for=cout style="width:200px;">Number of Week:</label>
          </dt>
          <dd>
            <select id="weeks" name="weeks" class="home-select">
             <?php echo $bsiCore->generateWeekMonthdd();?>
            </select>
          </dd>
          <?php } elseif($bsiCore->config['conf_rental_type']==3){ ?>
          <dt style="width:106px;">
            <label for=cout>入住月份:</label>
          </dt>
          <dd>
             <table>
              <tr>
                <td>
            <input type="text" name="txtMonthIn" id="txtMonthIn" class="home-input" style="width:110px;" readonly="readonly" /></td>
            <td><a id="txtMonthIn1" href="javascript:;"><img src="images/month.png" width="18px" height="18px" style=" margin-bottom:-1;" /></a></td>
              </tr>
            </table>
          </dd>
          <dt  style="width:110px;">
            <label for=cout>月数:</label>
          </dt>
          <dd>
            <select id="months" name="months" class="home-select">
               <?php echo $bsiCore->generateWeekMonthdd();?>
            </select>
          </dd>
          <?php } ?>
          <dt style="width:110px;">
            <label for=sc3>选项:</label>
          </dt>
          <dd>
			<select class="home-select" name="district">
            <?php echo $bsiCore->getDistrictList($_SESSION['now_city']);?>
			</select>
          </dd>
          <dt style="margin-top:6px; width:110px;"></dt>
          <dd  style="margin-top:6px;">
            <select  class="home-select" name="locationType">
            <?php echo $bsiCore->getApmtStreetCombobox('');?>
			</select>
          </dd>
          <dt style="width:110px;">
            <label for=cout style="width:200px;">排序方式:</label>
          </dt>
          <dd>
            <select id="sorting" name="sorting" class="home-select">
              <option value="asc">价格由低到高</option>
              <option value="desc">价格由高到低</option>
              
            </select>
          </dd>
          <dt style="width:110px;"></dt>
          <dd>
            <input name="submit" id="btn_appmt_search" value="搜索" type="submit" class="btn1" />
          </dd>
        </dl>
      </div>
    </form>
  </div>
</div>
<div id="shadow">
  <div id="shadow-inside">
    <div id="shadow-left"></div>
    <div id="shadow-right"></div>
  </div>
</div>
<div id="container-div">
  <div id="container-inside">
    <div id="leftside-div">
      <div id="about-us">
        <?php echo $fixedurl_content;?>
      </div>
     
    </div>
    <div class="clr"></div>
    <div id="rightside-div">
      <h2 class="col2">热门房间 <span class="col3">图片</span></h2>
      <?php echo $bsiCore->getTopApartmentPhoto();?>
    </div>
    <div class="clr"></div>
    <div class="new-listings-div">
      <h1 class="col2">新列表</h1>
      <?php echo $bsiCore->getNewListing();?>
    </div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>
<div class="clr"></div>
<?php include("footer.php"); ?>
</body>
</html>
