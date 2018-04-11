<?php /* Smarty version Smarty-3.0.8, created on 2018-03-14 02:15:46
         compiled from "F:\sys_guestbook/tpl\admin/index/top.html" */ ?>
<?php /*%%SmartyHeaderCode:195115aa885d2683795-09248766%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a1ac64f6420577841a4b6ffba13213b2720c78c3' => 
    array (
      0 => 'F:\\sys_guestbook/tpl\\admin/index/top.html',
      1 => 1520993722,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '195115aa885d2683795-09248766',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script type="text/javascript" src="tpl/admin/css/jquery.min.js"></script>
<link href="tpl/admin/css/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/Bootstrap/js/bootstrap.min.js"></script>
<link href="tpl/admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
$(function () {
  $('ul.list-inline li a').click(function () {
    $('ul.list-inline li a').removeClass('hover'); 
    $(this).addClass('hover');
    window.parent.document.getElementById('leftFrame').src = $(this).data('url');
    window.parent.document.getElementById('mainFrame').src = $(this).data('href');
  })
})




</script>
</head>

<body>
<div class="top">
<div class="logo"></div>
<ul class="list-inline">
  <?php if ($_SESSION['admin']['admin']=='admin'){?>


<!--   <li class="first"><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'admin','a'=>'menu','fenlei'=>'guestbook'),$_smarty_tpl);?>
" class="hover" target="leftFrame">留言板</a></li>
  <li class="second"><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'admin','a'=>'menu','fenlei'=>'adminuser'),$_smarty_tpl);?>
" target="leftFrame">管理员</a></li> -->



  <li class="first"><a class="hover" data-url="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'admin','a'=>'menu','fenlei'=>'guestbook'),$_smarty_tpl);?>
" data-href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminGuestbook','a'=>'ListGuestbook'),$_smarty_tpl);?>
">留言板</a></li>

  <li class="second"><a data-url="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'admin','a'=>'menu','fenlei'=>'adminuser'),$_smarty_tpl);?>
" data-href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'Administrator','a'=>'ListAdmin'),$_smarty_tpl);?>
">管理员</a></li>

  <?php }?>
</ul>
<ul class="fr">
  <li class="sign_out"><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'main','a'=>'logout'),$_smarty_tpl);?>
" target="_top">注销</a></li>
  <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'Administrator','a'=>'update','id'=>$_SESSION['admin']['id']),$_smarty_tpl);?>
" target="mainFrame">修改密码</a></li>
  <li>管理员<span style="color:#e60012;">[<?php echo $_SESSION['admin']['username'];?>
]</span></li>
  <!-- <li><a target="_blank" href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbook'),$_smarty_tpl);?>
">前台首页</a></li> -->
</ul>
</div>
<!-- <div class="admin-bread">
  <span class="fr">
    <?php $_template = new Smarty_Internal_Template("admin/index/smalltop.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate(); $_template->rendered_content = null;?><?php unset($_template);?>
  </span>
  
  <ul class="fl">
      <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'admin','a'=>'content'),$_smarty_tpl);?>
"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 开始</a></li>
      <li>后台首页</li>
  </ul>
</div> -->
</body>
</html>
