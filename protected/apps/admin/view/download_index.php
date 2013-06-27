<?php if(!defined('APP_NAME')) exit;?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLICAPP__/css/back.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/highslide.css" />
<script type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/highslide.js"></script>
<script language="javascript">
//封面图效果
hs.graphicsDir = "__PUBLIC__/images/graphics/";
hs.showCredits = false;
hs.outlineType = 'rounded-white';
hs.restoreTitle = '关闭';

function CheckAll(form) { //复选框全选/取消
	for (var i=0;i<form.elements.length;i++) { 
		var e = form.elements[i]; 
		if (e.Name != "chkAll"&&e.disabled!=true) 
		e.checked = form.chkAll.checked; 
	} 
  } 
 //锁定
function lock(obj){
	     obj.click(function(){
			var nowobj=$(this);
			var id=nowobj.parent().parent().attr('id');
			$.post("{url('download/lock')}", {id:id,ispass:0},
   				function(data){
					if(data==1){
                      nowobj.html("审核");
					  nowobj.attr('class','unlock');
					  nowobj.unbind("click");
					  unlock(nowobj);
					}else alert(data);
   			});
		});
}
//解锁
function unlock(obj){
		obj.click(function(){
			var nowobj=$(this);
			var id=nowobj.parent().parent().attr('id');
			$.post("{url('download/lock')}", {id:id,ispass:1},
   				function(data){
					if(data==1){
                      nowobj.html("取消");
					  nowobj.attr('class','lock');
					  nowobj.unbind("click");
					  lock(nowobj);
					}else alert(data);
   			});
		});
}

$(function ($) { 
	//行颜色效果
	$('.all_cont tr').hover(
	function () {
        $(this).children().css('background-color', '#f9f9f9');
	},
	function () {
        $(this).children().css('background-color', '#fff');
	}
	);
	//下拉分类跳转
	$('#sort').change(function(){$('#colum').submit()});
	//处理执行选择
	$('#dotype').change(function(){
		var delaction= "{url('download/del')}" ;
		var changeaction="{url('download/colchange')}";
		if('del'==$(this).val()){
		   	$('#dos').attr('action',delaction);
			$('#col').hide();
		}else if('change'==$(this).val()){
		    $('#dos').attr('action',changeaction);
			$('#col').show();
		}
	});
	//ajax操作
	lock($('.lock'));
	unlock($('.unlock'));
	 $('.del').click(function(){
			if(confirm('删除将不可恢复~')){
			var delobj=$(this).parent().parent();
			var id=delobj.attr('id');
			$.get("{url('download/del')}", {id:id},
   				function(data){
					if(data==1){
              delobj.remove();
					}else alert(data);
   			});
			}
	  });
  });
</script>
<title>下载列表</title>
</head>
<body>
<div class="contener">
<div class="list_head_m">        
           <div class="list_head_ml">当前位置：【下载列表】</div>
           <div class="list_head_mr"><a href="{url('download/add')}" class="add">新增</a></div>                           
        </div>

         <table width="100%" border="0" cellpadding="0" cellspacing="1"   class="all_cont">
          <tr>
            <td></td>
            <td></td>
            <td align="center">
            <form action="{url('download/index')}" method="GET" id="colum" >
            <input name="r" type="hidden" value="{$_GET['r']}" />
                <select name="sort" id="sort">
                  <option value="">=所有下载栏目=</option>
                  {$option}
               </select>
            </form>
            </td>
            <td colspan="4" align="right">
               <form action="{url('download/index')}" method="GET" >
                  <div style="float:right"> <input class="btn btn-success btn-small" type="submit" value="搜索"></div>
                  <div style="float:right">下载标题：<input type="text" name="keyword" size="20"> </div>
                  <input name="r" type="hidden" value="{$_GET['r']}" />    
               </form> 
            </td>
          </tr>
         <form action="{url('download/del')}" method="post" id="dos"  onSubmit="return confirm('执行后不可以恢复~确定要执行吗？');"> 
          <tr>
            <th align="center" width="85"><input style="color:#E2E2E2" type="checkbox" name="chkAll" value="checkbox" onClick="CheckAll(this.form)"/></th>
            <th>ID</th>
            <th>所属栏目</th>
            <th>下载标题(下载)</th>
            <th width="150" >发布者</th>	
            <th width="150" >添加日期</th>	
            <th width="150" align="center">管理选项</th>
          </tr>
          <?php 
                 if(!empty($list)){
                      foreach($list as $vo){
                          $sortid=explode(',',$vo['sort']);
						  $vo['realname']=empty($vo['realname'])?"已被删除":$vo['realname'];
                          $sortstr='';
                          foreach($sortid as $v){
                              $sortstr.=empty($sortname[$v])?'':$sortname[$v].'→';
                          }
                          $cont.= '<tr id="'.$vo['id'].'"><td align="center"><input type="checkbox" name="delid[]" value="'.$vo['id'].'" /></td>';
                          $cont.= '<td  align="center">'.$vo['id'].'</td>';
                          $cont.= '<td >'.$sortstr.'</td>';
                          $cont.= '<td><a title="点击预览" style="color:'.$vo['color'].'" target="_blank" href="'.url('default/download/download',array('id'=>$vo['id'])).'">';
                          $cont.= str_replace($keyword,"<font color=green>$keyword</font>",$vo['title']).'</a><font color=green>（'.$vo['count'].'次下载）</font>';
                          $cont.= '</td><td width="150" align="center">'.$vo['realname'].'</td>';
                          $cont.= '<td width="150" align="center">'.date("Y-m-d H:i:s",$vo['addtime']).'</td><td align="center"  width="150">';
                          $cont.=$vo['ispass']?'<div class="lock" >取消</div>':'<div class="unlock">审核</div>';
                          $cont.= '<a href="'.url('download/edit',array('id'=>$vo['id'])).'" class="edt">编辑</a><div class="del">删除</div></td></tr>';
                       }
                        echo $cont;
                     }
          ?>
          <tr>
             <td colspan="3">
                 <div class="listdo">
                     <select name="dotype" id="dotype">
                        <option value="del">删除信息</option>
                        <option value="change">栏目移动</option>
                     </select>
                 </div>
                 <div class="listdo" id="col"><select  name="col"><option value="">=选择栏目=</option>{$option}</select></div>
                 <div class="listdo"><input type="submit" class="btn btn-small"  value="执行"></div>
             </td>
             <td colspan="4"><div class="pagelist">{$page}</div></td>
          </tr>
          </form>      
        </table>

</div>
</body>
</html>
