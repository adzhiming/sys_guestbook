<?php
/***********************************************
 * 文件: /controller/guestbook.php
 * 说明: 前台留言板
 * 作者: huhuachuan
 * 更新: 2015年11月1日
 ***********************************************/

/**
 * 后台
 */
class guestbook extends spController
{
	function __construct() { //全局
        parent::__construct();
		$jumpGb = spClass("lib_guestbook")->find(NULL,"id ASC","id");
		$this->JumpId = $jumpGb['id'];
	}
	/////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 留言板
	 */
	function index()
	{
		$id = $this->spArgs("id",$this->JumpId);
		$this->g = $g = spClass("lib_guestbook")->find(array("id"=>$id));
		if($g)
		{
			$this->template = 'tpl/guestbook/'.$g['gTpl'];
			$this->ip = getIP();
			$lib_message = spClass("lib_message");
			$this->message = $lib_message->spPager($this->spArgs("page",1),$g['gPag'])->findAll(array('gid'=>$id,'status'=>'yes'),"id DESC,good DESC");
			$pager=$lib_message->spPager()->getPager();
			$this->pager=$pager;
			$this->c=$this->spArgs("c");
			$this->a=$this->spArgs("a"); 
			$this->display("guestbook/".$g['gTpl']."/index.html");
		}
		else
		{
			$this->error("抱歉，没有这个留言板！", (spUrl('guestbook')));
		}
		
	}
	
	/**
	 * 添加留言
	 */
	function megAddPost()
	{
		$gid = $this->spArgs("gid");
		$ip = getIP();
		$url = $this->spArgs("refereUrl");
		$url = empty($url)?$ip:$url;
		$g = spClass("lib_guestbook")->find(array("id"=>$gid),NULL,"gFilter,gCheck");
		if($g['gCheck'] == 'yes')
		{
			$megTitle = '留言提交成功！我们会尽快审核……';
			$status = 'no';
		}
		elseif($g['gCheck'] == 'no')
		{
			$megTitle = '留言提交成功！';
			$status = 'yes';
		}
		
		if($this->spArgs("submit"))
		{
			$vcode = spClass('spVerifyCode');
			if(!preg_match("/^1[34578]{1}\d{9}$/",$this->spArgs("phone"))){
				$this->error("手机号码格式有误");
			}
			if($vcode->verify($this->spArgs('verifycode'))) {
			  $postData = array(
							'gid'=>$gid,
							'name'=>strip_tags($this->spArgs("name")),
							'phone'=>strip_tags($this->spArgs("phone")),
							'message'=>$this->spArgs("message"),
							'addtime'=>time(),
							'ip'=>$ip,
			  		        'url'=>$url,
							'address'=>AssMegReplaceIp($ip),
							'status'=>$status
							);
							//dump($postData);
				setcookie("valueName", $postData['name'], time()+3600*24);
				setcookie("valueQq", $postData['qq'], time()+3600*24);
			  if($g['gFilter'] == 'yes')
			  {
				  if(isValidData($this->spArgs("message")))
				  {
					  spClass("lib_message")->create($postData);
					  $this->success($megTitle,($_SERVER['HTTP_REFERER']));
				  }
				  else
				  {
					  $this->error("内容不合法，可能原因：广告信息、内容过简单，请重新输入！", ($_SERVER['HTTP_REFERER'].'#MegAddForm'),5);
				  }
			  }
			  elseif($g['gFilter'] == 'no')
			  {
				  spClass("lib_message")->create($postData);
				  $this->success($megTitle,($_SERVER['HTTP_REFERER']));
			  }
			  else
			  {
				  $this->error("参数错误！", ($_SERVER['HTTP_REFERER'].'#MegAddForm'));
			  }
			}
			else
			{
				$this->error("验证码错误，请重新填写！", ($_SERVER['HTTP_REFERER'].'#MegAddForm'));
			}
		}
	}
	
