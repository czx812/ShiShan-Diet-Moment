// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router'
import { ElMessage } from 'element-plus' // 导入ElMessage（原代码可能漏了）
import store from '@/store' // 导入vuex store

const routes = [
  // 你的原有路由配置（如/login、/profile、/admin、/plan等）
  // 示例：
  { path: '/login', component: () => import('@/views/login/index.vue') },
  { path: '/profile', component: () => import('@/views/profile/index.vue') },
  { path: '/admin', component: () => import('@/views/admin/index.vue') },
  { path: '/plan', component: () => import('@/views/plan/index.vue') },
  { path: '/dish', component: () => import('@/views/dish/index.vue') },
  { path: '/', redirect: '/profile' }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫：未登录跳转登录页 + 管理员页面权限校验
router.beforeEach(async (to, from, next) => {
  const token = localStorage.getItem('token')

  // 1. 未登录跳转登录（原有逻辑保留，补充兜底）
  if (to.path !== '/login' && !token) {
    ElMessage.warning('请先登录')
    next('/login')
    return
  }

  // 2. 管理员页面权限校验（核心修改：从store获取userInfo）
  if (to.path === '/admin') {
    try {
      // 先确保userInfo已加载（如果未加载，主动获取）
      if (Object.keys(store.state.userInfo).length === 0) {
        await store.dispatch('fetchUserInfo')
      }
      // 从store获取用户信息，而非localStorage
      const userInfo = store.state.userInfo

      // 权限判断
      if (userInfo.role !== 'admin') {
        ElMessage.error('无管理员权限，无法访问后台')
        next('/profile')
        return
      }
    } catch (err) {
      ElMessage.error('权限校验失败，请重新登录')
      localStorage.removeItem('token') // 清除无效token
      store.commit('SET_TOKEN', '') // 同步清空vuex的token
      next('/login')
      return
    }
  }

  next()
})

export default router