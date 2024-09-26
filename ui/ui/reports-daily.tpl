{include file="sections/header.tpl"}
<!-- reports-daily -->

<div class="row">
    <div class=" panel col-md-12">
        <div class="invoice-wrap">
            <div class="clearfix invoice-head">
                <h3 class="brand-logo text-uppercase text-bold left mt15">
                    <span class="text">{Lang::T('Daily Reports')}</span>
                </h3>
            </div>
            <div class="clearfix invoice-subhead mb20">
                <div class="group clearfix left">
                    <p class="text-bold mb5">{Lang::T('All Transactions at Date')}:</p>
                    <p class="small">{date($_c['date_format'], strtotime($mdate))} {$mtime}</p>
                </div>
                <div class="group clearfix right">
                    <a href="{$_url}export/print-by-date" class="btn btn-default" target="_blank"><i
                            class="ion ion-printer"></i>{Lang::T('Export for Print')}</a>
                    <a href="{$_url}export/pdf-by-date" class="btn btn-default"><i
                            class="fa fa-file-pdf-o"></i>{Lang::T('Export to PDF')}</a>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th>{Lang::T('Username')}</th>
                            <th>{Lang::T('Type')}</th>
                            <th>{Lang::T('Plan Name')}</th>
                            <th>{Lang::T('Plan Price')}</th>
                            <th>{Lang::T('Created On')}</th>
                            <th>{Lang::T('Expires On')}</th>
                            <th>{Lang::T('Method')}</th>
                            <th>{Lang::T('Routers')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $d as $ds}
                            <tr>
                                <td>{$ds['username']}</td>
                                <td>{$ds['type']}</td>
                                <td>{$ds['plan_name']}</td>
                                <td class="text-right">{Lang::moneyFormat($ds['price'])}</td>
                                <td>{Lang::dateAndTimeFormat($ds['recharged_on'],$ds['recharged_time'])}</td>
                                <td>{Lang::dateAndTimeFormat($ds['expiration'],$ds['time'])}</td>
                                <td>{$ds['method']}</td>
                                <td>{$ds['routers']}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
            {include file="pagination.tpl"}

            <div class="clearfix text-right total-sum mb10">
                <h4 class="text-uppercase text-bold">{Lang::T('Total Income')}:</h4>
                <h3 class="sum">{Lang::moneyFormat($dr)}</h3>
            </div>
            <p class="text-center small text-info">{Lang::T('All Transactions at Date')}:
                {date($_c['date_format'], strtotime($mdate))} {$mtime}</p>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}