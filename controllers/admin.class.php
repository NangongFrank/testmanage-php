<?php
/**
 * @Author: name
 * @Date:   2019-03-20 16:24:32
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-21 10:54:17
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
}