	/**
	 * API添加留言
	 */
	function api_message_add()
	{
		header('Access-Control-Allow-Origin:*');
		$gid = $this->spArgs("gid");
		$ip = getIP();
		$url = $this->spArgs("refereUrl");
		$url = empty($url)?$ip:$url;
		$g = spClass("lib_guestbook")->find(array("id"=>$gid),NULL,"gFilter,gCheck");
		if($gid == 8){
			$hasly = spClass("lib_message")->find(array("phone"=>$this->spArgs("phone"),"gid"=>$gid));
			if($hasly){
				$returnData['code'] = 0;
				$returnData['msg'] = "该手机已留言，无需重复提交！";
				echo json_encode($returnData);die;
			}
		}
		$returnData = array();
		if($g['gCheck'] == 'yes')
		{
			$megTitle = '留言提交成功！我们会尽快审核……';
			$status = 'no';
		}
		elseif($g['gCheck'] == 'no')
		{
			$megTitle = '留言提交成功！';
			$status = 'yes';
		}
	
			if(!preg_match("/^1[34578]{1}\d{9}$/",$this->spArgs("phone"))){
				$this->error("手机号码格式有误");
			}
				$postData = array(
						'gid'=>$gid,
						'name'=>strip_tags($this->spArgs("name")),
						'nick'=>strip_tags($this->spArgs("nick")),
						'phone'=>strip_tags($this->spArgs("phone")),
						'message'=>$this->spArgs("message"),
						'addtime'=>time(),
						'ip'=>$ip,
						'url'=>$url,
						'address'=>AssMegReplaceIp($ip),
						'status'=>$status
				);
				//dump($postData);
				setcookie("valueName", $postData['name'], time()+3600*24);
				setcookie("valueQq", $postData['qq'], time()+3600*24);
				if($g['gFilter'] == 'yes')
				{
					if(isValidData($this->spArgs("message")))
					{
						spClass("lib_message")->create($postData);
						$returnData['code'] = 1;
						$returnData['msg'] = $megTitle;
					}
					else
					{
						$returnData['code'] = 0;
						$returnData['msg'] = "内容不合法，可能原因：广告信息、内容过简单，请重新输入！";
					}
				}
				elseif($g['gFilter'] == 'no')
				{
					spClass("lib_message")->create($postData);
					$returnData['code'] = 1;
					$returnData['msg'] = $megTitle;
				}
				else
				{
					$returnData['code'] = 0;
					$returnData['msg'] = "参数错误！";
				}
				
		echo json_encode($returnData);die;
	}
	
	/**
	 * Ajax赞一下
	 */
	function AjaxGood()
	{
		$mid = $this->spArgs("mid");
		$ip = getIP();
		$lib_voteip = spClass("lib_voteip");
		if($lib_voteip->find(array("mid"=>$mid,"ip"=>$ip)))
		{
			echo '抱歉，您已经支持过TA了！';
		}
		else
		{
			spClass('lib_message')->incrField(array('id'=>$mid), 'good');
			$lib_voteip->create(array('mid'=>$mid,'ip'=>$ip,'addtime'=>time()));
			echo '谢谢您的支持！';
		}
	}
	
	/**
	 * JS调用专版
	 */
	function jsMessage()
	{
		$id = $this->spArgs("gid",$this->JumpId);
		$lib_guestbook = spClass("lib_guestbook");
		$this->g = spClass("lib_guestbook")->find(array("id"=>$id));
		$this->url = APP_URL;
		$this->template = 'tpl/jsMessage';
		
		$lib_message = spClass("lib_message");
        $this->message = $lib_message->spPager($this->spArgs("page",1),20)->findAll(array('gid'=>$id,'status'=>'yes'),"addtime DESC");
        $pager=$lib_message->spPager()->getPager();
        //dump($pager);
        $this->pager=$pager;
        $this->c=$this->spArgs("c");
        $this->a=$this->spArgs("a"); 
		if($this->g)
		{
			$this->display("jsMessage/index.html");
		}
		else
		{
			$this->display("jsMessage/notId.html");
		}
		
	}
	
	/**
	 * 获取客户端IP地址
	 * @param integer $type
	 * @return mixed
	 */
	function getclientip() {
		static $realip = NULL;
	
		if($realip !== NULL){
			return $realip;
		}
		if(isset($_SERVER)){
			if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){ //但如果客户端是使用代理服务器来访问，那取到的就是代理服务器的 IP 地址，而不是真正的客户端 IP 地址。要想透过代理服务器取得客户端的真实 IP 地址，就要使用 $_SERVER["HTTP_X_FORWARDED_FOR"] 来读取。
				$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
				/* 取X-Forwarded-For中第一个非unknown的有效IP字符串 */
				foreach ($arr AS $ip){
					$ip = trim($ip);
					if ($ip != 'unknown'){
						$realip = $ip;
						break;
					}
				}
			}elseif(isset($_SERVER['HTTP_CLIENT_IP'])){//HTTP_CLIENT_IP 是代理服务器发送的HTTP头。如果是"超级匿名代理"，则返回none值。同样，REMOTE_ADDR也会被替换为这个代理服务器的IP。
				$realip = $_SERVER['HTTP_CLIENT_IP'];
			}else{
				if (isset($_SERVER['REMOTE_ADDR'])){ //正在浏览当前页面用户的 IP 地址
					$realip = $_SERVER['REMOTE_ADDR'];
				}else{
					$realip = '0.0.0.0';
				}
			}
		}else{
			//getenv环境变量的值
			if (getenv('HTTP_X_FORWARDED_FOR')){//但如果客户端是使用代理服务器来访问，那取到的就是代理服务器的 IP 地址，而不是真正的客户端 IP 地址。要想透过代理服务器取得客户端的真实 IP 地址
				$realip = getenv('HTTP_X_FORWARDED_FOR');
			}elseif (getenv('HTTP_CLIENT_IP')){ //获取客户端IP
				$realip = getenv('HTTP_CLIENT_IP');
			}else{
				$realip = getenv('REMOTE_ADDR');  //正在浏览当前页面用户的 IP 地址
			}
		}
		preg_match("/[\d\.]{7,15}/", $realip, $onlineip);
		$realip = !empty($onlineip[0]) ? $onlineip[0] : '0.0.0.0';
		return $realip;
	}
	
}