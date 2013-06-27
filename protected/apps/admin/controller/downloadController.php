<?php
class downloadController extends commonController
{
	static protected $sorttype;//下载分类
	static protected $downpath='';//下载图路径
	static protected $uploadpath='';//下载图上传路径
	public function __construct()
	{
		parent::__construct();
		$this->downpath = __ROOT__.'/upload/download/';
		$this->uploadpath = ROOT_PATH.'upload/download/';
		$this->sorttype=7;
	}

	public function index()
	{
		$listRows=20;//每页显示的信息条数
		$url=url('download/index',array('page'=>'{page}'));
		$sortlist=model('sort')->select('','id,name,deep,path,norder,type');
		if(!empty($sortlist)){
			$sortlist=re_sort($sortlist);
			$sortname=array();
			//栏目选项
			foreach($sortlist as $vo){
                $space = str_repeat('├┈', $vo['deep']-1);
                $sortnow=$vo['path'].','.$vo['id'];
                $selected=($sort==$sortnow)?'selected="selected"':'';   
                $disable=($this->sorttype==$vo['type'])?'':'disabled="disabled"'; 
                $option.= '<option '.$selected.' value="'.$sortnow.'" '.$disable.'>'.$space.$vo ['name'].'</option>';

                $sortname[$vo['id']]=$vo['name'];
            }
            $this->option=$option;
            $this->sortname=$sortname;
		}
		//类别条件
		$sort=$_GET['sort'];
		if($sort){
			$url=url('download/index',array('sort'=>$sort,'page'=>'{page}'));
			$this->sort=$sort;
		}
		//搜索条件
		$keyword=in(urldecode(trim($_GET['keyword'])));
		if(!empty($keyword)){
			$url=url('download/index',array('keyword'=>urlencode($keyword),'page'=>'{page}'));
			$this->keyword=$keyword;
		}
		
		$limit=$this->pageLimit($url,$listRows);
		$count=model('download')->downloadcount($sort,$keyword);
        $list=model('download')->downloadANDadmin($sort,$keyword,$limit);

		$this->list=$list;
		$this->count=$count;
		$this->path=__ROOT__.'/upload/download/';
		$this->public=__PUBLICAPP__;
		$this->page=$this->pageShow($count);
		$this->display();
	}

	public function add()
	{
		if(!$this->isPost()){
			$sortlist=model('sort')->select('','id,name,deep,tplist,path,norder,type');
			if(empty($sortlist))  $this->error('请先添加下载栏目~',url('sort/downloadadd'));
			$sortlist=re_sort($sortlist);
			foreach ($sortlist as $vo) {
				$ct=explode(',',$vo['tplist']);
				$tpco[$vo['path'].','.$vo['id']]=$ct[1];
			}

            $this->sortlist=$sortlist;
			$this->type=$this->sorttype;
			$this->display();
		}else{
			if(empty($_POST['title'])||empty($_FILES['filepath']['name'])||empty($_POST['sort']))
			$this->error('请填写完整的信息  ~');
			$data=array();
			$data['title']=in($_POST['title']);
			$data['account']=$_SESSION['admin_username'];
			$data['showname']=in($_POST['showname']);
			$data['addtime']=strtotime(date('Y-m-d H:i:s'));
			$data['count']=intval(in($_POST['count']));
			$data['sort']=$_POST['sort'];
			$data['ispass']=intval($_POST['ispass']);
			if (empty($_FILES['filepath']['name']) === false){
				$fileupload= $this->upload($this->uploadpath,config('imgupSize'));
				$fileupload->upload();
				$fileinfo=$fileupload->getUploadFileInfo();
				$errorinfo=$fileupload->getErrorMsg();
				if(!empty($errorinfo)) {
					$this->error($errorinfo);
				} else {
					$data['filename']=$fileinfo[0]['savename'];
				}
			}
			if (empty($data['showname'])) {
				$data['showname']=$data['filename'];
			}
			if(model('download')->insert($data))
				$this->success('下载添加成功~',url('download/index'));
			else $this->error('下载添加失败~');
		}
	}

	public function edit()
	{
		$id=intval($_GET['id']);
		if(empty($id)) $this->error('参数错误');
		if(!$this->isPost()){
			$sortlist=model('sort')->select('','id,name,deep,path,norder,type');
			if(empty($sortlist)) $this->error('下载分类被清空了');
			$sortlist=re_sort($sortlist);
			$info=model('download')->find("id='$id'");
			$this->info=$info;
	        $this->type=$this->sorttype;
            $this->sortlist=$sortlist;
			$this->path=$this->downpath;
			$this->display();
		}else{
			if(empty($_POST['title'])||empty($_POST['sort']))
			$this->error('请填写完整的信息~');
			$data=array();
			$data['title']=in($_POST['title']);
			$data['showname']=in($_POST['showname']);
			$data['count']=intval(in($_POST['count']));
			$data['sort']=$_POST['sort'];
			$data['ispass']=intval($_POST['ispass']);
			if (empty($_FILES['filepath']['name']) === false){
				$fileupload= $this->upload($this->uploadpath,config('imgupSize'));
				if(!empty($_POST['oldfile'])){
					$picpath=$this->uploadpath.$_POST['oldfile'];
					if(file_exists($picpath)) @unlink($picpath);
					$fileupload->saveRule=substr($_POST['oldfile'],0,strrpos($_POST['oldfile'],'.'));//固定文件名
					$fileupload->uploadReplace=true;//重名则覆盖
				}
				$fileupload->upload();
				$fileinfo=$fileupload->getUploadFileInfo();
				$errorinfo=$fileupload->getErrorMsg();
				if(!empty($errorinfo)) $this->alert($errorinfo);
				$data['filename']=$fileinfo[0]['savename'];
				$mes='文件已经上传，';
			}
			if(model('download')->update("id='{$id}'",$data))
			$this->success($mes.'下载编辑成功~',url('download/index'));
			else $this->error($mes.'信息不需要修改~');
		}
	}

	public function del()
	{
		if(!$this->isPost()){
			$id=intval($_GET['id']);
			if(empty($id)) $this->error('您没有选择~');
			$coverpic=model('download')->find("id='$id'",'filename');
			$picpath=$this->uploadpath.$coverpic[filename];
			if(file_exists($picpath)) @unlink($picpath);
			if(model('download')->delete("id='$id'"))
			echo 1;
			else echo '删除失败~';
		}else{
			if(empty($_POST['delid'])) $this->error('您没有选择~');
			$delid=implode(',',$_POST['delid']);
			$coverpics=model('download')->select('id in ('.$delid.')','filename');
			foreach($coverpics as $vo){
				if(!empty($vo[filename])){
					$picpath=$this->uploadpath.$vo[filename];
					if(file_exists($picpath)) @unlink($picpath);
				}
			}
			if(model('download')->delete('id in ('.$delid.')'))
			$this->success('删除成功',url('download/index'));
		}
	}
	//审核,ajax
	public function lock()
	{
		$id=intval($_POST['id']);
		$lock['ispass']=intval($_POST['ispass']);
		if(model('download')->update("id='{$id}'",$lock))
		echo 1;
		else echo '操作失败~';
	}

	public function colchange()
	{
		 if('change'!=$_POST['dotype']) $this->error('操作类型错误~');
         if(empty($_POST['delid'])||empty($_POST['col'])) $this->error('您没有选择~');
		 $changeid=implode(',',$_POST['delid']);
		 $data['sort']=$_POST['col'];
		 if(model('download')->update('id in ('.$changeid.')',$data)) $this->success('栏目移动成功~',url('download/index'));
		 else $this->error('栏目移动失败~');
	}
}