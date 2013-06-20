<?php
class photoModel extends baseModel{
	protected $table = 'photo';

	public function photoANDadmin($sort='',$keyword='',$limit=''){
		$where=empty($sort)?(empty($keyword)?'':'where '.$this->prefix.'photo.title like "%'.$keyword.'%"'):'where '.$this->prefix.'photo.sort like "'.$sort.'%"';
		$sql="SELECT {$this->prefix}photo.id,{$this->prefix}photo.sort,{$this->prefix}photo.title,{$this->prefix}photo.color,{$this->prefix}photo.recmd,{$this->prefix}photo.hits,{$this->prefix}photo.ispass,{$this->prefix}photo.addtime,{$this->prefix}photo.method,{$this->prefix}admin.realname FROM {$this->prefix}photo left outer join {$this->prefix}admin on {$this->prefix}photo.account = {$this->prefix}admin.username {$where}  ORDER BY {$this->prefix}photo.recmd DESC,{$this->prefix}photo.norder desc,{$this->prefix}photo.id DESC LIMIT {$limit}";
		return $this->model->query($sql);
	}
	public function photocount($sort='',$keyword=''){
		$where=empty($sort)?(empty($keyword)?'':'title like "%'.$keyword.'%"'):'sort like "'.$sort.'%"';
		return $this->count($where);
	}
}
?>