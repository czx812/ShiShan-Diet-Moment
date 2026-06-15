import request from '@/utils/request'

// 生成饮食计划（日/周）
export function generatePlan(data) {
  return request({
    url: '/plan/generate',
    method: 'post',
    data
  })
}

// 获取用户计划列表
export function getPlanList(params) {
  return request({
    url: '/plan/list',
    method: 'get',
    params
  })
}

// 获取计划详情
export function getPlanDetail(id) {
  return request({
    url: `/plan/detail/${id}`,
    method: 'get'
  })
}

// 调整计划/替换菜品
export function adjustPlan(data) {
  return request({
    url: '/plan/adjust',
    method: 'put',
    data
  })
}
