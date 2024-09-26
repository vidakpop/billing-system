<?php

/**
 *  PHP Mikrotik Billing (https://github.com/hotspotbilling/phpnuxbill/)
 *  by https://t.me/ibnux
 **/

_admin();
$ui->assign('_title', Lang::T('Network'));
$ui->assign('_system_menu', 'network');

$action = $routes['1'];
$ui->assign('_admin', $admin);

if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin'])) {
    _alert(Lang::T('You do not have permission to access this page'),'danger', "dashboard");
}


switch ($action) {
    case 'list':
        $ui->assign('xfooter', '<script type="text/javascript" src="ui/lib/c/pool.js"></script>');

        $name = _post('name');
        if ($name != '') {
            $query = ORM::for_table('tbl_pool')->where_like('pool_name', '%' . $name . '%')->order_by_desc('id');
            $d = Paginator::findMany($query, ['name' => $name]);
        } else {
            $query = ORM::for_table('tbl_pool')->order_by_desc('id');
            $d = Paginator::findMany($query);
        }

        $ui->assign('d', $d);
        run_hook('view_pool'); #HOOK
        $ui->display('pool.tpl');
        break;

    case 'add':
        $r = ORM::for_table('tbl_routers')->find_many();
        $ui->assign('r', $r);
        run_hook('view_add_pool'); #HOOK
        $ui->display('pool-add.tpl');
        break;

    case 'edit':
        $id  = $routes['2'];
        $d = ORM::for_table('tbl_pool')->find_one($id);
        if ($d) {
            $ui->assign('d', $d);
            run_hook('view_edit_pool'); #HOOK
            $ui->display('pool-edit.tpl');
        } else {
            r2(U . 'pool/list', 'e', Lang::T('Account Not Found'));
        }
        break;

    case 'delete':
        $id  = $routes['2'];
        run_hook('delete_pool'); #HOOK
        $d = ORM::for_table('tbl_pool')->find_one($id);
        if ($d) {
            if ($d['routers'] != 'radius') {
                try {
                    $mikrotik = Mikrotik::info($d['routers']);
                    $client = Mikrotik::getClient($mikrotik['ip_address'], $mikrotik['username'], $mikrotik['password']);
                    Mikrotik::removePool($client, $d['pool_name']);
                } catch (Exception $e) {
                    //ignore exception, it means router has already deleted
                } catch(Throwable $e){
                    //ignore exception, it means router has already deleted
                }
            }
            $d->delete();

            r2(U . 'pool/list', 's', Lang::T('Data Deleted Successfully'));
        }
        break;

    case 'sync':
        $pools = ORM::for_table('tbl_pool')->find_many();
        $log = '';
        foreach ($pools as $pool) {
            if ($pool['routers'] != 'radius') {
                $mikrotik = Mikrotik::info($pool['routers']);
                $client = Mikrotik::getClient($mikrotik['ip_address'], $mikrotik['username'], $mikrotik['password']);
                Mikrotik::addPool($client, $pool['pool_name'], $pool['range_ip']);
                $log .= 'DONE: ' . $pool['pool_name'] . ': ' . $pool['range_ip'] . '<br>';
            }
        }
        r2(U . 'pool/list', 's', $log);
        break;
    case 'add-post':
        $name = _post('name');
        $ip_address = _post('ip_address');
        $routers = _post('routers');
        run_hook('add_pool'); #HOOK
        $msg = '';
        if (Validator::Length($name, 30, 2) == false) {
            $msg .= 'Name should be between 3 to 30 characters' . '<br>';
        }
        if ($ip_address == '' or $routers == '') {
            $msg .= Lang::T('All field is required') . '<br>';
        }

        $d = ORM::for_table('tbl_pool')->where('pool_name', $name)->find_one();
        if ($d) {
            $msg .= Lang::T('Pool Name Already Exist') . '<br>';
        }
        if ($msg == '') {
            if ($routers != 'radius') {
                $mikrotik = Mikrotik::info($routers);
                $client = Mikrotik::getClient($mikrotik['ip_address'], $mikrotik['username'], $mikrotik['password']);
                Mikrotik::addPool($client, $name, $ip_address);
            }

            $b = ORM::for_table('tbl_pool')->create();
            $b->pool_name = $name;
            $b->range_ip = $ip_address;
            $b->routers = $routers;
            $b->save();

            r2(U . 'pool/list', 's', Lang::T('Data Created Successfully'));
        } else {
            r2(U . 'pool/add', 'e', $msg);
        }
        break;


    case 'edit-post':
        $ip_address = _post('ip_address');
        $routers = _post('routers');
        run_hook('edit_pool'); #HOOK
        $msg = '';

        if ($ip_address == '' or $routers == '') {
            $msg .= Lang::T('All field is required') . '<br>';
        }

        $id = _post('id');
        $d = ORM::for_table('tbl_pool')->find_one($id);
        if ($d) {
        } else {
            $msg .= Lang::T('Data Not Found') . '<br>';
        }

        if ($msg == '') {
            if ($routers != 'radius') {
                $mikrotik = Mikrotik::info($routers);
                $client = Mikrotik::getClient($mikrotik['ip_address'], $mikrotik['username'], $mikrotik['password']);
                Mikrotik::setPool($client, $d['pool_name'], $ip_address);
            }

            $d->range_ip = $ip_address;
            $d->routers = $routers;
            $d->save();

            r2(U . 'pool/list', 's', Lang::T('Data Updated Successfully'));
        } else {
            r2(U . 'pool/edit/' . $id, 'e', $msg);
        }
        break;

    default:
        r2(U . 'pool/list/', 's', '');
}
