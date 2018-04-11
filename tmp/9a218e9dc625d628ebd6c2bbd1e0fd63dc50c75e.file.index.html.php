<?php /* Smarty version Smarty-3.0.8, created on 2018-03-12 09:20:54
         compiled from "F:\sys_guestbook/tpl\admin/index/index.html" */ ?>
<?php /*%%SmartyHeaderCode:2385aa646764e7374-38669803%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9a218e9dc625d628ebd6c2bbd1e0fd63dc50c75e' => 
    array (
      0 => 'F:\\sys_guestbook/tpl\\admin/index/index.html',
      1 => 1520846381,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2385aa646764e7374-38669803',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo @WEBNAME;?>
</title>
</head>
<frameset  rows="50,80,*" framespacing="0" frameborder="no" border="0">
        <frame src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>"admin",'a'=>"top"),$_smarty_tpl);?>
" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
        <frame src="<?php echo $_smarty_tpl->getVariable('url')->value;?>
" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>"adminGuestbook",'a'=>"ListGuestbook"),$_smarty_tpl);?>
" name="mainFrame" id="mainFrame" title="mainFrame" />
</frameset>


<noframes>
<body>
</body>
</noframes>
</html>

