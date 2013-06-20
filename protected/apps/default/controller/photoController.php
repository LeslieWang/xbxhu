<?php
class photoController extends commonController
{
	public function index()
	{
		$id=in($_GET['id']);
		if(empty($id)) $this->pageerror('404');
		else{
			$sortinfo=model('sort')->find("id='{$id}'",'id,name,type,path,url,deep,tplist,keywords,description,extendid');
			if(2!=$sortinfo['type']) $this->pageerror('404');
			$path=$sortinfo['path'].','.$sortinfo['id'];
			$deep=$sortinfo['deep']+1;
		}

		$listRows=empty($sortinfo['url'])?10:intval($sortinfo['url']);//每页显示的信息条数
		$url=url('photo/index',array('id'=>$id,'page'=>'{page}'));
	    $limit=$this->pageLimit($url,$listRows);

		$where="sort LIKE '{$path}%' AND ispass='1'";
		$count=model('photo')->count($where);
		if(empty($sortinfo['extendid']))
		  $list=model('photo')->select($where,'id,title,color,sort,addtime,hits,method,picture,keywords,description,photolist','recmd DESC,norder desc,id DESC',$limit);
		else {
			$exid=$sortinfo['extendid'];
			$extables=model('extend')->select("id='{$exid}' or pid='{$exid}'","tableinfo","pid");
			$list=model('photo')->photoANDextend($extables,$path,$limit);
		}
		if(!empty($list)){
		   foreach ($list as $key=>$vo) {
			  $list[$key]['url']=url($vo['method'],array('id'=>$vo['id']));
			  $list[$key]['sort']=substr($vo['sort'],-6);
			  $list[$key]['pnum']=mb_substr_count($list[$key]['photolist'],',','utf-8')+1;
			  if(!empty($vo['keywords'])) $list[$key]['tags']=gettags($vo['keywords']);
		   }
		}
		$this->title=$sortinfo['name'].'-'.$this->title;//title标签
		if(!empty($sortinfo['keywords'])) $this->keywords=$sortinfo['keywords'];
		if(!empty($sortinfo['description'])) $this->description=$sortinfo['description'];
		$this->daohang=$this->crumbs($path);//面包屑导航
		$this->sortlist=$this->sortArray(0,$deep,$path);//子分类信息
		$this->plist=$list;
		$this->num=$count;
		$this->id=$id;
		$this->page=$this->pageShow($count);
		$this->rootid=$this->getrootid($_GET['id']);//根节点id
		$tp=explode(',', $sortinfo['tplist']);
		$this->display($tp[0]);
	}
	public function content()
	{
	   $id=intval(in($_GET['id']));
	   if(empty($id)) $this->pageerror('404');
	   $info=model('photo')->find("id='{$id}'");
	   if(empty($info)) $this->pageerror('404');
	   $info['content']=html_out($info['content']);
	   model('photo')->update("id='$id'","hits=hits+1");//点击
	   if(!empty($info['conlist'])) $titar=explode(',',$info['conlist']);
	   if(!empty($info['photolist'])){
               $phoar=explode(',',$info['photolist']);
               $cont=sizeof($phoar);
               for($i=0;$i<$cont;$i++){
           	       $photolist[$i]['picture']=$phoar[$i];
           	       $photolist[$i]['tit']=$titar[$i];
                   //$tit.="'<p>$titar[$i]</p>',";
                   //$sphoto.="'".__ROOT__."/upload/photos/thumb_$phoar[$i]',";
                   //$bphoto.="'".__ROOT__."/upload/photos/$phoar[$i]',";
                }
                $this->photolist=$photolist;
                $this->num=$cont;
                //$this->assign(tit,substr($tit,0,-1));
                //$this->assign(sphoto,substr($sphoto,0,-1));
                //$this->assign(bphoto,substr($bphoto,0,-1));
	    }
		//获取拓展数据
		$sortid=substr($info['sort'],-6,6);
		$tabid=model('sort')->find("id='{$sortid}'",'extendid');//获取拓展表
		if($tabid['extendid']!=0 && !empty($tabid['extendid'])){
			$tab=model('extend')->select("id='{$tabid['extendid']}' OR pid='{$tabid['extendid']}'",'id,name,tableinfo,type','id');//获取拓展表名和字段
			if(!empty($tab[0]['tableinfo'])){
				$extdata=model('extend')->Extfind($tab[0]['tableinfo'],"id='{$info['extfield']}'");	
				$extinfo=array();
				for($i=1;$i<count($tab);$i++){
					$extinfo[$tab[$i]['id']]=array('name'=>$tab[$i]['name'],'value'=>$extdata[$tab[$i]['tableinfo']],'type'=>$tab[$i]['type']);
				}
				$this->extinfo=$extinfo;//拓展信息,用于循环调用
				$this->extdata=$extdata;//拓展信息,用于直接调用
			}
		}
		//获取拓展数据结束
        $topsort=substr($info['sort'],0,14); //获取顶级类
		$upnews=model('photo')->find("ispass='1'  AND id>'$id' AND sort like '{$topsort}%'",'id,title,method','id ASC',1);//上一篇
		$downnews=model('photo')->find("ispass='1' AND id<'$id' AND sort like '{$topsort}%'",'id,title,method','id DESC',1);//下一篇
		$crumbs=$this->crumbs($info['sort']);//面包屑导航
		$lastCrumb=end($crumbs);
		$this->title=$info['title'].'-'.$lastCrumb['name'].'-'.$this->title;//title标题
		if(!empty($info['keywords'])){
			$this->keywords=$info['keywords'];
			if(!empty($info['keywords'])) $info['tags']=gettags($info['keywords']);
		}
		if(!empty($info['description'])) $this->description=$info['description'];
        $this->daohang=$crumbs;//面包屑导航
		$this->info=$info;
		$this->rootid=substr($info['sort'],8,6);
		$this->downnews=$downnews;
		$this->upnews=$upnews;
		$this->display($info['tpcontent']);
	}
}
?>