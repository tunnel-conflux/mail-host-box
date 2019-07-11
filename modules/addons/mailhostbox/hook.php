<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : hook.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[D/M/Y]  : 2016/11/22 6:49 PM
 */

include_once __DIR__ . "/autoload.php";

/**
 * @param \WHMCS\View\Menu\Item $primarySidebar
 */
add_hook('ClientAreaPrimarySidebar', 1, function ($primarySidebar) {
    if (moduleActive(getDomainLocalData()->registrar)) {
        $domainId = getUrlId();
        $newMenu  = $primarySidebar->addChild("Domain Details Management")
            ->setLabel(Lang::trans("manage"))
            ->setIcon("fa-cog");

        $newMenu->addChild("Overview")
            ->setLabel(Lang::trans("overview"))
            ->setUri("clientarea.php?action=domaindetails&id={$domainId}#tabOverview")
            ->setOrder(10);

        $newMenu->addChild("Auto Renew Settings")
            ->setLabel(Lang::trans("domainsautorenew"))
            ->setUri("clientarea.php?action=domaindetails&id={$domainId}#tabAutorenew")
            ->setOrder(20);

        $newMenu->addChild("Modify Nameservers")
            ->setLabel(Lang::trans("domainnameservers"))
            ->setUri("clientarea.php?action=domaindetails&id={$domainId}#tabNameservers")
            ->setOrder(30);

        $newMenu->addChild("Registrar Lock Status")
            ->setLabel(Lang::trans("domainregistrarlock"))
            ->setUri("clientarea.php?action=domaindetails&id={$domainId}#tabReglock")
            ->setOrder(40);

        $newMenu->addChild("Domain Contacts")
            ->setLabel(Lang::trans("domaincontactinfo"))
            ->setUri("clientarea.php?action=domaincontacts&domainid={$domainId}")
            ->setOrder(50);

        $newMenu->addChild("Manage Private Nameservers")
            ->setLabel(Lang::trans("domainprivatenameservers"))
            ->setUri("clientarea.php?action=domainregisterns&domainid={$domainId}")
            ->setOrder(60);

        $currentDomainData = localAPI("getclientsdomains", [
            "clientid"     => $_SESSION["uid"],
            "domainid"     => $domainId,
            "responsetype" => "json",
        ]);
        $currentDomainData = getDomainInfoFromResponse($currentDomainData);

        if ($currentDomainData->dnsmanagement === 1) {
            $newMenu->addChild("Manage DNS Host Records")
                ->setLabel(Lang::trans("domaindnsmanagement"))
                ->setUri("clientarea.php?action=domaindns&domainid={$domainId}")
                ->setOrder(70);
        }

        $newMenu->addChild("Get EPP Code")
            ->setLabel(Lang::trans("domaingeteppcode"))
            ->setUri("clientarea.php?action=domaingetepp&domainid={$domainId}")
            ->setOrder(100);
    }
});

/**
 * @param \WHMCS\View\Menu\Item $secondarySidebar
 */
add_hook("ClientAreaSecondarySidebar", 1, function ($secondarySidebar) {
    if (moduleActive(getDomainLocalData()->registrar)) {
        $domainId   = getUrlId();
        $secondMenu = $secondarySidebar->addChild("All Email Details Management")
            ->setLabel(Lang::trans("email"))
            ->setIcon("fa-envelope");

        $secondMenu->addChild("Manage Email Accounts")
            ->setLabel("Accounts")
            ->setUri("index.php?m=mailhostbox&action=accounts&domainid={$domainId}")
            ->setOrder(80);

        $secondMenu->addChild("New Email Account")
            ->setLabel("New Email")
            ->setUri("index.php?m=mailhostbox&action=new-email&domainid={$domainId}")
            ->setOrder(90);

        $secondMenu->addChild("New Email Forwarder")
            ->setLabel("New Forwarder")
            ->setUri("index.php?m=mailhostbox&action=forwarder&domainid={$domainId}")
            ->setOrder(100);

        if (getUrlValue("action") == "accounts") {
            $secondMenu->getChild("Manage Email Accounts")->setClass("active");
        } elseif (getUrlValue("action") == "new-email") {
            $secondMenu->getChild("New Email Account")->setClass("active");
        } elseif (getUrlValue("action") == "forwarder") {
            $secondMenu->getChild("New Email Forwarder")->setClass("active");
        }

        $sidebar = $secondarySidebar->addChild("Domain Details Actions")
            ->setLabel("&nbsp" . Lang::trans("actions"))
            ->setIcon("fa-plus");

        $sidebar->addChild("Renew Domain")
            ->setLabel("&nbsp" . Lang::trans("domainsrenew"))
            ->setIcon("fas fa-sync fa-fw")
            ->setUri("clientarea.php?a=domains#tabRenew")
            ->setOrder(10);

        $sidebar->addChild("Register a New Domain")
            ->setLabel("&nbsp" . Lang::trans("orderregisterdomain"))
            ->setIcon("fa-globe fa-fw")
            ->setUri("cart.php?a=add&domain=register")
            ->setOrder(20);

        $sidebar->addChild("Transfer in a Domain")
            ->setLabel("&nbsp" . Lang::trans("transferinadomain"))
            ->setIcon("fa-share fa-fw")
            ->setUri("cart.php?a=add&domain=transfer")
            ->setOrder(30);
    }
});