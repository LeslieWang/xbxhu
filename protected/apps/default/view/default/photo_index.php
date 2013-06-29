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
            {loop $plist $vo}
                  <dl class="plist yx-u">
                     <dt><a href="{$vo['url']}" target="_blank"><img src="{$PhotoImgPath}thumb_{$vo['picture']}" width="145" height="110"></a><span>{$vo['title']}</span></dt>
                     <dd>{$vo['description']}<br>
                     </dd>
                     
                  </dl>
            {/loop}
            <div class="pagelist yx-u">{$page}</div>   
       </div>
    </div>
    {include file="arightCom"}
</div>
</div>