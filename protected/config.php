<?php 
return array (
  'REWRITE' => 
  array (
  ),
  'APP' => 
  array (
    'DEBUG' => true,
    'LOG_ON' => false,
    'LOG_PATH' => BASE_PATH . 'cache/log/',
    'URL_HTTP_HOST' => '',
    'TIMEZONE' => 'PRC',
    'COOKIE_RANGE' => '',
    'COOKIE_PATH' => '/',
    'COOKIE_PRE' => 'yx_',
    'HTML_CACHE_ON' => false,
    'HTML_CACHE_PATH' => BASE_PATH . 'cache/html_cache/',
    'HTML_CACHE_RULE' => 
    array (
      'default' => 
      array (
        'index' => 
        array (
          'index' => 3000,
        ),
        'news' => 
        array (
          '*' => 3000,
        ),
        'photo' => 
        array (
          '*' => 3000,
        ),
        'page' => 
        array (
          '*' => 3000,
        ),
      ),
    ),
  ),
  'DB' => 
  array (
    'DB_TYPE' => 'mysql',
    'DB_HOST' => 'localhost',
    'DB_USER' => 'root',
    'DB_PWD' => '888888',
    'DB_PORT' => '3306',
    'DB_NAME' => 'yxcmsapp',
    'DB_CHARSET' => 'utf8',
    'DB_PREFIX' => 'yx_',
    'DB_CACHE_ON' => false,
    'DB_CACHE_PATH' => BASE_PATH . 'cache/db_cache/',
    'DB_CACHE_TIME' => 600,
    'DB_PCONNECT' => false,
    'DB_CACHE_CHECK' => true,
    'DB_CACHE_FILE' => 'cachedata',
    'DB_CACHE_SIZE' => '15M',
    'DB_CACHE_FLOCK' => true,
  ),
  'TPL' => 
  array (
    'TPL_TEMPLATE_PATH' => '',
    'TPL_TEMPLATE_SUFFIX' => '.php',
    'TPL_CACHE_ON' => false,
    'TPL_CACHE_TYPE' => '',
    'TPL_CACHE_PATH' => BASE_PATH . 'cache/tpl_cache/',
    'TPL_CACHE_SUFFIX' => '.php',
  ),
  'ver_name' => 'YxcmsApp 1.1.7',
  'ver_date' => '20130529',
  'copyright' => '由Ycms提供技术支持',
  'sitename' => 'Yxcms建站系统演示站',
  'siteurl' => 'http://www.ycms.net/',
  'keywords' => 'Yxcms,建站系统,cms,方便,高效,灵活,实用,开源',
  'description' => 'Yxcms是一款高效,灵活,实用,开源的企业建站系统,基于PHP和mysql技术,不纠结于任何设计模式。',
  'telephone' => '13638888888',
  'QQ' => 8888888,
  'email' => '8888888@qq.com',
  'address' => 'your address',
  'icp' => 'ICPxxxxxx',
  'fileupSize' => 2000000,
  'imgupSize' => 1000000,
  'ifwatermark' => true,
  'watermarkImg' => 'logo.png',
  'watermarkPlace' => 9,
  'coverMaxwidth' => 260,
  'coverMaxheight' => 208,
  'thumbMaxwidth' => 145,
  'thumbMaxheight' => 110,
  'allowType' => 'jpg,bmp,gif,png,flv,mp4,mp3,wma,mp4,7z,zip,rar,ppt,txt,pdf,xls,doc,swf,wmv,avi,rmvb,rm',
);