<?php if (!defined('CANPHP')) exit;?><?php if(!defined('APP_NAME')) exit;?>
<script type="text/javascript" src="<?php echo __PUBLICAPP__; ?>/js/jquery.KinSlideshow-1.2.1.min.js"></script>
<script type='text/javascript' src='<?php echo __PUBLICAPP__; ?>/js/jquery.slider.pack.js'></script>
<script type='text/javascript' src='<?php echo __PUBLICAPP__; ?>/js/jquery.easing.js'></script>
<script type="text/javascript" src="<?php echo __PUBLICAPP__; ?>/js/bxCarousel.js"> </script> 
<script type="text/javascript">
$(function(){
	$('#demo1').bxCarousel({
		display_num: 6, 
		move: 1, 
		auto: true, 
		controls: false,
		margin: 10,
		auto_interval: 1500,
		auto_hover: true
	});
});
</script>
<script type="text/javascript">
//<![CDATA[
jQuery(function() {
	//首页大幻灯开始
	jQuery('#cycle-prev, #cycle-next').css({opacity: '0'});
	jQuery('.cycleslider-wrap').hover(function(){
		jQuery('#cycle-prev',this).stop().animate({left: '-31', opacity: '1'},200,'easeOutCubic');
		jQuery('#cycle-next',this).stop().animate({right: '-31', opacity: '1'},200,'easeOutCubic');	 
	}, function() {
		jQuery('#cycle-prev',this).stop().animate({left: '-50', opacity: '0'},400,'easeInCubic');
		jQuery('#cycle-next',this).stop().animate({right: '-50', opacity: '0'},400,'easeInCubic');		
	});
	
	jQuery(".cycleslider-wrap").fadeIn(1000);
	jQuery(".slider-wrap .loader").css({display: "none"});
	jQuery("#slider").cycle({
		fx:  "turnDown",
		speed:  "800", 
		timeout: "4000",
		easing:  "easeOutBounce",
		next:  "#cycle-next",
		prev:  "#cycle-prev",
		pager:  "#cycle-nav"
	});
	//首页大幻灯结束
	//焦点图
	$("#KinSlideshow").KinSlideshow({
			moveStyle:"right",
			intervalTime:2,
			titleBar:{titleBar_height:25,titleBar_bgColor:"#fff",titleBar_alpha:0.5},
			titleFont:{TitleFont_size:12,TitleFont_color:"#484848",TitleFont_weight:"normal"},
			btn:{btn_bgColor:"#FFFFFF",btn_bgHoverColor:"#1072aa",btn_fontColor:"#000000",btn_fontHoverColor:"#FFFFFF",btn_borderColor:"#cccccc",btn_borderHoverColor:"#1188c0",btn_borderWidth:1}
	});
});
//]]>
</script>
<div id="Main">
<!-- <div class="adv"> -->
<!--     <img src="<?php echo __PUBLICAPP__; ?>/images/banner.png"> -->
<!-- </div> -->

