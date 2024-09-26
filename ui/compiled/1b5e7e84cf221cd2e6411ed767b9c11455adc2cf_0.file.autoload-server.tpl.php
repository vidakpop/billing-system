<?php
/* Smarty version 4.3.1, created on 2024-06-29 16:19:16
  from '/var/www/html/MAIN/ui/ui/autoload-server.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_668009d49079a4_00243988',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1b5e7e84cf221cd2e6411ed767b9c11455adc2cf' => 
    array (
      0 => '/var/www/html/MAIN/ui/ui/autoload-server.tpl',
      1 => 1716341390,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_668009d49079a4_00243988 (Smarty_Internal_Template $_smarty_tpl) {
?><option value=''><?php echo Lang::T('Select Routers');?>
</option>
<?php if ($_smarty_tpl->tpl_vars['_c']->value['radius_enable']) {?>
    <option value="radius">Radius</option>
<?php }
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['d']->value, 'ds');
$_smarty_tpl->tpl_vars['ds']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['ds']->value) {
$_smarty_tpl->tpl_vars['ds']->do_else = false;
?>
	<option value="<?php echo $_smarty_tpl->tpl_vars['ds']->value['name'];?>
"><?php echo $_smarty_tpl->tpl_vars['ds']->value['name'];?>
</option>
<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
}
}
