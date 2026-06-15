import request from '@/utils/request'

// 菜品列表（多标签筛选、检索）
export function getDishList(params) {
  return request({
    url: '/dish/list',
    method: 'get',
    params
  })
}

// 菜品详情
export function getDishDetail(id) {
  return request({
    url: `/dish/detail/${id}`,
    method: 'get'
  })
}

// 随机菜品推荐
export function getRandomDish(params) {
  return request({
    url: '/dish/random',
    method: 'get',
    params
  })
}

// 获取菜品标签列表
export function getDishTags() {
  return request({
    url: '/dish/tags',
    method: 'get'
  })
}
