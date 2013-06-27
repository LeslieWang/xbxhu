<?php
class downloadController extends commonController
{
	static protected $downpath='';//下载图路径
	public function __construct()
	{
		parent::__construct();
		$this->downpath = ROOT_PATH.'upload/download/';
	}
	
	public function index()
	{
		$id=in($_GET['id']);
		if(empty($id)) $this->pageerror('404');
		else{
			$sortinfo=model('sort')->find("id='{$id}'",'id,name,path,url,type,deep,tplist,keywords,description,extendid');
			if(7!=$sortinfo['type']) $this->pageerror('404');
			$path=$sortinfo['path'].','.$sortinfo['id'];
			$deep=$sortinfo['deep']+1;
		}

		$listRows=empty($sortinfo['url'])?10:intval($sortinfo['url']);//每页显示的信息条数
		$url=url('download/index',array('id'=>$id,'page'=>'{page}'));
	    $limit=$this->pageLimit($url,$listRows);
	    
		$where="sort LIKE '{$path}%' AND ispass='1'";

		$count=model('download')->count($where);
		$list=model('download')->select($where,'id,title,account,sort,addtime,filename,count,showname','addtime DESC,id DESC',$limit);

		if(!empty($list)){
			foreach ($list as $key=>$vo) {
				$list[$key]['url']=url('download/download',array('id'=>$vo['id']));
				$list[$key]['sort']=substr($vo['sort'],-6);
				if(!empty($vo['keywords'])) $list[$key]['tags']=gettags($vo['keywords']);
			}
		}

		$this->daohang=$this->crumbs($path);//面包屑导航
		$this->sortlist=$this->sortArray(0,$deep,$path);//子分类信息
		$this->alist=$list;
		$this->num=$count;
		$this->id=$id;
		$this->page=$this->pageShow($count);
		$this->title=$sortinfo['name'].'-'.$this->title;//title标签
		if(!empty($sortinfo['keywords'])) $this->keywords=$sortinfo['keywords'];
		if(!empty($sortinfo['description'])) $this->description=$sortinfo['description'];
		$this->rootid=$this->getrootid($id);//根节点id
		$tp=explode(',', $sortinfo['tplist']);
		$this->display($tp[0]);
	}
        
	public function download()
	{
		$id=intval(in($_GET['id']));
		if(empty($id)) $this->pageerror('404');
		$info=model('download')->find("id='{$id}'");
		if(empty($info)) $this->pageerror('404');
        model('download')->update("id='$id'","count=count+1");//点击
        
        $showname=$info['showname'];
        $showname=auto_charset($showname,'utf-8','gbk');//utf-8编码转成gbk编码
        Http::download($this->downpath.$info['filename'],$showname);
	}
}
?>