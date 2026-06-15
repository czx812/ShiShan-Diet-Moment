import request from '@/utils/request'

// 获取科普文章列表
export function getArticleList(params) {
  return request({
    url: '/community/article/list',
    method: 'get',
    params
  })
}

// 文章详情
export function getArticleDetail(id) {
  return request({
    url: `/community/article/${id}`,
    method: 'get'
  })
}

// 发布动态帖子
export function postArticle(data) {
  return request({
    url: '/community/article/add',
    method: 'post',
    data
  })
}
