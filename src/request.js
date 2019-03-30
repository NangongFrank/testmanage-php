/*
* @Author: name
* @Date:   2019-03-18 11:44:37
* @Last Modified by:   name
* @Last Modified time: 2019-03-18 12:57:21
*/
import axios from 'axios'

function req(type, data, suc, err) {
    var options
    aixos.default.baseURL = "localhost:8888/testmg/index.php"
    axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
    type = type.toLowerCase()

    if(type == "get") {
        options = {
            method: "get",
            data

        }
    } else if(type == "post") {

    }
    axios(options).then(suc(res)).catch(err(e))
}