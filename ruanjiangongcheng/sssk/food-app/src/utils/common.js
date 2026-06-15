/**
 * 格式化日期
 * @param {string|Date} time
 * @returns {string}
 */
export function formatDate(time) {
  if (!time) return ''
  return new Date(time).toLocaleString()
}

/**
 * 饮食目标文本映射
 * @param {string} type
 * @returns {string}
 */
export function getTargetText(type) {
  const map = {
    reduce: '减脂塑形',
    gain: '增肌/健身',
    health: '养生调理',
    exam: '备考养胃',
    special: '特殊体质'
  }
  return map[type] || '日常饮食'
}

/**
 * 复制文本
 * @param {string} text
 */
export function copyText(text) {
  navigator.clipboard?.writeText(text)
    .then(() => ElMessage.success('复制成功'))
    .catch(() => ElMessage.error('复制失败'))
}

