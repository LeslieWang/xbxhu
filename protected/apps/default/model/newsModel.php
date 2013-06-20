<?php
class newsModel extends baseModel{
	protected $table = 'news';

	public function newsANDextend($exttables=array(),$path='',$limit=''){
		$exttable=$exttables[0]['tableinfo'];
    	$exfield='';
    	for($i=1;$i<count($exttables);$i++){
    		if(!empty($exttables[$i]['tableinfo'])) $exfield.=','.$this->prefix.$exttable.'.'.$exttables[$i]['tableinfo'];
    	}
		$sql="SELECT {$this->prefix}news.id,{$this->prefix}news.title,{$this->prefix}news.color,{$this->prefix}news.sort,{$this->prefix}news.picture,{$this->prefix}news.origin,{$this->prefix}news.hits,{$this->prefix}news.addtime,{$this->prefix}news.method,{$this->prefix}news.description{$exfield} FROM {$this->prefix}news left outer join {$this->prefix}{$exttable} on ({$this->prefix}news.extfield = {$this->prefix}{$exttable}.id) where  {$this->prefix}news.sort LIKE '{$path}%' AND {$this->prefix}news.ispass='1'  ORDER BY {$this->prefix}news.recmd DESC,{$this->prefix}news.norder desc,{$this->prefix}news.id DESC LIMIT {$limit}";
		return $this->model->query($sql);
	}
}
?>