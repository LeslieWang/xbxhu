<?php if(!defined('APP_NAME')) exit;?>
<script type="text/javascript" src="__PUBLICAPP__/js/jquery.KinSlideshow-1.2.1.min.js"></script>
<script type='text/javascript' src='__PUBLICAPP__/js/jquery.slider.pack.js'></script>
<script type='text/javascript' src='__PUBLICAPP__/js/jquery.easing.js'></script>

<div id="Main">
<!-- <div class="adv"> -->
<!--     <img src="__PUBLICAPP__/images/banner.png"> -->
<!-- </div> -->

<div class="yx-g index-mid">
    <div class="yx-u-17-24">
    
       
       <div class="yx-u box index-big">
            <div class="bock-tit"><h2>{$sorts[100032]['name']}</h2><a class="more" href="{$sorts[100032]['url']}">more</a></div>
                     <ul class="bock-list">
                     {newso:{table=(news) field=(id,title,color,addtime,method) column=(100032) where=(ispass='1') limit=(8)}}
                       <li><a class="w220" style="color:[newso:color]" title="[newso:title]" target="_blank" href="[newso:url]">[newso:title $len=40]</a><span>{date($newso['addtime'],Y-m-d)}</span></li>
                     {/newso}
                     </ul>
       </div>

       <div class="yx-u index-big">
           <div class="yx-g">
              <div class="yx-u-1-2">
                 <div class="box left-list">
                     <div class="bock-tit"><h2>{$sorts[100034]['name']}</h2><a class="more" href="{$sorts[100034]['url']}">more</a></div>
                     <ul class="bock-list">
                     {newso:{table=(news) field=(id,title,color,addtime,method) column=(100034) where=(ispass='1') limit=(8)}}
                       <li><a class="w220" style="color:[newso:color]" title="[newso:title]" target="_blank" href="[newso:url]">[newso:title $len=16]</a><span>{date($newso['addtime'],Y-m-d)}</span></li>
                     {/newso}
                     </ul>
                  </div>
              </div>
              
              <div class="yx-u-1-2">
                 <div class="box">
                     <div class="bock-tit"><h2>{$sorts[100035]['name']}</h2><a class="more" href="{$sorts[100035]['url']}">more</a></div>
                     <ul class="bock-list">
                       {newst:{table=(news) field=(id,title,color,addtime,method) column=(100035) where=(ispass='1') limit=(8)}}
                     <li><a class="w220" style="color:[newst:color]" title="[newst:title]" target="_blank" href="[newst:url]">[newst:title $len=16]</a><span>{date($newst['addtime'],Y-m-d)}</span></li>
                      {/newst}
                     </ul>
                 </div>
              </div>
           </div>
       </div>
    </div>
    {include file="arightCom"}
</div>
<div class="links box">
   <div class="bock-tit"><h2>快速通道</h2></div>
   <div class="link yx-u">
       {link:{table=(link) field=(name,url,type,picture,logourl) order=(norder desc,id desc) where=(ispass='1')}}
             {if $link['type']==1} <a  href="[link:url]" target="_blank">[link:name]</a>
             {elseif $link['type']==2} <a  href="[link:url]" target="_blank"><img src="{if empty($link['picture'])}[link:logourl]{else}{$LinkImgPath}[link:picture]{/if}" alt="[link:name]" ></a>
             {/if}
       {/link}
   </div>
</div>
</div>     