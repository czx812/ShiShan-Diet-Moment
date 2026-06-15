<template>
  <div class="dish-page">
    <!-- 分类筛选按钮 -->
    <div class="filter-bar">
      <button @click="handleFilter('')" :class="{ active: !currentCateId }">全部菜品</button>
      <button v-for="cate in categoryList" :key="cate.cate_id" @click="handleFilter(cate.cate_id)" :class="{ active: currentCateId === cate.cate_id }">
        {{ cate.cate_name }}
      </button>
    </div>

    <!-- 搜索区域 -->
    <div class="search-box">
      <input v-model="keyword" placeholder="输入菜品名称检索"/>
      <button @click="searchDish">索引查找</button>
      <button @click="resetFilter">重置</button>
    </div>

    <!-- 菜品列表 -->
    <div class="dish-table">
      <table border="1" cellpadding="6" cellspacing="0">
        <tr>
          <th>菜品ID</th>
          <th>菜品名称</th>
          <th>菜品价格</th>
        </tr>
        <tr v-for="item in dishList" :key="item.dishId">
          <td>{{ item.dishId }}</td>
          <td>{{ item.dishName }}</td>
          <td>{{ item.price }}</td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script setup>
import {ref, onMounted} from 'vue'
import request from '@/utils/request'

const dishList = ref([])
const keyword = ref('')
const currentCateId = ref('')

// 1. 这里是根据你数据库截图写死的分类列表，100%匹配
const categoryList = ref([
  { cate_id: 1, cate_name: '粉面类' },
  { cate_id: 2, cate_name: '粥品' },
  { cate_id: 3, cate_name: '米饭套餐' },
  { cate_id: 4, cate_name: '拌面/粉' },
  { cate_id: 5, cate_name: '小吃' },
  { cate_id: 6, cate_name: '饮品/糖水' },
  { cate_id: 7, cate_name: '面点' },
  { cate_id: 8, cate_name: '饺子' },
  { cate_id: 9, cate_name: '炖菜' },
  { cate_id: 10, cate_name: '麻辣烫/拌' },
  { cate_id: 11, cate_name: '小碗菜' },
  { cate_id: 12, cate_name: '掉渣饼' },
  { cate_id: 13, cate_name: '炒饭/粉/面' },
  { cate_id: 14, cate_name: '油炸' },
  { cate_id: 15, cate_name: '馄饨/水饺' },
  { cate_id: 16, cate_name: '干锅/煲' },
  { cate_id: 17, cate_name: '主食类' },
  { cate_id: 18, cate_name: '面类' },
  { cate_id: 19, cate_name: '快餐类' },
  { cate_id: 20, cate_name: '烧烤类' },
  { cate_id: 21, cate_name: '麻辣烫' },
  { cate_id: 22, cate_name: '粥粉类' },
  { cate_id: 23, cate_name: '饮品甜品' },
  { cate_id: 24, cate_name: '早餐类' },
  { cate_id: 25, cate_name: '减脂餐' },
])

// 2. 核心请求方法，只修复 cate_id 参数名
const loadDishList = () => {
  request.get('/dish/list', {
    params: {
      keyword: keyword.value,
      cate_id: currentCateId.value   // ✅ 只改了这一行！
    }
  }).then(res => {
    dishList.value = res.data
  })
}

// 切换分类
const handleFilter = (id) => {
  currentCateId.value = id
  loadDishList()
}

// 关键词搜索
const searchDish = () => {
  loadDishList()
}

// 重置筛选
const resetFilter = () => {
  keyword.value = ''
  currentCateId.value = ''
  loadDishList()
}

onMounted(() => {
  loadDishList()
})
</script>

<style scoped>
.filter-bar {
  margin: 15px 0;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.filter-bar button {
  padding: 5px 10px;
  cursor: pointer;
  border: 1px solid #ccc;
  background: #fff;
  border-radius: 4px;
}
.filter-bar button.active {
  background: #409eff;
  color: #fff;
  border-color: #409eff;
}
.search-box {
  margin: 15px 0;
}
input {
  padding: 5px;
  width: 260px;
}
button {
  margin-left: 8px;
  padding: 5px 12px;
  cursor: pointer;
}
</style>