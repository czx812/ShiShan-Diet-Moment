// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  // 原有路由配置不变
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫：未登录跳转登录页 + 管理员页面权限校验
router.beforeEach(async (to, from, next) => {
  const token = localStorage.getItem('token')

  // 未登录跳转登录
  if (to.path !== '/login' && !token) {
    next('/login')
    return
  }

  // 管理员页面权限校验
  if (to.path === '/admin') {
    try {
      // 简单模拟：实际应从用户信息中获取角色
      const userInfo = JSON.parse(localStorage.getItem('userInfo') || '{}')
      if (userInfo.role !== 'admin') {
        ElMessage.error('无管理员权限')
        next('/profile')
        return
      }
    } catch (err) {
      ElMessage.error('权限校验失败')
      next('/profile')
      return
    }
  }

  next()
})

export default router