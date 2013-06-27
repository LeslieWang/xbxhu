<?php if(!defined('APP_NAME')) exit;?>
<div id="Main">
<!-- <div class="adv"> -->
<!--     <img src="__PUBLICAPP__/images/banner.png"> -->
<!-- </div> -->
<div class="yx-g">
    <div class="yx-u-17-24">
       <div class="box index-big">
           <div class="bock-tit">
           <h3>
               当前位置：<a href="{url()}">首页</a> >
               {loop $daohang $vo}
                     <a href="{$vo['url']}">{$vo['name']}</a> >
               {/loop}
           </h3>
           </div>
           {loop $alist $vo}
            <div class="arlist">
              <a style="color:{$vo['color']}" onFocus="this.blur()" title="{$vo['title']}" href="{$vo['url']}" target="_blank"><h2>{$vo['title']}</h2></a>
              <span>创建时间:{date($vo['addtime'],Y-m-d H:m:i)}&nbsp;&nbsp;&nbsp;&nbsp;下载:{$vo['count']}</span>
           </div>
           {/loop}
           <div class="pagelist yx-u">{$page}</div>
       </div>
    </div>
    {include file="arightCom"}
</div>
</div>