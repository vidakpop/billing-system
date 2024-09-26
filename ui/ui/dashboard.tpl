{include file="sections/header.tpl"}
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
                    <h2 class="text-4xl font-bold mb-2"><sup>{$_c['currency_code']}</sup>{number_format($iday, 0, $_c['dec_point'], $_c['thousands_sep'])}</h2>
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
                            <sup>{$_c['currency_code']}</sup>{number_format($imonth, 0, $_c['dec_point'], $_c['thousands_sep'])}
                        </h4>
                        <p>Monthly Sales</p>
                    </div>
                </div>
                <div class="flex items-center">
                    <div class="text-4xl mr-4">
                        <i class="fas fa-comment"></i>
                    </div>
                    <div>
                        <h4 class="text-2xl font-bold">{$balance}</h4>
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
                <p>{Lang::T('Online Users')}</p>
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
                <p>{Lang::T('Online Hotspot Users')}</p>
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
                <p>{Lang::T('Online PPPoE Users')}</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-network-wired"></i>
            </div>
        </div>
    </div>

    <div class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold">{$u_act}/{$u_all}</h4>
                <p>{Lang::T('Active Accounts')}</p>
            </div>
            <div class="text-4xl text-[var(--primary-color)]">
                <i class="fas fa-user"></i>
            </div>
        </div>
    </div>

    <div class="bg-white text-gray-700 p-6 shadow-md flex flex-col rounded-1g">
        <div class="flex items-center border-b-4 border-[var(--primary-color)] pb-2 mb-4">
            <div class="flex-grow">
                <h4 class="text-2xl font-bold">{$c_all}</h4>
                <p>{Lang::T('Total Users')}</p>
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
                <p>{Lang::T('Data Usage')}</p>
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
        {if $_c['hide_mrc'] != 'yes'}
            <div class="box box-solid ">
                <div class="box-header">
                    <i class="fa fa-th"></i>

                    <h3 class="box-title">{Lang::T('Monthly Registered Customers')}</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <a href="{$_url}dashboard&refresh" class="btn bg-teal btn-sm"><i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body border-radius-none">
                    <canvas class="chart" id="chart" style="height: 250px;"></canvas>
                </div>
            </div>
        {/if}
</div>
  <div class="col-md-5">

        <!-- solid sales graph -->
        {if $_c['hide_tms'] != 'yes'}
            <div class="box box-solid ">
                <div class="box-header">
                    <i class="fa fa-inbox"></i>

                    <h3 class="box-title">{Lang::T('Total Monthly Sales')}</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <a href="{$_url}dashboard&refresh" class="btn bg-teal btn-sm"><i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body border-radius-none">
                    <canvas class="chart" id="salesChart" style="height: 250px;"></canvas>
                </div>
            </div>
        {/if}
</div>
<div>
                {if $_c['hide_uet'] != 'yes'}
            <div class="panel panel-warning mb20 panel-hovered project-stats table-responsive">
                <div class="panel-heading">{Lang::T('User Expired, Today')}</div>
                <div class="table-responsive">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>{Lang::T('Username')}</th>
                                <th>{Lang::T('Created / Expired')}</th>
                                <th>{Lang::T('Internet Plan')}</th>
                                <th>{Lang::T('Location')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $expire as $expired}
                                {assign var="rem_exp" value="{$expired['expiration']} {$expired['time']}"}
                                {assign var="rem_started" value="{$expired['recharged_on']} {$expired['recharged_time']}"}
                                <tr>
                                    <td><a href="{$_url}customers/viewu/{$expired['username']}">{$expired['username']}</a></td>
                                    <td><small data-toggle="tooltip" data-placement="top"
                                    title="{Lang::dateAndTimeFormat($expired['recharged_on'],$expired['recharged_time'])}">{Lang::timeElapsed($rem_started)}</small> /
                                        <span data-toggle="tooltip" data-placement="top"
                                            title="{Lang::dateAndTimeFormat($expired['expiration'],$expired['time'])}">{Lang::timeElapsed($rem_exp)}</span>
                                    </td>
                                    <td>{$expired['namebp']}</td>
                                    <td>{$expired['routers']}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                &nbsp; {include file="pagination.tpl"}
            </div>
        {/if}
    
</div>



</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
    {if $_c['hide_mrc'] != 'yes'}
        {literal}
            document.addEventListener("DOMContentLoaded", function() {
                var counts = JSON.parse('{/literal}{$monthlyRegistered|json_encode}{literal}');

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
        {/literal}
    {/if}
    {if $_c['hide_tms'] != 'yes'}
        {literal}
            document.addEventListener("DOMContentLoaded", function() {
                var monthlySales = JSON.parse('{/literal}{$monthlySales|json_encode}{literal}');

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
        {/literal}
    {/if}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
    $.ajax({
        url: "{$_url}onlineusers/summary", // Adjust this URL to your actual endpoint
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
</script>

{include file="sections/footer.tpl"}
