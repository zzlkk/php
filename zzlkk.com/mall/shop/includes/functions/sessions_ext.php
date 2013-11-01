<?php
$conn = mysql_connect('127.0.0.1','root','PD06root');
if(!$conn)die('暂时无法连接服务器');
mysql_query("set names utf8");
mysql_select_db('vovor',$conn);
  
  function _sess_open($save_path, $session_name) {
    return true;
  }

  function _sess_close() {
    return true;
  }

  
  function _sess_read($key) {

    $qid = "select value
            from " . TABLE_SESSIONS . "
            where sesskey = '" . addslashes($key) . "'
            and expiry > '" . time() . "'";

    $value = mysql_query($qid);

    if (isset($value->fields['value']) && $value->fields['value']) {
      $value->fields['value'] = base64_decode($value->fields['value']);
      return $value->fields['value'];
    }

    return ("");
  }

  function _sess_write($key, $val) {
    $val = base64_encode($val);

    global $SESS_LIFE;

    $expiry = time() + $SESS_LIFE;

    $qid = "select count(*) as total
            from " . TABLE_SESSIONS . "
            where sesskey = '" . addslashes($key) . "'";

    $total = mysql_query($qid);

    if ($total->fields['total'] > 0) {
      $sql = "update " . TABLE_SESSIONS . "
              set expiry = '" . addslashes($expiry) . "', value = '" . addslashes($val) . "'
              where sesskey = '" . addslashes($key) . "'";

      $result = mysql_query($sql);

    } else {
      $sql = "insert into " . TABLE_SESSIONS . "
              values ('" . addslashes($key) . "', '" . addslashes($expiry) . "', '" .
                       addslashes($val) . "')";

      $result = mysql_query($sql);

    }
  return (!empty($result) && !empty($result->resource));
  }

  function _sess_destroy($key) {
    $sql = "delete from " . TABLE_SESSIONS . " where sesskey = '" . addslashes($key) . "'";
    return mysql_query($sql);
  }

  function _sess_gc($maxlifetime) {
    $sql = "delete from " . TABLE_SESSIONS . " where expiry < " . time();
    mysql_query($sql);
    return true;
  }

  session_set_save_handler('_sess_open', '_sess_close', '_sess_read', '_sess_write', '_sess_destroy', '_sess_gc');

  function zen_session_start() {
    @ini_set('session.gc_probability', 1);
    @ini_set('session.gc_divisor', 2);
	//@ini_set("session.cookie_path",'../');
	//@ini_set("session.cookie_domain",'.vovor.cn');
    if (IS_ADMIN_FLAG === true) {
      @ini_set('session.gc_maxlifetime', (SESSION_TIMEOUT_ADMIN > 900 ? 900 : SESSION_TIMEOUT_ADMIN));
    }
  	if (preg_replace('/[a-zA-Z0-9]/', '', session_id()) != '')
  	{
  	  zen_session_id(md5(uniqid(rand(), true)));
  	}
    $temp = session_start();
    if (!isset($_SESSION['securityToken'])) {
      $_SESSION['securityToken'] = md5(uniqid(rand(), true));
    }
    return $temp;
  }

  function zen_session_register($variable) {
    die('This function has been deprecated. Please use Register Globals Off compatible code');
  }

  function zen_session_is_registered($variable) {
    die('This function has been deprecated. Please use Register Globals Off compatible code');
  }

  function zen_session_unregister($variable) {
    die('This function has been deprecated. Please use Register Globals Off compatible code');
  }

  function zen_session_id($sessid = '') {
    if (!empty($sessid)) {
      $tempSessid = $sessid;
  	  if (preg_replace('/[a-zA-Z0-9]/', '', $tempSessid) != '')
  	  {
  	    $sessid = md5(uniqid(rand(), true));
  	  }
      return session_id($sessid);
    } else {
      return session_id();
    }
  }

  function zen_session_name($name = '') {
    if (!empty($name)) {
      $tempName = $name;
      if (preg_replace('/[a-zA-Z0-9]/', '', $tempName) == '') return session_name($name);
      return FALSE;
    } else {
      return session_name();
    }
  }

  function zen_session_close() {
    if (function_exists('session_close')) {
      return session_close();
    }
  }

  function zen_session_destroy() {
    return session_destroy();
  }

  function zen_session_save_path($path = '') {
    if (!empty($path)) {
      return session_save_path($path);
    } else {
      return session_save_path();
    }
  }

  function zen_session_recreate() {
    global $http_domain, $https_domain, $current_domain;
      if ($http_domain == $https_domain) {
      $saveSession = $_SESSION;
      $oldSessID = session_id();
      session_regenerate_id();
      $newSessID = session_id();
      session_id($oldSessID);
      session_id($newSessID);
      session_set_save_handler('_sess_open', '_sess_close', '_sess_read', '_sess_write', '_sess_destroy', '_sess_gc');
      $_SESSION = $saveSession;
      if (IS_ADMIN_FLAG !== true) {
        whos_online_session_recreate($oldSessID, $newSessID);
      }
    }
  }
