<?php /* Smarty version Smarty-3.0.8, created on 2018-03-14 03:44:34
         compiled from "F:\sys_guestbook/tpl\admin/message/ListMessage.html" */ ?>
<?php /*%%SmartyHeaderCode:151675aa89aa2446f18-61099190%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '979bb5df363739b3cc0aef78bf243c74572cbaba' => 
    array (
      0 => 'F:\\sys_guestbook/tpl\\admin/message/ListMessage.html',
      1 => 1520997386,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '151675aa89aa2446f18-61099190',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $_smarty_tpl->getVariable('title')->value;?>
 - <?php echo @WEBNAME;?>
</title>

<link href="tpl/admin/css/megList.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/jquery.min.js"></script>
<link href="tpl/admin/css/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tpl/admin/css/Bootstrap/js/bootstrap.min.js"></script>
<link href="tpl/admin/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  .table tr:last-child{
    border:none;
  }
  body{background:#eee;}
</style>
<script type="text/javascript">
function reply(mid,gid)
{
	$.ajax({
	  type:"POST",
	  url:"<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminMessage','a'=>'reply'),$_smarty_tpl);?>
",
	  data:"mid="+mid+"&gid="+gid,
	  cache:false,
	  success:function(data){
	  $("#replyForm").html(data);
	  }
});
return false;
}

function replyButton(mid)
{
	var reply = $("#replyVal").val();
	var status = $("input[name='status']:checked").val();
	$.ajax({
	  type:"POST",
	  url:"<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminMessage','a'=>'AjaxReplyPost'),$_smarty_tpl);?>
",
	  data:"mid="+mid+"&reply="+reply+"&status="+status,
	  cache:false,
	  success:function(data){
		if(data!='no')
		{
			$('#replyModal').modal('hide');
			$("#reply"+mid).html('<div class="reply"><div class="con">'+data+'</div></div>');
		}
		else
		{
			$("#replyMessage").html('回复失败');
			alert('回复失败');
		}
		
	  }
});
return false;

}

</script>
</head>

<body>
<!--admin-bread-->
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
      <li>/</li>
      <li><?php echo $_smarty_tpl->getVariable('g')->value['gName'];?>
</li>
  </ul> -->
<!-- </div> -->
<!--admin-bread End-->

<!--content-->
<div class="content">
<div>

<form name="form1" action="" method="post" class="form-inline new-form-inline">
  <input type="text" placeholder="来源URL(支持模糊查询)" name="url" class="url_input"/>
  <div class="form-group">
    <label for="exampleInputName2">开始时间</label>
    <input name="stime" id="stime" type="date" value="<?php echo $_smarty_tpl->getVariable('stime')->value;?>
" class="form-control"/>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail2">结束时间</label>
    <input  name="etime" id="etime" class="form-control"  type="date" value="<?php echo $_smarty_tpl->getVariable('etime')->value;?>
"/>
  </div>
  <button type="submit" class="btn btn-default chaxun">查询</button>
  <div class="pull-right daochu_div">
    导出:
    <input type="button" class="btn btn-default daochu pull-right" onclick="downloadExcel()" value="导出EXCEL"/>
  </div>
  <select name="page" class="pull-right form-control pages">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
</form>


</div>
<!-- <p><?php echo MegSum(array('gid'=>$_smarty_tpl->getVariable('g')->value['id']),$_smarty_tpl);?>
 - 管理员：<?php echo $_smarty_tpl->getVariable('g')->value['admin_name'];?>
</p> -->
<?php if ($_smarty_tpl->getVariable('lists')->value){?>
<div class="panel panel-default">
<table  class="table  table-bordered new_border">
  <tr class="active">
    <td width="140" align="center" class="bgc"><strong>留言时间</strong></td>
    <td width="350" class="bgc" align="center"><strong>请求url</strong></td>
    <td width="120" align="center" class="bgc"><strong>姓名</strong></td>
    <td width="100" align="center" class="bgc"><strong>手机</strong></td>
    <td width="120" align="center" class="bgc"><strong>地址</strong></td>
    <td width="250" align="center" class="bgc"><strong>留言内容</strong></td>
    <td width="180" align="center" class="bgc"><strong>操作</strong></td>
  </tr>
  <?php  $_smarty_tpl->tpl_vars['m'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('lists')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['m']->key => $_smarty_tpl->tpl_vars['m']->value){
?>
  <tr>
    <td class="border-left" align="center"><?php echo dateTime(array('format'=>'Y年m月d日 H:i','timestamp'=>$_smarty_tpl->tpl_vars['m']->value['addtime']),$_smarty_tpl);?>
</td>
    <td align="center"><?php echo $_smarty_tpl->tpl_vars['m']->value['url'];?>
</td>
    <td align="center"><?php echo $_smarty_tpl->tpl_vars['m']->value['name'];?>
</td>
    <td align="center"><?php echo $_smarty_tpl->tpl_vars['m']->value['phone'];?>
</td>
    <td align="center"><?php echo $_smarty_tpl->tpl_vars['m']->value['address'];?>
</td>
    <td align="center"><?php echo $_smarty_tpl->tpl_vars['m']->value['reply'];?>
</td>
    <td class="right" align="center">
      <a class="btn btn-danger btn-xs new_mess_a" href="javascript:void(0);" onclick="delconfirm('id','<?php echo $_smarty_tpl->tpl_vars['m']->value['id'];?>
','确定删除(ID:<?php echo $_smarty_tpl->tpl_vars['m']->value['id'];?>
)的留言吗？');"> 删除单个留言</a>  <a class="btn btn-danger btn-xs new_mess_a" href="javascript:void(0);" onclick="delconfirm('ip','<?php echo $_smarty_tpl->tpl_vars['m']->value['ip'];?>
','确定删除(IP:<?php echo $_smarty_tpl->tpl_vars['m']->value['ip'];?>
)下的全部留言吗？');">删除同IP留言</a>
  </tr>
  <?php }} ?>
</table>
</div>

<?php }else{ ?>
<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> 暂无留言！</div>
<?php }?>

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
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">上一页</a>
      <?php }elseif($_smarty_tpl->getVariable('pager')->value['current_page']>1&&$_smarty_tpl->getVariable('pager')->value['current_page']<=$_smarty_tpl->getVariable('max_page')->value){?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">上一页</a>
      <?php }else{ ?>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['first_page']),$_smarty_tpl);?>
">首页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['prev_page']),$_smarty_tpl);?>
">«</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['current_page']-$_smarty_tpl->getVariable('max_page')->value),$_smarty_tpl);?>
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
              <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->tpl_vars['thepage']->value),$_smarty_tpl);?>
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
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['next_page']),$_smarty_tpl);?>
">下一页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['last_page']),$_smarty_tpl);?>
">尾页</a>
      <?php }?>
      <?php }else{ ?> 
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['current_page']+$_smarty_tpl->getVariable('max_page')->value),$_smarty_tpl);?>
">+<?php echo $_smarty_tpl->getVariable('max_page')->value;?>
</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['next_page']),$_smarty_tpl);?>
">下一页</a>
        <a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>$_smarty_tpl->getVariable('c')->value,'a'=>$_smarty_tpl->getVariable('a')->value,'gid'=>$_smarty_tpl->getVariable('g')->value['id'],'page'=>$_smarty_tpl->getVariable('pager')->value['last_page']),$_smarty_tpl);?>
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

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModal">
  <div class="modal-dialog modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="replyModal">管理员回复：</h4>
      </div>
      <div class="modal-body">
		<div id="replyForm"></div>
      </div>
    </div>
  </div>
</div>


</div><!--content End-->
<script>
function delconfirm(mold,v,tit){
	if( window.confirm(tit) ){
		window.location = "<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['spUrl'][0][0]->__template_spUrl(array('c'=>'adminMessage','a'=>'del'),$_smarty_tpl);?>
&mold="+mold+"&v="+v;
	}
}
function downloadExcel(){
	var stime = $("#stime").val()
	var etime = $("#etime").val()
	document.form1.action="/index.php?c=adminMessage&a=downLoad2Excel&gid=<?php echo $_smarty_tpl->getVariable('g')->value['id'];?>
"
	document.form1.submit();
	document.form1.action=""
}
</script>
</body>
</html>