<?php

/**
 * @Author: zhao mac
 * @Date:   2019-03-20 08:41:16
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-20 16:27:14
 */
## 单例+工厂的结合模型
class Factory {
	private function __construct() {}
	private static $objectList = array();
    private static $config = null;
	function getobj($name) {
        if (!empty(self :: $objectList[$name])) {
            return self :: $objectList[$name];
        } else {
            $obj = new $name(self :: $config);
            self :: $objectList[$name] = $obj;
            return $obj;
        }
    }
    function setconfig($config) {
        self :: $config = $config;
    }
}