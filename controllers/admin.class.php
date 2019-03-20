<?php
/**
 * @Author: name
 * @Date:   2019-03-20 16:24:32
 * @Last Modified by:   zhao mac
 * @Last Modified time: 2019-03-20 20:42:04
 */
class AdminController {
	function info($model, $options) {
		echo json_encode($options);
	}
}