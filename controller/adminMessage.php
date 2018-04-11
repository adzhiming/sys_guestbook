<?php
/***********************************************
 * SpeedPHP入口文件
 * 文件: /controller/adminMessage.php
 * 说明: 后台处理文件
 * 作者: huhuachuan
 * 更新: 2015年11月1日
 ***********************************************/

/**
 * 后台
 */
class adminMessage extends spController
{
	function __construct() { //全局
        parent::__construct();
			if(!$_SESSION["admin"]){$this->error("无权限访问，请先登录！", (spUrl("adminlogin")));}//访问权限判断信
	}
	/////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 留言本列表
	 */
	function ListMessage()
	{
		
		$url = $this->spArgs("url");
		$page = $this->spArgs("page",1);
		$pageSize = $this->spArgs("pageSize",10);
		$stime = $this->spArgs("stime",date("Y-m-d",strtotime("-30 day")));
		$etime = $this->spArgs("etime",date("Y-m-d",time()));
		$this->title="留言列表";
		$gid = $this->spArgs('gid');
		$data = spClass("lib_guestbook")->find(array("id"=>$gid));
		if(isset($_POST["postsubmit"])){
			$page = 1;
		}
		if($data){
			$data['admin_name'] =  $this->getAdminListName($gid);
		}
		$this->g =$data;
 
		$userGid = $_SESSION['admin']['gid'];
		$gidArr = explode(",", $userGid);
		$admin = $_SESSION['admin']['username'];
		$condition = $condition ."gid = ". $gid;
		$this->url ="";
		if(!empty(trim($url))){
			$condition =$condition . " and url like '%{$url}%' ";
			$this->url = $url;
		}
		$page = empty($page)?'1':$page;
		$this->page = $page;
		if(!empty($stime) && !empty($etime)){
			 if(strtotime($stime) > strtotime($etime)){
			 	 $this->error("请输入正确的查询时间");
			 }
			 $condition =$condition . "  and addtime >= '".strtotime($stime." 00:00:00")."' and  addtime <= '".strtotime($etime." 23:59:59")."' ";
			 $this->stime = $stime;
			 $this->etime = $etime;
		}
		else{
			$this->stime = date("Y-m-d",strtotime("-1 month"));
			$this->etime = date("Y-m-d",time());
		}
		if(in_array($gid, $gidArr) || $admin == 'admin')
		{
			$lib_message = spClass("lib_message");
			$this->lists = $lib_message->spPager($page, $pageSize)->findAll($condition,"addtime DESC");
			//echo $lib_message->dumpSql(); 
			$pager=$lib_message->spPager()->getPager();
			$this->pager=$pager;
			$this->pageSize = $pageSize;
			$this->c=$this->spArgs("c");
			$this->a=$this->spArgs("a"); 
			$this->gid=$gid;
			$this->display("admin/message/ListMessage.html");
		}
		else
		{
			$this->error("无权限，请返回！", (spUrl('adminGuestbook','ListGuestbook')));
		}
         
	}
	
	public function reMark(){
		$mid = $this->spArgs("mid");
		$remark = $this->spArgs("remark");
		$gid = $this->spArgs('gid');
		$admin = $_SESSION['admin']['username'];
		$userGid = $_SESSION['admin']['gid'];
		$gidArr = explode(",", $userGid);
		$lib_message = spClass("lib_message");
		if(in_array($gid, $gidArr) || $admin == 'admin'){ 
			 $where = array();
			 $where['id'] = $mid;
			 $data["remark"] = $remark;
			 $rs = $lib_message->update($where,$data);
			 echo json_encode(1);
			  die;
		}
		echo json_encode(0);die;
	}
	
