<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<div class="yx-u-7-24 ">
       <!--演示调用当前栏目下的子栏目-->
       <?php if(!empty($sortlist)) { ?>  
       <div class="block box">
          <div class="bock-tit"><h2><?php echo $sorts[$id]['name']; ?></h2></div>
          <ul class="bock-list">
            <?php $n=1; if(is_array($sortlist)) foreach($sortlist AS $key => $vo) { ?>  
               <li><a class="w180" title="<?php echo $vo['name']; ?>"  href="<?php echo $vo['url']; ?>"><?php echo $vo['name']; ?></a></li>
            <?php $n++;}unset($n); ?>
          </ul>
       </div>
	<?php } ?>
	<div class="block box">
		<div class="bock-tit">
			<h2>搜 索</h2>
		</div>
		<div class="bock-con">
				<div class="searchbox">
					<div class="searchinput">
						<form method="get" action="<?php echo url('index/search');?>">
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
          <div class="bock-tit"><h2><?php echo $sorts[100033]['name']; ?></h2><a class="more" href="<?php echo $sorts[100033]['url']; ?>">more</a></div>
             <ul class="bock-list">
                 <?php $newso=getlist("table=(news) field=(id,title,color,addtime,method) column=(100033) where=(ispass='1') limit=(6)"); $newso_i=0; if(!empty($newso)) foreach($newso as $newso){  $newso_i++; ?> 
                   <li><a class="w220" style="color:<?php echo $newso['color'] ?>" title="<?php echo $newso['title'] ?>" target="_blank" href="<?php echo $newso['url'] ?>"><?php echo msubstr($newso['title'],0,20); ?></a></li>
                 <?php } ?>
             </ul>
       </div>
       <div class="block box">
          <div class="bock-tit"><h2>领导邮箱</h2></div>
          <div class="bock-con">
          <tr height="45px" class=''>
                			<td align='left'><a href="mailto:xb@mail.xhu.edu.cn" ><img style='border:0;' src="<?php echo __PUBLICAPP__; ?>/images/mail.png"/></a></td>
                		</tr>
          </div>
       </div>
       <div class="block box">
          <div class="bock-tit"><h2>联系我们</h2></div>
          <div class="bock-con"><?php $cpTemplate->display(model('fragment')->fragment(contactus),false,false); ?></div>
       </div>
</div> 