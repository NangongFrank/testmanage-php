<?php
/**
 * @Author: name
 * @Date:   2019-03-20 16:24:32
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-30 09:38:41
 */
class AdminController extends BaseController {
	function adminlogin($model, $options) {
        if(!empty($options["code"]) && !empty($options['pwd'])){
           $res = $model -> getadmin($options);
           $this -> echofunc($res);
        } else {
            $this -> echofunc();
            die();
        }
    }
    function changeAdminPwd($model, $options) {
        if(!empty($options['code']) && !empty("oldPwd") && !empty("newPwd")) {
            $res = $model -> setAdminNewPwd($options);
            $this -> echofunc($res);
        } else {
            $this -> echofunc();
            die();
        }
    }
}