import request from '@/utils/request'

// 饮食打卡
export function addCheckin(data) {
  return request({
    url: '/checkin/add',
    method: 'post',
    data
  })
}

// 获取打卡记录
export function getCheckinList(params) {
  return request({
    url: '/checkin/list',
    method: 'get',
    params
  })
}

// 获取营养/热量统计报表
export function getNutritionReport(params) {
  return request({
    url: '/checkin/report',
    method: 'get',
    params
  })
}
