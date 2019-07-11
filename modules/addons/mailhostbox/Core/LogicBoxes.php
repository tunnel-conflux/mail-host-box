<?php
/**
 * Project      : LogicBoxes Free Mail
 * File Name    : OrderBox.php
 * Author       : Abu Bakar Siddique
 * Email        : absiddique.live@gmail.com
 * Company      : Tunnel Conflux
 * Website      : http://www.tunnelconflux.com
 * Date[D/M/Y]  : 2016/11/22 6:46 PM
 */

namespace TunnelConflux\MailHostBox\Core;

class LogicBoxes
{
    const API_BASE_URL = 'https://httpapi.com/api/';
    const API_TEST_URL = 'https://test.httpapi.com/api/';

    private $apiBaseUrl = '';
    private $resellerId = null;
    private $apiKey     = null;
    private $params     = [];
    private $logFlag    = '';

    public function __construct($resellerId, $apiKey, $test = false, $url = '', $log = true, $profiler = 'mailhostbox-email')
    {
        $this->apiBaseUrl = !empty($url) ? $url : ($test ? self::API_TEST_URL : self::API_BASE_URL);
        $this->resellerId = $resellerId;
        $this->apiKey     = $apiKey;
        $this->params     = [
            'auth-userid'  => $this->resellerId,
            'api-key'      => $this->apiKey,
            'profiler-ink' => $profiler,
        ];
        $this->logFlag    = $log;
    }

    public function apiRequest($requestRoute, $requestType, $params = [])
    {
        if (!empty($params)) {
            $params = array_merge($this->params, $params);
        }

        $url = $this->apiBaseUrl . $requestRoute;
        $ch  = curl_init();

        if ($requestType === 'GET') {
            $url .= "?" . http_build_query($params);
        } else {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        }

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_VERBOSE, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);

        return json_decode($result);
    }
}