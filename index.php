<?php
/**
 * @Author: name
 * @Date:   2019-03-18 10:54:36
 * @Last Modified by:   name
 * @Last Modified time: 2019-03-20 18:56:30
 */
header("Access-Control-Allow-Origin:*");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
require_once './test.config.php';
require_once "./base/DBModel.class.php";
require_once "./base/Factory.class.php";

## 配置数据库模型实体类的连接配置属性
Factory :: setconfig($config);
## 配置请求参数，必须有m,c
# m标志着models中的一项 -- 全小写
# c标志着Controllers中的一项 -- 首字母大写

if(!empty($_GET) || !empty($_POST)) {
    if(!empty($_GET)) {
        $get = $_GET;
        if(!empty($get["m"]) && !empty($get["c"])) {
            $demo = "admin";
            require_once "./models/" . $demo . ".class.php";
            $p = Factory :: getobj("admin");
            $p2 = Factory :: getobj("admin");
            var_dump($p === $p2);
        } else {
            $res = array("msg" => "lost primary key words", "state" => 0);
            echo json_encode($res);
        }
    } else {
        $post = $_POST;
        if(!empty($post["m"]) && !empty($post["c"])) {
            $demo = "admin";
            require_once "./models/" . $demo . ".class.php";
            $p = Factory :: getobj("admin");
            $p2 = Factory :: getobj("admin");
            var_dump($p === $p2);
        } else {
            $res = array("msg" => "lost primary key words", "state" => 0, "request" => $_REQUEST);
            echo json_encode($res);
        }
    }
} else {
    $res = array("msg" => "post and get to request", "state" => 0, "global" => $GLOBALS);
    echo json_encode($res);
}




