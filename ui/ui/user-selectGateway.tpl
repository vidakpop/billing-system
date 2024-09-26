{include file="sections/user-header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-info panel-hovered">
            <div class="panel-heading">{Lang::T('Available Payment Gateway')}</div>
            <div class="panel-footer">
                <form method="post" action="{$_url}order/buy/{$route2}/{$route3}">
                    <div class="form-group row">
                        <label class="col-md-2 control-label">Payment Gateway</label>
                        <div class="col-md-8">
                            <select name="gateway" id="gateway" class="form-control">
                                {foreach $pgs as $pg}
                                <option value="{$pg}">
                                    {ucwords($pg)}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
            </div>
            <div class="panel-body">
                <center><b>{Lang::T('Package Details')}</b></center>
                <ul class="list-group list-group-unbordered">
                    <li class="list-group-item">
                        <b>{Lang::T('Plan Name')}</b> <span class="pull-right">{$plan['name_plan']}</span>
                    </li>
                    {if $plan['is_radius'] or $plan['routers']}
                    <li class="list-group-item">
                        <b>{Lang::T('Location')}</b> <span class="pull-right">{if
                            $plan['is_radius']}Radius{else}{$plan['routers']}{/if}</span>
                    </li>
                    {/if}
                    <li class="list-group-item">
                        <b>{Lang::T('Type')}</b> <span class="pull-right">{if $plan['prepaid'] eq
                            'yes'}Prepaid{else}Postpaid{/if}
                            {$plan['type']}</span>
                    </li>
                    <li class="list-group-item">
                        <b>{Lang::T('Plan Price')}</b> <span class="pull-right">{if $using eq
                            'zero'}{Lang::moneyFormat(0)}{else}{Lang::moneyFormat($plan['price'])}{/if}</span>
                    </li>
                    {if $plan['validity']}
                    <li class="list-group-item">
                        <b>{Lang::T('Plan Validity')}</b> <span class="pull-right">{$plan['validity']}
                            {$plan['validity_unit']}</span>
                    </li>
                    {/if}
                </ul>
                <center><b>{Lang::T('Summary')}</b></center>
                <ul class="list-group list-group-unbordered">
                    {if $tax}
                    <li class="list-group-item">
                        <b>{Lang::T('Tax')}</b> <span
                            class="pull-right">{Lang::moneyFormat($tax)}</span>
                    </li>
                    <li class="list-group-item">
                        <b>{Lang::T('Total')}</b> <small>({Lang::T('Plan Price')} + {Lang::T('Tax')})</small><span class="pull-right"
                            style="font-size: large; font-weight:bolder; font-family: 'Courier New', Courier, monospace; ">{Lang::moneyFormat($plan['price']+$tax)}</span>
                    </li>
                    {else}
                    <li class="list-group-item">
                        <b>{Lang::T('Total')}</b> <span class="pull-right"
                            style="font-size: large; font-weight:bolder; font-family: 'Courier New', Courier, monospace; ">
                          {Lang::moneyFormat($plan['price'])}</span>
                    </li>
                    {/if}
                </ul>
                <center>
                    <button type="submit" class="btn btn-primary">{Lang::T('Pay Now')}</button><br>
                    <a class="btn btn-link" href="{$_url}home">{Lang::T('Cancel')}</a>
                </center>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="sections/user-footer.tpl"}