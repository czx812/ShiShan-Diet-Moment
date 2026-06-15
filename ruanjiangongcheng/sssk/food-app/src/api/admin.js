import request from '@/utils/request'

// 菜品管理-新增/编辑
export function adminSaveDish(data) {
  return request({
    url: '/admin/dish/save',
    method: 'post',
    data
  })
}

// 菜品管理-删除
export function adminDeleteDish(id) {
  return request({
    url: `/admin/dish/delete/${id}`,
    method: 'delete'
  })
}

// 用户管理-列表
export function adminUserList(params) {
  return request({
    url: '/admin/user/list',
    method: 'get',
    params
  })
}

// 系统数据统计
export function adminStat() {
  return request({
    url: '/admin/stat',
    method: 'get'
  })
}
