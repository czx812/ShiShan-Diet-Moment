import { createStore } from 'vuex'
import { getUserInfo } from '@/api/user'

export default createStore({
  state: {
    token: localStorage.getItem('token') || '',
    userInfo: {},
    dishTags: []
  },
  mutations: {
    SET_TOKEN(state, token) {
      state.token = token
      localStorage.setItem('token', token)
    },
    SET_USER_INFO(state, info) {
      state.userInfo = info
    },
    SET_DISH_TAGS(state, tags) {
      state.dishTags = tags
    }
  },
  actions: {
    async fetchUserInfo({ commit }) {
      try {
        const res = await getUserInfo()
        commit('SET_USER_INFO', res)
        return res
      } catch (err) {
        console.error('获取用户信息失败', err)
        return null
      }
    }
  },
  getters: {
    isLogin: state => !!state.token
  }
})
