<?php

/**
 * @Author: zhao mac
 * @Date:   2019-03-20 08:41:16
 * @Last Modified by:   zhao mac
 * @Last Modified time: 2019-03-20 08:42:48
 */
## 单例+工厂的结合模型
class Factory {
	private function __construct() {}
	private static $objectList = array();
	
}