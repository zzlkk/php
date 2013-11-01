/**
 * 遮罩弹出层
 * @param wid 弹出层内容id
 * @param cid 关闭弹出层元素id
 */
function popup(wid,cid){
	var mtop = ($(window).height()*0.8-$("#"+wid).height())/2;
	mtop = mtop<1?0:parseInt(mtop);
	$(document.body).append('<div id="popbkg" style="position:absolute;z-index:97;left:0;top:0;width:100%;height:100%;opacity:0.4;filter:Alpha(opacity=40);background:#000;"></div>');
	$(document.body).append('<div id="outwin" style="position:absolute;z-index:98;left:0;top:0;width:100%;height:100%;"><div id="popwin" style="width:'+$("#"+wid).width()+'px;margin:'+mtop+'px auto 0 auto;"></div></div>');
	$("#"+wid).appendTo($("#popwin")).show();
	if(typeof(cid)!=='undefined'&&cid!==null){
		$("#"+cid).click(function(){
			$("#"+wid).hide().appendTo($(document.body));
			$("#popbkg").remove();$("#outwin").remove();
		});
	}
}
/**
 * 消息弹出层 2秒自动淡出
 * @param msg 消息内容
 * @param level 1 提示 2成功 3信息 4警告 5错误
 */
function xalert(msg,level){
	for(var i=0;i<10;i++){
		if($("#xalert"+i).length<1){
			$(document.body).append('<div id="xalert'+i+'" style="display:none;top:'+(60*i)+'px" class="xalert emsg'+level+'">'+msg+'</div>');
			$("#xalert"+i).slideDown().delay(2000).slideUp(function(){$("#xalert"+i).remove();});
			break;
		}
	}
}