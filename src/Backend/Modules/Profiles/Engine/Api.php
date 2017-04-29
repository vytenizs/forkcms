<?php

namespace Backend\Modules\Profiles\Engine;

use Api\V1\Engine\Api as BaseAPI;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Authentication as BackendAuthentication;
use Backend\Modules\Profiles\Engine\Model as BackendProfilesModel;
use Frontend\Modules\Profiles\Engine\Authentication as FrontendProfilesAuthentication;

/**
 * Class Api
 * @package Backend\Modules\Members\Engine
 */
class Api
{

    /**
     * Get the API-key for a user.
     *
     * @param string $email    The emailaddress for the user.
     * @param string $password The password for the user.
     * @return array
     */
    public static function getAPIKey($email, $password)
    {
        $email = (string) $email;
        $password = (string) $password;

        if (empty($email)) {
            return BaseAPI::output(BaseAPI::BAD_REQUEST, array('message' => 'No email-parameter provided.'));
        }
        if (empty($password)) {
            return BaseAPI::output(
                BaseAPI::BAD_REQUEST,
                array('message' => 'No password-parameter provided.')
            );
        }

        $profile = BackendProfilesModel::getByEmail($email);
        if (empty($profile)) {
            return BaseAPI::output(BaseAPI::FORBIDDEN, array('message' => 'This profile does not exist.'));
        }

        $encryptedPassword = BackendProfilesModel::getEncryptedString(
            $password,
            BackendProfilesModel::getSetting($profile['id'], 'salt')
        );

        $loginStatus = BackendModel::getContainer()->get('database')->getVar(
            'SELECT p.status FROM profiles AS p WHERE p.email = ? AND p.password = ?',
            array($email, $encryptedPassword)
        );

        if ($loginStatus != FrontendProfilesAuthentication::LOGIN_ACTIVE) {
            return BaseAPI::output(
                BaseAPI::FORBIDDEN,
                array('message' => 'Can\'t authenticate you.')
            );
        }

        /**
         * @todo code below may have duplicates in other parts of code (should be fixed in the future)
         */
        $apiAccess = BackendProfilesModel::getSetting($profile['id'], 'api_access');
        $apiKey = BackendProfilesModel::getSetting($profile['id'], 'api_key');

        if ($apiAccess === false && $apiKey === false) {
            $apiAccess = true;
            $apiKey = uniqid();
            BackendProfilesModel::setSetting($profile['id'], 'api_access', (int)$apiAccess);
            BackendProfilesModel::setSetting($profile['id'], 'api_key', $apiKey);
        }

        if (!$apiAccess) {
            return BaseAPI::output(
                BaseAPI::FORBIDDEN,
                array('message' => 'Your profile isn\'t allowed to use the API. Contact an administrator.')
            );
        }

        return array('api_key' => $apiKey);
    }

    /**
     * @return bool
     */
    public static function isAuthorized()
    {
        $email = BackendModel::getContainer()->get('request')->get('email');
        $nonce = BackendModel::getContainer()->get('request')->get('nonce');;
        $secret = BackendModel::getContainer()->get('request')->get('secret');;

        if (is_null($email) || is_null($nonce) || is_null($secret)) {
            return BaseAPI::output(
                BaseAPI::NOT_AUTHORIZED,
                array('message' => 'Not authorized.')
            );
        }

        $profile = BackendProfilesModel::getByEmail($email);
        if (empty($profile)) {
            return BaseAPI::output(BaseAPI::FORBIDDEN, array('message' => 'This profile does not exist.'));
        }

        $apiAccess = (bool)BackendProfilesModel::getSetting($profile['id'], 'api_access');
        $apiKey = BackendProfilesModel::getSetting($profile['id'], 'api_key');

        if (!$apiAccess) {
            return BaseAPI::output(
                BaseAPI::FORBIDDEN,
                array('message' => 'Your profile isn\'t allowed to use the API. Contact an administrator.')
            );
        }

        $hash = BackendAuthentication::getEncryptedString($email.$apiKey, $nonce);
        if ($secret != $hash) {
            return BaseAPI::output(BaseAPI::FORBIDDEN, array('message' => 'Invalid secret.'));
        }

        return true;
    }
}
