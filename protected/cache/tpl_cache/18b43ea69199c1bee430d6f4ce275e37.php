<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<div id="Main">
       <div class="box search-con">
           <div class="bock-tit"><h3>一共找到 <font style="color:red"> <?php echo $count; ?> </font> 个结果 </h3></div>
           <?php
               if ($type=='download') {
 
           ?>
           <?php $n=1;if(is_array($list)) foreach($list AS $vo) { ?>
            <div class="arlist">
              <a  onFocus="this.blur()" title="<?php echo $vo['title']; ?>" href="<?php echo url('default/download/download',array('id'=>$vo['id']));?>" target="_blank"><h2><?php echo str_replace($keywords,"<font style='color:red'>$keywords</font>",$vo['title']); ?></h2></a>
              <span><?php echo date('Y-m-d H:m:i',$vo['addtime']); ?>&nbsp;&nbsp;&nbsp;&nbsp;下载次数:<?php echo $vo['count']; ?></span>
            </div>
          <?php $n++;}unset($n); ?>
           <?php
               } else { 
           ?>
           <?php $n=1;if(is_array($list)) foreach($list AS $vo) { ?>
            <div class="arlist">
              <a  onFocus="this.blur()" title="<?php echo $vo['title']; ?>" href="<?php echo url($vo['method'],array('id'=>$vo['id']));?>" target="_blank"><h2><?php echo str_replace($keywords,"<font style='color:red'>$keywords</font>",$vo['title']); ?></h2></a>
              <span><?php echo date('Y-m-d H:m:i',$vo['addtime']); ?>&nbsp;&nbsp;&nbsp;&nbsp;点击:<?php echo $vo['hits']; ?></span>
              <p><?php echo str_replace($keywords,"<font style='color:red'>$keywords</font>",$vo['description']); ?>......</p>
            </div>
          <?php $n++;}unset($n); ?>
           <?php
               }
           ?>
           <div class="pagelist yx-u"><?php echo $page; ?></div>
       </div>
</div>