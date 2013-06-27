<?php if(!defined('APP_NAME')) exit;?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLICAPP__/css/back.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
<script  type="text/javascript" language="javascript" src="__PUBLIC__/js/jquery.skygqCheckAjaxform.js"></script>
<script language="javascript">
  $(function ($) { 
	//行颜色效果
	$('.all_cont tr').hover(
	function () {
        $(this).children().css('background-color', '#f9f9f9');
	},
	function () {
        $(this).children().css('background-color', '#fff');
	});
   //表单验证
	var items_array = [
	    { name:"sort",min:6,simple:"类别",focusMsg:'选择类别'},
	    { name:"title",min:2,simple:"标题",focusMsg:'3-30个字符'},
		{ name:"filepath",min:2,simple:"文件",focusMsg:'3-30个字符'}
	];

	$("#info").skygqCheckAjaxForm({
		items			: items_array
	});
  });
</script>
<title>下载添加</title>
</head>
<body>
<div class="contener">
<div class="list_head_m">
           <div class="list_head_ml">当前位置：【下载添加】</div>
        </div>

        <form enctype="multipart/form-data" action="{url('download/add')}" method="post" id="info" name="info" >
         <table class="all_cont" width="100%" border="0" cellpadding="5" cellspacing="1"   > 
         <tr>
            <td align="right" width="100">选择类别：</td>
            <td align="left">
               <select name="sort" id="sort" onChange="ajax_fields();tpchange();">
                  <option selected="selected" value="">=请选择类别=</option>
                  <?php 
                      if(!empty($sortlist)){
                      foreach($sortlist as $vo){
                          $space = str_repeat('├┈┈┈', $vo['deep']-1);    
                          $disable=($type==$vo['type'])?'':'disabled="disabled"';
                          $option.= '<option '.$disable.' value="'.$vo['path'].','.$vo['id'].'">'.$space.$vo ['name'].'</option>';
                        }
                        echo $option;
                     }
                  ?>
               </select>
             </td>
            <td class="inputhelp"><a href="{url('sort/add')}">点击添加栏目</a></td>
          </tr>
          <tr>
            <td align="right">标题：</td>
            <td align="left"><input name="title" id="title" type="text" value="" /></td>
            <td class="inputhelp">下载标题</td>
          </tr>
          <tr>
            <td align="right">显示名：</td>
            <td align="left"><input name="showname" id="showname" type="text" value="" /></td>
            <td class="inputhelp">下载时显示的名称，默认为服务器上文件名</td>
          </tr>
          <tr>
            <td align="right">上传资料：</td>
            <td align="left"><input type="file" name="filepath" id="filepath" size="30"></td>
            <td class="inputhelp">选择需要上传的文件</td>
          </tr>
          <tr>
            <td align="right">下载量：</td>
            <td align="left"><input name="count" id="count" type="text" value="0" size="6"/></td>
            <td class="inputhelp">设置下载量</td>
          </tr>
          <tr>
            <td align="right">通过审核：</td>
            <td align="left"><input checked="checked" name="ispass"  type="radio" value="1" />是 <input name="ispass" type="radio" value="0" />否</td>
            <td class="inputhelp">未通过审核的文件将不显示</td>
          </tr>   
          <tr>
            <td></td>
            <td colspan="2" align="left"><input type="submit" class="btn btn-primary btn-small" value="添加">&nbsp;<input class="btn btn-primary btn-small" type="reset" value="重置"></td>
          </tr>           
        </table>
</form>
</div>
</body>
</html>
