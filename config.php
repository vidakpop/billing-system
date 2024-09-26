<?php

define('APP_URL', 'https://isp.netguru.co.ke');
$_app_stage = 'Live';

// Database PHPNuxBill
$db_host	    = 'localhost';
$db_user        = 'root';
$db_password	= 'password';
$db_name	    = 'isp';

// Database Radius
$radius_host	    = 'localhost';
$radius_user        = 'root';
$radius_pass    	= 'password';
$radius_name	    = 'rainlink';

if($_app_stage!='Live'){
    error_reporting(E_ERROR);
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
}else{
    error_reporting(E_ERROR);
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
}
