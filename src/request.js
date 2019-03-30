import axios from 'axios'
import qs from "qs"
import {reqHost} from "./hostList"

function req(type, data, success, err) {
    type = type.toLowerCase()
    const func = axios.create({
        baseURL: reqHost,
    })
    let options
    if(type == "get") {
        options = {
            params: data,
        }
    } else if(type == "post") {
        options = {
            method: 'post',
            data: qs.stringify(data),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
        }
    }
    if(typeof err != "function") {
        err = new Function()
    }
    func(options).then(res => {
        res = res.data
        success(res)
    }).catch(error => {
        err(error)
    })
}

export default req