<?php
class photoModel extends baseModel{
	protected $table = 'photo';
    
    public function photoANDextend($exttables=array(),$path='',$limit=''){
    	$exttable=$exttables[0]['tableinfo'];
    	$exfield='';
    	for($i=1;$i<count($exttables);$i++){
    		if(!empty($exttables[$i]['tableinfo'])) $exfield.=','.$this->prefix.$exttable.'.'.$exttables[$i]['tableinfo'];
    	}
		$sql="SELECT {$this->prefix}photo.id,{$this->prefix}photo.title,{$this->prefix}photo.color,{$this->prefix}photo.sort,{$this->prefix}photo.picture,{$this->prefix}photo.hits,{$this->prefix}photo.addtime,{$this->prefix}photo.method,{$this->prefix}photo.description{$exfield} FROM {$this->prefix}photo left outer join {$this->prefix}{$exttable} on ({$this->prefix}photo.extfield = {$this->prefix}{$exttable}.id) where  {$this->prefix}photo.sort LIKE '{$path}%' AND {$this->prefix}photo.ispass='1'  ORDER BY {$this->prefix}photo.recmd DESC,{$this->prefix}photo.norder desc,{$this->prefix}photo.id DESC LIMIT {$limit}";
		return $this->model->query($sql);
	}
}
?>