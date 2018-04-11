<?php
/***********************************************
 * 文件: /controller/adminUser.php
 * 说明: 管理员管理
 * 作者: huhuachuan
 * 更新: 2015年11月1日
 ***********************************************/

/**
 * 后台
 */
class Administrator extends spController
{
	function __construct() { //全局
        parent::__construct();
		if(!$_SESSION["admin"]){$this->error("无权限访问，请先登录！", (spUrl("adminlogin")));}
	}
	/////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 管理员列表
	 */
	function ListAdmin(){
		if(!$_SESSION["admin"]["admin"] == 'admin'){$this->error("无权限访问，请先登录！", (spUrl("adminlogin")));}
		$this->title="管理员列表";
        $lib_adminuser = spClass("lib_adminuser");
        if($_SESSION["admin"]['pid'] !='0'){
             $adminid = $_SESSION["admin"]['id'];
             $codition = "pid ='{$adminid}' or id = '{$adminid}'";
        }
        $data = $lib_adminuser->spPager($this->spArgs("page",1),15)->findAll($codition);
        if($data){
        	foreach ($data as $k=>$v){
        		   $data[$k]['gName'] =  $this->getBookListName($v["id"]);
        	}
        }
        $this->myid = $_SESSION["admin"]['id'];
        $pager=$lib_adminuser->spPager()->getPager();
        $this->results = $data;
        $this->pager=$pager;
        $this->c=$this->spArgs("c");
        $this->a=$this->spArgs("a"); 
        $this->display("admin/adminuser/ListAdmin.html"); 
	}
	function getBookListName($adminid){
		$lib_admin_guestbook = spClass("lib_admin_guestbook");
		$codition = array("admin_id"=>$adminid);
		$data = $lib_admin_guestbook->findAll($codition);
		$name = "";
		if($data){
			foreach ($data as $v){
				  if(empty($name)){
				  	 $name = "【".$this->getName($v['gid'])."】";
				  }
				  else
				  {
				  	$name = $name ."，【". $this->getName($v['gid'])."】";
				  }
			}
		}
		return $name;
	}
	/**
	 * 添加管理员
	 */
	function add(){	
		if($_SESSION["admin"]["admin"] != 'admin'){$this->error("无权限访问，请先登录！", ($_SERVER['HTTP_REFERER']));}
		$this->title="添加管理员";
        $lib_adminuser = spClass("lib_adminuser");
        $lib_admin_guestbook =spClass("lib_admin_guestbook");
        $adminid = $_SESSION["admin"]["id"];
		if ($this->spArgs("username")){
			$condition = array("username"=>$this->spArgs("username"));
			$result = $lib_adminuser->find($condition);
			if($result)
			{
				$this->error("用户名已被占用，请重新填写！", ($_SERVER['HTTP_REFERER']));
			}
			else
			{
				$sele_arr = $this->spArgs("gid",0);
				
				$newrow = array( // 这里制作新增记录的值
						        'pid' => $adminid,
								'username' => $this->spArgs("username"),
								'password' => md5($this->spArgs("password")),
								'admin' => $this->spArgs("admin")
								);
				$rs = $lib_adminuser->create($newrow);
				
				//添加新关系
				if($rs){
					if(!empty($sele_arr)){
						foreach ($sele_arr as $v){
							$row = array();
							$row['admin_id'] = $rs;
							$row['gid'] = $v;
							$row['addtime'] = date("Y-m-d H:i:s",time());
							$lib_admin_guestbook->create($row);
						}
					}
				}
				$this->success("添加管理员成功！", (spUrl("Administrator","ListAdmin")));
			}
		}
		$pid = $_SESSION["admin"]["pid"];
		$where = "";
		if($pid =='0'){
			$this->SuperAdmin = 1;
		}
		else{
			$where =  "creator ='{$adminid}' ";
			$this->SuperAdmin = 0;
		}
        $this->gList = spClass("lib_guestbook")->findAll($where,NULL,"id,gName");
		$this->display("admin/adminuser/add.html");
	}
	
