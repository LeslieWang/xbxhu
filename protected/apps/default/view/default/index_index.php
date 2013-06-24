<?php if(!defined('APP_NAME')) exit;?>
<script type="text/javascript" src="__PUBLICAPP__/js/jquery.KinSlideshow-1.2.1.min.js"></script>
<script type='text/javascript' src='__PUBLICAPP__/js/jquery.slider.pack.js'></script>
<script type='text/javascript' src='__PUBLICAPP__/js/jquery.easing.js'></script>

<div id="Main">
<div class="adv">
    <img src="__PUBLICAPP__/images/banner.png">
</div>

<div class="yx-g index-mid">
    <div class="yx-u-17-24">
       <div class="yx-g index-mid-top">
          <div class="yx-u-3-5">
             <div class="index-reg box">
              <ul class="bock-list">
                    {news:{table=(news) field=(id,title,color,addtime,method,description) where=(ispass='1') limit=(6)}}
                       {if $news_i==1} <!--通过计数器判断第一条显示为头条样式-->
                          <h1><a href="[news:url]">[news:title $len=20]</a></h1>
                          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[news:description]</p>
                       {else}
                          <li><a class="w280" style="color:[news:color]" title="[news:title]" target="_blank" href="[news:url]">[news:title $len=25]</a><span>{date($news['addtime'],Y-m-d)}</span></li>
                       {/if}
                    {/news} 
                </ul>
             </div>
          </div>
       </div>
       
       <div class="yx-u box index-big">
            <div class="bock-tit"><h2>{$sorts[100002]['name']}</h2><a class="more" href="{$sorts[100002]['url']}">more</a></div>
            <ul class="photo-list">
             {photo:{table=(photo) field=(id,title,picture,method) column=(100002) where=(ispass='1') limit=(8)}}
               <li><a style="color:[photo:color]" title="[photo:title]" target="_blank" href="[photo:url]"><img class="box" src="{$PhotoImgPath}thumb_[photo:picture]" alt="[photo:title]" width="145" height="110"></a><span>[photo:title]</span></li>
             {/photo}
            </ul>
       </div>
       
       <div class="yx-u box index-big">
            <div class="bock-tit"><h2>{$sorts[100004]['name']}</h2><a class="more" href="{$sorts[100004]['url']}">more</a></div>
            <ul class="photo-list">
             <!--演示调用拓展字段值-->
             {photo:{table=(photo) field=(id,title,picture) exfield=(area,price) column=(100004) where=(ispass='1') limit=(8)}}
               <li><a style="color:[photo:color]" title="[photo:title]" target="_blank" href="[photo:url]"><img class="box" src="{$PhotoImgPath}thumb_[photo:picture]" alt="[photo:title]" width="145" height="110"></a><span>[photo:title]</span><span> 价格：[photo:price]-[photo:area]</span></li>
             {/photo}
            </ul>
       </div>

       <div class="yx-u index-big">
           <div class="yx-g">
              <div class="yx-u-1-2">
                 <div class="box left-list">
                     <div class="bock-tit"><h2>{$sorts[100005]['name']}</h2><a class="more" href="{$sorts[100005]['url']}">more</a></div>
                     <ul class="bock-list">
                     {newso:{table=(news) field=(id,title,color,addtime,method) column=(100005) where=(ispass='1') limit=(6)}}
                       <li><a class="w220" style="color:[newso:color]" title="[newso:title]" target="_blank" href="[newso:url]">[newso:title $len=16]</a><span>{date($newso['addtime'],Y-m-d)}</span></li>
                     {/newso}
                     </ul>
                  </div>
              </div>
              
              <div class="yx-u-1-2">
                 <div class="box">
                     <div class="bock-tit"><h2>{$sorts[100006]['name']}</h2><a class="more" href="{$sorts[100006]['url']}">more</a></div>
                     <ul class="bock-list">
                       {newst:{table=(news) field=(id,title,color,addtime,method) column=(100006) where=(ispass='1') limit=(7)}}
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