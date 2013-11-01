<?php
return array(
		'SHOW_PAGE_TRACE'=>true, //显示调试标签
		'TMPL_FILE_DEPR' => '_',
		'DB_PREFIX' => '',
		'DB_DSN' => 'mysql://root:123456@127.0.0.1:3306/zzlkk',
		'DEFAULT_AJAX_RETURN' => 'JSON',
		'URL_MODEL' => 2,
		'URL_CASE_INSENSITIVE' => true,//URL不区分大小写

		'AUTH_CONFIG'=>array(
				'AUTH_ON' => true, //认证开关
				'AUTH_TYPE' => 1, //认证方式，1为时时认证；2为登录认证。
				'AUTH_GROUP' => 'auth_group', //用户组数据表名
				'AUTH_GROUP_ACCESS' => 'auth_group_access', //用户组明细表
				'AUTH_RULE' => 'auth_rule', //权限规则表
				'AUTH_USER' => 'userinfo' //用户信息表
		),
        'AUTH_SUPER' => array(10000,10003),
		'AUTH_EXCEPT' => array('Index_login','Index_qqlogin','Index_logout')
);
?>