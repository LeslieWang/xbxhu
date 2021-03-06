<?php if(!defined('APP_NAME')) exit;?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>西华校办管理系统</title>
<link href="__PUBLICAPP__/css/back.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
<script language="javascript">
var menulist={$menulist};
//[{"title":"菜单一","channels": [{"channel":"导航1-1","pages":[{"name":"页面1-1-1","url":"index/welcome.html"},{"name":"页面1-1-2","url":"__APP__"}]}]}]
function showleftmenu(target){//左侧菜单
	//$('#menutop').html(menulist[target].title);//当前主菜单标题
	 var leftmenu='';
	 var channels=menulist[target].channels;
	 for(i=0;i<channels.length;i++){
		 if(channels[i]){
		 leftmenu+='<div class="menumid_tit">'+channels[i].channel+'</div><ul class="menumid_list">';
		 for(var j=0;j<channels[i].pages.length;j++){
			 leftmenu+='<li><a href="'+channels[i].pages[j].url+'" target="right">'+channels[i].pages[j].name+'</a></li>';
		 }
		 leftmenu+='</ul>';
		 }
	 }
	 $('#menumid').html(leftmenu);
	 //菜单收起、显示
	 $('.menumid_tit').click(function(){
		var list=$(this).next();
		if(list.css("display")=='none'){
	         list.slideDown(); 
		}
		else{
			list.slideUp();
		}
	});
	 //iframe加载效果  
	 $(".menumid_list a").click(function(){ 
		  $("#rightfr").hide();
          $("#loading").show();
     }); 
}  

function showtopmenu(){//顶部菜单
     var topmenu='';
	 for(var i=0;i<menulist.length;i++){
		 var flag=0;
		 for(var j=0;j<menulist[i].channels.length;j++){if(menulist[i].channels[j]) flag=1;}
		 if(flag) topmenu+='<a class="top_menu btn" id="'+i+'" href="#">'+menulist[i].title+'</a>';		
	}
	$('#topmenu').html(topmenu);
	//顶部菜单处理
	var topmenu=$('.top_menu');
	topmenu.first().addClass(" btn-primary");//初始第一个为选中样式
	topmenu.click(function(){
		showleftmenu($(this).attr('id'));//显示左菜单
		topmenu.removeClass(" btn-primary");
		$(this).addClass(" btn-primary");
	});
}

$(function($){
     showtopmenu();//显示顶部菜单
     showleftmenu($('.top_menu').first().attr('id'));//显示默认左侧菜单
	//左侧隐现
	$('#switchPoint').click(function(){
		var left=$('#frmTitle');
		if(left.css("display")=='none'){
	         left.show(); 
			 $('#switchPoint').attr("class","navPoint1");
		}
		else{
			left.hide();
			$('#switchPoint').attr("class","navPoint2");
		}
	});   
	//自适应高度
	var just_block=$('.middlel,.middler');
	just_block.css('height',$(window).height()-70+'px');
	$(window).resize(function(){just_block.css('height',$(window).height()-70+'px')});
	$('#bloading').hide();
	$('#body').fadeIn();
	 //iframe加载效果
     $("#rightfr").load(function(){		       
		   $("#loading").hide();
		   $("#rightfr").fadeIn();
		   $("#rightfr").contents().find("img").not("#coverimg").each(function(){//限制内容中图片大小
    	         if($(this).width()>600){
			        $(this).height($(this).height()*(600/$(this).width()));
			        $(this).width(600);
			        $(this).wrap("<a href=" + $(this)[0].src + " target=_blank></a>");
		         }
	       });
     });  
	 //刷新按钮效果
	 $("#refreash").click(function(){ 
		  $("#rightfr").hide();
          $("#loading").show(); 
		  window.right.location.reload();
     }); 
 });
</script>
</head>
<body style="overflow-y:hidden">
<div id="bloading"></div>
<div id="body" style="display:none">
<table cellpadding="0" cellspacing="0" height="100%" width="100%">
<!--头部开始-->
<tr class="top_t">
 <td>  
  <div class="logo"></div>
  <div id="topmenu"><!--js动态获得--></div> 
  <div class="func">
     <div class="link_info">当前用户：{$username}</div>
      <a class="link_index link" href="{url('default/index/index')}" target="_blank">首页</a>
      <div class="link_up link"  onClick="history.go(1);">前进</div>
      <div class="link_down link" onClick="history.go(-1);">后退</div>
      <div class="link_flush link" id="refreash" onClick="history.go(1);">刷新</div>
      <a class="link_ext link" href="{url('index/logout')}">退出</a>
  </div>
  </td>
</tr>
 <!--头部结束-->  
 
<!--中部开始-->  
<tr>
<td>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>    
    <td class="middlel" width="171" align="center" valign="top" id="frmTitle">
          <div class="menumid" id="menumid">
              <!--js动态获得-->
          </div>
          <div class="menubot"><a target="_blank" href="http://xb.xhu.edu.cn">{$ver}</a></div>	
    </td>   
    <td width="15" valign="middle" class="middlem" >
        <div class="navPoint1" id="switchPoint" title="关闭/打开左栏"></div>
    </td>
    <td class="middler" width="100%" align="center" valign="top">
        <iframe name="right" id="rightfr" height="100%" width="100%" border="0" frameborder="0" src="{url('index/welcome')}"></iframe>
        <div id="loading"></div>
    </td>
  </tr>
 </table>
</td>
</tr>
<!--中部结束-->   
 </table>
 </div>
</body>
</html>