	/**
	 * 导出EXCEL
	 */
	public function downLoad2Excel(){
		include_once SP_PATH."/Extensions/PHPExcel.php";
		$url = $this->spArgs("url");
		$stime = $this->spArgs("stime");
		$etime = $this->spArgs("etime");
		$gid = $this->spArgs('gid');
		$userGid = $_SESSION['admin']['gid'];
		$gidArr = explode(",", $userGid);
		$admin = $_SESSION['admin']['username'];
		$this->stime = "";
		$this->etime = "";
		$condition = $condition ." gid = ". $gid;
		$this->url ="";
		if(!empty(trim($url))){
			$condition =$condition . " and url like '%{$url}%' ";
			$this->url = $url;
		}
		if(!empty($stime) && !empty($etime)){
			if(strtotime($stime) > strtotime($etime)){
				$this->error("请输入正确的查询时间");
			}
			$condition =$condition . "  and addtime between '".strtotime($stime." 00:00:00")."' and '".strtotime($etime." 23:59:59")."' ";
			$this->stime = $stime;
			$this->etime = $etime;
		}
		if(in_array($gid, $gidArr) || $admin == 'admin')
		{
			$lib_message = spClass("lib_message");
			 
			$this->lists = $lib_message->findAll($condition,"addtime DESC");
		
			$arr = $this->lists;
			$filename =date("Y-m-d-His",time());
			$filename=str_replace('.xls', '', $filename).'.xls';
           //实例化 
           $objPHPExcel = new PHPExcel(); 
           /*右键属性所显示的信息*/  
           $objPHPExcel->getProperties()->setCreator("zxf")  //作者       
           ->setLastModifiedBy("zxf")  //最后一次保存者       
           ->setTitle('数据EXCEL导出')  //标题       
           ->setSubject('数据EXCEL导出') //主题       
           ->setDescription('导出数据')  //描述       
           ->setKeywords("excel")   //标记       
           ->setCategory("result file");  //类别
           
           //设置当前的表格  
           $objPHPExcel->setActiveSheetIndex(0); 
           
           // 设置表格第一行显示内容 
           $objPHPExcel->getActiveSheet()  
           ->setCellValue('A1', 'ID')  
           ->setCellValue('B1', '留言板') 
           ->setCellValue('C1', '姓名')
           ->setCellValue('D1', '手机号码')
           ->setCellValue('E1', '内容')
           ->setCellValue('F1','地址' )
           ->setCellValue('G1', '来源url')
           ->setCellValue('H1', '留言时间')
           ->setCellValue('I1', '备注');
           //设置第一行为红色字体  
          // ->getStyle('A1:G1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_RED);
           $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
           $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
           $key = 1; 
           /*以下就是对处理Excel里的数据，横着取数据*/ 
           foreach($arr as $v){  
	           	//设置循环从第二行开始 
	           	$key++; 
	           	
	           	$objPHPExcel->getActiveSheet()      
	           	//Excel的第A列，name是你查出数组的键值字段，下面以此类推     
	           	->setCellValue('A'.$key, $v['id'])      
	           	->setCellValue('B'.$key, $this->getName($v['gid']))     
	           	->setCellValue('C'.$key, $v['name'])     
	           	->setCellValue('D'.$key, $v['phone'])
	           	->setCellValue('E'.$key, $v['message'])
	           	->setCellValue('F'.$key, $v['address']."(".$v['ip'].")")
	           	->setCellValue('G'.$key, $v['url'])
	           	->setCellValue('H'.$key, date("Y-m-d H:i:s",$v['addtime']))
	           	->setCellValue('I'.$key, $v['remark']);
	           	
           }
           //设置当前的表格  
          // $objPHPExcel->setActiveSheetIndex(0);　　 
           ob_end_clean();  //清除缓冲区,避免乱码  
           header('Content-Type: application/vnd.ms-excel'); //文件类型 
            header('Content-Disposition: attachment;filename="'.$filename.'"'); //文件名  
            header('Cache-Control: max-age=0');  
            header('Content-Type: text/html; charset=utf-8'); //编码  
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');  //excel 2003  
            $objWriter->save('php://output');   
            exit;
		}
		else
		{
			$this->error("无权限，请返回！", (spUrl('adminGuestbook','ListGuestbook')));
		}
	}
	
	/**
	 * 管理员回复
	 */
	function reply()
	{
		$this->g = spClass("lib_guestbook")->find(array("id"=>$this->spArgs("gid")));
		$this->m = spClass("lib_message")->find(array("id"=>$this->spArgs("mid")));
		$this->display("admin/message/reply.html");
	}
	
	//管理员Ajax回复提交
	function AjaxReplyPost()
	{
		$id = $this->spArgs("mid");
		$replyAdmin = $_SESSION["admin"]['username'];
		$reply = $this->spArgs("reply");
		$status = $this->spArgs("status");
		if($this->spArgs("mid"))
		{
			$row = array(
						 'replyAdmin'=>$replyAdmin,
						 'reply'=>$reply,
						 'status'=>$status
						 );
			spClass("lib_message")->update(array("id"=>$id),$row);
            echo $reply;
        }
		else
		{
			echo 'no';
		}
	}
	
	/**
	 * 删除留言板
	 */
	function del(){
        $mold = $this->spArgs("mold");
		$v = $this->spArgs("v");
        spClass("lib_message")->delete(array($mold=>$v));
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