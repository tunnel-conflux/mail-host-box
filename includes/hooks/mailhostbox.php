<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : mailhostbox.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[D/M/Y]  : 2016/11/22 6:46 PM
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

define("MY_ADDON_NAME", "mailhostbox");

$action = strtolower($_GET['action']);
$pages  = ['domaindetails', 'domaincontacts', 'domainregisterns', 'domaindns', 'domaingetepp'];

if ($_SESSION['uid'] && in_array($action, $pages)) {
    include_once __DIR__ . "/../../modules/addons/mailhostbox/hook.php";
}