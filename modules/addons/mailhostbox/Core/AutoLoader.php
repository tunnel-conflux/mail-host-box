<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : AutoLoader.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[Y/M/D]  : 2019/07/11 03:04
 */

namespace TunnelConflux\MailHostBox\Core;

defined('DS') or define('DS', DIRECTORY_SEPARATOR);

include_once __DIR__ . "/helper.php";

class AutoLoader
{
    static $TC_DIR = __DIR__ . DS;

    static function register(AutoLoader $loader = null)
    {
        spl_autoload_register([$loader ?: (new static()), 'autoload']);
    }

    static function autoload($className)
    {
        if (strpos($className, __NAMESPACE__) === false) {
            return null;
        }

        $className = substr($className, strlen(__NAMESPACE__));
        $className = ltrim($className, '\\');
        $fileName  = '';
        $namespace = '';

        if ($lastNsPos = strrpos($className, '\\')) {
            $namespace = substr($className, 0, $lastNsPos);
            $className = str_replace('_', DS, substr($className, $lastNsPos + 1));
            $fileName  = str_replace('\\', DS, $namespace) . DS;
        }

        $fileNameNormal = self::$TC_DIR . $fileName . $className . '.php';

        if (class_exists($className, false)) {
            return null;
        }

        $fileNameLower = self::$TC_DIR . $fileName . strtolower($className) . '.php';

        if (file_exists($fileNameNormal) && is_readable($fileNameNormal)) {
            include_once $fileNameNormal;

            return true;
        }

        if (file_exists($fileNameLower) && is_readable($fileNameLower)) {
            include_once $fileNameLower;

            return true;
        }

        return false;
    }
}

AutoLoader::register();