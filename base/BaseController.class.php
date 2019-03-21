<?php
/**
 * @Author: name
 * @Date:   2019-03-21 08:32:39
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-21 11:19:32
 */
class BaseController {
    protected function echofunc($data) {
        if($data) {
            $data = array("data" => $data, "state" => 1);
        } else {
           $data = array("msg" => "this request no response", "state" => 0);
        }
        echo json_encode($data);
    }
}