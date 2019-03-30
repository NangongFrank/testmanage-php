import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)


import user from "./store/user"
import setting from "./store/setting"
import course from "./store/course"

export default new Vuex.Store({
  state: {
    progressPage: 0,
    progressStatus: false,
  },
  mutations: {
    setProgressPage(state, value) {
        state.progressPage = value
    },
    setProgressStatus(state, value) {
        state.progressStatus = value
    },
  },
  actions: {
    forProgressPage({commit}, value) {
      setTimeout(() => {
        commit("setProgressPage", (value / 2) ^ 0)
      }, 100)
      setTimeout(() => {
          commit("setProgressPage", value)
      }, 200)
    }
  },
  getters: {
    getProgressPage(state) {
        return state.progressPage
    },
    getpProgressStatus(state) {
        return state.progressStatus
    },
  },
  modules: {
    setting,
    user,
    course,
  },
})
