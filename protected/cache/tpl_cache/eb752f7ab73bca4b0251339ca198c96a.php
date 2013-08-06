<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<div id="Main">
<!-- <div class="adv"> -->
<!--     <img src="<?php echo __PUBLICAPP__; ?>/images/banner.png"> -->
<!-- </div> -->
<div class="yx-g">
    <div class="yx-u-17-24">
       <div class="box index-big">
           <div class="bock-tit">
           <h3>
               当前位置：<a href="<?php echo url();?>">首页</a> >
               <?php $n=1;if(is_array($daohang)) foreach($daohang AS $vo) { ?>
                     <a href="<?php echo $vo['url']; ?>"><?php echo $vo['name']; ?></a> >
               <?php $n++;}unset($n); ?>
           </h3>
           </div>
           <?php $n=1;if(is_array($alist)) foreach($alist AS $vo) { ?>
            <div class="arlist">
              <a style="color:<?php echo $vo['color']; ?>" onFocus="this.blur()" title="<?php echo $vo['title']; ?>" href="<?php echo $vo['url']; ?>" target="_blank"><h2><?php echo $vo['title']; ?></h2></a>
              <span><?php echo date('Y-m-d H:m:i',$vo['addtime']); ?>&nbsp;&nbsp;&nbsp;&nbsp;点击:<?php echo $vo['hits']; ?></span>
              <p><?php echo $vo['description']; ?>......</p>
              <a class="detail" href="<?php echo url($vo['method'],array('id'=>$vo['id']));?>">更多详细>></a>
           </div>
           <?php $n++;}unset($n); ?>
           <div class="pagelist yx-u"><?php echo $page; ?></div>
       </div>
    </div>
    <?php $cpTemplate->display("arightCom"); ?>
</div>
</div>