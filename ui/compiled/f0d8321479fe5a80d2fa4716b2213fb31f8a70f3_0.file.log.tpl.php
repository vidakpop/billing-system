<?php
/* Smarty version 4.3.1, created on 2024-06-29 17:18:53
  from '/var/www/html/MAIN/system/plugin/ui/log.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_668017cde515e8_52485588',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f0d8321479fe5a80d2fa4716b2213fb31f8a70f3' => 
    array (
      0 => '/var/www/html/MAIN/system/plugin/ui/log.tpl',
      1 => 1718818509,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sections/header.tpl' => 1,
    'file:sections/footer.tpl' => 1,
  ),
),false)) {
function content_668017cde515e8_52485588 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/MAIN/system/vendor/smarty/smarty/libs/plugins/modifier.count.php','function'=>'smarty_modifier_count',),));
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log UI</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<?php $_smarty_tpl->_subTemplateRender("file:sections/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
    <div class="container mx-auto mt-8 bg-white rounded-lg shadow-lg p-6">
        <form class="mb-4" method="post" role="form" action="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
plugin/log_ui">
            <ul class="nav nav-tabs flex border-b">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['routers']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
                    <li class="mr-1" role="presentation" <?php if ($_smarty_tpl->tpl_vars['r']->value['id'] == $_smarty_tpl->tpl_vars['router']->value) {?>class="active"<?php }?>>
                        <a class="bg-white inline-block py-2 px-4 text-blue-500 hover:text-blue-800 font-semibold" href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
plugin/log_ui/<?php echo $_smarty_tpl->tpl_vars['r']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['r']->value['name'];?>
</a>
                    </li>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            </ul>
        </form>

        <div class="flex flex-wrap mb-4">
            <div class="w-full md:w-8/12">
                <label class="block">
                    Show entries
                    <select name="data_length" aria-controls="data" class="form-control form-control-sm" onchange="updatePerPage(this.value)">
                        <option value="5" <?php if ($_smarty_tpl->tpl_vars['per_page']->value == 5) {?>selected<?php }?>>5</option>
                        <option value="10" <?php if ($_smarty_tpl->tpl_vars['per_page']->value == 10) {?>selected<?php }?>>10</option>
                        <option value="25" <?php if ($_smarty_tpl->tpl_vars['per_page']->value == 25) {?>selected<?php }?>>25</option>
                        <option value="50" <?php if ($_smarty_tpl->tpl_vars['per_page']->value == 50) {?>selected<?php }?>>50</option>
                        <option value="100" <?php if ($_smarty_tpl->tpl_vars['per_page']->value == 100) {?>selected<?php }?>>100</option>
                    </select>
                </label>
            </div>
            <div class="w-full md:w-4/12">
                <label class="block">
                    Search:
                    <input type="search" id="logSearch" class="form-control form-control-sm" placeholder="Search logs" aria-controls="data" onkeyup="filterLogs()">
                </label>
            </div>
        </div>

        <table class="min-w-full bg-white table-auto">
            <thead>
                <tr class="bg-gray-200">
                    <th class="w-1/3 py-2 px-4">Time</th>
                    <th class="w-1/3 py-2 px-4">Topic</th>
                    <th class="w-1/3 py-2 px-4">Message</th>
                </tr>
            </thead>
            <tbody id="logTableBody">
                <?php $_smarty_tpl->_assignInScope('current_page', (($tmp = $_GET['page'] ?? null)===null||$tmp==='' ? 1 ?? null : $tmp));?>
                <?php $_smarty_tpl->_assignInScope('per_page', (($tmp = $_GET['per_page'] ?? null)===null||$tmp==='' ? 10 ?? null : $tmp));?>
                <?php $_smarty_tpl->_assignInScope('start_index', ($_smarty_tpl->tpl_vars['current_page']->value-1)*$_smarty_tpl->tpl_vars['per_page']->value);?>
                
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, array_reverse($_smarty_tpl->tpl_vars['logs']->value), 'log', false, NULL, 'logLoop', array (
  'index' => true,
));
$_smarty_tpl->tpl_vars['log']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['log']->value) {
$_smarty_tpl->tpl_vars['log']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_logLoop']->value['index']++;
?>
                    <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_logLoop']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_logLoop']->value['index'] : null) >= $_smarty_tpl->tpl_vars['start_index']->value && (isset($_smarty_tpl->tpl_vars['__smarty_foreach_logLoop']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_logLoop']->value['index'] : null) < ($_smarty_tpl->tpl_vars['start_index']->value+$_smarty_tpl->tpl_vars['per_page']->value)) {?>
                        <tr class="log-entry">
                            <td class="border px-4 py-2"><?php echo $_smarty_tpl->tpl_vars['log']->value['time'];?>
</td>
                            <td class="border px-4 py-2"><?php echo $_smarty_tpl->tpl_vars['log']->value['topics'];?>
</td>
                            <td class="border px-4 py-2 log-message">
                                <?php if (strpos(mb_strtolower((string) $_smarty_tpl->tpl_vars['log']->value['message'], 'UTF-8'),'failed') !== false) {?>
                                    <span class="text-red-700 text-bold"><?php echo $_smarty_tpl->tpl_vars['log']->value['message'];?>
</span>
                                <?php } elseif (strpos(mb_strtolower((string) $_smarty_tpl->tpl_vars['log']->value['message'], 'UTF-8'),'trying') !== false) {?>
                                    <span class="text-yellow-700"><?php echo $_smarty_tpl->tpl_vars['log']->value['message'];?>
</span>
                                <?php } elseif (strpos(mb_strtolower((string) $_smarty_tpl->tpl_vars['log']->value['message'], 'UTF-8'),'logged in') !== false) {?>
                                    <span class="text-green-700"><?php echo $_smarty_tpl->tpl_vars['log']->value['message'];?>
</span>
                                <?php } elseif (strpos(mb_strtolower((string) $_smarty_tpl->tpl_vars['log']->value['message'], 'UTF-8'),'login failed') !== false) {?>
                                    <span class="text-blue-700"><?php echo $_smarty_tpl->tpl_vars['log']->value['message'];?>
</span>
                                <?php } else { ?>
                                    <span class="text-gray-700"><?php echo $_smarty_tpl->tpl_vars['log']->value['message'];?>
</span>
                                <?php }?>
                            </td>
                        </tr>
                    <?php }?>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            </tbody>
        </table>

        <?php $_smarty_tpl->_assignInScope('total_logs', smarty_modifier_count($_smarty_tpl->tpl_vars['logs']->value));?>
        <?php $_smarty_tpl->_assignInScope('last_page', ceil($_smarty_tpl->tpl_vars['total_logs']->value/$_smarty_tpl->tpl_vars['per_page']->value));?>

        <nav class="mt-4">
            <ul class="pagination flex justify-center">
                <?php if ($_smarty_tpl->tpl_vars['current_page']->value > 1) {?>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=1&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="First">&laquo;&laquo;</a>
                    </li>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['current_page']->value-1;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="Previous">&laquo;</a>
                    </li>
                <?php }?>

                <?php $_smarty_tpl->_assignInScope('max_links', 5);?>
                <?php $_smarty_tpl->_assignInScope('start_page', max(1,$_smarty_tpl->tpl_vars['current_page']->value-floor($_smarty_tpl->tpl_vars['max_links']->value/2)));?>
                <?php $_smarty_tpl->_assignInScope('end_page', min($_smarty_tpl->tpl_vars['last_page']->value,$_smarty_tpl->tpl_vars['start_page']->value+$_smarty_tpl->tpl_vars['max_links']->value-1));?>

                <?php if ($_smarty_tpl->tpl_vars['start_page']->value > 1) {?>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['start_page']->value-1;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="Previous">&hellip;</a>
                    </li>
                <?php }?>

                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, range($_smarty_tpl->tpl_vars['start_page']->value,$_smarty_tpl->tpl_vars['end_page']->value), 'page');
$_smarty_tpl->tpl_vars['page']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['page']->value) {
$_smarty_tpl->tpl_vars['page']->do_else = false;
?>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1 <?php if ($_smarty_tpl->tpl_vars['page']->value == $_smarty_tpl->tpl_vars['current_page']->value) {?>bg-blue-500 text-white<?php }?>" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['page']->value;?>
</a>
                    </li>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                <?php if ($_smarty_tpl->tpl_vars['end_page']->value < $_smarty_tpl->tpl_vars['last_page']->value) {?>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['end_page']->value+1;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="Next">&hellip;</a>
                    </li>
                <?php }?>

                <?php if ($_smarty_tpl->tpl_vars['current_page']->value < $_smarty_tpl->tpl_vars['last_page']->value) {?>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['current_page']->value+1;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="Next">&raquo;</a>
                    </li>
                    <li>
                        <a class="page-link border py-2 px-4 mx-1" href="index.php?_route=plugin/log_ui&page=<?php echo $_smarty_tpl->tpl_vars['last_page']->value;?>
&per_page=<?php echo $_smarty_tpl->tpl_vars['per_page']->value;?>
" aria-label="Last">&raquo;&raquo;</a>
                    </li>
                <?php }?>
            </ul>
        </nav>
    </div>

    <?php echo '<script'; ?>
>
        function updatePerPage(value) {
            var urlParams = new URLSearchParams(window.location.search);
            urlParams.set('per_page', value);
            urlParams.set('page', 1); // Reset to first page
            window.location.search = urlParams.toString();
        }

        function filterLogs() {
            var input = document.getElementById('logSearch').value.toLowerCase();
            var table = document.getElementById('logTableBody');
            var tr = table.getElementsByClassName('log-entry');

            for (var i = 0; i < tr.length; i++) {
                var logMessage = tr[i].getElementsByClassName('log-message')[0].textContent || tr[i].getElementsByClassName('log-message')[0].innerText;
                if (logMessage.toLowerCase().indexOf(input) > -1) {
                    tr[i].style.display = '';
                } else {
                    tr[i].style.display = 'none';
                }
            }
        }
    <?php echo '</script'; ?>
>

    <?php $_smarty_tpl->_subTemplateRender("file:sections/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
</body>
</html>
<?php }
}
