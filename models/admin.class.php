<?php
/**
 * @Author: name
 * @Date:   2019-03-20 16:24:32
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-30 09:36:16
 */
class Admin extends DBModel {
    function getadmin($options) {
        $code = $options["code"];
        $pwd = $options["pwd"];
        $sql = "SELECT a_code as code, a_name as name from admin where a_code = '$code' and a_pwd = md5('$pwd')";
        $res = $this -> getrow($sql);
        return $res;
    }
    function setAdminNewPwd($options) {
        $code = $options['code'];
        $oldPwd = $options["oldPwd"];
        $newPwd = $options["newPwd"];
        $sql = "UPDATE admin set a_pwd = md5('$newPwd') where a_pwd = md5('$oldPwd') and a_code = '$code'";
        $res = $this -> exec($sql);
        return $res;
    }
}