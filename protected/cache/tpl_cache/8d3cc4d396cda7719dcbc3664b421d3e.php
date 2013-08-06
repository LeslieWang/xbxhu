<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="<?php echo $keywords; ?>"/>
<meta name="description" content="<?php echo $description; ?>"/>
<title><?php echo $title; ?></title>
<link rel="stylesheet" href="<?php echo __PUBLICAPP__; ?>/css/base.css" type="text/css">
<link rel="stylesheet" href="<?php echo __PUBLICAPP__; ?>/css/default.css" type="text/css">
<link rel="stylesheet" href="<?php echo __PUBLICAPP__; ?>/css/slider.css" type="text/css">
<script type="text/javascript" src="<?php echo __PUBLIC__; ?>/js/jquery.js"></script>
<script type='text/javascript' src='<?php echo __PUBLICAPP__; ?>/js/menu.js'></script>
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
               <td><embed height="120px" type="application/x-shockwave-flash" width="990px" src="<?php echo __PUBLICAPP__; ?>/images/top.swf" menu="true" loop="true" play="true"></embed></td>
   </div>
   <div id="menu">
      <ul class="menu"><!--菜单可以无限深度，以下只演示4层深度导航菜单调用，如果您实际项目中需要4层以上，请参照规律，多加一次判断。如果您懒得研究,请加QQ:404133748-->
        <li><a <?php if(empty($rootid)) { ?> class="current" <?php } ?> href="<?php echo url();?>"><span>首页</span></a></li>
        <li><ul><li><ul><li><ul>
      <?php $n=1; if(is_array($sorts)) foreach($sorts AS $key => $vo) { ?>
        <?php if($vo['ifmenu']) { ?>         
           <?php if($vo['deep']==1) { ?>
             </ul></li></ul></li></ul></li><li <?php if($rootid==$key) { ?> class="current" <?php } ?> ><a <?php echo $mclass; ?> href="<?php echo $vo['url']; ?>"><span><?php echo $vo['name']; ?></span></a><ul><li><ul><li><ul>
           <?php } elseif ($vo['deep']==2) { ?>
             </ul></li></ul></li><li><a href="<?php echo $vo['url']; ?>"><span><?php echo $vo['name']; ?></span></a><ul><li><ul>
           <?php } elseif ($vo['deep']==3) { ?>
             </ul></li><li><a href="<?php echo $vo['url']; ?>"><span><?php echo $vo['name']; ?></span></a><ul>
           <?php } elseif ($vo['deep']==4) { ?>
             <li><a href="<?php echo $vo['url']; ?>"><span><?php echo $vo['name']; ?></span></a></li>
           <?php } ?>
         <?php } ?>
      <?php $n++;}unset($n); ?>
       </ul></li>
    </ul>
    </div>
</div>

<?php $cpTemplate->display("$__template_file"); ?> <!--这里不用说了吧，主流cms都有的layout功能主体部分调用-->
<div id="Foot">
   <div class="foot-con">
          版权:<?php echo $copyright; ?>&nbsp;&nbsp;&nbsp;&nbsp;地址:<?php echo $address; ?>&nbsp;&nbsp;&nbsp;&nbsp;技术支持:<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3499936&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:3499936:44" alt="在线咨询" title="在线咨询" /></a>
   </div>
</div>
<div id="toTop">Back to top</div>
</body>
</html>