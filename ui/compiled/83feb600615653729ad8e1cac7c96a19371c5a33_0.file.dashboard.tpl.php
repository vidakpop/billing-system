<?php
/* Smarty version 4.3.1, created on 2024-06-29 14:13:38
  from '/var/www/html/MAIN/ui/ui/dashboard.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_667fec62916e03_12565922',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '83feb600615653729ad8e1cac7c96a19371c5a33' => 
    array (
      0 => '/var/www/html/MAIN/ui/ui/dashboard.tpl',
      1 => 1719596265,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sections/header.tpl' => 1,
    'file:pagination.tpl' => 1,
    'file:sections/footer.tpl' => 1,
  ),
),false)) {
function content_667fec62916e03_12565922 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:sections/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
    :root {
        --primary-color: #38a169; /* Green color */
        --secondary-color: #2f855a; /* Darker green */
    }

    body {
        font-family: 'Inter', sans-serif;
    }
</style>

 
<div class="row">
    <div class="flex flex-col lg:flex-row mb-6">
        <div class="bg-gradient-to-r from-[var(--primary-color)] to-[var(--secondary-color)] text-white p-6 shadow-md flex flex-col justify-between lg:w-1/3 mb-6 lg:mb-0 mr-0 lg:mr-6">
            <div class="flex items-center">
                <div>
                    <h4 class="text-xl font-medium mb-2">Your Sales today</h4>
                    <h2 class="text-4xl font-bold mb-2"><sup><?php echo $_smarty_tpl->tpl_vars['_c']->value['currency_code'];?>
</sup><?php echo number_format($_smarty_tpl->tpl_vars['iday']->value,0,$_smarty_tpl->tpl_vars['_c']->value['dec_point'],$_smarty_tpl->tpl_vars['_c']->value['thousands_sep']);?>
</h2>
                </div>
            </div>
            <hr class="border-gray-300 my-2">
            <div class="flex justify-between items-center">
                <div class="flex items-center">
                    <div class="text-4xl mr-4">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div>
                        <h4 class="text-2xl font-bold">
                            <sup><?php echo $_smarty_tpl->tpl_vars['_c']->value['currency_code'];?>
</sup><?php echo number_format($_smarty_tpl->tpl_vars['imonth']->value,0,$_smarty_tpl->tpl_vars['_c']->value['dec_point'],$_smarty_tpl->tpl_vars['_c']->value['thousands_sep']);?>

                        </h4>
                        <p>Monthly Sales</p>
                    </div>
                </div>
                <div class="flex items-center">
                    <div class="text-4xl mr-4">
                        <i class="fas fa-comment"></i>
                    </div>
                    <div>
                        <h4 class="text-2xl font-bold"><?php echo $_smarty_tpl->tpl_vars['balance']->value;?>
</h4>
                        <p>SMS Balance</p>
                    </div>
                </div>
            </div>
        </div>
       <div class="lg:w-2/3 grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-3 gap-6">
    <div id="online-users-card" class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold" id="total-online-users"></h4>
                <p><?php echo Lang::T('Online Users');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-users"></i>
            </div>
        </div>
    </div>

    <div id="hotspot-users-card" class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold" id="online-hotspot-users"></h4>
                <p><?php echo Lang::T('Online Hotspot Users');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-wifi"></i>
            </div>
        </div>
    </div>

    <div id="pppoe-users-card" class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold" id="online-pppoe-users"></h4>
                <p><?php echo Lang::T('Online PPPoE Users');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-network-wired"></i>
            </div>
        </div>
    </div>

    <div class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold"><?php echo $_smarty_tpl->tpl_vars['u_act']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['u_all']->value;?>
</h4>
                <p><?php echo Lang::T('Active Accounts');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-user"></i>
            </div>
        </div>
    </div>

    <div class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold"><?php echo $_smarty_tpl->tpl_vars['c_all']->value;?>
</h4>
                <p><?php echo Lang::T('Total Users');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-users"></i>
            </div>
        </div>
    </div>

    <div id="hotspot-users-card" class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold" id="total_data"></h4>
                <p><?php echo Lang::T('Data Usage');?>
</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-signal"></i>
            </div>
        </div>
    </div>
</div>
</div>
<div class="row">
    <div class="col-md-7">

        <!-- solid sales graph -->
        <?php if ($_smarty_tpl->tpl_vars['_c']->value['hide_mrc'] != 'yes') {?>
            <div class="box box-solid ">
                <div class="box-header">
                    <i class="fa fa-th"></i>

                    <h3 class="box-title"><?php echo Lang::T('Monthly Registered Customers');?>
</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
dashboard&refresh" class="btn bg-teal btn-sm"><i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body border-radius-none">
                    <canvas class="chart" id="chart" style="height: 250px;"></canvas>
                </div>
            </div>
        <?php }?>
</div>
  <div class="col-md-5">

        <!-- solid sales graph -->
        <?php if ($_smarty_tpl->tpl_vars['_c']->value['hide_tms'] != 'yes') {?>
            <div class="box box-solid ">
                <div class="box-header">
                    <i class="fa fa-inbox"></i>

                    <h3 class="box-title"><?php echo Lang::T('Total Monthly Sales');?>
</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
dashboard&refresh" class="btn bg-teal btn-sm"><i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body border-radius-none">
                    <canvas class="chart" id="salesChart" style="height: 250px;"></canvas>
                </div>
            </div>
        <?php }?>
