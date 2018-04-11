<?php /* Smarty version Smarty-3.0.8, created on 2018-03-09 10:38:38
         compiled from "F:\xammp\htdocs\sys_guestbook/tpl\jsMessage/index.html" */ ?>
<?php /*%%SmartyHeaderCode:214415aa2642e08cbe8-29825762%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b8d8efe0a41eefbd23264cd6fe27f65f56ba3d28' => 
    array (
      0 => 'F:\\xammp\\htdocs\\sys_guestbook/tpl\\jsMessage/index.html',
      1 => 1447343464,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '214415aa2642e08cbe8-29825762',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include 'F:\xammp\htdocs\sys_guestbook\SpeedPHP\Drivers\Smarty\plugins\function.cycle.php';
?><link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->getVariable('url')->value;?>
<?php echo $_smarty_tpl->getVariable('template')->value;?>
/css/style.css"/>
<script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('url')->value;?>
<?php echo $_smarty_tpl->getVariable('template')->value;?>
/css/jquery.min.js"></script>
<script type="text/javascript">
function good(mid)
  {
    $.ajax({
	  type:"POST",
	  url:"<?php echo $_smarty_tpl->getVariable('url')->value;?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbook','a'=>'AjaxGood'),$_smarty_tpl);?>
",
	  data:"mid="+mid,
	  cache:false,
	  success:function(data){
		$("#good"+mid).html(data);
	  }
  });
  $("#good"+mid).html('谢谢您的支持！');
  return false;
  }
</script>

<!--wrapper-->
<div class="SY_wrapper border_radius_5px">
<div class="adminlist">
  <span class="fl">管理员：<?php echo adminuserList(array('gid'=>$_smarty_tpl->getVariable('g')->value['id']),$_smarty_tpl);?>
</span>
  <span class="fr"><?php echo MegSum(array('gid'=>$_smarty_tpl->getVariable('g')->value['id']),$_smarty_tpl);?>
</span>
  <div class="clear"></div>
</div>

<div class="b15"></div>

<?php if ($_smarty_tpl->getVariable('g')->value['gDisplay']=='yes'){?>

<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_variable(0, null, null);?>
<?php  $_smarty_tpl->tpl_vars['m'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('message')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['m']->key => $_smarty_tpl->tpl_vars['m']->value){
?>
<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_variable($_smarty_tpl->getVariable('i')->value+1, null, null);?>
<div class="megList <?php echo smarty_function_cycle(array('values'=>"bg1,bg2"),$_smarty_tpl);?>
">
  <div class="meg">
    <div class="mTop">
      <span class="fl"><span class="user ico">网友：<?php echo $_smarty_tpl->tpl_vars['m']->value['name'];?>
</span>&nbsp;&nbsp;&nbsp;<span class="time ico">时间：<?php echo formatTime(array('date'=>$_smarty_tpl->tpl_vars['m']->value['addtime'],'type'=>1),$_smarty_tpl);?>
</span></span>
      <span class="fr">#<?php echo $_smarty_tpl->getVariable('i')->value;?>
</span>
      <div class="clear"></div>
    </div>
    <div class="mContent">
      <div><?php echo $_smarty_tpl->tpl_vars['m']->value['message'];?>
</div>
      <?php if ($_smarty_tpl->tpl_vars['m']->value['reply']){?>
      <div class="reply">
        <div class="tit">管理员<?php echo $_smarty_tpl->tpl_vars['m']->value['replyAdmin'];?>
回复：</div>
        <div class="con"><?php echo $_smarty_tpl->tpl_vars['m']->value['reply'];?>
</div>
      </div>
      <?php }?>
    </div>
    <div class="mSm">
      <span class="fl"><span class="address ico"><?php echo $_smarty_tpl->tpl_vars['m']->value['address'];?>
（<?php echo hideIp(array('ip'=>$_smarty_tpl->tpl_vars['m']->value['ip']),$_smarty_tpl);?>
）</span></span>
      <span class="fr" id="good<?php echo $_smarty_tpl->tpl_vars['m']->value['id'];?>
"><a class="good ico" onclick="javascript:good('<?php echo $_smarty_tpl->tpl_vars['m']->value['id'];?>
');">赞一下（<?php echo $_smarty_tpl->tpl_vars['m']->value['good'];?>
）</a></span>
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<?php }} ?>

<!--分页-->
<?php if ($_smarty_tpl->getVariable('pager')->value){?>

<div class="pag">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      <div class="pager">共有记录<?php echo $_smarty_tpl->getVariable('pager')->value['total_count'];?>
条</div>
	</td>
  </tr>
</table>
</div>
<div class="b15"></div>
<?php }?>
<!--分页 end-->
<?php }elseif($_smarty_tpl->getVariable('g')->value['gDisplay']=='no'){?>
<div class="gDisplayNo">已关闭留言显示！</div>
<div class="b15"></div>
<?php }?>

<a name="MegAddForm" id="MegAddForm"></a>
<div class="megAdd">
  <div class="addform basic-grey">
    <h1>在线留言<span>请认真填写您的留言信息，以便我们能更快的处理您的问题！</span></h1>
    <form id="MyMegForm" name="MyMegForm" method="post" action="<?php echo $_smarty_tpl->getVariable('url')->value;?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbook','a'=>'megAddPost','gid'=>$_smarty_tpl->getVariable('g')->value['id']),$_smarty_tpl);?>
">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="45" align="center"><span class="Prompt">昵称</span></td>
          <td>
            <input type="text" name="name" id="name" datatype="*2-30" nullmsg="昵称不能为空！" errormsg="昵称必须为2~30个字符!" value="<?php echo $_COOKIE['valueName'];?>
" /></td>
        </tr>
        <tr>
          <td align="center"><span class="Prompt">QQ</span></td>
          <td><input type="text" name="qq" id="qq" datatype="n5-12" errormsg="QQ格式错误!" nullmsg="QQ号不能为空！" value="<?php echo $_COOKIE['valueQq'];?>
" /></td>
        </tr>
        <tr>
          <td align="center"><span class="Prompt">留言<br />内容</span></td>
          <td>
            <textarea name="message" id="message" cols="45" rows="5" datatype="*" nullmsg="留言内容不能为空！"></textarea></td>
        </tr>
        <tr>
          <td align="center">验证</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="130"><input type="text" name="verifycode" id="verifycode" datatype="n4-4" errormsg="验证码格式错误!" nullmsg="验证码不能为空！" style="width:100px;"  /></td>
              <td><img id="img" class="verifycodeImg" style="width:90px; height:30px; cursor:pointer; margin-bottom:15px;" src="<?php echo $_smarty_tpl->getVariable('url')->value;?>
index.php?c=main&a=verifyCode" onclick="document.getElementById('img').src='<?php echo $_smarty_tpl->getVariable('url')->value;?>
index.php?c=main&a=verifyCode&amp;tm='+Math.random()"></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" class="submit" name="submit" id="submit" value="提交留言" />&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgSpan">文明上网，理性发言！</span></td>
        </tr>
      </table>
    </form>
  </div>
  <div class="clear"></div>
</div>

</div><!--wrapper End-->

<div class="SY_footer">
  <span class="fr">Powered by <a href="http://syguestbook.logphp.com" target="_blank">SyGouestBook</a></span>
  <div class="clear"></div>
</div>

<script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('url')->value;?>
<?php echo $_smarty_tpl->getVariable('template')->value;?>
/css/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
$(function(){		
	$("#MyMegForm").Validform({
		tiptype:function(msg,o,cssctl){
			var objtip=$("#msgSpan");
			cssctl(objtip,o.type);
			objtip.text(msg);
		},
		ajaxPost:false
	});
})
</script>