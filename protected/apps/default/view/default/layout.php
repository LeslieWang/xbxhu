<?php if(!defined('APP_NAME')) exit;?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="{$keywords}"/>
<meta name="description" content="{$description}"/>
<title>{$title}</title>
<link rel="stylesheet" href="__PUBLICAPP__/css/base.css" type="text/css">
<link rel="stylesheet" href="__PUBLICAPP__/css/default.css" type="text/css">
<link rel="stylesheet" href="__PUBLICAPP__/css/slider.css" type="text/css">
<script type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
<script type='text/javascript' src='__PUBLICAPP__/js/menu.js'></script>
<script type="text/javascript">
//<![CDATA[
	//Scroll to top
	jQuery(function() {
		jQuery(window).scroll(function() {
			if(jQuery(this).scrollTop() != 0) {
				jQuery('#toTop').fadeIn();	
			} else {
				jQuery('#toTop').fadeOut();
			}
		});
		jQuery('#toTop').click(function() {
			jQuery('body,html').animate({scrollTop:0},300);
	});
});
//]]>
</script>
</head>
<body>
<div id="Header">
   <div class="Top yx-g">
      <div class="yx-u-2-5"><img src="__PUBLICAPP__/images/logo.png" class="top-logo"></div>
      <div class="yx-u-3-5">
        <div class="Top-right">
          <div class="member-info">
          {if !$memberoff}<!--判断会员中心app是否开启-->
             {if !empty($auth)}<!--判断会员是否登陆-->
                用户：{$auth['nickname']}&nbsp;&nbsp; 上次登录IP：{$auth['lastip']}&nbsp;&nbsp;<a href="{url('member/index/index')}">【会员中心】</a>&nbsp;<a href="{url('member/index/logout')}">【退出】</a>
              {else}
                 <a class="yx-button" href="{url('member/index/login')}">登录</a>&nbsp;<a class="yx-button" href="{url('member/index/regist')}">注册</a>
             {/if}
           {/if}
          </div>
          <div class="searchbox">
              <div class="searchinput">
              <form method="get" action="{url('index/search')}">
                    <span class="tags">TAGS:
                        {tag:{table=(tags) field=(name) order=(hits desc,id desc) limit=(5)}}
                           <a href="{url('default/index/search',array('type'=>'all','keywords'=>urlencode($tag['name'])))}">[tag:name]</a>
                        {/tag}...&nbsp;&nbsp;
                     </span>
                   <input name="r" type="hidden" value="default/index/search" />
                    <select name="type">
                       <option value="all">全部&nbsp;</option>
                       <option value="news">文章&nbsp;</option>
                       <option value="photo">图集&nbsp;</option>
                     </select>
                     <input type="text"  name="keywords" value="" class="search-input">
                     <input type="submit" value="搜 索" class="yx-button">
               </form>
               </div>
           </div>
         </div>
      </div>
   </div>
   <div id="menu">
      <ul class="menu"><!--菜单可以无限深度，以下只演示4层深度导航菜单调用，如果您实际项目中需要4层以上，请参照规律，多加一次判断。如果您懒得研究,请加QQ:404133748-->
        <li><a {if empty($rootid)} class="current" {/if} href="{url()}"><span>首页</span></a></li>
        <li><ul><li><ul><li><ul>
      {loop $sorts $key $vo}
        {if $vo['ifmenu']}         
           {if $vo['deep']==1}
             </ul></li></ul></li></ul></li><li {if $rootid==$key} class="current" {/if} ><a {$mclass} href="{$vo['url']}"><span>{$vo['name']}</span></a><ul><li><ul><li><ul>
           {elseif $vo['deep']==2}
             </ul></li></ul></li><li><a href="{$vo['url']}"><span>{$vo['name']}</span></a><ul><li><ul>
           {elseif $vo['deep']==3}
             </ul></li><li><a href="{$vo['url']}"><span>{$vo['name']}</span></a><ul>
           {elseif $vo['deep']==4}
             <li><a href="{$vo['url']}"><span>{$vo['name']}</span></a></li>
           {/if}
         {/if}
      {/loop}
       </ul></li>
    </ul>
    </div>
</div>

{include file="$__template_file"} <!--这里不用说了吧，主流cms都有的layout功能主体部分调用-->
<div id="Foot">
   <div class="foot-con">
       <img class="logo" src="__PUBLICAPP__/images/Lmark.png">
       <div class="copy">
           {loop $sorts $key $vo}  
             {if $vo['ifmenu']}        
                {if $vo['deep']==1}
                    <a target="_blank" href="{$vo['url']}">{$vo['name']}</a> -
                {/if}
             {/if}
           {/loop}<br>
          Copyright @ 2012-2013 Yxcms Inc. All right reserved.Powered By <a target="_blank" title="免费版不可去除此版权" href="http://www.yxcms.net">YXcms</a>&nbsp;&nbsp;&nbsp;&nbsp;地址:{$address}&nbsp;&nbsp;&nbsp;&nbsp;<br>
         联系电话:{$telephone}&nbsp;&nbsp;&nbsp;&nbsp;传真:{$fax}&nbsp;&nbsp;&nbsp;&nbsp;邮编:{$postcode}&nbsp;&nbsp;&nbsp;&nbsp;校长邮箱：{$email}&nbsp;&nbsp;&nbsp;&nbsp;ICP:{$icp}
       </div>
   </div>
</div>
<div id="toTop">Back to top</div>
</body>
</html>