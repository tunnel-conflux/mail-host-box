<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : mailhostbox.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[D/M/Y]  : 2016/11/22 6:59 PM
 */

include_once __DIR__ . "/hook.php";

use WHMCS\Database\Capsule as DB;
use TunnelConflux\MailHostBox\Core\LogicBoxes;

function mailhostbox_config()
{
    $data    = [];
    $options = [
        [
            "FriendlyName" => "<b>Available Registrars</b>",
            "Description"  => "<b>Check to enable</b>",
        ],
    ];

    try {
        foreach (DB::table("tblregistrars")->get() as $item) {
            $data[$item->registrar][$item->setting] = $item->value;
            $options[$item->registrar]              = [
                "Type"        => "yesno",
                "Description" => "<b>" . ucfirst($item->registrar) . "</b>",
            ];
        }
    } catch (Exception $e) {
        //Some action
    }

    return [
        'name'        => 'MailHostBox',
        'version'     => '0.1',
        'author'      => 'Tunnel Conflux',
        'description' => 'Module to manage free email for LogicBoxes registrar (ResellerClub, Resell.biz, Rezistro, NetEarthOne, ResellerCamp, ResellerID)',
        'language'    => 'english',
        "fields"      => $options,
    ];
}

function mailhostbox_activate()
{
}

function mailhostbox_deactivate()
{
}

function mailhostbox_output($vars)
{
    $i = 1;
    echo "<h4>Active Registrars</h4><hr/>";

    foreach ($vars as $key => $val) {
        if ($val == "on") {
            echo "<b>{$i}. " . ucfirst($key) . "</b><br/>";
            $i++;
        }
    }

    echo "<br/><a href='configaddonmods.php?#mailhostbox'>Update config</a>";

    echo "<br/><hr/><pre>";
    /**
     * Don't Remove License issue
     */
    print_r([
        "Project"   => "LogicBoxes Free Mail",
        "File Name" => "mailhostbox.php",
        "Author"    => "Abu Bakar Siddique",
        "Email"     => "absiddique.live@gmail.com",
        "Company"   => "Tunnel Conflux",
        "Website"   => "www.tunnelconflux.com",
    ]);
    echo "</pre>";
}

function mailhostbox_sidebar()
{
}

function mailhostbox_clientarea()
{
    $domainId = getUrlId();

    if (!$_SESSION['uid'] || !$domainId) {
        redirectInLogin();
    }

    $orderId    = 0;
    $emails     = null;
    $domainInfo = getDomainLocalData();
    $domainName = $domainInfo->domainname;
    $registrar  = getRegistrar($domainInfo->registrar);

    if (!moduleActive($domainInfo->registrar) || empty($registrar)) {
        redirectTo("clientarea.php", ["action" => "domains"]);
    }

    if (empty($domainInfo) || $domainInfo->emailforwarding != 1) {
        redirectInLogin();
    }

    if (getUrlValue("m") == 'mailhostbox') {
        $tunnel  = new LogicBoxes($registrar["ResellerID"], $registrar["APIKey"], ($registrar["TestMode"] == "on") ?: false);
        $orderId = $tunnel->apiRequest('domains/orderid.json', 'GET', ['domain-name' => $domainName]);

        if (getUrlValue("email")) {
            $emails = $tunnel->apiRequest('mail/user.json', 'GET', [
                'order-id' => $orderId,
                'email'    => $_GET['email'],
            ]);
        } else {
            $emails = getEmails($tunnel, $orderId);

            if ($emails->message == "You need to activate your FREE Email Services before you can perform this action") {
                $tunnel->apiRequest('mail/activate.json', 'POST', ['order-id' => $orderId]);
                $emails = getEmails($tunnel, $orderId);
            }
        }
    }

    if ($_POST) {
        $emails         = (object)[];
        $tempEmail      = "";
        $postAction     = getUrlValue("action");
        $redirectParams = [
            'm'        => 'mailhostbox',
            "action"   => 'accounts',
            'domainid' => $domainId,
        ];

        if ($postAction == "new-email") {
            $tempEmail = strtolower($_POST['email-username'] . "@$domainName");
            $emails    = $tunnel->apiRequest('mail/user/add.json', 'POST', [
                'order-id'           => trim($orderId),
                'email'              => trim($tempEmail),
                'passwd'             => trim($_POST['password']),
                'first-name'         => trim($_POST['first-name']),
                'last-name'          => trim($_POST['last-name']),
                'country-code'       => trim($_POST['country']),
                'language-code'      => trim($_POST['language']),
                'notification-email' => trim($_POST['alternative-email']),
            ]);
        } elseif ($postAction == "forwarder") {
            $tempEmail = strtolower($_POST['email-username'] . "@$domainName");
            $emails    = $tunnel->apiRequest('mail/user/add-forward-only-account.json', 'POST', [
                'order-id' => trim($orderId),
                'email'    => trim($tempEmail),
                'forwards' => trim(str_replace(["[", "]", "(", ")", " "], "", trim($_POST['forward-to'])), ','),
            ]);
        } elseif ($postAction == "delete-account") {
            $tempEmail = strtolower($_POST['email-username'] . "@$domainName");
            $emails    = $tunnel->apiRequest('mail/user/delete.json', 'POST', [
                'order-id' => trim($orderId),
                'email'    => trim($_REQUEST['email']),
            ]);
        }

        if ($emails->response->status == "SUCCESS" && $postAction != "delete-account") {
            $redirectParams['email'] = $tempEmail;
        }

        redirectTo("index.php", $redirectParams);
    }

    return [
        'pagetitle'    => "Managing Email Accounts",
        'breadcrumb'   => [
            "clientarea.php"                                     => "Client Area",
            "clientarea.php?action=domains"                      => "My Domains",
            "clientarea.php?action=domaindetails&id={$domainId}" => $domainName,
            'index.php?m=mailhostbox'                            => 'Email Accounts',
        ],
        'templatefile' => 'mailhostbox',
        'requirelogin' => true, # accepts true/false
        'forcessl'     => false, # accepts true/false
        'vars'         => [
            'emails' => $emails,
            'domain' => $domainName,
        ],
    ];

}

function mailhostbox_mailbox($params)
{
    header("Location: index.php?m=mailhostbox");
}

/**
 * @param LogicBoxes $tunnel
 * @param int         $orderId
 *
 * @return string
 */
function getEmails(LogicBoxes $tunnel, $orderId)
{
    return $tunnel->apiRequest('mail/users/search.json', 'GET', ['order-id' => $orderId]);
}