<?php
class downloadModel extends baseModel{
	protected $table = 'download';

	public function downloadANDadmin($sort='',$keyword='',$limit=''){
		$where=empty($sort)?(empty($keyword)?'':'where '.$this->prefix.'download.title like "%'.$keyword.'%"'):'where '.$this->prefix.'download.sort like "'.$sort.'%"';
		$sql="SELECT {$this->prefix}download.id,{$this->prefix}download.sort,{$this->prefix}download.title,{$this->prefix}download.filename,{$this->prefix}download.showname,{$this->prefix}download.count,{$this->prefix}download.ispass,{$this->prefix}download.addtime,{$this->prefix}admin.realname FROM {$this->prefix}download left outer join {$this->prefix}admin on {$this->prefix}download.account = {$this->prefix}admin.username  {$where}  ORDER BY {$this->prefix}download.addtime desc,{$this->prefix}download.id DESC LIMIT {$limit}";
		return $this->model->query($sql);
	}
	public function downloadcount($sort='',$keyword=''){
		$where=empty($sort)?(empty($keyword)?'':'title like "%'.$keyword.'%"'):'sort like "'.$sort.'%"';
		return $this->count($where);
	}
}
?>