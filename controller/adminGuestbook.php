<?php
/***********************************************
 * SpeedPHP入口文件
 * 文件: /controller/adminGuestbook.php
 * 说明: 后台处理文件
 * 作者: huhuachuan
 * 更新: 2015年11月1日
 ***********************************************/

/**
 * 后台
 */
class adminGuestbook extends spController
{
	function __construct() { //全局
        parent::__construct();
			if(!$_SESSION["admin"]){$this->error("无权限访问，请先登录！", (spUrl("adminlogin")));}//访问权限判断
			getAdminSessionGid($_SESSION["admin"]['id']);
	}
	/////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 留言本列表
	 */
	function ListGuestbook()
	{
		$this->title="留言板列表";
		$userGid = $_SESSION['admin']['gid'];
		$pid = $_SESSION['admin']['pid'];
		$adminid = $_SESSION['admin']['id'];
		
		if($pid == '0'){
			$condition = NULL;
			$this->SuperAdmin = 1;
		}
		else{
			//$condition = array('id'=>$userGid);
			$this->SuperAdmin = 0;
			$condition = " id in( {$userGid} )";
		}
		if($_SESSION["admin"]["admin"] == 'admin')
		{
			$this->isAdmin = 1;
		}
		else
		{
			$this->isAdmin = 0;
		}
        $lib_guestbook = spClass("lib_guestbook");
        $data = $lib_guestbook->spPager($this->spArgs("page",1),20)->findAll($condition);
       // echo $lib_guestbook->dumpSql();
        if($data){
        	 foreach ($data as $k=>$v){
        	 	 $data[$k]['admin_name'] =  $this->getAdminListName($v["id"]);
        	 	 $data[$k]['creator_name'] =  $this->getAdminName($v["creator"]);
        	 }
        }
        
        $this->myid = $_SESSION['admin']['id'];
        $this->lists = $data;
        $pager=$lib_guestbook->spPager()->getPager();
      // echo $lib_guestbook->dumpSql();
        $this->pager=$pager;
        $this->c=$this->spArgs("c");
        $this->a=$this->spArgs("a"); 
        $this->display("admin/guestbook/ListGuestbook.html"); 
	}
	
	function getAdminListName($gid){
		$lib_admin_guestbook = spClass("lib_admin_guestbook");
		$codition = array("gid"=>$gid);
		$data = $lib_admin_guestbook->findAll($codition);
		$name = "";
		if($data){
			foreach ($data as $v){
				if(empty($name)){
					$name = "【".$this->getAdminName($v['admin_id'])."】";
				}
				else
				{
					$name = $name ."，【". $this->getAdminName($v['admin_id'])."】";
				}
			}
		}
		return $name;
	}
	
	/**
	 * 添加留言板
	 */
	function add()
	{
		if($_SESSION["admin"]['admin'] != 'admin'){$this->error("无权限访问！", (spUrl("adminGuestbook","ListGuestbook")));}//访问权限判断
		if($this->spArgs("submit"))
		{
			$postData = $this->spArgs();
			$postData['creator'] = $_SESSION["admin"]['id'];
			$rs = spClass("lib_guestbook")->create($postData);
			
			//建立关系
			$lib_admin_guestbook =spClass("lib_admin_guestbook");
			if($rs){
				$row = array();
				$row['admin_id'] = $_SESSION["admin"]['id'];
				$row['gid'] = $rs;
				$row['addtime'] = date("Y-m-d H:i:s",time());
				$lib_admin_guestbook->create($row);
			}
            $this->success("成功添加留言板！",(spUrl("adminGuestbook","ListGuestbook")));
        }
		//获取留言板模板目录
		$this->dirUrl = APP_PATH.'/tpl/guestbook/';
		$this->tplList = glob($this->dirUrl.'*',GLOB_ONLYDIR );
		$this->display("admin/guestbook/add.html");
	}
	
	/**
	 * 编辑留言板
	 */
	function update()
	{
		$userGid = $_SESSION['admin']['gid'];
		$admin = $_SESSION['admin']['admin'];
		$gid = $this->spArgs("id");
		$gidArr = explode(",", $userGid);
		
		if($admin == 'admin' || in_array($gid, $gidArr)){
			$conditions = array("id"=>$gid );
			$lib_guestbook = spClass("lib_guestbook");
			$this->guestbook = $lib_guestbook->find($conditions);
			if($this->spArgs("submit"))
			{
				$lib_guestbook->update($conditions,$this->spArgs());
				$this->success("编辑成功！",(spUrl("adminGuestbook","ListGuestbook")));
			}
			//获取留言板模板目录
			$this->dirUrl = APP_PATH.'/tpl/guestbook/';
			$this->tplList = glob($this->dirUrl.'*',GLOB_ONLYDIR );
			$this->display("admin/guestbook/update.html");
		}
		else
		{
			$this->error("无权限访问！", (spUrl("adminGuestbook","ListGuestbook")));
		}
		
	}
	
	/**
	 * 删除留言板
	 */
	function del(){
        if($_SESSION['admin']['username'] == 'admin')
		{
			$id = $this->spArgs("id");
			spClass("lib_guestbook")->delete(array("id"=>$id));
			$this->success("删除成功", ($_SERVER['HTTP_REFERER']));
		}
		else
		{
			$this->error("无权限操作！", (spUrl("adminGuestbook","ListGuestbook")));
		}
	}
	
	function getAdminName($adminid){
		$lib_adminuser = spClass("lib_adminuser");
		$condition =  "id = ". $adminid;
		$data = $lib_adminuser->find($condition);
	
		if($data){
			return $data['username'];
		}
		return "";
	}
	
}