<?php
class IndexAction extends BaseAction{
    public function index(){
		$this->display();
    }
	public function login(){
		$name = I('name','');
		$pwd = I('pwd','');
		if(IS_POST&&strlen($name)>0&&strlen($pwd)>0){
			$user = M('users')->where(array('name'=>$name,'pwd'=>md5($pwd)))->find();
			if($user){
				$_SESSION['user']=$user;
				sessionTip($user['nick'].',欢迎登录！');
				header('Location: '.(originalUrl()?originalUrl():'/'));return;
			}else{
				sessionTip('登录失败！',4);
			}
		}
		$this->display();
	}
	public function qqlogin(){
		$appid = '100271837';
		$appkey = 'bce7fff0d5af7f1d6f6a75639d659de3';
		$backurl = 'http://admin.zzlkk.com/qqlogin';
		if(isset($_GET['state'])&&isset($_GET['code'])&&$_SESSION['qqstate']==$_GET['state']){
			//QQ登录对接
			$url_token = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=$appid&code=".$_GET['code']."&client_secret=$appkey&redirect_uri=$backurl";
			$str = file_get_contents($url_token);
			if(strpos($str,"callback")!==false){
				$lpos = strpos($str,"(");
				$rpos = strrpos($str,")");
				$str  = substr($str,$lpos+1,$rpos-$lpos-1);
				$msg = json_decode($str);
				if(isset($msg->error)){
					sessionTip($msg->error.':'.$msg->error_description,5);
					$this->redirect('login');exit;
				}
			}
			$params = array();
			parse_str($str,$params);
			//获取唯一用户号进行关联或登录操作
			$url_openid = "https://graph.qq.com/oauth2.0/me?access_token=".$params['access_token'];
			$str = file_get_contents($url_openid);
			if(strpos($str,"callback")!==false){
				$lpos = strpos($str,"(");
				$rpos = strrpos($str,")");
				$str  = substr($str,$lpos+1,$rpos-$lpos-1);
			}
			$qq = json_decode($str);
			if(isset($qq->openid)){
				require('db.php');
				$sql="select id,nick,head from users where u_qq='".$qq->openid."'";
				$user = mysql_fetch_array(mysql_query($sql));
				if($user){//old user
					$_SESSION['user'] = $user;
				}else{//new user
					$url_info = "https://graph.qq.com/user/get_user_info?access_token=".$params['access_token']."&oauth_consumer_key=$appid&openid=".$qq->openid;
					$str = file_get_contents($url_info);
					$nqq = json_decode($str);
					$sql = "insert into users(u_qq,nick,head) values('".$qq->openid."','".$nqq->nickname."','".$nqq->figureurl_qq_2."')";
					mysql_query($sql);
					$_SESSION['user'] = array('id'=>0,'nick'=>$nqq->nickname,'head'=>$nqq->figureurl_qq_2);
				}
				sessionTip($_SESSION['user']['nick'].',欢迎登录！');
				$this->redirect('index');
			}else{
				sessionTip($msg->error.':'.$msg->error_description,5);
				$this->redirect('login');
			}
		}else{
			//初始化QQ登录链接
			$_SESSION['qqstate'] = md5(session_id().time());
			header("Location: https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=$appid&state=".$_SESSION['qqstate']."&redirect_uri=$backurl");
		}
	}
	public function logout(){
		session_destroy();
		session_unset();
		$this->redirect('login');
	}
}
?>