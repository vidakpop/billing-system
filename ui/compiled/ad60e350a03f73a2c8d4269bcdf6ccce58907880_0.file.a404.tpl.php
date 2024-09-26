<?php
/* Smarty version 4.3.1, created on 2024-06-29 14:59:39
  from '/var/www/html/MAIN/ui/ui/a404.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_667ff72b5324c8_15375857',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ad60e350a03f73a2c8d4269bcdf6ccce58907880' => 
    array (
      0 => '/var/www/html/MAIN/ui/ui/a404.tpl',
      1 => 1716341390,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sections/header.tpl' => 1,
    'file:sections/footer.tpl' => 1,
  ),
),false)) {
function content_667ff72b5324c8_15375857 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:sections/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

			<div class="page page-err clearfix">
				<div class="err-container">
					<h1 class="m404 mb0">404 <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
dashboard" class="ion ion-forward" title="go to dashboard"></a></h1>
				</div>
			</div>

<?php $_smarty_tpl->_subTemplateRender("file:sections/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
