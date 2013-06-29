<?php
class indexController extends commonController
{
	public function index()
	{
		// static id for xihua gallery.
		$id='13';
		$info=model('photo')->find("id='{$id}'");
		if(!empty($info)) {
			$info['content']=html_out($info['content']);
			if(!empty($info['conlist'])) $titar=explode(',',$info['conlist']);
			if(!empty($info['photolist'])){
				$phoar=explode(',',$info['photolist']);
				$cont=sizeof($phoar);
				for($i=0;$i<$cont;$i++){
					$photolist[$i]['picture']=$phoar[$i];
					$photolist[$i]['tit']=$titar[$i];
				}
				$this->photolist=$photolist;
			}
		}
        $this->display();
	}

	public function search()
	{
       if(empty($_GET['keywords'])||empty($_GET['type'])) $this->error('搜索条件不足~');
       $keywords=in(urldecode(trim($_GET['keywords'])));
       $type=in($_GET['type']);
       $listRows=10;//每页显示的信息条数,2n偶数
       $url=url('index/search',array('id'=>'000000','page'=>'{page}','keywords'=>urlencode($keywords),'type'=>$type));
	   $where="(title like '%".$keywords."%' OR description like '%".$keywords."%') AND ispass='1' ";
         switch ($type) {
       	case 'news':
       	      $count=model('news')->count($where);
                  $limit=$this->pageLimit($url,$listRows);
       		$list=model('news')->select($where,'id,title,description,method,addtime,hits','id DESC',$limit);
       		break;

       	case 'photo':
       	      $count=model('photo')->count($where);
                  $limit=$this->pageLimit($url,$listRows);
       		$list=model('photo')->select($where,'id,title,description,method,addtime,hits','id DESC',$limit);
       		break;

       	case 'download':
       		$where="title like '%".$keywords."%' AND ispass='1' ";
       	      $count=model('download')->count($where);
                  $limit=$this->pageLimit($url,$listRows);
       		$list=model('download')->select($where,'id,title,account,sort,addtime,filename,count,showname','addtime DESC,id DESC', $limit);
       		break;
       	
       	case 'all':
       	      $count1=model('news')->count($where);
       	      $count2=model('photo')->count($where);
                  $limit=$this->pageLimit($url,$listRows/2);
       	      $list1=model('news')->select($where,'id,title,description,method,addtime,hits','id DESC',$limit);
       		$list2=model('photo')->select($where,'id,title,description,method,addtime,hits','id DESC',$limit);
       		$count=max($count1,$count2);
       		if(empty($list1)) $list1=array();
       		if(empty($list2)) $list2=array();
       		$list=array_merge($list1,$list2);
       		break;
       	default:
       		$this->error('搜索类型错误~');
       		break;
       }
       $this->page=$this->pageShow($count);
       $count=isset($count1)?($count1+$count2):$count;
       $this->count=$count;
       if(strlen($keywords)<60) model('tags')->update("name='{$keywords}'","hits=hits+1,mesnum='{$count}'");
       $this->list=$list;
       $this->keywords=$keywords;
       $this->type=$type;
       $this->display();
	}
      //生成验证码
      public function verify()
      {
            Image::buildImageVerify();
      }
}
?>