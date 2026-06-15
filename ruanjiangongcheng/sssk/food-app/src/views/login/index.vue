<!-- src/views/checkin/index.vue -->
<template>
  <div class="checkin-page">
    <h2>饮食打卡</h2>
    <el-form
      :model="checkinForm"
      inline
      :rules="checkinRules" // 新增校验规则
      ref="checkinFormRef" // 新增表单引用
    >
      <el-form-item label="菜品" prop="dishName"> // 新增prop
        <el-input v-model="checkinForm.dishName" placeholder="请输入菜品名称" />
      </el-form-item>
      <el-form-item label="热量" prop="calorie"> // 新增prop
        <el-input
          v-model="checkinForm.calorie"
          placeholder="请输入热量数值"
          type="number" // 限制为数字
          min="0" // 最小值0
        />
      </el-form-item>
      <el-button type="primary" @click="handleCheckin">打卡</el-button>
    </el-form>
    <el-card style="margin-top:20px">
      <h3>本周营养报表</h3>
      <p>总热量：{{ report.totalCalorie }} kcal</p>
      <p>蛋白质：{{ report.protein }} g</p>
      <p>碳水：{{ report.carbohydrate }} g</p>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { addCheckin, getNutritionReport } from '@/api/checkin'
import { ElMessage, ElLoading } from 'element-plus'

const checkinFormRef = ref(null) // 表单引用
const checkinForm = ref({ dishName: '', calorie: '' })
const report = ref({ totalCalorie: 0, protein: 0, carbohydrate: 0 })

// 表单校验规则
const checkinRules = ref({
  dishName: [
    { required: true, message: '请输入菜品名称', trigger: 'blur' },
    { min: 2, max: 20, message: '菜品名称长度在2-20个字符', trigger: 'blur' }
  ],
  calorie: [
    { required: true, message: '请输入热量数值', trigger: 'blur' },
    { type: 'number', min: 0, message: '热量必须为非负数', trigger: 'blur' }
  ]
})

onMounted(async () => {
  const loading = ElLoading.service({ text: '加载报表中...' })
  try {
    const res = await getNutritionReport()
    report.value = res
  } catch (err) {
    ElMessage.error('获取报表失败')
    console.error(err)
  } finally {
    loading.close()
  }
})

const handleCheckin = async () => {
  // 先校验表单
  const valid = await checkinFormRef.value.validate()
  if (!valid) return

  const loading = ElLoading.service({ text: '打卡中...' })
  try {
    await addCheckin(checkinForm.value)
    ElMessage.success('打卡成功')
    // 清空表单
    checkinForm.value = { dishName: '', calorie: '' }
    // 重新获取报表
    const res = await getNutritionReport()
    report.value = res
  } catch (err) {
    ElMessage.error('打卡失败')
    console.error(err)
  } finally {
    loading.close()
  }
}
</script>