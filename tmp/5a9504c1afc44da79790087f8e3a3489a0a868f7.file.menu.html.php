<?php /* Smarty version Smarty-3.0.8, created on 2018-03-14 02:55:52
         compiled from "F:\xammp\htdocs\sys_guestbook/tpl\admin/index/menu.html" */ ?>
<?php /*%%SmartyHeaderCode:123115aa88f387b9742-85725879%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5a9504c1afc44da79790087f8e3a3489a0a868f7' => 
    array (
      0 => 'F:\\xammp\\htdocs\\sys_guestbook/tpl\\admin/index/menu.html',
      1 => 1520993722,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '123115aa88f387b9742-85725879',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台边栏</title>

<script type="text/javascript" src="tpl/admin/css/jquery.min.js"></script>
<link href="tpl/admin/css/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/Bootstrap/js/bootstrap.min.js"></script>
<link href="tpl/admin/css/style.css" rel="stylesheet" type="text/css" />
<style>
body,html{height:100%;}
</style>
<script language="javascript" type="text/javascript">
$(function () {
  $('.con ul li a').click(function () {
    $('.con ul li a').removeClass('hover'); 
    $(this).addClass('hover');  
  })
})
</script>
</head>

<body style="background-color:#f2f9fd">
<div class="sidebar">
  <div class="con">
  <?php if (!$_smarty_tpl->getVariable('fenlei')->value||$_smarty_tpl->getVariable('fenlei')->value=='guestbook'){?>
  <ul>
  	<!-- <li class="tit"><img src="tpl/admin/images/meun_1.png" alt="" />留言板管理</li> -->
    <li ><a class="hover" href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminGuestbook','a'=>'ListGuestbook'),$_smarty_tpl);?>
" target="mainFrame"><img src="tpl/admin/images/meun_2.png" alt="" />留言板列表</a></li>
    <?php if ($_SESSION['admin']['admin']=='admin'){?>
    <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminGuestbook','a'=>'add'),$_smarty_tpl);?>
" target="mainFrame"><img src="tpl/admin/images/meun_3.png" alt="" />留言板添加</a></li>
    <?php }?>
    <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbookCall','a'=>'ListGuestbookCall'),$_smarty_tpl);?>
" target="mainFrame"><img src="tpl/admin/images/meun_4.png" alt="" />留言板调用</a></li>
  </ul>
  
  <?php }elseif($_smarty_tpl->getVariable('fenlei')->value=='adminuser'){?>
  
  <ul>
      <!-- <li class="tit"><img src="tpl/admin/images/meun_1.png" alt="" />管理员管理</li> -->
      <li><a class="hover" href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'Administrator','a'=>'ListAdmin'),$_smarty_tpl);?>
" target="mainFrame"><img src="tpl/admin/images/meun_2.png" alt="" />管理员列表</a></li>
      <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'Administrator','a'=>'add'),$_smarty_tpl);?>
" target="mainFrame"><img src="tpl/admin/images/meun_3.png" alt="" />添加管理员</a></li>
  </ul>
    
  <?php }?>
  </div>
</div>
</body>
</html>