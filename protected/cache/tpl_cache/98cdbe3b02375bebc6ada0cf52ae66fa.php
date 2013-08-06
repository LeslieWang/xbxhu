<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<div id="Main">
<!-- <div class="adv"> -->
<!--     <img src="<?php echo __PUBLICAPP__; ?>/images/banner.png"> -->
<!-- </div> -->
<div class="yx-g page">
       <div class="box yx-u page-con">
           <div class="bock-tit">
           <h3>
               当前位置：<a href="<?php echo url();?>">首页</a> >
               <?php $n=1;if(is_array($daohang)) foreach($daohang AS $vo) { ?>
                     <a href="<?php echo $vo['url']; ?>"><?php echo $vo['name']; ?></a> >
               <?php $n++;}unset($n); ?>
           </h3>
           </div>
           <h1 class="con-tit"><?php echo $info['title']; ?></h1>
           <div class="content"><?php echo $info['content']['content']; ?></div>
           <div class="pagelist yx-u"><?php echo $info['content']['page']; ?></div>
       </div>
</div>
</div>