<?php
/**
 $rule 要验证的规则名称
 $uid 用户的id
 $relation 规则组合方式，默认为'or'，以上三个参数都是根据Auth的check()函数来的
 $t 符合规则后，执行的代码
 $f 不符合规则的，执行代码，默返回字符串'没有权限'
*/
function authcheck($rule,$uid,$relation='or'){
	if(in_array($rule,C('AUTH_EXCEPT'))){
		return true;//无需验证的权限
	}elseif(empty($uid)){
		return false;//未登录
	}elseif(in_array($uid,C('AUTH_SUPER'))){
		return true;//是超级管理员
	}else{//进行权限验证
		import('ORG.Util.Auth');
		$auth=new Auth();
		return $auth->check($rule,$uid,$relation);
	}
}
/**
 * 递归排序无限级内容数组
 * $arr 待排序数组
 * $pid 开始排序父id
 * $indent 缩进内容
 * $level 缩进量
 * $line 显示级别对齐线
 * $mark 子级符号
 */
function unlimitLevel($arr,$pid=0,$indent='&nbsp;&nbsp;',$level=0,$line=false,$mark='┕'){
	$tmp = array();
	foreach($arr as $a){
		if($pid==$a['pid']){
			$a['level']=$level+1;
			$a['indent']=($line&&$level>1?$indent.str_repeat('┊',$level-1):str_repeat($indent,$level)).($level>0?$mark:($a['id']%2==0?'♂':'♀'));
			$tmp[]=$a;
			$tmp = array_merge($tmp,unlimitLevel($arr,$a['id'],$indent,$level+1));
		}
	}
	return $tmp;
}
/**
 * 暂存消息内容到Session 3提示/4警告/5错误
 */
function sessionTip($msg,$level=1){
	session('emsg',array('level'=>$level,'msg'=>$msg));
}
/**
 * 输出暂存的消息内容，然后清空消息
 */
function sessionMsg(){
	if(empty($_SESSION['emsg'])){
		return;
	}else{
		echo '<script type="text/javascript">xalert("'.$_SESSION['emsg']['msg'].'",'.$_SESSION['emsg']['level'].');</script>';
		unset($_SESSION['emsg']);
	}
}
/**
 * 处理自动跳转地址，
 * 有参数就设置，无参数取出并清除。
 */
function originalUrl($url=''){
	if(empty($url)){
		$ourl = $_SESSION['originalUrl'];
		unset($_SESSION['originalUrl']);
		return $ourl;
	}else{
		$_SESSION['originalUrl']=$url;
		return null;
	}
}
/**
 * AES-256加密，
 * key 密钥，data 原文
 */
function aesEncode($key,$data){
	$td = mcrypt_module_open(MCRYPT_RIJNDAEL_256,'',MCRYPT_MODE_CBC,'');
	$iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td),MCRYPT_RAND);
	mcrypt_generic_init($td,$key,$iv);
	$encrypted = mcrypt_generic($td,$data);
	mcrypt_generic_deinit($td);
	return $iv . $encrypted;
}
/**
 * AES-256解密
 * key 密钥，data 密文
 */
function aesDecode($key,$data){
	$td = mcrypt_module_open(MCRYPT_RIJNDAEL_256,'',MCRYPT_MODE_CBC,'');
	$iv = mb_substr($data,0,32,'latin1');
	mcrypt_generic_init($td,$key,$iv);
	$data = mb_substr($data,32,mb_strlen($data,'latin1'),'latin1');
	$data = mdecrypt_generic($td,$data);
	mcrypt_generic_deinit($td);
	mcrypt_module_close($td);
	return trim($data);
}
?>