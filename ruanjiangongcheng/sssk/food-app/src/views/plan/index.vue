<!-- src/views/plan/index.vue -->
<template>
  <div class="plan-page">
    <h2>饮食计划</h2>
    <el-card>
      <el-form :model="planForm" inline>
        <el-form-item label="计划周期">
          <el-radio-group v-model="planForm.type">
            <el-radio label="day">日计划</el-radio>
            <el-radio label="week">周计划</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-button type="primary" @click="generate">生成计划</el-button>
      </el-form>
    </el-card>
    <div v-if="planList.length">
      <el-table :data="planList" style="margin-top:20px">
        <el-table-column label="日期" prop="date" />
        <el-table-column label="菜品" prop="dishName" />
        <el-table-column label="热量" prop="calorie" />
        <el-table-column label="操作">
          <template #default="{ row }">
            <el-button size="small" @click="replace(row)">替换菜品</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { generatePlan, getPlanList, adjustPlan } from '@/api/plan'
import { getRandomDish } from '@/api/dish' // 新增导入
import { ElMessage, ElLoading } from 'element-plus' // 新增ElLoading

const planForm = ref({ type: 'day' })
const planList = ref([])
let loadingInstance = null // 定义loading实例

onMounted(async () => {
  getPlanData()
})

// 封装获取计划列表方法（添加loading）
const getPlanData = async () => {
  loadingInstance = ElLoading.service({ text: '加载中...' })
  try {
    const res = await getPlanList()
    planList.value = res
  } catch (err) {
    ElMessage.error('获取计划失败')
    console.error(err)
  } finally {
    loadingInstance.close()
  }
}

const generate = async () => {
  loadingInstance = ElLoading.service({ text: '生成计划中...' })
  try {
    const res = await generatePlan(planForm.value)
    planList.value = res
    ElMessage.success('计划生成成功')
  } catch (err) {
    ElMessage.error('生成计划失败')
    console.error(err)
  } finally {
    loadingInstance.close()
  }
}

const replace = async (row) => {
  loadingInstance = ElLoading.service({ text: '替换菜品中...' })
  try {
    // 先获取随机菜品，再替换
    const randomDish = await getRandomDish()
    await adjustPlan({
      planId: row.id,
      dishId: randomDish.id // 传有效菜品ID
    })
    // 重新获取计划列表
    await getPlanData()
    ElMessage.success('已为你替换菜品')
  } catch (err) {
    ElMessage.error('替换菜品失败')
    console.error(err)
  } finally {
    loadingInstance.close()
  }
}
</script>