<div class="yx-g index-mid">
    <div class="yx-u-17-24">
       
       <div class="yx-u box index-big">
            <div class="bock-tit"><h2><?php echo $sorts[100032]['name']; ?></h2><a class="more" href="<?php echo $sorts[100032]['url']; ?>">more</a></div>
                     <ul class="bock-list">
                     <?php $newso=getlist("table=(news) field=(id,title,color,addtime,method) column=(100032) where=(ispass='1') limit=(10)"); $newso_i=0; if(!empty($newso)) foreach($newso as $newso){  $newso_i++; ?> 
                       <li><a class="w220" style="color:<?php echo $newso['color'] ?>" title="<?php echo $newso['title'] ?>" target="_blank" href="<?php echo $newso['url'] ?>"><?php echo msubstr($newso['title'],0,40); ?></a><span><?php echo date('Y-m-d',$newso['addtime']); ?></span></li>
                     <?php } ?>
                     </ul>
       </div>

       <div class="yx-u index-big">
           <div class="yx-g">
              <div class="yx-u-1-2">
                 <div class="box left-list">
                     <div class="bock-tit"><h2><?php echo $sorts[100034]['name']; ?></h2><a class="more" href="<?php echo $sorts[100034]['url']; ?>">more</a></div>
                     <ul class="bock-list">
                     <?php $newso=getlist("table=(news) field=(id,title,color,addtime,method) column=(100034) where=(ispass='1') limit=(10)"); $newso_i=0; if(!empty($newso)) foreach($newso as $newso){  $newso_i++; ?> 
                       <li><a class="w220" style="color:<?php echo $newso['color'] ?>" title="<?php echo $newso['title'] ?>" target="_blank" href="<?php echo $newso['url'] ?>"><?php echo msubstr($newso['title'],0,16); ?></a><span><?php echo date('Y-m-d',$newso['addtime']); ?></span></li>
                     <?php } ?>
                     </ul>
                  </div>
              </div>
              
              <div class="yx-u-1-2">
                 <div class="box">
                     <div class="bock-tit"><h2><?php echo $sorts[100030]['name']; ?></h2><a class="more" href="<?php echo $sorts[100030]['url']; ?>">more</a></div>
                     <ul class="bock-list">
                       <?php $newst=getlist("table=(news) field=(id,title,color,addtime,method) column=(100030) where=(ispass='1') limit=(10)"); $newst_i=0; if(!empty($newst)) foreach($newst as $newst){  $newst_i++; ?> 
                     <li><a class="w220" style="color:<?php echo $newst['color'] ?>" title="<?php echo $newst['title'] ?>" target="_blank" href="<?php echo $newst['url'] ?>"><?php echo msubstr($newst['title'],0,16); ?></a><span><?php echo date('Y-m-d',$newst['addtime']); ?></span></li>
                      <?php } ?>
                     </ul>
                 </div>
              </div>
           </div>
       </div>
       
       
    	</div>
    <?php $cpTemplate->display("arightCom"); ?>
    
</div>

<?php
if (!empty($photolist)){
       ?>
	<div class="links box">
		<div class="bock-tit">
			<h2>校园风光</h2>
		</div>
		<div class="bx_wrap">
			<div class="bx_container">
				<ul id="demo1">
					<?php $n=1;if(is_array($photolist)) foreach($photolist AS $vo) { ?>
					<li><A onClick="return hs.expand(this)" title="<?php echo $vo['tit']; ?>"
						href="<?php echo $PhotoImgPath; ?><?php echo $vo['picture']; ?>"><img width="145"
							height="110" alt="<?php echo $vo['tit']; ?>" class="box"
							src="<?php echo $PhotoImgPath; ?>thumb_<?php echo $vo['picture']; ?>"> </A>
						<div class="highslide-caption"><?php echo $vo['tit']; ?></div></li> <?php $n++;}unset($n); ?>
				</ul>
			</div>
		</div>
	</div>
	<?php
      }
    ?>
<div class="links box">
   <div class="bock-tit"><h2>快速通道</h2></div>
   <div class="link yx-u">
       <?php $link=getlist("table=(link) field=(name,url,type,picture,logourl) order=(norder desc,id desc) where=(ispass='1')"); $link_i=0; if(!empty($link)) foreach($link as $link){  $link_i++; ?> 
             <?php if($link['type']==1) { ?> <a  href="<?php echo $link['url'] ?>" target="_blank"><?php echo $link['name'] ?></a>
             <?php } elseif ($link['type']==2) { ?> <a  href="<?php echo $link['url'] ?>" target="_blank"><img src="<?php if(empty($link['picture'])) { ?><?php echo $link['logourl'] ?><?php } else { ?><?php echo $LinkImgPath; ?><?php echo $link['picture'] ?><?php } ?>" alt="<?php echo $link['name'] ?>" ></a>
             <?php } ?>
       <?php } ?>
   </div>
</div>
</div>     