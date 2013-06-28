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
		<div class="bock-tit">
			<h2>搜 索</h2>
		</div>
		<div class="bock-con">
				<div class="searchbox">
					<div class="searchinput">
						<form method="get" action="{url('index/search')}">
							<input name="r" type="hidden" value="default/index/search" /> <select
								name="type">
<!-- 								<option value="all">全部&nbsp;&nbsp;&nbsp;</option> -->
								<option value="news">文章&nbsp;&nbsp;</option>
								<option value="download">下载&nbsp;&nbsp;</option>
<!-- 								<option value="photo">图集&nbsp;&nbsp;&nbsp;</option> -->
							</select> <input type="text" name="keywords" value=""
								class="search-input"> <input type="submit" value="搜 索"
								class="yx-button">
						</form>
					</div>
			</div>
		</div>
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
          <div class="bock-tit"><h2>领导邮箱</h2></div>
          <div class="bock-con">
          <tr height="45px" class=''>
                			<td align='left'><a href="mailto:xb@mail.xhu.edu.cn" ><img style='border:0;' src="__PUBLICAPP__/images/mail.png"/></a></td>
                		</tr>
          </div>
       </div>
       <div class="block box">
          <div class="bock-tit"><h2>联系我们</h2></div>
          <div class="bock-con">{piece:contactus}</div>
       </div>
</div> 