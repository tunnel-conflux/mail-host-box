<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : autoload.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[Y/M/D]  : 2019/07/12 00:54
 */

namespace TunnelConflux\MailHostBox;

use TunnelConflux\MailHostBox\Core\AutoLoader;

if (!class_exists("TunnelConflux\\MailHostBox\\Core\\AutoLoader")) {
    include_once __DIR__ . "/Core/AutoLoader.php";
} else {
    AutoLoader::register();
}