	/**
	 * 编辑管理员
	 */
	function update(){
		$this->title="编辑管理员";
        $id = $this->spArgs("id");
        $del_conditions = array("admin_id"=>$id);
        $lib_admin_guestbook =spClass("lib_admin_guestbook");
        $adminid = $_SESSION["admin"]["id"];
        $this->isAdmin = 0;

        if($_SESSION["admin"]["admin"] == 'admin' && $id != $_SESSION["admin"]["id"]){
        	$this->isAdmin = 1;
        }
		if($_SESSION["admin"]["id"] == $id ||  $_SESSION["admin"]["admin"] == 'admin')
		{
			$lib_adminuser=spClass("lib_adminuser");
			$conditions=array("id"=>$id);
			$this->admins=$lib_adminuser->find($conditions);
			
			if ($this->spArgs("submit")){
				if($this->spArgs("pass_new"))
				{
					$pass = md5($this->spArgs("pass_new"));
				}
				else
				{
					$pass = $this->spArgs("pass_old");
				}
				$sel_gid = $this->spArgs("gid",$_SESSION["admin"]["gid"]);
				
				if($_SESSION["admin"]["admin"] == 'admin'){ 
					//只有超级管理员可以修改留言板绑定
					//先把旧的删除
					$lib_admin_guestbook->delete($del_conditions);
				
					//添加新关系
					foreach ($sel_gid as $v){
						$row = array();
						$row['admin_id'] = $id;
						$row['gid'] = $v;
						$row['addtime'] = date("Y-m-d H:i:s",time());
						$lib_admin_guestbook->create($row);
					}
				}
				$newrow = array( // 这里是要修改的字段
						'username' => $this->spArgs("username"),
						'password' => $pass,
						'admin' => $this->spArgs("admin")
						);
				$lib_adminuser->update($conditions,$newrow);
				
				
				//dump($newrow);
				$this->success("修改成功！", (spUrl("Administrator","update",array("id"=>$id))));
			}
			$pid = $_SESSION["admin"]["pid"];
			$where = "";
			if($pid =='0'){
				$this->SuperAdmin = 1;
			}
			else{
				$where =  "creator ='{$adminid}' ";
				$this->SuperAdmin = 0;
			}
			$gListData = spClass("lib_guestbook")->findAll($where,NULL,"id,gName");
			 //echo $lib_admin_guestbook->dumpSql();
			$sele_data = $lib_admin_guestbook->findAll($del_conditions,'','gid');
			 //echo $lib_admin_guestbook->dumpSql();
			$sele_arr = array();
            foreach ($sele_data as $v){
            	$sele_arr[] = $v['gid'];
            }
			if($gListData){
				foreach ($gListData as $k=>$v){
					$gListData[$k]['selected'] = 0;
					 if(in_array($v['id'], $sele_arr)){
					 	$gListData[$k]['selected'] = 1;
					 }
				}
			}
			$this->gList = $gListData;
			$this->display("admin/adminuser/update.html");
		}
		else
		{
			$this->error("无权限访问，请先登录！", ($_SERVER['HTTP_REFERER']));
		}
		
	}
	
	/**
	 * 删除管理员
	 */
	function del(){
		if($_SESSION["admin"]["username"] != 'admin'){$this->error("无权限访问，请先登录！", (spUrl("adminlogin")));}
        $lib_adminuser=spClass("lib_adminuser");
        $lib_admin_guestbook =spClass("lib_admin_guestbook");
        $id=$this->spArgs("id");
        $conditions = array("id"=>$id); // 构造条件
       
        if($id==$_SESSION["admin"]["id"]){
        	 $this->error("不能删除自己！", (spUrl("Administrator","ListAdmin")));
        }
        $lib_adminuser->delete($conditions);
        //把留言板和管理员的关系删除
        $where = array("admin_id"=>$id); // 构造条件
        $lib_admin_guestbook->delete($where);
		$this->success("删除成功", ($_SERVER['HTTP_REFERER']));
	}
	
    function getName($gid){
		 $lib_guestbook = spClass("lib_guestbook");
		 $condition =  "id = ". $gid;
		 $data = $lib_guestbook->find($condition);

		 if($data){
		 	return $data['gName'];
		 }
		 return "";
	}
}