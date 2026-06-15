<template>
  <div class="target-page">
    <h2>设定健康目标</h2>
    <el-card>
      <el-radio-group v-model="target">
        <el-radio label="reduce">减脂塑形</el-radio>
        <el-radio label="gain">增肌健身</el-radio>
        <el-radio label="health">养生调理</el-radio>
        <el-radio label="exam">备考养胃</el-radio>
        <el-radio label="special">特殊体质</el-radio>
      </el-radio-group>
      <el-button type="primary" style="margin-top: 20px" @click="confirm">确认目标</el-button>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useStore } from 'vuex'
import { useRouter } from 'vue-router'
import { updateUserInfo } from '@/api/user'
import { ElMessage } from 'element-plus'

const store = useStore()
const router = useRouter()
const target = ref('reduce')

const confirm = async () => {
  await updateUserInfo({ target: target.value })
  ElMessage.success('目标已更新，可前往生成饮食计划')
  router.push('/plan')
}
</script>
