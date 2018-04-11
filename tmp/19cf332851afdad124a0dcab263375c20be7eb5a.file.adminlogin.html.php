<?php /* Smarty version Smarty-3.0.8, created on 2018-03-16 01:38:25
         compiled from "F:\xammp\htdocs\sys_guestbook/tpl\adminlogin/adminlogin.html" */ ?>
<?php /*%%SmartyHeaderCode:284025aab2011ce1e81-54271773%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '19cf332851afdad124a0dcab263375c20be7eb5a' => 
    array (
      0 => 'F:\\xammp\\htdocs\\sys_guestbook/tpl\\adminlogin/adminlogin.html',
      1 => 1521011820,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '284025aab2011ce1e81-54271773',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="tpl/adminlogin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/adminlogin/css/jquery.js"></script>
<!-- <script src="tpl/adminlogin/css/cloud.js" type="text/javascript"></script> -->

<script language="javascript">
  $(function(){

  });  
</script> 

</head>

<body style="background-image:url('tpl/adminlogin/images/login_bg.jpg'); background-repeat:no-repeat; background-position:center top; overflow:hidden;height:100vh;background-size:cover">






<!-- <div class="logintop">    
    <span><?php echo $_smarty_tpl->getVariable('web')->value['webname'];?>
</span> <?php if ($_smarty_tpl->getVariable('liulanqi')->value!='no'){?><span>浏览器兼容检测正常，可以顺利登录！</span><?php }else{ ?><span style="color:#FF0">您的浏览器有兼容隐患！请升级或更换浏览器。</span><?php }?>
    <ul>
    <li><a href="/">回首页</a></li>
    <li><a href="http://syguestbook.logphp.com" target="_blank">关于我们</a></li>
    <li>QQ：1030040075</li>
    </ul>    
</div> -->
    
  <div class="loginbody">
    <form action="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminlogin','a'=>'loginPost'),$_smarty_tpl);?>
" method="post"  name="form1" id="post_form">
      <div class="title">
        <p >用户登录<span>User Login</span></p>
        <span class="right">共想留言板</span>
      </div>
      <div class="loginbox">
        <?php if ($_smarty_tpl->getVariable('liulanqi')->value!='no'){?>
          <ul>
            <li class="row">
              <div class="label">
                <img src="tpl/adminlogin/images/user.png"/>
                <p>账号<br/><span>name</span></p>
              </div>
              <input name="username" type="text" class="loginuser shuru_input" placeholder="请输入帐号"/>
            </li>
            <li class="row" style="margin-top:-16px;">
              <div class="label">
                <img src="tpl/adminlogin/images/pass.png"/>
                <p>密码<br/><span>password</span></p>
              </div>
              <input name="password" type="password" class="loginpwd shuru_input" placeholder="请输入密码……"/>
            </li>
            <li class="row" style="margin-top:40px;">
              <input name="verifycode" type="text" class="verifycodeInp" id="verifycode" placeholder="请输入验证码"/>
              <img id="img" class="verifycodeImg" style="cursor:pointer" src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'main','a'=>'verifyCode'),$_smarty_tpl);?>
" onclick="document.getElementById('img').src='<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'main','a'=>'verifyCode'),$_smarty_tpl);?>
&tm='+Math.random()" />
            </li>
            <li class="row">
              <input name="submit" type="submit" class="loginbtn" value="登 录"  />
            </li>
          </ul>
        <?php }else{ ?>
        <div class="explorerDown">
          <p>对不起，您的浏览器版本太低！</p>
          <p>后台使用了大量Bootstrap，建议升级您的浏览器！</p>
          <hr />
          <p>推荐浏览器：</p>
          <p>360急速浏览器 - <a href="http://chrome.360.cn/" target="_blank">点击下载</a></p>
          <p>火狐浏览器 - <a href="http://www.firefox.com.cn/download/" target="_blank">点击下载</a></p>
          <p>谷歌浏览器 - <a href="http://www.haosou.com/s?ie=utf-8&src=360chrome_toolbar_search&q=%E8%B0%B7%E6%AD%8C%E6%B5%8F%E8%A7%88%E5%99%A8" target="_blank">点击下载</a></p>
          <p>IE8.0 - (这个我也放弃了)</p>
        </div>
        <?php }?>
        <img class="logo" src="tpl/adminlogin/images/login_logo.png" alt="" />

      </div>
      <div class="loginbm">问题反馈：<a href="http://guestbook.gzgxkj.com" target="_blank">共想留言板</a> - 程序版本 <?php echo @VERSIONNUMBER;?>
 您当前的位置：IP：<?php echo $_smarty_tpl->getVariable('ip')->value;?>
 <?php echo $_smarty_tpl->getVariable('diqu')->value;?>
</div>
    </form>
  </div>
</body>

</html>
