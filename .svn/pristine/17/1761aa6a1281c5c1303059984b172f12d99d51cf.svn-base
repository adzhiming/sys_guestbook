<?php /* Smarty version Smarty-3.0.8, created on 2018-03-14 01:16:32
         compiled from "F:\sys_guestbook/tpl\admin/guestbookCall/ListGuestbookCall.html" */ ?>
<?php /*%%SmartyHeaderCode:190155aa877f05680e5-76397243%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '26e63b76c345c6e6cae42945d445f576d0c3aa71' => 
    array (
      0 => 'F:\\sys_guestbook/tpl\\admin/guestbookCall/ListGuestbookCall.html',
      1 => 1520990097,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '190155aa877f05680e5-76397243',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主体</title>
<link href="tpl/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/jquery.min.js"></script>
<link href="tpl/admin/css/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/Bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<!-- <div class="admin-bread">
  <span class="fr">
    <?php $_template = new Smarty_Internal_Template("admin/index/smalltop.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate(); $_template->rendered_content = null;?><?php unset($_template);?>
  </span> -->
  
<!--   <ul class="fl">
      <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminGuestbook','a'=>'ListGuestbook'),$_smarty_tpl);?>
"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 开始</a></li>
      <li>/</li>
      <li><?php echo $_smarty_tpl->getVariable('title')->value;?>
</li>
  </ul> -->
<!-- </div> -->

<!--content-->
<div class="content">
<div class="panel panel-default" style="overflow:inherit;">
      <!-- Default panel contents -->
    <div class="panel-heading">
      
      <!-- Default panel contents -->
      <div class="panel-body">
      <div class="btn-toolbar" role="toolbar">
        <div class="btn-group">
          <button class="btn btn-primary dropdown-toggle btn-lg" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <?php echo (($tmp = @$_smarty_tpl->getVariable('guestbook')->value['gName'])===null||$tmp==='' ? '请选择要调用的留言板' : $tmp);?>
 <span class="caret"></span>
          </button>
          <ul class="dropdown-menu">
          <?php  $_smarty_tpl->tpl_vars['list'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('lists')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['list']->key => $_smarty_tpl->tpl_vars['list']->value){
?>
            <li><a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbookCall','a'=>'ListGuestbookCall','gid'=>$_smarty_tpl->tpl_vars['list']->value['id']),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['list']->value['gName'];?>
</a></li>
          <?php }} ?>
          </ul>
        </div><!-- /btn-group -->
      </div>
      </div><!-- Default panel contents End -->
      
    </div>

      <!-- Table -->
      <table class="table">
        <?php if ($_smarty_tpl->getVariable('guestbook')->value){?>
        <thead>
          <tr>
            <th width="240"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> IFRAME调用:</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td scope="row">
            <pre>&lt;iframe name=&quot;SyGuestBook&quot; src=&quot;<?php echo $_smarty_tpl->getVariable('url')->value;?>
?c=guestbook&amp;id=<?php echo $_smarty_tpl->getVariable('guestbook')->value['id'];?>
&quot; width=&quot;100%&quot; height=&quot;1500&quot; frameborder=&quot;0&quot; scrolling=&quot;auto&quot;&gt;&lt;/iframe&gt;</pre>
            <p>优点：兼容性好，万金油的调用方式</p>
            <p>缺点：不能自适应高度，不美观。（比较适合风格比较简单的模板，最好是响应式的）</p>
            <p class="text-danger">注意事项：宽度（width=100%）可以不管。最主要是设置高度（height=？），要调整到适合你网站的高度。</p>
            </td>
          </tr>
        </tbody>
        <thead>
          <tr>
            <th width="240"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> JS调用:（个人比较喜欢的调用方式）</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td scope="row">
            <pre>&lt;script name=&quot;SyGuestBook&quot; charset=&quot;UTF-8&quot; type=&quot;text/javascript&quot; src=&quot;<?php echo $_smarty_tpl->getVariable('url')->value;?>
?c=main&amp;a=jsMessage&amp;gid=<?php echo $_smarty_tpl->getVariable('guestbook')->value['id'];?>
&quot;&gt;&lt;/script&gt;</pre>
            <p>优点：自适应高度，调用后违和感很低。</p>
            <p>缺点：JS跨域了，无法使用AJAX，所以无法翻页，默认显示最新20条留言，使用了内置的模板。另外也有可能出现兼容问题</p>
            <p class="text-danger">注意事项：出现乱码的的话要注意把（charset=UTF-8）改为你网站的编码。例如你要调用留言板的网站编码是GBK，则要改为“charset=GBK”</p>
            </td>
          </tr>
        </tbody>
        <?php }else{ ?>
        <thead>
          <tr>
            <th width="240"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 提示：请在上方选择要调用的留言板</th>
          </tr>
        </thead>
        <?php }?>
      </table>
  </div>
</div><!--content End-->
</body>
</html>