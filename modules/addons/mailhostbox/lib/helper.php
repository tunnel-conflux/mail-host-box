<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : helper.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[Y/M/D]  : 2019/06/26 01:44
 */

use WHMCS\Database\Capsule as DB;

function redirectInLogin()
{
    redirectTo("clientarea.php", [
        'action' => 'domaindetails',
        'id'     => getUrlId(),
    ]);
}

function redirectTo($file, $data = [])
{
    redir($data, $file);
}

function getUrlValue($key)
{
    return $_GET[$key] ?? null;
}

function getUrlId()
{
    return getUrlValue("id") ?: getUrlValue("domainid");
}

function getData($url)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_VERBOSE, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    return curl_exec($ch);
}

function getDomainInfoFromResponse($data)
{
    return (object)$data["domains"]["domain"][0] ?? null;
}

function getDomainLocalData()
{
    return getDomainInfoFromResponse(localAPI("getclientsdomains", [
        "clientid"     => $_SESSION["uid"],
        "domainid"     => getUrlId(),
        "responsetype" => "json",
    ]));
}

function moduleActive($registrar)
{
    return DB::table("tbladdonmodules")
        ->where("module", MY_ADDON_NAME)
        ->where("setting", $registrar)
        ->where("value", "on")
        ->count() ? true : false;
}

function getRegistrar($registrar)
{
    $data = [];

    foreach (DB::table("tblregistrars")->where("registrar", $registrar)->get() as $item) {
        $data[$item->setting] = decryptText($item->value);
    }

    return $data;
}

function decryptText($text): string
{
    $data = localAPI('DecryptPassword', [
        'password2' => $text,
    ]);

    return $data["password"] ?? null;
}

function encryptText($text): string
{
    $data = localAPI('EncryptPassword', [
        'password2' => $text,
    ]);

    return $data["password"] ?? null;
}