<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<script type="text/javascript">
//<![CDATA[
jQuery(function() {
   $(".content").contents().find("img").each(function(){//限制内容中图片大小
       if($(this).width()>600){
         $(this).height($(this).height()*(600/$(this).width()));
         $(this).width(600);
         $(this).wrap("<a href=" + $(this)[0].src + " target=_blank></a>");
     }
  });
});
//]]>
</script>
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
           <h1 class="con-tit"><?php echo $info['title']; ?></h1>
           <p class="con-info">发布日期：<?php echo date('Y-m-d H:m:i',$info['addtime']); ?>&nbsp;&nbsp;点击量：<?php echo $info['hits']; ?>&nbsp;&nbsp; 信息来源：<?php echo $info['origin']; ?> </p>
           <div class="yx-u content" id="content">
                <?php echo $info['content']['content']; ?>
           </div>
           <?php $n=1;if(is_array($extinfo)) foreach($extinfo AS $vo) { ?>
                <div><?php echo $vo['name']; ?>:<?php echo $vo['value']; ?></div>
           <?php $n++;}unset($n); ?>
           
           <div class="pagelist yx-u"><?php echo $info['content']['page']; ?></div>

           <ul class="next">
                 <li>上一篇：<?php if(!empty($upnews)) { ?><a href="<?php echo url($upnews['method'],array('id'=>$upnews['id']));?>" onFocus="this.blur()"><?php echo $upnews['title']; ?></a><?php } else { ?>没有了....<?php } ?></li>
                <li>下一篇：<?php if(!empty($downnews)) { ?><a href="<?php echo url($downnews['method'],array('id'=>$downnews['id']));?>" onFocus="this.blur()"><?php echo $downnews['title']; ?></a><?php } else { ?>没有了....<?php } ?></li>
           </ul>
       </div>
    </div>
    <?php $cpTemplate->display("arightCom"); ?>
</div>
</div>