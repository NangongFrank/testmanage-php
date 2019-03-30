import Vue from 'vue'
import Router from 'vue-router'
import store from "./store"


Vue.use(Router)


import Index from "./views/index"
import Home from "./views/home"
import HomeIndex from "./components/HomeIndex"
import NotFound from "./components/NotFound"

import UserTeacher from "./components/user/Teacher"
import UserStudent from "./components/user/Student"


import CourseUp from "./components/course/Up"
import CourseDown from "./components/course/Down"
import CourseFree from "./components/course/Free"

import SettingUser from "./components/setting/User"
import SettingCourse from "./components/setting/Course"
import SettingAdmin from "./components/setting/Admin"

let router = new Router({
    //mode: "history",
    routes: [{
        path: "/",
        redirect: "/index",
    },{
        path: "/index",
        component: Index,
    },{
        path: "/home",
        component: Home,
        children: [{
            path: "/home",
            component: HomeIndex
        }, {
            path: "/userteacher",
            component: UserTeacher,
        }, {
            path: "/userstudent",
            component: UserStudent,
        }, {
            path: "/courseup",
            component: CourseUp,
        }, {
            path: "/coursedown",
            component: CourseDown,
        }, {
            path: "/coursefree",
            component: CourseFree,
        }, {
            path: "/settinguser",
            component: SettingUser,
        }, {
            path: "/settingcourse",
            component: SettingCourse,
        }, {
            path: "/settingadmin",
            component: SettingAdmin,
        }]
    }, {
        path: "*",
        component: NotFound,
    }],

})
router.beforeEach((to, from, next) => {
    store.commit("setProgressStatus", false)
    store.commit("setProgressPage", 0)
    setTimeout(() => {
         next()
    }, 1)
})
router.afterEach((to, from) => {
    store.commit("setProgressStatus", true)
    store.dispatch("forProgressPage", 100)
})
export default router

