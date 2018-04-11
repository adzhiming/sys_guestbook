<?php /* Smarty version Smarty-3.0.8, created on 2018-03-09 08:42:24
         compiled from "F:\sys_guestbook/tpl\guestbook/default/index.html" */ ?>
<?php /*%%SmartyHeaderCode:99465aa248f04e7a35-65796906%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '004ae1e4a9cad7f305c0da06846f632a58996464' => 
    array (
      0 => 'F:\\sys_guestbook/tpl\\guestbook/default/index.html',
      1 => 1520577874,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '99465aa248f04e7a35-65796906',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_function_cycle')) include 'F:\sys_guestbook\SpeedPHP\Drivers\Smarty\plugins\function.cycle.php';
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $_smarty_tpl->getVariable('g')->value['gName'];?>
 - Powered by SyGouestBook</title>
<meta name="keywords" content="<?php echo $_smarty_tpl->getVariable('g')->value['gKeywords'];?>
" />
<meta name="description" content="<?php echo $_smarty_tpl->getVariable('g')->value['gDescription'];?>
" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" media="screen" />
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->getVariable('template')->value;?>
/css/style.css"/>
<script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('template')->value;?>
/css/jquery.min.js"></script>
<script type="text/javascript">
function good(mid)
  {
    $.ajax({
	  type:"POST",
	  url:"<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbook','a'=>'AjaxGood'),$_smarty_tpl);?>
",
	  data:"mid="+mid,
	  cache:false,
	  success:function(data){
		$("#good"+mid).html(data);
	  }
  });
  return false;
  }
</script>
</head>

<body>
<!--wrapper-->
<div class="wrapper border_radius_5px">
  <div class="logo fl"><img src="<?php echo (($tmp = @$_smarty_tpl->getVariable('g')->value['gLogo'])===null||$tmp==='' ? 'tpl/guestbook/default/images/logo.jpg' : $tmp);?>
" width="250" height="60" /></div>
  <div class="gName fr"><?php echo $_smarty_tpl->getVariable('g')->value['gName'];?>
</div>
  
  <div class="clear b15"></div>
  
  <div class="gBanner"><img src="<?php echo (($tmp = @$_smarty_tpl->getVariable('g')->value['gBanner'])===null||$tmp==='' ? 'tpl/guestbook/default/images/gBanner.jpg' : $tmp);?>
" width="930"/></div>
  
  <div class="b15"></div>
  
  <div class="nav">
    <div class="fl">
      <a href="#MegAddForm">我要留言</a>
      <?php echo NavList(array('data'=>$_smarty_tpl->getVariable('g')->value['gNav']),$_smarty_tpl);?>

    </div>
    <div class="fr">欢迎来自<?php echo replaceIp(array('ip'=>$_smarty_tpl->getVariable('ip')->value),$_smarty_tpl);?>
（<?php echo $_smarty_tpl->getVariable('ip')->value;?>
）的网友！</div>
  </div>
  
  <div class="b15"></div>
  
  <div class="gIntroduction"><?php echo $_smarty_tpl->getVariable('g')->value['gIntroduction'];?>
</div>

<div class="b15"></div>

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
  <div class="head fl"><img src="<?php echo HeadImg(array('qq'=>$_smarty_tpl->tpl_vars['m']->value['qq'],'mold'=>$_smarty_tpl->getVariable('g')->value['gHead']),$_smarty_tpl);?>
" /></div>
  <div class="meg fr">
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

<div class="b15"></div>

<div class="pag">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      <div class="pager">
      共有记录<?php echo $_smarty_tpl->getVariable('pager')->value['total_count'];?>
条，共有<?php echo $_smarty_tpl->getVariable('pager')->value['total_page'];?>
页（每页<?php echo $_smarty_tpl->getVariable('pager')->value['page_size'];?>
条）：
      <?php $_smarty_tpl->tpl_vars['max_page'] = new Smarty_variable(5, null, null);?>
      <!--每页最大页码数-->
      <!--开始及结束页码--> 
      <?php if ($_smarty_tpl->getVariable('pager')->value['current_page']%$_smarty_tpl->getVariable('max_page')->value==0){?>
      	<?php $_smarty_tpl->tpl_vars['start_page'] = new Smarty_variable(floor($_smarty_tpl->getVariable('pager')->value['current_page']/$_smarty_tpl->getVariable('max_page')->value)*$_smarty_tpl->getVariable('max_page')->value+1-$_smarty_tpl->getVariable('max_page')->value, null, null);?>
      <?php }else{ ?>
      	<?php $_smarty_tpl->tpl_vars['start_page'] = new Smarty_variable(floor($_smarty_tpl->getVariable('pager')->value['current_page']/$_smarty_tpl->getVariable('max_page')->value)*$_smarty_tpl->getVariable('max_page')->value+1, null, null);?>
      <?php }?>     
      <?php if (($_smarty_tpl->getVariable('start_page')->value+$_smarty_tpl->getVariable('max_page')->value)<=$_smarty_tpl->getVariable('pager')->value['total_page']){?>
      	<?php $_smarty_tpl->tpl_vars['end_page'] = new Smarty_variable($_smarty_tpl->getVariable('start_page')->value+$_smarty_tpl->getVariable('max_page')->value-1, null, null);?>
      <?php }else{ ?>
      	<?php $_smarty_tpl->tpl_vars['end_page'] = new Smarty_variable($_smarty_tpl->getVariable('pager')->value['total_page'], null, null);?>
      <?php }?>
      <?php if ($_smarty_tpl->getVariable('start_page')->value<=1&&$_smarty_tpl->getVariable('pager')->value['current_page']<=1){?>
        <a class="Invalid">首页</a>
        <a class="Invalid">上一页</a>
      <?php }elseif($_smarty_tpl->getVariable('pager')->value['current_page']>1&&$_smarty_tpl->getVariable('pager')->value['total_page']<=$_smarty_tpl->getVariable('max_page')->value){?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">上一页</a>
      <?php }elseif($_smarty_tpl->getVariable('pager')->value['current_page']>1&&$_smarty_tpl->getVariable('pager')->value['current_page']<=$_smarty_tpl->getVariable('max_page')->value){?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">上一页</a>
      <?php }else{ ?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">«</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['current_page']-$_smarty_tpl->getVariable('max_page')->value),$_smarty_tpl);?>
">-<?php echo $_smarty_tpl->getVariable('max_page')->value;?>
</a>
      <?php }?>
      <!--开始循环页码，同时如果循环到当前页设置属性为active-->
      <?php  $_smarty_tpl->tpl_vars['thepage'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('pager')->value['all_pages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['thepage']->key => $_smarty_tpl->tpl_vars['thepage']->value){
?>        
      <?php if ($_smarty_tpl->tpl_vars['thepage']->value<=$_smarty_tpl->getVariable('end_page')->value&&$_smarty_tpl->tpl_vars['thepage']->value>=$_smarty_tpl->getVariable('start_page')->value){?>  
          <?php if ($_smarty_tpl->tpl_vars['thepage']->value==$_smarty_tpl->getVariable('pager')->value['current_page']){?>
              <a class="present"><?php echo $_smarty_tpl->tpl_vars['thepage']->value;?>
</a>
              <?php }else{ ?>
              <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->tpl_vars['thepage']->value),$_smarty_tpl);?>
"><?php echo $_smarty_tpl->tpl_vars['thepage']->value;?>
</a>
          <?php }?>
       <?php }?>
      <?php }} ?>
      <?php if ($_smarty_tpl->getVariable('end_page')->value==$_smarty_tpl->getVariable('pager')->value['total_page']){?> 
      <?php if ($_smarty_tpl->getVariable('pager')->value['current_page']==$_smarty_tpl->getVariable('pager')->value['last_page']){?>
        <a class="Invalid">下一页</a>
        <a class="Invalid">尾页</a>
      <?php }else{ ?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['next_page']),$_smarty_tpl);?>
">下一页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['last_page']),$_smarty_tpl);?>
">尾页</a>
      <?php }?>
      <?php }else{ ?> 
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['current_page']+$_smarty_tpl->getVariable('max_page')->value),$_smarty_tpl);?>
">+<?php echo $_smarty_tpl->getVariable('max_page')->value;?>
</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['next_page']),$_smarty_tpl);?>
">下一页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'id'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['last_page']),$_smarty_tpl);?>
">尾页</a>
      <?php }?> 
      </div>
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
  <div class="addform fl basic-grey">
    <h1>在线留言<span>请认真填写您的留言信息，以便我们能更快的处理您的问题！</span></h1>
    <form id="MyMegForm" name="MyMegForm" method="post" action="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'guestbook','a'=>'megAddPost','gid'=>$_smarty_tpl->getVariable('g')->value['id']),$_smarty_tpl);?>
">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="45" align="center"><span class="Prompt">姓名</span></td>
          <td>
            <input type="text" name="name" id="name" datatype="*2-30" nullmsg="昵称不能为空！" errormsg="昵称必须为2~30个字符!" value="<?php echo $_COOKIE['valueName'];?>
" /></td>
        </tr>
        <tr>
          <td align="center"><span class="Prompt">手机</span></td>
          <td><input type="text" name="phone" id="phone" datatype="n5-12" errormsg="手机号码格式错误!" nullmsg="手机号码号不能为空！" value="<?php echo $_COOKIE['valuePhone'];?>
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
              <td><img id="img" class="verifycodeImg" style="width:90px; height:30px; cursor:pointer; margin-bottom:15px;" src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'main','a'=>'verifyCode'),$_smarty_tpl);?>
" onclick="document.getElementById('img').src='<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'main','a'=>'verifyCode'),$_smarty_tpl);?>
&amp;tm='+Math.random()"></td>
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
  <div class="sm fr">
    <p class="tit">友情提示：</p>
    <p class="con">填写QQ将自动获取您的QQ头像，涉及到邮箱的地方也会生成您的QQ邮箱进行操作（回复提醒等），也是我们联系您的唯一途径，所以填写正确的QQ十分重要！</p>
    <div class="b15"></div>
    <p class="tit">留言须知：</p>
    <p class="con">文明上网，理性发言！</p>
    <div class="b15"></div>
    <img src="<?php echo (($tmp = @$_smarty_tpl->getVariable('g')->value['gLogo'])===null||$tmp==='' ? 'tpl/guestbook/default/images/logo.jpg' : $tmp);?>
" width="250" height="60" />
  </div>
  <div class="clear"></div>
</div>

</div><!--wrapper End-->

<div class="footer">
  <span class="fl"><?php echo $_smarty_tpl->getVariable('g')->value['gPowerby'];?>
 <?php echo $_smarty_tpl->getVariable('g')->value['gbeian'];?>
 <?php echo $_smarty_tpl->getVariable('g')->value['gBeian'];?>
 <?php echo $_smarty_tpl->getVariable('g')->value['gTongji'];?>
</span>
  <span class="fr">Powered by <a href="http://www.sucainiu.com" target="_blank">www.sucainiu.com</a></span>
  <div class="clear"></div>
</div>

<script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('template')->value;?>
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
</body>
</html>