</div>
<div>
                <?php if ($_smarty_tpl->tpl_vars['_c']->value['hide_uet'] != 'yes') {?>
            <div class="panel panel-warning mb20 panel-hovered project-stats table-responsive">
                <div class="panel-heading"><?php echo Lang::T('User Expired, Today');?>
</div>
                <div class="table-responsive">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th><?php echo Lang::T('Username');?>
</th>
                                <th><?php echo Lang::T('Created / Expired');?>
</th>
                                <th><?php echo Lang::T('Internet Plan');?>
</th>
                                <th><?php echo Lang::T('Location');?>
</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['expire']->value, 'expired');
$_smarty_tpl->tpl_vars['expired']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['expired']->value) {
$_smarty_tpl->tpl_vars['expired']->do_else = false;
?>
                                <?php $_smarty_tpl->_assignInScope('rem_exp', ((string)$_smarty_tpl->tpl_vars['expired']->value['expiration'])." ".((string)$_smarty_tpl->tpl_vars['expired']->value['time']));?>
                                <?php $_smarty_tpl->_assignInScope('rem_started', ((string)$_smarty_tpl->tpl_vars['expired']->value['recharged_on'])." ".((string)$_smarty_tpl->tpl_vars['expired']->value['recharged_time']));?>
                                <tr>
                                    <td><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
customers/viewu/<?php echo $_smarty_tpl->tpl_vars['expired']->value['username'];?>
"><?php echo $_smarty_tpl->tpl_vars['expired']->value['username'];?>
</a></td>
                                    <td><small data-toggle="tooltip" data-placement="top"
                                    title="<?php echo Lang::dateAndTimeFormat($_smarty_tpl->tpl_vars['expired']->value['recharged_on'],$_smarty_tpl->tpl_vars['expired']->value['recharged_time']);?>
"><?php echo Lang::timeElapsed($_smarty_tpl->tpl_vars['rem_started']->value);?>
</small> /
                                        <span data-toggle="tooltip" data-placement="top"
                                            title="<?php echo Lang::dateAndTimeFormat($_smarty_tpl->tpl_vars['expired']->value['expiration'],$_smarty_tpl->tpl_vars['expired']->value['time']);?>
"><?php echo Lang::timeElapsed($_smarty_tpl->tpl_vars['rem_exp']->value);?>
</span>
                                    </td>
                                    <td><?php echo $_smarty_tpl->tpl_vars['expired']->value['namebp'];?>
</td>
                                    <td><?php echo $_smarty_tpl->tpl_vars['expired']->value['routers'];?>
</td>
                                </tr>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </tbody>
                    </table>
                </div>
                &nbsp; <?php $_smarty_tpl->_subTemplateRender("file:pagination.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            </div>
        <?php }?>
    
</div>



</div>


<?php echo '<script'; ?>
 src="https://cdn.jsdelivr.net/npm/chart.js"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
 type="text/javascript">
    <?php if ($_smarty_tpl->tpl_vars['_c']->value['hide_mrc'] != 'yes') {?>
        
            document.addEventListener("DOMContentLoaded", function() {
                var counts = JSON.parse('<?php echo json_encode($_smarty_tpl->tpl_vars['monthlyRegistered']->value);?>
');

                var monthNames = [
                    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                ];

                var labels = [];
                var data = [];

                for (var i = 1; i <= 12; i++) {
                    var month = counts.find(count => count.date === i);
                    labels.push(month ? monthNames[i - 1] : monthNames[i - 1].substring(0, 3));
                    data.push(month ? month.count : 0);
                }

                var ctx = document.getElementById('chart').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Registered Members',
                            data: data,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(201, 203, 207, 0.2)'
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)',
                                'rgb(201, 203, 207)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            x: {
                                grid: {
                                    display: false
                                }
                            },
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                }
                            }
                        }
                    }
                });
            });
        
    <?php }?>
    <?php if ($_smarty_tpl->tpl_vars['_c']->value['hide_tms'] != 'yes') {?>
        
            document.addEventListener("DOMContentLoaded", function() {
                var monthlySales = JSON.parse('<?php echo json_encode($_smarty_tpl->tpl_vars['monthlySales']->value);?>
');

                var monthNames = [
                    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                ];

                var labels = [];
                var data = [];

                for (var i = 1; i <= 12; i++) {
                    var month = findMonthData(monthlySales, i);
                    labels.push(month ? monthNames[i - 1] : monthNames[i - 1].substring(0, 3));
                    data.push(month ? month.totalSales : 0);
                }

                var ctx = document.getElementById('salesChart').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Monthly Sales',
                            data: data,
                            fill: true,
                            backgroundColor: 'rgba(56, 161, 105, 0.2)', // Use the primary color with transparency
                            borderColor: 'rgba(56, 161, 105, 1)', // Use the primary color
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            x: {
                                grid: {
                                    display: true
                                }
                            },
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.1)'
                                }
                            }
                        }
                    }
                });
            });

            function findMonthData(monthlySales, month) {
                for (var i = 0; i < monthlySales.length; i++) {
                    if (monthlySales[i].month === month) {
                        return monthlySales[i];
                    }
                }
                return null;
            }
        
    <?php }
echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="https://code.jquery.com/jquery-3.6.0.min.js"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>
$(document).ready(function() {
    $.ajax({
        url: "<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
onlineusers/summary", // Adjust this URL to your actual endpoint
        type: 'GET',
        dataType: 'json', // Ensure the expected response is JSON
        success: function(data) {
            console.log('Data fetched successfully:', data);
            $('#total-online-users').text(data.total_users);
            $('#online-hotspot-users').text(data.hotspot_users);
            $('#online-pppoe-users').text(data.ppp_users);
				$('#total_data').text(data.total_bytes);
        },
        error: function(error) {
            console.log('Error fetching data:', error);
        }
    });
});
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:sections/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
