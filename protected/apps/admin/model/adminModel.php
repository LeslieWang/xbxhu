<?php
class adminModel extends baseModel{
	protected $table = 'admin';
	//登录
	public function login($username,$password)
	{
		$condition=array();
		$condition['username']=$username;
		$condition['password']=$password;
		$field='id,groupid,username,realname,password,iflock';
		$user_info=$this->find($condition,$field);
		//用户名密码正确且没有锁定
		if(($user_info['password']==$password)&&($user_info['iflock']==0))
		{
			//更新帐号信息
			$data=array();
			$data['lastlogin_time']=time();
			$data['lastlogin_ip']=get_client_ip();
			$this->update($condition,$data);

			//设置登录信息
			Auth::set($user_info['groupid']);
			Auth::getGroupPower($user_info['groupid']);
			$_SESSION['admin_uid']=$user_info['id'];
			$_SESSION['admin_username']=$user_info['username'];
			$_SESSION['admin_realname']=$user_info['realname'];
			return true;
		}
		return false;
	}
	
	public function adminANDgroup($limit=''){
		$sql="SELECT A.id,A.groupid,A.realname,A.lastlogin_time,A.lastlogin_ip,A.iflock,B.name FROM {$this->prefix}admin A,{$this->prefix}group B WHERE A.groupid=B.id ORDER BY A.groupid,A.id LIMIT {$limit}";
		return $this->model->query($sql);
	}
}