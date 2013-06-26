<?php if(!defined('APP_NAME')) exit;?>
<div class="yx-u-7-24 ">
       <!--演示调用当前栏目下的子栏目-->
       {if !empty($sortlist)}  
       <div class="block box">
          <div class="bock-tit"><h2>{$sorts[$id]['name']}</h2></div>
          <ul class="bock-list">
            {loop $sortlist $key $vo}  
               <li><a class="w180" title="{$vo['name']}"  href="{$vo['url']}">{$vo['name']}</a></li>
            {/loop}
          </ul>
       </div>
       {/if}
       
       <div class="block box">
          <div class="bock-tit"><h2>校办简介</h2></div>
          <div class="bock-con">{piece:announce}</div>
       </div>
       
       
       <div class="block box">
          <div class="bock-tit"><h2>{$sorts[100033]['name']}</h2><a class="more" href="{$sorts[100033]['url']}">more</a></div>
             <ul class="bock-list">
                 {newso:{table=(news) field=(id,title,color,addtime,method) column=(100033) where=(ispass='1') limit=(6)}}
                   <li><a class="w220" style="color:[newso:color]" title="[newso:title]" target="_blank" href="[newso:url]">[newso:title $len=20]</a></li>
                 {/newso}
             </ul>
       </div>
       <div class="block box">
          <div class="bock-tit"><h2>联系我们</h2></div>
          <div class="bock-con">{piece:contactus}</div>
       </div>
</div> 